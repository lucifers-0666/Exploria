using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Tours_Travels
{
    public partial class Login : System.Web.UI.Page
    {
        public string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        public void GetCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginMessage"] != null)
            {
                lblMessage.Text = Session["LoginMessage"].ToString();
                lblMessage.ForeColor = System.Drawing.Color.Red;
                Session.Remove("LoginMessage");
            }
            if (Session["ResetMessage"] != null)
            {
                lblMessage.Text = Session["ResetMessage"].ToString();
                lblMessage.ForeColor = System.Drawing.Color.Green;
                Session.Remove("ResetMessage");
            }

        }
      
        protected void btnLogin_Click1(object sender, EventArgs e)
        {
            if(txtEmail.Text == "" || txtPassword.Text == "")
            {
                lblMessage.Text = "All fields are required.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }
            
            try
            {
                GetCon();
                // Use parameterized query to prevent SQL injection - using lowercase 'users' table
                string query = "SELECT * FROM users WHERE Email = @Email AND Password = @Password";
                cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
                
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    // Try to get the ID column - it might be named differently
                    // Common variations: Id, ID, UserId, UserID, User_Id
                    string userId = "";
                    try
                    {
                        if (dr.GetOrdinal("Id") >= 0)
                            userId = dr["Id"].ToString();
                    }
                    catch
                    {
                        try
                        {
                            if (dr.GetOrdinal("ID") >= 0)
                                userId = dr["ID"].ToString();
                        }
                        catch
                        {
                            try
                            {
                                if (dr.GetOrdinal("UserID") >= 0)
                                    userId = dr["UserID"].ToString();
                            }
                            catch
                            {
                                // If no ID column found, use Email as identifier
                                userId = dr["Email"].ToString();
                            }
                        }
                    }
                    
                    Session["UserID"] = userId;
                    Session["FirstName"] = dr["FirstName"].ToString();
                    Session["LastName"] = dr["LastName"].ToString();
                    Session["Email"] = dr["Email"].ToString();
                    
                    // Handle Role column - check if it exists
                    try
                    {
                        if (dr.GetOrdinal("Role") >= 0 && dr["Role"] != DBNull.Value)
                        {
                            Session["Role"] = dr["Role"].ToString();
                        }
                        else
                        {
                            Session["Role"] = "users"; // Default role
                        }
                    }
                    catch
                    {
                        Session["Role"] = "users"; // Default role if column doesn't exist
                    }
                    
                    dr.Close();
                    con.Close();
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid Email or Password.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    dr.Close();
                    con.Close();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
                if (con != null && con.State == System.Data.ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }
    }
}