using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tours_Travels
{
    public partial class AdminReviews : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["Exploria"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is admin
            if (Session["role"] == null || Session["role"].ToString() != "admin")
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadDestinations();
                LoadReviews();
                LoadStatistics();
            }
        }

        private void LoadDestinations()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT DISTINCT DestinationName FROM DestinationReviews ORDER BY DestinationName";
                SqlCommand cmd = new SqlCommand(query, con);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                ddlDestinationFilter.Items.Clear();
                ddlDestinationFilter.Items.Add(new ListItem("All Destinations", ""));

                foreach (DataRow row in dt.Rows)
                {
                    ddlDestinationFilter.Items.Add(new ListItem(row["DestinationName"].ToString(), row["DestinationName"].ToString()));
                }
            }
        }

        private void LoadReviews()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                StringBuilder query = new StringBuilder("SELECT * FROM DestinationReviews WHERE 1=1");

                // Apply filters
                if (!string.IsNullOrEmpty(ddlRatingFilter.SelectedValue))
                {
                    query.Append(" AND Rating = @Rating");
                }

                if (!string.IsNullOrEmpty(ddlStatusFilter.SelectedValue))
                {
                    query.Append(" AND IsApproved = @IsApproved");
                }

                if (!string.IsNullOrEmpty(ddlDestinationFilter.SelectedValue))
                {
                    query.Append(" AND DestinationName = @Destination");
                }

                query.Append(" ORDER BY ReviewDate DESC");

                SqlCommand cmd = new SqlCommand(query.ToString(), con);

                if (!string.IsNullOrEmpty(ddlRatingFilter.SelectedValue))
                {
                    cmd.Parameters.AddWithValue("@Rating", ddlRatingFilter.SelectedValue);
                }

                if (!string.IsNullOrEmpty(ddlStatusFilter.SelectedValue))
                {
                    cmd.Parameters.AddWithValue("@IsApproved", ddlStatusFilter.SelectedValue == "1" ? 1 : 0);
                }

                if (!string.IsNullOrEmpty(ddlDestinationFilter.SelectedValue))
                {
                    cmd.Parameters.AddWithValue("@Destination", ddlDestinationFilter.SelectedValue);
                }

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                gvReviews.DataSource = dt;
                gvReviews.DataBind();
            }
        }

        private void LoadStatistics()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Total Reviews
                SqlCommand cmdTotal = new SqlCommand("SELECT COUNT(*) FROM DestinationReviews", con);
                litTotalReviews.Text = cmdTotal.ExecuteScalar().ToString();

                // Approved Reviews
                SqlCommand cmdApproved = new SqlCommand("SELECT COUNT(*) FROM DestinationReviews WHERE IsApproved = 1", con);
                litApprovedReviews.Text = cmdApproved.ExecuteScalar().ToString();

                // Pending Reviews
                SqlCommand cmdPending = new SqlCommand("SELECT COUNT(*) FROM DestinationReviews WHERE IsApproved = 0", con);
                litPendingReviews.Text = cmdPending.ExecuteScalar().ToString();

                // Average Rating
                SqlCommand cmdAvg = new SqlCommand("SELECT ISNULL(AVG(CAST(Rating AS FLOAT)), 0) FROM DestinationReviews WHERE IsApproved = 1", con);
                double avgRating = Convert.ToDouble(cmdAvg.ExecuteScalar());
                litAvgRating.Text = avgRating.ToString("F1");
            }
        }

        protected void btnApplyFilters_Click(object sender, EventArgs e)
        {
            LoadReviews();
        }

        protected void gvReviews_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int reviewId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "ApproveReview")
            {
                UpdateReviewStatus(reviewId, true);
                ScriptManager.RegisterStartupScript(this, GetType(), "success", 
                    "alert('Review approved successfully!');", true);
            }
            else if (e.CommandName == "RejectReview")
            {
                UpdateReviewStatus(reviewId, false);
                ScriptManager.RegisterStartupScript(this, GetType(), "success", 
                    "alert('Review status updated!');", true);
            }
            else if (e.CommandName == "DeleteReview")
            {
                DeleteReview(reviewId);
                ScriptManager.RegisterStartupScript(this, GetType(), "success", 
                    "alert('Review deleted successfully!');", true);
            }

            LoadReviews();
            LoadStatistics();
        }

        private void UpdateReviewStatus(int reviewId, bool isApproved)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "UPDATE DestinationReviews SET IsApproved = @IsApproved WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@IsApproved", isApproved ? 1 : 0);
                cmd.Parameters.AddWithValue("@Id", reviewId);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private void DeleteReview(int reviewId)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "DELETE FROM DestinationReviews WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Id", reviewId);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        protected string GetStarRating(int rating)
        {
            StringBuilder stars = new StringBuilder();

            for (int i = 1; i <= 5; i++)
            {
                if (i <= rating)
                {
                    stars.Append("<i class='las la-star star-filled'></i>");
                }
                else
                {
                    stars.Append("<i class='las la-star star-empty'></i>");
                }
            }

            return stars.ToString();
        }
    }
}
