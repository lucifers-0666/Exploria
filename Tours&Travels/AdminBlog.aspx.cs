using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tours_Travels
{
    public partial class AdminBlog : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

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
                LoadBlogPosts();
                LoadStatistics();
            }
        }

        private void LoadBlogPosts(string searchQuery = "")
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = @"SELECT * FROM BlogPosts";

                if (!string.IsNullOrWhiteSpace(searchQuery))
                {
                    query += " WHERE Title LIKE @Search OR Content LIKE @Search OR Tags LIKE @Search";
                }

                query += " ORDER BY PublishedDate DESC";

                SqlCommand cmd = new SqlCommand(query, con);

                if (!string.IsNullOrWhiteSpace(searchQuery))
                {
                    cmd.Parameters.AddWithValue("@Search", "%" + searchQuery + "%");
                }

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                gvBlogPosts.DataSource = dt;
                gvBlogPosts.DataBind();
            }
        }

        private void LoadStatistics()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Total Posts
                SqlCommand cmdTotal = new SqlCommand("SELECT COUNT(*) FROM BlogPosts", con);
                litTotalPosts.Text = cmdTotal.ExecuteScalar().ToString();

                // Published Posts
                SqlCommand cmdPublished = new SqlCommand("SELECT COUNT(*) FROM BlogPosts WHERE IsPublished = 1", con);
                litPublishedPosts.Text = cmdPublished.ExecuteScalar().ToString();

                // Total Views
                SqlCommand cmdViews = new SqlCommand("SELECT ISNULL(SUM(ViewCount), 0) FROM BlogPosts", con);
                litTotalViews.Text = cmdViews.ExecuteScalar().ToString();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            LoadBlogPosts(txtSearch.Text.Trim());
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtTitle.Text) || 
                string.IsNullOrWhiteSpace(txtAuthor.Text) ||
                string.IsNullOrWhiteSpace(txtExcerpt.Text) ||
                string.IsNullOrWhiteSpace(txtContent.Text) ||
                string.IsNullOrWhiteSpace(txtImageUrl.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", 
                    "alert('Please fill in all required fields.'); showModal();", true);
                return;
            }

            int blogId = Convert.ToInt32(hdnBlogId.Value);

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query;

                if (blogId == 0)
                {
                    // Insert new post
                    query = @"INSERT INTO BlogPosts 
                            (Title, Excerpt, Content, Category, Author, ImageUrl, PublishedDate, 
                             ViewCount, IsFeatured, IsPublished, Tags)
                            VALUES 
                            (@Title, @Excerpt, @Content, @Category, @Author, @ImageUrl, GETDATE(), 
                             0, @IsFeatured, @IsPublished, @Tags)";
                }
                else
                {
                    // Update existing post
                    query = @"UPDATE BlogPosts SET 
                            Title = @Title, 
                            Excerpt = @Excerpt, 
                            Content = @Content, 
                            Category = @Category, 
                            Author = @Author, 
                            ImageUrl = @ImageUrl,
                            IsFeatured = @IsFeatured,
                            IsPublished = @IsPublished,
                            Tags = @Tags
                            WHERE Id = @Id";
                }

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                cmd.Parameters.AddWithValue("@Excerpt", txtExcerpt.Text.Trim());
                cmd.Parameters.AddWithValue("@Content", txtContent.Text.Trim());
                cmd.Parameters.AddWithValue("@Category", ddlCategory.SelectedValue);
                cmd.Parameters.AddWithValue("@Author", txtAuthor.Text.Trim());
                cmd.Parameters.AddWithValue("@ImageUrl", txtImageUrl.Text.Trim());
                cmd.Parameters.AddWithValue("@IsFeatured", chkFeatured.Checked ? 1 : 0);
                cmd.Parameters.AddWithValue("@IsPublished", chkPublished.Checked ? 1 : 0);
                cmd.Parameters.AddWithValue("@Tags", txtTags.Text.Trim());

                if (blogId > 0)
                {
                    cmd.Parameters.AddWithValue("@Id", blogId);
                }

                con.Open();
                cmd.ExecuteNonQuery();
            }

            // Clear form
            ClearForm();

            // Reload data
            LoadBlogPosts();
            LoadStatistics();

            ScriptManager.RegisterStartupScript(this, GetType(), "success", 
                "alert('Blog post saved successfully!');", true);
        }

        protected void gvBlogPosts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int blogId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditPost")
            {
                LoadBlogForEdit(blogId);
                ScriptManager.RegisterStartupScript(this, GetType(), "showEdit", "showModal();", true);
            }
            else if (e.CommandName == "DeletePost")
            {
                DeleteBlogPost(blogId);
            }
            else if (e.CommandName == "TogglePublish")
            {
                TogglePublishStatus(blogId);
            }
        }

        private void LoadBlogForEdit(int blogId)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM BlogPosts WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Id", blogId);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    hdnBlogId.Value = blogId.ToString();
                    litModalTitle.Text = "Edit Blog Post";
                    txtTitle.Text = reader["Title"].ToString();
                    txtExcerpt.Text = reader["Excerpt"].ToString();
                    txtContent.Text = reader["Content"].ToString();
                    ddlCategory.SelectedValue = reader["Category"].ToString();
                    txtAuthor.Text = reader["Author"].ToString();
                    txtImageUrl.Text = reader["ImageUrl"].ToString();
                    txtTags.Text = reader["Tags"].ToString();
                    chkFeatured.Checked = Convert.ToBoolean(reader["IsFeatured"]);
                    chkPublished.Checked = Convert.ToBoolean(reader["IsPublished"]);
                }
            }
        }

        private void DeleteBlogPost(int blogId)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "DELETE FROM BlogPosts WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Id", blogId);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            LoadBlogPosts();
            LoadStatistics();

            ScriptManager.RegisterStartupScript(this, GetType(), "deleted", 
                "alert('Blog post deleted successfully!');", true);
        }

        private void TogglePublishStatus(int blogId)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "UPDATE BlogPosts SET IsPublished = CASE WHEN IsPublished = 1 THEN 0 ELSE 1 END WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Id", blogId);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            LoadBlogPosts();
            LoadStatistics();
        }

        private void ClearForm()
        {
            hdnBlogId.Value = "0";
            litModalTitle.Text = "Add New Blog Post";
            txtTitle.Text = "";
            txtExcerpt.Text = "";
            txtContent.Text = "";
            txtAuthor.Text = "";
            txtImageUrl.Text = "";
            txtTags.Text = "";
            chkFeatured.Checked = false;
            chkPublished.Checked = true;
            ddlCategory.SelectedIndex = 0;
        }

        protected string GetCategoryIcon(string category)
        {
            switch (category?.ToLower())
            {
                case "adventure":
                    return "🏔️";
                case "beach":
                case "beach & islands":
                    return "🏖️";
                case "culture":
                case "culture & heritage":
                    return "🎭";
                case "food":
                case "food & cuisine":
                    return "🍽️";
                case "tips":
                case "travel tips":
                    return "💡";
                case "guides":
                case "destination guides":
                    return "📚";
                default:
                    return "✈️";
            }
        }
    }
}
