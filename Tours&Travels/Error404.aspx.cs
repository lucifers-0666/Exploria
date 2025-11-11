using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Tours_Travels
{
    public partial class Error404 : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["connect"]?.ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPopularDestinations();
            }
        }

        private void LoadPopularDestinations()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = @"SELECT TOP 6 Id, DestinationName, Location, Price, ImageUrl 
                                    FROM Destinations 
                                    ORDER BY Id DESC";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        rptPopularDestinations.DataSource = dt;
                        rptPopularDestinations.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error loading destinations: " + ex.Message);
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtSearch.Text))
            {
                Response.Redirect($"SearchResults.aspx?q={Server.UrlEncode(txtSearch.Text)}");
            }
        }

        protected void btnGoHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }
    }
}
