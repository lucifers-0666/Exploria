using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Tours_Travels
{
    public partial class Wishlist : System.Web.UI.Page
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

                CreateWishlistTableIfNotExists();
                LoadWishlist();
            }
        }

        private void CreateWishlistTableIfNotExists()
        {
            try
            {
                string createTableQuery = @"
                    IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Wishlist')
                    BEGIN
                        CREATE TABLE Wishlist (
                            WishlistId INT PRIMARY KEY IDENTITY(1,1),
                            UserId INT NOT NULL,
                            DestinationId INT NOT NULL,
                            DateAdded DATETIME DEFAULT GETDATE(),
                            FOREIGN KEY (UserId) REFERENCES Users(Id),
                            FOREIGN KEY (DestinationId) REFERENCES Destinations(Id)
                        )
                    END";

                SqlCommand cmd = new SqlCommand(createTableQuery, con);
                con.Open();
                cmd.ExecuteNonQuery();
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

        private void LoadWishlist()
        {
            try
            {
                int userId = Convert.ToInt32(Session["UserID"]);
                string query = @"SELECT d.Id, d.Name, d.Tagline, d.MainImage, d.Duration, 
                                d.GroupSize, d.Region, d.Price
                                FROM Wishlist w
                                INNER JOIN Destinations d ON w.DestinationId = d.Id
                                WHERE w.UserId = @UserId
                                ORDER BY w.DateAdded DESC";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserId", userId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    rptWishlist.DataSource = dt;
                    rptWishlist.DataBind();
                    pnlWishlist.Visible = true;
                    pnlEmpty.Visible = false;
                }
                else
                {
                    pnlWishlist.Visible = false;
                    pnlEmpty.Visible = true;
                }
            }
            catch (Exception ex)
            {
                // Log error
            }
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            try
            {
                Button btn = (Button)sender;
                int destinationId = Convert.ToInt32(btn.CommandArgument);
                int userId = Convert.ToInt32(Session["UserID"]);

                string query = "DELETE FROM Wishlist WHERE UserId = @UserId AND DestinationId = @DestinationId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.Parameters.AddWithValue("@DestinationId", destinationId);

                con.Open();
                cmd.ExecuteNonQuery();

                LoadWishlist();
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
    }
}
