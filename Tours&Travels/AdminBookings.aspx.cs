using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Tours_Travels
{
    public partial class AdminBookings : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if user is admin
                if (Session["isLogin"] == null || Session["isLogin"].ToString() != "true")
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                if (Session["Role"] == null || Session["Role"].ToString() != "admin")
                {
                    Response.Redirect("Home.aspx");
                    return;
                }

                LoadStatistics();
                LoadBookings();
            }
        }

        private void LoadStatistics()
        {
            try
            {
                con.Open();

                // Total bookings
                SqlCommand cmdTotal = new SqlCommand("SELECT COUNT(*) FROM Bookings", con);
                lblTotalBookings.Text = cmdTotal.ExecuteScalar().ToString();

                // Confirmed bookings
                SqlCommand cmdConfirmed = new SqlCommand("SELECT COUNT(*) FROM Bookings WHERE BookingStatus = 'Confirmed'", con);
                lblConfirmedBookings.Text = cmdConfirmed.ExecuteScalar().ToString();

                // Pending bookings
                SqlCommand cmdPending = new SqlCommand("SELECT COUNT(*) FROM Bookings WHERE BookingStatus = 'Pending'", con);
                lblPendingBookings.Text = cmdPending.ExecuteScalar().ToString();

                // Cancelled bookings
                SqlCommand cmdCancelled = new SqlCommand("SELECT COUNT(*) FROM Bookings WHERE BookingStatus = 'Cancelled'", con);
                lblCancelledBookings.Text = cmdCancelled.ExecuteScalar().ToString();
            }
            catch (Exception ex)
            {
                ShowError("Error loading statistics: " + ex.Message);
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                    con.Close();
            }
        }

        private void LoadBookings()
        {
            try
            {
                string query = @"SELECT 
                    b.BookingId,
                    d.Name AS DestinationName,
                    CONCAT(u.FirstName, ' ', u.LastName) AS CustomerName,
                    b.TravelerEmail,
                    b.TravelDate,
                    b.NumberOfAdults,
                    b.NumberOfChildren,
                    b.TotalAmount,
                    b.BookingStatus,
                    b.DateOfBooking
                    FROM Bookings b
                    INNER JOIN Destinations d ON b.DestinationId = d.Id
                    INNER JOIN Users u ON b.UserId = u.Id
                    WHERE 1=1";

                // Apply filters
                if (!string.IsNullOrEmpty(ddlStatus.SelectedValue))
                {
                    query += " AND b.BookingStatus = @Status";
                }

                if (!string.IsNullOrEmpty(txtSearch.Text))
                {
                    query += @" AND (CAST(b.BookingId AS NVARCHAR) LIKE @Search 
                               OR CONCAT(u.FirstName, ' ', u.LastName) LIKE @Search
                               OR b.TravelerEmail LIKE @Search)";
                }

                if (!string.IsNullOrEmpty(txtFromDate.Text))
                {
                    query += " AND b.DateOfBooking >= @FromDate";
                }

                if (!string.IsNullOrEmpty(txtToDate.Text))
                {
                    query += " AND b.DateOfBooking <= @ToDate";
                }

                query += " ORDER BY b.DateOfBooking DESC";

                SqlCommand cmd = new SqlCommand(query, con);

                if (!string.IsNullOrEmpty(ddlStatus.SelectedValue))
                    cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);

                if (!string.IsNullOrEmpty(txtSearch.Text))
                    cmd.Parameters.AddWithValue("@Search", "%" + txtSearch.Text + "%");

                if (!string.IsNullOrEmpty(txtFromDate.Text))
                    cmd.Parameters.AddWithValue("@FromDate", txtFromDate.Text);

                if (!string.IsNullOrEmpty(txtToDate.Text))
                    cmd.Parameters.AddWithValue("@ToDate", txtToDate.Text);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvBookings.DataSource = dt;
                gvBookings.DataBind();
            }
            catch (Exception ex)
            {
                ShowError("Error loading bookings: " + ex.Message);
            }
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            LoadStatistics();
            LoadBookings();
        }

        protected void gvBookings_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int bookingId = Convert.ToInt32(e.CommandArgument);

            try
            {
                if (e.CommandName == "ConfirmBooking")
                {
                    UpdateBookingStatus(bookingId, "Confirmed");
                    ShowSuccess("Booking confirmed successfully!");
                }
                else if (e.CommandName == "CancelBooking")
                {
                    UpdateBookingStatus(bookingId, "Cancelled");
                    ShowSuccess("Booking cancelled successfully!");
                }

                LoadStatistics();
                LoadBookings();
            }
            catch (Exception ex)
            {
                ShowError("Error: " + ex.Message);
            }
        }

        private void UpdateBookingStatus(int bookingId, string status)
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
