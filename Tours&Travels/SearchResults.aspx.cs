using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;

namespace Tours_Travels
{
    public partial class SearchResults : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["connect"]?.ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string searchQuery = Request.QueryString["q"];
                string category = Request.QueryString["category"];
                string minPrice = Request.QueryString["minPrice"];
                string maxPrice = Request.QueryString["maxPrice"];

                if (!string.IsNullOrEmpty(searchQuery))
                {
                    txtQuickSearch.Text = searchQuery;
                    lblSearchQuery.Text = $"Showing results for \"{searchQuery}\"";
                }
                else
                {
                    lblSearchQuery.Text = "Explore all amazing destinations";
                }

                LoadDestinations();
            }
        }

        private void LoadDestinations()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = BuildSearchQuery();
                    
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        // Add parameters for search
                        if (!string.IsNullOrEmpty(txtQuickSearch.Text))
                        {
                            cmd.Parameters.AddWithValue("@SearchQuery", "%" + txtQuickSearch.Text.Trim() + "%");
                        }

                        // Add price filters
                        if (!string.IsNullOrEmpty(txtMinPrice.Text))
                        {
                            cmd.Parameters.AddWithValue("@MinPrice", Convert.ToDecimal(txtMinPrice.Text));
                        }

                        if (!string.IsNullOrEmpty(txtMaxPrice.Text))
                        {
                            cmd.Parameters.AddWithValue("@MaxPrice", Convert.ToDecimal(txtMaxPrice.Text));
                        }

                        // Add category filters
                        AddCategoryFilters(cmd);

                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            rptDestinations.DataSource = dt;
                            rptDestinations.DataBind();
                            lblResultsCount.Text = dt.Rows.Count.ToString();
                            pnlNoResults.Visible = false;
                        }
                        else
                        {
                            rptDestinations.DataSource = null;
                            rptDestinations.DataBind();
                            lblResultsCount.Text = "0";
                            pnlNoResults.Visible = true;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Log error
                System.Diagnostics.Debug.WriteLine("Search Error: " + ex.Message);
                pnlNoResults.Visible = true;
            }
        }

        private string BuildSearchQuery()
        {
            string query = @"SELECT Id, DestinationName, Location, Description, Price, Duration, 
                            Category, ImageUrl, CreatedAt 
                            FROM Destinations 
                            WHERE 1=1";

            // Add search condition
            if (!string.IsNullOrEmpty(txtQuickSearch.Text))
            {
                query += " AND (DestinationName LIKE @SearchQuery OR Location LIKE @SearchQuery OR Description LIKE @SearchQuery OR Category LIKE @SearchQuery)";
            }

            // Add price filters
            if (!string.IsNullOrEmpty(txtMinPrice.Text))
            {
                query += " AND Price >= @MinPrice";
            }

            if (!string.IsNullOrEmpty(txtMaxPrice.Text))
            {
                query += " AND Price <= @MaxPrice";
            }

            // Add category filter
            var selectedCategories = chkCategory.Items.Cast<ListItem>().Where(i => i.Selected).Select(i => i.Value).ToList();
            if (selectedCategories.Count > 0)
            {
                query += " AND Category IN (" + string.Join(",", selectedCategories.Select((c, i) => "@Cat" + i)) + ")";
            }

            // Add sorting
            switch (ddlSortBy.SelectedValue)
            {
                case "price_asc":
                    query += " ORDER BY Price ASC";
                    break;
                case "price_desc":
                    query += " ORDER BY Price DESC";
                    break;
                case "rating":
                    query += " ORDER BY Id DESC"; // Placeholder for rating
                    break;
                case "popular":
                    query += " ORDER BY Id DESC"; // Placeholder for popularity
                    break;
                default:
                    query += " ORDER BY CreatedAt DESC";
                    break;
            }

            return query;
        }

        private void AddCategoryFilters(SqlCommand cmd)
        {
            var selectedCategories = chkCategory.Items.Cast<ListItem>().Where(i => i.Selected).Select(i => i.Value).ToList();
            for (int i = 0; i < selectedCategories.Count; i++)
            {
                cmd.Parameters.AddWithValue("@Cat" + i, selectedCategories[i]);
            }
        }

        protected void btnQuickSearch_Click(object sender, EventArgs e)
        {
            lblSearchQuery.Text = !string.IsNullOrEmpty(txtQuickSearch.Text) 
                ? $"Showing results for \"{txtQuickSearch.Text}\"" 
                : "Explore all amazing destinations";
            LoadDestinations();
        }

        protected void btnApplyFilters_Click(object sender, EventArgs e)
        {
            LoadDestinations();
        }

        protected void btnClearFilters_Click(object sender, EventArgs e)
        {
            txtQuickSearch.Text = string.Empty;
            txtMinPrice.Text = string.Empty;
            txtMaxPrice.Text = string.Empty;
            
            foreach (ListItem item in chkCategory.Items)
            {
                item.Selected = false;
            }
            foreach (ListItem item in chkDuration.Items)
            {
                item.Selected = false;
            }
            foreach (ListItem item in chkRating.Items)
            {
                item.Selected = false;
            }

            ddlSortBy.SelectedIndex = 0;
            lblSearchQuery.Text = "Explore all amazing destinations";
            LoadDestinations();
        }

        protected void ddlSortBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadDestinations();
        }

        protected void btnBrowseAll_Click(object sender, EventArgs e)
        {
            Response.Redirect("Destination.aspx");
        }
    }
}
