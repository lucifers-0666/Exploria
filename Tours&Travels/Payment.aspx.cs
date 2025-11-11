using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Tours_Travels
{
    public partial class Payment : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if user is logged in
                if (Session["isLogin"] == null || Session["isLogin"].ToString() != "true")
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                // Get booking ID from query string
                if (Request.QueryString["bookingId"] != null)
                {
                    LoadBookingDetails(Request.QueryString["bookingId"]);
                }
                else
                {
                    // Redirect to home if no booking ID
                    Response.Redirect("Home.aspx");
                }
            }
        }

        private void LoadBookingDetails(string bookingId)
        {
            try
            {
                string query = @"SELECT b.*, d.Name, d.MainImage, d.Duration, d.Price 
                                FROM Bookings b 
                                INNER JOIN Destinations d ON b.DestinationId = d.Id 
                                WHERE b.BookingId = @BookingId";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@BookingId", bookingId);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    // Store booking ID in ViewState
                    ViewState["BookingId"] = bookingId;

                    // Destination Information
                    lblDestinationName.Text = reader["Name"].ToString();
                    imgDestination.ImageUrl = reader["MainImage"].ToString();
                    lblTravelDate.Text = Convert.ToDateTime(reader["TravelDate"]).ToString("MMM dd, yyyy");
                    lblDuration.Text = reader["Duration"].ToString();

                    // Traveler Information
                    int adults = Convert.ToInt32(reader["NumberOfAdults"]);
                    int children = Convert.ToInt32(reader["NumberOfChildren"]);
                    lblTravelers.Text = $"{adults} Adults, {children} Children";
                    lblAdultsCount.Text = adults.ToString();
                    lblChildrenCount.Text = children.ToString();

                    // Price Calculation
                    decimal basePrice = Convert.ToDecimal(reader["Price"]);
                    decimal adultsPrice = basePrice * adults;
                    decimal childrenPrice = (basePrice * 0.5m) * children; // 50% for children
                    decimal subtotal = adultsPrice + childrenPrice;
                    decimal gst = subtotal * 0.18m; // 18% GST
                    decimal total = subtotal + gst;

                    lblBasePrice.Text = basePrice.ToString("N2");
                    lblAdultsPrice.Text = adultsPrice.ToString("N2");
                    lblChildrenPrice.Text = childrenPrice.ToString("N2");
                    lblGST.Text = gst.ToString("N2");
                    lblTotalAmount.Text = total.ToString("N2");

                    // Store total in ViewState for payment processing
                    ViewState["TotalAmount"] = total;
                }
                else
                {
                    ShowError("Booking not found!");
                    Response.Redirect("Home.aspx");
                }

                reader.Close();
            }
            catch (Exception ex)
            {
                ShowError("Error loading booking details: " + ex.Message);
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                    con.Close();
            }
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            try
            {
                // Validate payment details
                if (string.IsNullOrWhiteSpace(txtCardholderName.Text))
                {
                    ShowError("Please enter cardholder name");
                    return;
                }

                if (string.IsNullOrWhiteSpace(txtCardNumber.Text) || txtCardNumber.Text.Replace(" ", "").Length < 13)
                {
                    ShowError("Please enter a valid card number");
                    return;
                }

                if (string.IsNullOrWhiteSpace(txtExpiryDate.Text))
                {
                    ShowError("Please enter expiry date");
                    return;
                }

                if (string.IsNullOrWhiteSpace(txtCVV.Text) || txtCVV.Text.Length < 3)
                {
                    ShowError("Please enter a valid CVV");
                    return;
                }

                // In real application, integrate with payment gateway (Razorpay, Stripe, PayPal)
                // For demo purposes, we'll simulate successful payment

                bool paymentSuccess = ProcessPayment();

                if (paymentSuccess)
                {
                    // Update booking status to "Confirmed"
                    UpdateBookingStatus(ViewState["BookingId"].ToString(), "Confirmed");

                    // Create payment record
                    InsertPaymentRecord(ViewState["BookingId"].ToString());

                    // Send confirmation email (optional)
                    // SendPaymentConfirmationEmail();

                    // Redirect to thank you page
                    Response.Redirect($"ThankYou.aspx?bookingId={ViewState["BookingId"]}");
                }
                else
                {
                    ShowError("Payment failed. Please try again.");
                }
            }
            catch (Exception ex)
            {
                ShowError("Payment processing error: " + ex.Message);
            }
        }

        private bool ProcessPayment()
        {
            // Simulate payment processing
            // In production, integrate with actual payment gateway:
            // - Razorpay: https://razorpay.com/docs/
            // - Stripe: https://stripe.com/docs/
            // - PayPal: https://developer.paypal.com/

            System.Threading.Thread.Sleep(1000); // Simulate processing time

            // For demo, randomly simulate success/failure (90% success rate)
            Random random = new Random();
            return random.Next(1, 11) <= 9; // 90% success
        }

        private void UpdateBookingStatus(string bookingId, string status)
        {
            try
            {
                string query = "UPDATE Bookings SET BookingStatus = @Status WHERE BookingId = @BookingId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Status", status);
                cmd.Parameters.AddWithValue("@BookingId", bookingId);

                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Error updating booking status: " + ex.Message);
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                    con.Close();
            }
        }

        private void InsertPaymentRecord(string bookingId)
        {
            try
            {
                // Create Payments table if it doesn't exist
                string createTableQuery = @"
                    IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Payments')
                    BEGIN
                        CREATE TABLE Payments (
                            PaymentId INT PRIMARY KEY IDENTITY(1,1),
                            BookingId INT NOT NULL,
                            Amount DECIMAL(10,2) NOT NULL,
                            PaymentMethod NVARCHAR(50),
                            PaymentStatus NVARCHAR(50) DEFAULT 'Success',
                            TransactionId NVARCHAR(100),
                            CardLast4Digits NVARCHAR(4),
                            PaymentDate DATETIME DEFAULT GETDATE()
                        )
                    END";

                SqlCommand createCmd = new SqlCommand(createTableQuery, con);
                con.Open();
                createCmd.ExecuteNonQuery();
                con.Close();

                // Insert payment record
                string insertQuery = @"INSERT INTO Payments 
                    (BookingId, Amount, PaymentMethod, TransactionId, CardLast4Digits) 
                    VALUES (@BookingId, @Amount, @PaymentMethod, @TransactionId, @CardLast4Digits)";

                SqlCommand cmd = new SqlCommand(insertQuery, con);
                cmd.Parameters.AddWithValue("@BookingId", bookingId);
                cmd.Parameters.AddWithValue("@Amount", ViewState["TotalAmount"]);
                cmd.Parameters.AddWithValue("@PaymentMethod", rblPaymentMethod.SelectedValue);
                cmd.Parameters.AddWithValue("@TransactionId", GenerateTransactionId());
                
                // Get last 4 digits of card
                string cardNumber = txtCardNumber.Text.Replace(" ", "");
                string last4 = cardNumber.Length >= 4 ? cardNumber.Substring(cardNumber.Length - 4) : "****";
                cmd.Parameters.AddWithValue("@CardLast4Digits", last4);

                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Error creating payment record: " + ex.Message);
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                    con.Close();
            }
        }

        private string GenerateTransactionId()
        {
            // Generate unique transaction ID
            return "TXN" + DateTime.Now.ToString("yyyyMMddHHmmss") + new Random().Next(1000, 9999);
        }

        private void ShowError(string message)
        {
            pnlError.Visible = true;
            pnlSuccess.Visible = false;
            lblError.Text = message;
        }

        private void ShowSuccess(string message)
        {
            pnlSuccess.Visible = true;
            pnlError.Visible = false;
            lblSuccess.Text = message;
        }
    }
}
