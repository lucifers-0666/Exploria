using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;

namespace Tours_Travels
{
    public partial class Reviews : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["connect"]?.ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CreateReviewsTableIfNotExists();
                LoadDestinations();
                LoadReviews();
            }
        }

        private void CreateReviewsTableIfNotExists()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string createTableQuery = @"
                        IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'DestinationReviews')
                        BEGIN
                            CREATE TABLE DestinationReviews (
                                Id INT PRIMARY KEY IDENTITY(1,1),
                                DestinationId INT NOT NULL,
                                DestinationName NVARCHAR(255),
                                UserId INT,
                                CustomerName NVARCHAR(255) NOT NULL,
                                CustomerEmail NVARCHAR(255),
                                Rating INT NOT NULL CHECK (Rating >= 1 AND Rating <= 5),
                                ReviewText NVARCHAR(MAX) NOT NULL,
                                ReviewDate DATETIME NOT NULL DEFAULT GETDATE(),
                                IsVerified BIT NOT NULL DEFAULT 0,
                                HelpfulCount INT NOT NULL DEFAULT 0,
                                IsApproved BIT NOT NULL DEFAULT 1
                            )
                        END";

                    using (SqlCommand cmd = new SqlCommand(createTableQuery, con))
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Table Creation Error: " + ex.Message);
            }
        }

        private void LoadDestinations()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT Id, DestinationName FROM Destinations ORDER BY DestinationName";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        ddlDestination.Items.Clear();
                        ddlReviewDestination.Items.Clear();

                        ddlDestination.Items.Add(new ListItem("All Destinations", "all"));
                        ddlReviewDestination.Items.Add(new ListItem("-- Select Destination --", "0"));

                        while (reader.Read())
                        {
                            string id = reader["Id"].ToString();
                            string name = reader["DestinationName"].ToString();

                            ddlDestination.Items.Add(new ListItem(name, id));
                            ddlReviewDestination.Items.Add(new ListItem(name, id));
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Load Destinations Error: " + ex.Message);
            }
        }

        private void LoadReviews()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = BuildReviewQuery();

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Add parameters for filters
                        if (ddlDestination.SelectedValue != "all")
                        {
                            cmd.Parameters.AddWithValue("@DestinationId", ddlDestination.SelectedValue);
                        }

                        if (chkVerifiedOnly.Checked)
                        {
                            cmd.Parameters.AddWithValue("@IsVerified", 1);
                        }

                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            rptReviews.DataSource = dt;
                            rptReviews.DataBind();
                            lblTotalReviews.Text = dt.Rows.Count.ToString();
                            pnlNoReviews.Visible = false;
                        }
                        else
                        {
                            rptReviews.DataSource = null;
                            rptReviews.DataBind();
                            lblTotalReviews.Text = "0";
                            pnlNoReviews.Visible = true;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Load Reviews Error: " + ex.Message);
                pnlNoReviews.Visible = true;
            }
        }

        private string BuildReviewQuery()
        {
            string query = @"SELECT Id, DestinationId, DestinationName, CustomerName, 
                            Rating, ReviewText, ReviewDate, IsVerified, HelpfulCount 
                            FROM DestinationReviews 
                            WHERE IsApproved = 1";

            // Add destination filter
            if (ddlDestination.SelectedValue != "all")
            {
                query += " AND DestinationId = @DestinationId";
            }

            // Add verified filter
            if (chkVerifiedOnly.Checked)
            {
                query += " AND IsVerified = @IsVerified";
            }

            // Add rating filters
            var selectedRatings = chkRatingFilter.Items.Cast<ListItem>().Where(i => i.Selected).Select(i => i.Value).ToList();
            if (selectedRatings.Count > 0)
            {
                query += " AND Rating IN (" + string.Join(",", selectedRatings) + ")";
            }

            query += " ORDER BY ReviewDate DESC";

            return query;
        }

        protected string GenerateStars(int rating)
        {
            string stars = "";
            for (int i = 1; i <= 5; i++)
            {
                stars += i <= rating ? "★" : "☆";
            }
            return stars;
        }

        protected void btnApplyFilters_Click(object sender, EventArgs e)
        {
            LoadReviews();
        }

        protected void btnSubmitReview_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["UserId"] == null)
                {
                    Response.Redirect("Login.aspx?returnUrl=" + Server.UrlEncode(Request.Url.PathAndQuery));
                    return;
                }

                if (ddlReviewDestination.SelectedValue == "0")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select a destination');", true);
                    return;
                }

                if (hfRating.Value == "0")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please select a rating');", true);
                    return;
                }

                if (string.IsNullOrWhiteSpace(txtReviewText.Text))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please write your review');", true);
                    return;
                }

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    // Get destination name
                    string destName = ddlReviewDestination.SelectedItem.Text;

                    // Get user info
                    string userName = Session["FullName"]?.ToString() ?? "Anonymous";
                    string userEmail = Session["Email"]?.ToString();
                    int userId = Convert.ToInt32(Session["UserId"]);

                    string query = @"INSERT INTO DestinationReviews 
                                    (DestinationId, DestinationName, UserId, CustomerName, CustomerEmail, 
                                     Rating, ReviewText, IsVerified) 
                                    VALUES 
                                    (@DestinationId, @DestinationName, @UserId, @CustomerName, @CustomerEmail, 
                                     @Rating, @ReviewText, 1)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@DestinationId", ddlReviewDestination.SelectedValue);
                        cmd.Parameters.AddWithValue("@DestinationName", destName);
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        cmd.Parameters.AddWithValue("@CustomerName", userName);
                        cmd.Parameters.AddWithValue("@CustomerEmail", userEmail ?? "");
                        cmd.Parameters.AddWithValue("@Rating", Convert.ToInt32(hfRating.Value));
                        cmd.Parameters.AddWithValue("@ReviewText", txtReviewText.Text.Trim());

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                // Clear form
                ddlReviewDestination.SelectedIndex = 0;
                hfRating.Value = "0";
                txtReviewText.Text = "";

                // Reload reviews
                LoadReviews();

                // Show success message and close modal
                ClientScript.RegisterStartupScript(this.GetType(), "success", 
                    "alert('Thank you for your review!'); closeReviewModal();", true);
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Submit Review Error: " + ex.Message);
                ClientScript.RegisterStartupScript(this.GetType(), "error", 
                    "alert('Failed to submit review. Please try again.');", true);
            }
        }
    }
}
