using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Tours_Travels
{
    public partial class Gallery : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGallery();
            }
        }

        private void LoadGallery()
        {
            try
            {
                string query = "SELECT Id, Name, MainImage, Region, Category FROM Destinations ORDER BY DateAdded DESC";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptGallery.DataSource = dt;
                rptGallery.DataBind();
            }
            catch (Exception ex)
            {
                // Log error
            }
        }
    }
}
