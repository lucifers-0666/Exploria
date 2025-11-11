using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace Tours_Travels
{
    public partial class EmailVerification : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["connect"]?.ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string token = Request.QueryString["token"];
                string email = Request.QueryString["email"];

                if (!string.IsNullOrEmpty(token) && !string.IsNullOrEmpty(email))
                {
                    // Verify the token
                    VerifyToken(token, email);
                }
                else if (Session["UserEmail"] != null)
                {
                    // Show pending state for logged-in user
                    ShowPendingState(Session["UserEmail"].ToString());
                }
                else
                {
                    // Show error if no token or session
                    ShowErrorState("Invalid verification link. Please try again.");
                }
            }
        }

        private void VerifyToken(string token, string email)
        {
            try
            {
                // First, check if verification tokens table exists, if not create it
                CreateVerificationTableIfNotExists();

                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = @"SELECT UserId, ExpiryDate, IsUsed 
                                    FROM EmailVerificationTokens 
                                    WHERE Token = @Token AND Email = @Email";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Token", token);
                        cmd.Parameters.AddWithValue("@Email", email);

                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        if (reader.Read())
                        {
                            bool isUsed = Convert.ToBoolean(reader["IsUsed"]);
                            DateTime expiryDate = Convert.ToDateTime(reader["ExpiryDate"]);
                            int userId = Convert.ToInt32(reader["UserId"]);

                            reader.Close();

                            if (isUsed)
                            {
                                ShowErrorState("This verification link has already been used.");
                            }
                            else if (DateTime.Now > expiryDate)
                            {
                                ShowErrorState("This verification link has expired. Please request a new one.");
                            }
                            else
                            {
                                // Mark token as used
                                MarkTokenAsUsed(token);

                                // Update user as verified
                                UpdateUserVerificationStatus(userId);

                                ShowSuccessState();
                            }
                        }
                        else
                        {
                            ShowErrorState("Invalid verification link. Please check your email or request a new link.");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Verification Error: " + ex.Message);
                ShowErrorState("An error occurred during verification. Please try again later.");
            }
        }

        private void CreateVerificationTableIfNotExists()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string createTableQuery = @"
                        IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'EmailVerificationTokens')
                        BEGIN
                            CREATE TABLE EmailVerificationTokens (
                                Id INT PRIMARY KEY IDENTITY(1,1),
                                UserId INT NOT NULL,
                                Email NVARCHAR(255) NOT NULL,
                                Token NVARCHAR(500) NOT NULL,
                                CreatedDate DATETIME NOT NULL DEFAULT GETDATE(),
                                ExpiryDate DATETIME NOT NULL,
                                IsUsed BIT NOT NULL DEFAULT 0
                            )
                        END";

                    using (SqlCommand cmd = new SqlCommand(createTableQuery, con))
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Table Creation Error: " + ex.Message);
            }
        }

        private void MarkTokenAsUsed(string token)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "UPDATE EmailVerificationTokens SET IsUsed = 1 WHERE Token = @Token";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Token", token);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Mark Token Error: " + ex.Message);
            }
        }

        private void UpdateUserVerificationStatus(int userId)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    // First check if EmailVerified column exists
                    string checkColumnQuery = @"
                        IF NOT EXISTS (
                            SELECT * FROM sys.columns 
                            WHERE object_id = OBJECT_ID('Registration') 
                            AND name = 'EmailVerified'
                        )
                        BEGIN
                            ALTER TABLE Registration ADD EmailVerified BIT NOT NULL DEFAULT 0
                        END";

                    using (SqlCommand checkCmd = new SqlCommand(checkColumnQuery, con))
                    {
                        con.Open();
                        checkCmd.ExecuteNonQuery();
                    }

                    // Update user verification status
                    string updateQuery = "UPDATE Registration SET EmailVerified = 1 WHERE Id = @UserId";

                    using (SqlCommand cmd = new SqlCommand(updateQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Update User Error: " + ex.Message);
            }
        }

        private void ShowSuccessState()
        {
            pnlProcessing.Visible = false;
            pnlPending.Visible = false;
            pnlError.Visible = false;
            pnlSuccess.Visible = true;
        }

        private void ShowErrorState(string message)
        {
            pnlProcessing.Visible = false;
            pnlPending.Visible = false;
            pnlSuccess.Visible = false;
            pnlError.Visible = true;
            lblErrorMessage.Text = message;
        }

        private void ShowPendingState(string email)
        {
            pnlProcessing.Visible = false;
            pnlSuccess.Visible = false;
            pnlError.Visible = false;
            pnlPending.Visible = true;
            lblUserEmail.Text = email;
        }

        protected void btnResendEmail_Click(object sender, EventArgs e)
        {
            try
            {
                string email = Session["UserEmail"]?.ToString();
                
                if (string.IsNullOrEmpty(email))
                {
                    email = Request.QueryString["email"];
                }

                if (!string.IsNullOrEmpty(email))
                {
                    // Generate new token and send email
                    GenerateAndSendVerificationEmail(email);
                    
                    lblResendCountdown.Visible = true;
                    ClientScript.RegisterStartupScript(this.GetType(), "countdown", "startCountdown();", true);
                    
                    // Show success message
                    ShowPendingState(email);
                }
                else
                {
                    ShowErrorState("Unable to resend email. Please contact support.");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Resend Email Error: " + ex.Message);
                ShowErrorState("Failed to resend verification email. Please try again later.");
            }
        }

        private void GenerateAndSendVerificationEmail(string email)
        {
            try
            {
                // Get user ID from email
                int userId = GetUserIdByEmail(email);
                
                if (userId > 0)
                {
                    // Generate unique token
                    string token = GenerateSecureToken();
                    DateTime expiryDate = DateTime.Now.AddHours(24);

                    // Save token to database
                    SaveVerificationToken(userId, email, token, expiryDate);

                    // In production, send actual email here
                    // For now, we'll just log the verification link
                    string verificationLink = $"{Request.Url.Scheme}://{Request.Url.Authority}/EmailVerification.aspx?token={token}&email={email}";
                    System.Diagnostics.Debug.WriteLine($"Verification Link: {verificationLink}");
                    
                    // TODO: Send email using SMTP
                    // SendVerificationEmail(email, verificationLink);
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Generate Email Error: " + ex.Message);
                throw;
            }
        }

        private int GetUserIdByEmail(string email)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = "SELECT Id FROM Registration WHERE Email = @Email";
                    
                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);
                        con.Open();
                        
                        object result = cmd.ExecuteScalar();
                        return result != null ? Convert.ToInt32(result) : 0;
                    }
                }
            }
            catch
            {
                return 0;
            }
        }

        private string GenerateSecureToken()
        {
            using (RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider())
            {
                byte[] tokenData = new byte[32];
                rng.GetBytes(tokenData);
                return Convert.ToBase64String(tokenData).Replace("+", "-").Replace("/", "_").Replace("=", "");
            }
        }

        private void SaveVerificationToken(int userId, string email, string token, DateTime expiryDate)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = @"INSERT INTO EmailVerificationTokens (UserId, Email, Token, ExpiryDate) 
                                    VALUES (@UserId, @Email, @Token, @ExpiryDate)";

                    using (SqlCommand cmd = new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Token", token);
                        cmd.Parameters.AddWithValue("@ExpiryDate", expiryDate);

                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Save Token Error: " + ex.Message);
                throw;
            }
        }

        protected void btnGoToDashboard_Click(object sender, EventArgs e)
        {
            Response.Redirect("Dashboard.aspx");
        }

        protected void btnBrowseDestinations_Click(object sender, EventArgs e)
        {
            Response.Redirect("Destination.aspx");
        }

        protected void btnContactSupport_Click(object sender, EventArgs e)
        {
            Response.Redirect("Contact.aspx");
        }
    }
}
