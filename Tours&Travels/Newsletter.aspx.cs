using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tours_Travels
{
    public partial class Newsletter : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["Exploria"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if token is provided in query string for unsubscribe
                if (Request.QueryString["email"] != null)
                {
                    string email = Request.QueryString["email"];
                    txtCheckEmail.Text = email;
                    CheckSubscriptionStatus(email);
                }

                // Ensure newsletter table exists
                using (SqlConnection con = new SqlConnection(cs))
                {
                    CreateNewsletterTableIfNotExists(con);
                }
            }
        }

        protected void btnSubscribe_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtSubscribeEmail.Text))
            {
                ShowMessage(pnlSubscribeMessage, "Please enter your email address.", "warning");
                return;
            }

            string email = txtSubscribeEmail.Text.Trim();

            using (SqlConnection con = new SqlConnection(cs))
            {
                // Check if already subscribed
                string checkQuery = "SELECT IsActive FROM NewsletterSubscriptions WHERE Email = @Email";
                SqlCommand checkCmd = new SqlCommand(checkQuery, con);
                checkCmd.Parameters.AddWithValue("@Email", email);

                con.Open();
                object result = checkCmd.ExecuteScalar();

                if (result != null)
                {
                    bool isActive = Convert.ToBoolean(result);
                    if (isActive)
                    {
                        ShowMessage(pnlSubscribeMessage, "This email is already subscribed to our newsletter!", "info");
                        return;
                    }
                    else
                    {
                        // Reactivate subscription
                        string updateQuery = "UPDATE NewsletterSubscriptions SET IsActive = 1, SubscribedDate = GETDATE() WHERE Email = @Email";
                        SqlCommand updateCmd = new SqlCommand(updateQuery, con);
                        updateCmd.Parameters.AddWithValue("@Email", email);
                        updateCmd.ExecuteNonQuery();

                        ShowMessage(pnlSubscribeMessage, "Welcome back! Your subscription has been reactivated.", "success");
                        txtSubscribeEmail.Text = "";
                        return;
                    }
                }

                // New subscription
                string insertQuery = @"INSERT INTO NewsletterSubscriptions (Email, SubscribedDate, IsActive)
                                     VALUES (@Email, GETDATE(), 1)";
                SqlCommand insertCmd = new SqlCommand(insertQuery, con);
                insertCmd.Parameters.AddWithValue("@Email", email);
                insertCmd.ExecuteNonQuery();
            }

            ShowMessage(pnlSubscribeMessage, "Thank you for subscribing! You'll receive our latest travel stories and exclusive deals.", "success");
            txtSubscribeEmail.Text = "";
        }

        protected void btnCheckStatus_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtCheckEmail.Text))
            {
                ShowMessage(pnlCheckMessage, "Please enter your email address.", "warning");
                return;
            }

            string email = txtCheckEmail.Text.Trim();
            CheckSubscriptionStatus(email);
        }

        private void CheckSubscriptionStatus(string email)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM NewsletterSubscriptions WHERE Email = @Email";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", email);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    // Show manage panel
                    pnlSubscribe.Visible = false;
                    pnlManage.Visible = true;

                    litEmail.Text = email;
                    DateTime subscribedDate = Convert.ToDateTime(reader["SubscribedDate"]);
                    litSubscribedDate.Text = subscribedDate.ToString("MMMM dd, yyyy");

                    bool isActive = Convert.ToBoolean(reader["IsActive"]);
                    if (isActive)
                    {
                        litStatus.Text = "<span class='status-badge status-active'><i class='las la-check-circle'></i> Active</span>";
                        btnUnsubscribe.Visible = true;
                        btnResubscribe.Visible = false;
                    }
                    else
                    {
                        litStatus.Text = "<span class='status-badge status-inactive'><i class='las la-times-circle'></i> Inactive</span>";
                        btnUnsubscribe.Visible = false;
                        btnResubscribe.Visible = true;
                    }

                    pnlCheckMessage.Visible = false;
                }
                else
                {
                    ShowMessage(pnlCheckMessage, "No subscription found for this email address. Would you like to subscribe?", "info");
                    pnlSubscribe.Visible = true;
                    pnlManage.Visible = false;
                    txtSubscribeEmail.Text = email;
                }
            }
        }

        protected void btnUnsubscribe_Click(object sender, EventArgs e)
        {
            string email = litEmail.Text;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "UPDATE NewsletterSubscriptions SET IsActive = 0 WHERE Email = @Email";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", email);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            ShowMessage(pnlManageMessage, "You have been unsubscribed successfully. We're sorry to see you go!", "success");

            // Update UI
            litStatus.Text = "<span class='status-badge status-inactive'><i class='las la-times-circle'></i> Inactive</span>";
            btnUnsubscribe.Visible = false;
            btnResubscribe.Visible = true;
        }

        protected void btnResubscribe_Click(object sender, EventArgs e)
        {
            string email = litEmail.Text;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "UPDATE NewsletterSubscriptions SET IsActive = 1, SubscribedDate = GETDATE() WHERE Email = @Email";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Email", email);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            ShowMessage(pnlManageMessage, "Welcome back! Your subscription has been reactivated.", "success");

            // Update UI
            litStatus.Text = "<span class='status-badge status-active'><i class='las la-check-circle'></i> Active</span>";
            btnUnsubscribe.Visible = true;
            btnResubscribe.Visible = false;
        }

        private void ShowMessage(Panel panel, string message, string type)
        {
            string cssClass = "";
            string icon = "";

            switch (type)
            {
                case "success":
                    cssClass = "alert-success";
                    icon = "<i class='las la-check-circle' style='font-size: 20px;'></i>";
                    break;
                case "info":
                    cssClass = "alert-info";
                    icon = "<i class='las la-info-circle' style='font-size: 20px;'></i>";
                    break;
                case "warning":
                    cssClass = "alert-warning";
                    icon = "<i class='las la-exclamation-triangle' style='font-size: 20px;'></i>";
                    break;
                case "error":
                    cssClass = "alert-error";
                    icon = "<i class='las la-times-circle' style='font-size: 20px;'></i>";
                    break;
            }

            panel.Controls.Clear();
            panel.Controls.Add(new LiteralControl($"<div class='alert {cssClass}'>{icon}<span>{message}</span></div>"));
            panel.Visible = true;
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
    }
}
