using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Tours_Travels
{
    public partial class Blog : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["connect"]?.ConnectionString;
        private string currentCategory = "All";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CreateBlogTableIfNotExists();
                LoadFeaturedPosts();
                LoadBlogPosts();
                
                // Check for category from query string
                if (Request.QueryString["category"] != null)
                {
                    currentCategory = Request.QueryString["category"];
                    UpdateCategoryButtons(currentCategory);
                    lblSectionTitle.Text = currentCategory == "All" ? "Latest Articles" : $"{currentCategory} Articles";
                }
            }
        }

        private void CreateBlogTableIfNotExists()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string createTableQuery = @"
                        IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'BlogPosts')
                        BEGIN
                            CREATE TABLE BlogPosts (
                                Id INT PRIMARY KEY IDENTITY(1,1),
                                Title NVARCHAR(500) NOT NULL,
                                Excerpt NVARCHAR(1000),
                                Content NVARCHAR(MAX) NOT NULL,
                                Category NVARCHAR(100) NOT NULL,
                                Author NVARCHAR(255) NOT NULL,
                                ImageUrl NVARCHAR(500),
                                PublishedDate DATETIME NOT NULL DEFAULT GETDATE(),
                                ViewCount INT NOT NULL DEFAULT 0,
                                IsFeatured BIT NOT NULL DEFAULT 0,
                                IsPublished BIT NOT NULL DEFAULT 1,
                                Tags NVARCHAR(500)
                            )
                        END";

                    using (SqlCommand cmd = new SqlCommand(createTableQuery, con))
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }

                    // Insert sample blog posts if table is empty
                    InsertSampleBlogPosts(con);
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Table Creation Error: " + ex.Message);
            }
        }

        private void InsertSampleBlogPosts(SqlConnection con)
        {
            try
            {
                // Check if posts exist
                string checkQuery = "SELECT COUNT(*) FROM BlogPosts";
                using (SqlCommand cmd = new SqlCommand(checkQuery, con))
                {
                    if (con.State != System.Data.ConnectionState.Open)
                        con.Open();
                    
                    int count = (int)cmd.ExecuteScalar();
                    
                    if (count == 0)
                    {
                        // Insert sample posts
                        string insertQuery = @"
                            INSERT INTO BlogPosts (Title, Excerpt, Content, Category, Author, ImageUrl, IsFeatured, ViewCount) VALUES
                            ('10 Hidden Gems in the Himalayas You Must Visit', 
                             'Discover breathtaking destinations off the beaten path in the majestic Himalayan ranges.', 
                             'Explore the lesser-known wonders of the Himalayas that promise unforgettable adventures...', 
                             'Adventure', 'Sarah Johnson', 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800', 1, 1234),
                            
                            ('The Ultimate Beach Vacation Guide for 2025', 
                             'Everything you need to know about planning the perfect beach getaway this year.', 
                             'From Goa to the Maldives, discover the best beach destinations...', 
                             'Beach', 'Michael Chen', 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800', 1, 987),
                            
                            ('Exploring Ancient Temples: A Cultural Journey', 
                             'Step back in time and experience India''s rich cultural heritage through its ancient temples.', 
                             'Discover the architectural marvels and spiritual significance...', 
                             'Culture', 'Priya Sharma', 'https://images.unsplash.com/photo-1564507592333-c60657eea523?w=800', 1, 756),
                            
                            ('Street Food Adventures: A Culinary Tour of India', 
                             'Taste your way through India''s most vibrant street food scenes.', 
                             'From Mumbai''s vada pav to Delhi''s chaat, explore the flavors...', 
                             'Food', 'Raj Patel', 'https://images.unsplash.com/photo-1554978991-33ef7f31d658?w=800', 0, 543),
                            
                            ('Essential Travel Tips for First-Time Backpackers', 
                             'Make your first backpacking trip memorable with these expert tips.', 
                             'Learn about packing essentials, budgeting, and safety...', 
                             'Tips', 'Emily Watson', 'https://images.unsplash.com/photo-1488646953014-85cb44e25828?w=800', 0, 892),
                            
                            ('Complete Guide to Trekking in Ladakh', 
                             'Everything you need to know before embarking on a Ladakh adventure.', 
                             'Explore the best trekking routes, preparation tips, and more...', 
                             'Guides', 'David Kumar', 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800', 0, 678)";

                        using (SqlCommand insertCmd = new SqlCommand(insertQuery, con))
                        {
                            insertCmd.ExecuteNonQuery();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Sample Data Error: " + ex.Message);
            }
        }

        private void LoadFeaturedPosts()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = @"SELECT TOP 4 Id, Title, Excerpt, Category, Author, ImageUrl, 
                                    PublishedDate, ViewCount 
                                    FROM BlogPosts 
                                    WHERE IsPublished = 1 AND IsFeatured = 1
                                    ORDER BY PublishedDate DESC";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            rptFeatured.DataSource = dt;
                            rptFeatured.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Load Featured Error: " + ex.Message);
            }
        }

        private void LoadBlogPosts()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = @"SELECT Id, Title, Excerpt, Content, Category, Author, ImageUrl, 
                                    PublishedDate, ViewCount 
                                    FROM BlogPosts 
                                    WHERE IsPublished = 1";

                    // Add category filter
                    if (ViewState["CurrentCategory"] != null && ViewState["CurrentCategory"].ToString() != "All")
                    {
                        query += " AND Category = @Category";
                    }

                    // Add search filter
                    if (!string.IsNullOrEmpty(txtBlogSearch.Text))
                    {
                        query += " AND (Title LIKE @Search OR Excerpt LIKE @Search OR Content LIKE @Search OR Tags LIKE @Search)";
                    }

                    query += " ORDER BY PublishedDate DESC";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        if (ViewState["CurrentCategory"] != null && ViewState["CurrentCategory"].ToString() != "All")
                        {
                            cmd.Parameters.AddWithValue("@Category", ViewState["CurrentCategory"].ToString());
                        }

                        if (!string.IsNullOrEmpty(txtBlogSearch.Text))
                        {
                            cmd.Parameters.AddWithValue("@Search", "%" + txtBlogSearch.Text.Trim() + "%");
                        }

                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            rptBlogPosts.DataSource = dt;
                            rptBlogPosts.DataBind();
                            lblPostCount.Text = $"{dt.Rows.Count} articles";
                        }
                        else
                        {
                            rptBlogPosts.DataSource = null;
                            rptBlogPosts.DataBind();
                            lblPostCount.Text = "0 articles";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Load Posts Error: " + ex.Message);
            }
        }

        protected void btnCategory_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string category = btn.CommandArgument;
            
            ViewState["CurrentCategory"] = category;
            UpdateCategoryButtons(category);
            lblSectionTitle.Text = category == "All" ? "Latest Articles" : $"{category} Articles";
            
            LoadBlogPosts();
        }

        private void UpdateCategoryButtons(string activeCategory)
        {
            // Reset all buttons
            btnCatAll.CssClass = "category-btn";
            btnCatAdventure.CssClass = "category-btn";
            btnCatBeach.CssClass = "category-btn";
            btnCatCulture.CssClass = "category-btn";
            btnCatFood.CssClass = "category-btn";
            btnCatTips.CssClass = "category-btn";
            btnCatGuides.CssClass = "category-btn";

            // Set active button
            switch (activeCategory)
            {
                case "All":
                    btnCatAll.CssClass = "category-btn active";
                    break;
                case "Adventure":
                    btnCatAdventure.CssClass = "category-btn active";
                    break;
                case "Beach":
                    btnCatBeach.CssClass = "category-btn active";
                    break;
                case "Culture":
                    btnCatCulture.CssClass = "category-btn active";
                    break;
                case "Food":
                    btnCatFood.CssClass = "category-btn active";
                    break;
                case "Tips":
                    btnCatTips.CssClass = "category-btn active";
                    break;
                case "Guides":
                    btnCatGuides.CssClass = "category-btn active";
                    break;
            }
        }

        protected void btnBlogSearch_Click(object sender, EventArgs e)
        {
            LoadBlogPosts();
        }

        protected void btnSubscribe_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(txtNewsletterEmail.Text))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", 
                        "alert('Please enter your email address');", true);
                    return;
                }

                // Here you would typically save to a newsletter subscribers table
                // For now, we'll just show a success message

                ClientScript.RegisterStartupScript(this.GetType(), "success", 
                    "alert('Thank you for subscribing! You will receive travel updates in your inbox.');", true);
                
                txtNewsletterEmail.Text = "";
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Subscribe Error: " + ex.Message);
                ClientScript.RegisterStartupScript(this.GetType(), "error", 
                    "alert('Failed to subscribe. Please try again later.');", true);
            }
        }
    }
}
