using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Tours_Travels
{
    public partial class Contact : Page
    {
        public string s = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void GetCon()
        {
            con = new SqlConnection(s);
            con.Open();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                GetCon();

                if (string.IsNullOrEmpty(txtName.Text) || string.IsNullOrEmpty(txtEmail.Text) || string.IsNullOrEmpty(txtMessage.Text))
                {
                    lblMessage.Text = "Please fill in all required fields.";
                    lblMessage.CssClass = "form-message error";
                    lblMessage.Visible = true;
                    con.Close();
                    return;
                }

                if (txtMessage.Text.Length > 500)
                {
                    lblMessage.Text = "Message cannot exceed 500 characters.";
                    lblMessage.CssClass = "form-message error";
                    lblMessage.Visible = true;
                    con.Close();
                    return;
                }

                string subject = ddlSubject.SelectedItem.Text;
                if (subject == "Select a Subject")
                {
                    subject = "General Inquiry";
                }

                string phone = string.IsNullOrEmpty(txtPhone.Text) ? "" : txtPhone.Text.Trim();

                string query = "insert into Contacts(Name, Email, Phone, Subject, Message, CreatedDate) values('" + txtName.Text + "','" + txtEmail.Text + "','" + phone + "','" + subject + "','" + txtMessage.Text + "', GETDATE())";
                cmd = new SqlCommand(query, con);
                int rows = cmd.ExecuteNonQuery();

                if (rows > 0)
                {
                    try
                    {
                        EmailService emailService = new EmailService();

                        string userEmail = txtEmail.Text.Trim();
                        string userSubject = "Thank you for contacting Exploria Tours!";
                        string userBody = "<h3>Hello " + txtName.Text.Trim() + ",</h3>" +
                                          "<p>We have successfully received your message and appreciate you reaching out.</p>" +
                                          "<p>Our team will review your inquiry and get back to you as soon as possible.</p>" +
                                          "<p><b>Your Message Summary:</b><br/><b>Subject:</b> " + subject + "<br/><b>Message:</b> " + txtMessage.Text.Trim() + "</p>" +
                                          "<p>Thank you,<br/>The Exploria Tours Team</p>";
                        emailService.SendEmail(userEmail, userSubject, userBody);

                        string adminEmail = "wd0ashok@gmail.com";
                        string adminSubject = "New Contact Form Message: " + subject;
                        string adminBody = "<h3>New message received from the website contact form.</h3>" +
                                           "<p><b>Name:</b> " + txtName.Text.Trim() + "</p>" +
                                           "<p><b>Email:</b> " + txtEmail.Text.Trim() + "</p>" +
                                           "<p><b>Phone:</b> " + (string.IsNullOrEmpty(phone) ? "Not provided" : phone) + "</p>" +
                                           "<p><b>Subject:</b> " + subject + "</p>" +
                                           "<hr><p><b>Message:</b><br/>" + txtMessage.Text.Trim() + "</p>";
                        emailService.SendEmail(adminEmail, adminSubject, adminBody);
                    }
                    catch
                    {
                        // Email failed but data saved
                    }

                    lblMessage.Text = "Thank you! Your message has been sent successfully.";
                    lblMessage.CssClass = "form-message success";
                    lblMessage.Visible = true;

                    txtName.Text = "";
                    txtEmail.Text = "";
                    txtPhone.Text = "";
                    ddlSubject.SelectedIndex = 0;
                    txtMessage.Text = "";
                }
                else
                {
                    lblMessage.Text = "Error saving your message. Please try again.";
                    lblMessage.CssClass = "form-message error";
                    lblMessage.Visible = true;
                }

                con.Close();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "An error occurred: " + ex.Message;
                lblMessage.CssClass = "form-message error";
                lblMessage.Visible = true;
                if (con != null && con.State == System.Data.ConnectionState.Open)
                {
                    con.Close();
                }
            }
        }
    }
}
