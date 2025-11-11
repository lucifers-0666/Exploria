using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tours_Travels
{
    public partial class BlogDetails : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int blogId = 0;
                if (Request.QueryString["id"] != null)
                {
                    int.TryParse(Request.QueryString["id"], out blogId);
                }

                if (blogId > 0)
                {
                    LoadBlogDetails(blogId);
                    IncrementViewCount(blogId);
                    LoadRelatedPosts(blogId);
                    LoadComments(blogId);
                    SetupSocialSharing(blogId);
                }
                else
                {
                    Response.Redirect("Blog.aspx");
                }
            }
        }

        private void LoadBlogDetails(int blogId)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM BlogPosts WHERE Id = @Id AND IsPublished = 1";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Id", blogId);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    // Category with icon
                    string category = reader["Category"].ToString();
                    litCategory.Text = category;
                    litCategoryIcon.Text = GetCategoryIcon(category);

                    // Title and meta
                    litTitle.Text = reader["Title"].ToString();
                    Page.Title = reader["Title"].ToString() + " - Exploria Travel Blog";

                    litAuthor.Text = reader["Author"].ToString();
                    litAuthorName.Text = reader["Author"].ToString();
                    litAuthorName2.Text = reader["Author"].ToString();

                    DateTime publishedDate = Convert.ToDateTime(reader["PublishedDate"]);
                    litPublishedDate.Text = publishedDate.ToString("MMM dd, yyyy");

                    int viewCount = Convert.ToInt32(reader["ViewCount"]);
                    litViewCount.Text = viewCount.ToString();

                    // Calculate read time (rough estimate: 200 words per minute)
                    string content = reader["Content"].ToString();
                    int wordCount = content.Split(new[] { ' ', '\n', '\r' }, StringSplitOptions.RemoveEmptyEntries).Length;
                    int readTime = Math.Max(1, wordCount / 200);
                    litReadTime.Text = readTime.ToString();

                    // Featured image
                    imgFeatured.ImageUrl = reader["ImageUrl"].ToString();

                    // Content
                    litContent.Text = content;

                    // Tags
                    string tags = reader["Tags"].ToString();
                    if (!string.IsNullOrEmpty(tags))
                    {
                        List<string> tagList = tags.Split(',').Select(t => t.Trim()).ToList();
                        rptTags.DataSource = tagList;
                        rptTags.DataBind();
                    }
                }
                else
                {
                    Response.Redirect("Blog.aspx");
                }
            }
        }

        private void IncrementViewCount(int blogId)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "UPDATE BlogPosts SET ViewCount = ViewCount + 1 WHERE Id = @Id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Id", blogId);

                con.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private void LoadRelatedPosts(int blogId)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                // Get posts from same category, excluding current post
                string query = @"SELECT TOP 3 Id, Title, ImageUrl, PublishedDate, Category 
                               FROM BlogPosts 
                               WHERE Id != @Id 
                               AND Category = (SELECT Category FROM BlogPosts WHERE Id = @Id)
                               AND IsPublished = 1
                               ORDER BY PublishedDate DESC";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Id", blogId);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                rptRelatedPosts.DataSource = dt;
                rptRelatedPosts.DataBind();
            }
        }

        private void LoadComments(int blogId)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                // Check if BlogComments table exists, create if not
                CreateCommentsTableIfNotExists(con);

                string query = @"SELECT * FROM BlogComments 
                               WHERE BlogId = @BlogId AND IsApproved = 1 
                               ORDER BY CommentDate DESC";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@BlogId", blogId);

                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                rptComments.DataSource = dt;
                rptComments.DataBind();

                litCommentCount.Text = dt.Rows.Count.ToString();
            }
        }

        private void CreateCommentsTableIfNotExists(SqlConnection con)
        {
            string checkTable = @"IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='BlogComments' AND xtype='U')
                                CREATE TABLE BlogComments (
                                    Id INT PRIMARY KEY IDENTITY(1,1),
                                    BlogId INT NOT NULL,
                                    CommenterName NVARCHAR(255) NOT NULL,
                                    CommenterEmail NVARCHAR(255) NOT NULL,
                                    CommentText NVARCHAR(MAX) NOT NULL,
                                    CommentDate DATETIME DEFAULT GETDATE(),
                                    IsApproved BIT DEFAULT 1
                                )";

            SqlCommand cmd = new SqlCommand(checkTable, con);
            if (con.State == ConnectionState.Closed)
                con.Open();
            cmd.ExecuteNonQuery();
        }

        private void SetupSocialSharing(int blogId)
        {
            string currentUrl = Request.Url.AbsoluteUri;
            string title = litTitle.Text;

            // Facebook
            lnkShareFacebook.NavigateUrl = $"https://www.facebook.com/sharer/sharer.php?u={HttpUtility.UrlEncode(currentUrl)}";

            // Twitter
            lnkShareTwitter.NavigateUrl = $"https://twitter.com/intent/tweet?url={HttpUtility.UrlEncode(currentUrl)}&text={HttpUtility.UrlEncode(title)}";

            // LinkedIn
            lnkShareLinkedIn.NavigateUrl = $"https://www.linkedin.com/shareArticle?mini=true&url={HttpUtility.UrlEncode(currentUrl)}&title={HttpUtility.UrlEncode(title)}";

            // WhatsApp
            lnkShareWhatsApp.NavigateUrl = $"https://api.whatsapp.com/send?text={HttpUtility.UrlEncode(title + " " + currentUrl)}";
        }

        protected void btnSubmitComment_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtCommentName.Text) || 
                string.IsNullOrWhiteSpace(txtCommentEmail.Text) || 
                string.IsNullOrWhiteSpace(txtCommentText.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", 
                    "alert('Please fill in all fields.');", true);
                return;
            }

            int blogId = 0;
            if (Request.QueryString["id"] != null)
            {
                int.TryParse(Request.QueryString["id"], out blogId);
            }

            if (blogId > 0)
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = @"INSERT INTO BlogComments (BlogId, CommenterName, CommenterEmail, CommentText, CommentDate, IsApproved)
                                   VALUES (@BlogId, @Name, @Email, @Comment, GETDATE(), 1)";

                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@BlogId", blogId);
                    cmd.Parameters.AddWithValue("@Name", txtCommentName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtCommentEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Comment", txtCommentText.Text.Trim());

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                // Clear form
                txtCommentName.Text = "";
                txtCommentEmail.Text = "";
                txtCommentText.Text = "";

                // Reload comments
                LoadComments(blogId);

                ScriptManager.RegisterStartupScript(this, GetType(), "success", 
                    "alert('Thank you! Your comment has been posted.');", true);
            }
        }

        protected void btnSubscribe_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtNewsletterEmail.Text))
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "alert", 
                    "alert('Please enter your email address.');", true);
                return;
            }

            using (SqlConnection con = new SqlConnection(cs))
            {
                // Check if NewsletterSubscriptions table exists, create if not
                CreateNewsletterTableIfNotExists(con);

                // Check if email already exists
                string checkQuery = "SELECT COUNT(*) FROM NewsletterSubscriptions WHERE Email = @Email";
                SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                checkCmd.Parameters.AddWithValue("@Email", txtNewsletterEmail.Text.Trim());

                con.Open();
                int count = (int)checkCmd.ExecuteScalar();

                if (count > 0)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", 
                        "alert('This email is already subscribed to our newsletter.');", true);
                    return;
                }

                // Insert new subscription
                string insertQuery = @"INSERT INTO NewsletterSubscriptions (Email, SubscribedDate, IsActive)
                                     VALUES (@Email, GETDATE(), 1)";

                SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                insertCmd.Parameters.AddWithValue("@Email", txtNewsletterEmail.Text.Trim());
                insertCmd.ExecuteNonQuery();
            }

            txtNewsletterEmail.Text = "";
            ScriptManager.RegisterStartupScript(this, GetType(), "success", 
                "alert('Thank you for subscribing! You will receive our latest travel stories.');", true);
        }

        private void CreateNewsletterTableIfNotExists(SqlConnection con)
        {
            string checkTable = @"IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='NewsletterSubscriptions' AND xtype='U')
                                CREATE TABLE NewsletterSubscriptions (
                                    Id INT PRIMARY KEY IDENTITY(1,1),
                                    Email NVARCHAR(255) NOT NULL UNIQUE,
                                    SubscribedDate DATETIME DEFAULT GETDATE(),
                                    IsActive BIT DEFAULT 1
                                )";

            SqlCommand cmd = new SqlCommand(checkTable, con);
            if (con.State == ConnectionState.Closed)
                con.Open();
            cmd.ExecuteNonQuery();
        }

        private string GetCategoryIcon(string category)
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
