using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Tours_Travels
{
    public partial class Deals : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constr"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDeals();
            }
        }

        private void LoadDeals()
        {
            try
            {
                // Load top destinations as deals with imaginary discounts
                string query = @"SELECT TOP 6 Id, Name, Tagline, MainImage, Duration, GroupSize, Region, Price, 
                                 CAST((RAND() * 30 + 20) AS INT) AS Discount 
                                 FROM Destinations 
                                 ORDER BY NEWID()";
                
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptDeals.DataSource = dt;
                rptDeals.DataBind();
            }
            catch (Exception ex)
            {
                // Log error
            }
        }
    }
}
