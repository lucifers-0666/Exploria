using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Tours_Travels
{
    public partial class Dashboard : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["isLogin"] == null || Session["isLogin"].ToString() != "true")
                {
                    Response.Redirect("Login.aspx");
                    return;
                }

                LoadUserData();
                LoadStatistics();
                LoadRecentBookings();
            }
        }

        private void LoadUserData()
        {
            lblUserName.Text = Session["FullName"] != null ? Session["FullName"].ToString() : "User";
        }

        private void LoadStatistics()
        {
            try
            {
                int userId = Convert.ToInt32(Session["UserID"]);
                con.Open();

                // Total bookings
                SqlCommand cmdBookings = new SqlCommand("SELECT COUNT(*) FROM Bookings WHERE UserId = @UserId", con);
                cmdBookings.Parameters.AddWithValue("@UserId", userId);
                lblTotalBookings.Text = cmdBookings.ExecuteScalar().ToString();

                // Unique destinations visited
                SqlCommand cmdDestinations = new SqlCommand("SELECT COUNT(DISTINCT DestinationId) FROM Bookings WHERE UserId = @UserId AND BookingStatus IN ('Confirmed', 'Completed')", con);
                cmdDestinations.Parameters.AddWithValue("@UserId", userId);
                lblVisitedDestinations.Text = cmdDestinations.ExecuteScalar().ToString();

                // Total spent
                SqlCommand cmdSpent = new SqlCommand("SELECT ISNULL(SUM(TotalAmount), 0) FROM Bookings WHERE UserId = @UserId AND BookingStatus IN ('Confirmed', 'Completed')", con);
                cmdSpent.Parameters.AddWithValue("@UserId", userId);
                object spent = cmdSpent.ExecuteScalar();
                lblTotalSpent.Text = spent != null ? Convert.ToDecimal(spent).ToString("N2") : "0";

                // Wishlist count (set to 0 for now, will be implemented when wishlist is created)
                lblWishlistCount.Text = "0";
            }
            catch (Exception ex)
            {
                // Log error
            }
            finally
            {
                if (con.State == ConnectionState.Open)
                    con.Close();
            }
        }

        private void LoadRecentBookings()
        {
            try
            {
                int userId = Convert.ToInt32(Session["UserID"]);
                string query = @"SELECT TOP 5
                    b.BookingId,
                    d.Name AS DestinationName,
                    d.MainImage,
                    b.TravelDate,
                    b.NumberOfAdults,
                    b.NumberOfChildren,
                    b.BookingStatus
                    FROM Bookings b
                    INNER JOIN Destinations d ON b.DestinationId = d.Id
                    WHERE b.UserId = @UserId
                    ORDER BY b.DateOfBooking DESC";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserId", userId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    rptRecentBookings.DataSource = dt;
                    rptRecentBookings.DataBind();
                    pnlNoBookings.Visible = false;
                }
                else
                {
                    pnlNoBookings.Visible = true;
                }
            }
            catch (Exception ex)
            {
                // Log error
            }
        }
    }
}
