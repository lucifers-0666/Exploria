using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

namespace Tours_Travels
{
    public partial class AdminBookingReports : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is admin
            if (Session["isLogin"] == null || Session["isLogin"].ToString() != "true")
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (Session["Role"] == null || Session["Role"].ToString() != "admin")
            {
                Response.Redirect("Home.aspx");
                return;
            }

            if (!IsPostBack)
            {
                // Set default dates (last 30 days)
                txtToDate.Text = DateTime.Now.ToString("yyyy-MM-dd");
                txtFromDate.Text = DateTime.Now.AddDays(-30).ToString("yyyy-MM-dd");
            }
        }

        protected void Page_Unload(object sender, EventArgs e)
        {
            // Dispose Crystal Reports resources properly
            if (CrystalReportViewer1.ReportSource != null)
            {
                if (CrystalReportViewer1.ReportSource is ReportDocument)
                {
                    ReportDocument report = (ReportDocument)CrystalReportViewer1.ReportSource;
                    report.Close();
                    report.Dispose();
                }
                CrystalReportViewer1.ReportSource = null;
            }
        }

        protected void btnGenerateReport_Click(object sender, EventArgs e)
        {
            try
            {
                // Step 1: Fetch data into ReportsDataSet
                ReportsDataSet ds = new ReportsDataSet();
                DataTable bookingsData = GetBookingsData();

                if (bookingsData.Rows.Count == 0)
                {
                    ShowError("No data found for the selected criteria.");
                    return;
                }

                // Step 2: Fill the Bookings table in the dataset using ImportRow
                foreach (DataRow row in bookingsData.Rows)
                {
                    ds.Bookings.ImportRow(row);
                }

                // Step 3: Load the Crystal Report
                ReportDocument crystalReport = new ReportDocument();
                string reportPath = Server.MapPath("~/Reports/BookingSummaryReport.rpt");

                // Check if report file exists
                if (!File.Exists(reportPath))
                {
                    ShowError("Report file not found. Please create BookingSummaryReport.rpt in the Reports folder. " +
                             "Use Visual Studio: Add → New Item → Crystal Report");
                    return;
                }

                crystalReport.Load(reportPath);

                // Step 4: Set the DataSet as the data source
                crystalReport.SetDataSource(ds);

                // Step 5: Set parameters if needed
                if (crystalReport.ParameterFields.Count > 0)
                {
                    if (crystalReport.ParameterFields["FromDate"] != null)
                        crystalReport.SetParameterValue("FromDate", txtFromDate.Text);
                    
                    if (crystalReport.ParameterFields["ToDate"] != null)
                        crystalReport.SetParameterValue("ToDate", txtToDate.Text);
                    
                    if (crystalReport.ParameterFields["Status"] != null)
                        crystalReport.SetParameterValue("Status", ddlStatusFilter.SelectedValue);
                }

                // Step 6: Bind to viewer
                CrystalReportViewer1.ReportSource = crystalReport;
                CrystalReportViewer1.DataBind();

                ShowInfo($"Report generated successfully! Found {bookingsData.Rows.Count} booking(s).");
            }
            catch (Exception ex)
            {
                ShowError("Error generating report: " + ex.Message + 
                         (ex.InnerException != null ? " Inner: " + ex.InnerException.Message : ""));
            }
        }

        protected void btnExportPDF_Click(object sender, EventArgs e)
        {
            try
            {
                // Get data and create dataset
                ReportsDataSet ds = new ReportsDataSet();
                DataTable bookingsData = GetBookingsData();

                if (bookingsData.Rows.Count == 0)
                {
                    ShowError("No data found to export.");
                    return;
                }

                // Fill the dataset using ImportRow
                foreach (DataRow row in bookingsData.Rows)
                {
                    ds.Bookings.ImportRow(row);
                }

                // Load Crystal Report
                ReportDocument crystalReport = new ReportDocument();
                string reportPath = Server.MapPath("~/Reports/BookingSummaryReport.rpt");

                if (!File.Exists(reportPath))
                {
                    ShowError("Report file not found.");
                    return;
                }

                crystalReport.Load(reportPath);
                crystalReport.SetDataSource(ds);

                // Set parameters
                if (crystalReport.ParameterFields.Count > 0)
                {
                    if (crystalReport.ParameterFields["FromDate"] != null)
                        crystalReport.SetParameterValue("FromDate", txtFromDate.Text);
                    
                    if (crystalReport.ParameterFields["ToDate"] != null)
                        crystalReport.SetParameterValue("ToDate", txtToDate.Text);
                    
                    if (crystalReport.ParameterFields["Status"] != null)
                        crystalReport.SetParameterValue("Status", ddlStatusFilter.SelectedValue);
                }

                // Export to PDF
                string fileName = $"DestinovaBookingReport_{DateTime.Now:yyyyMMddHHmmss}.pdf";
                
                Response.Buffer = false;
                Response.ClearContent();
                Response.ClearHeaders();
                Response.ContentType = "application/pdf";
                Response.AddHeader("Content-Disposition", $"attachment; filename={fileName}");

                Stream stream = crystalReport.ExportToStream(ExportFormatType.PortableDocFormat);
                byte[] buffer = new byte[stream.Length];
                stream.Read(buffer, 0, buffer.Length);
                
                Response.BinaryWrite(buffer);
                Response.Flush();
                Response.End();

                crystalReport.Close();
                crystalReport.Dispose();
            }
            catch (Exception ex)
            {
                ShowError("Error exporting to PDF: " + ex.Message);
            }
        }

        protected void btnExportExcel_Click(object sender, EventArgs e)
        {
            try
            {
                // Get data and create dataset
                ReportsDataSet ds = new ReportsDataSet();
                DataTable bookingsData = GetBookingsData();

                if (bookingsData.Rows.Count == 0)
                {
                    ShowError("No data found to export.");
                    return;
                }

                // Fill the dataset using ImportRow
                foreach (DataRow row in bookingsData.Rows)
                {
                    ds.Bookings.ImportRow(row);
                }

                // Load Crystal Report
                ReportDocument crystalReport = new ReportDocument();
                string reportPath = Server.MapPath("~/Reports/BookingSummaryReport.rpt");

                if (!File.Exists(reportPath))
                {
                    ShowError("Report file not found.");
                    return;
                }

                crystalReport.Load(reportPath);
                crystalReport.SetDataSource(ds);

                // Set parameters
                if (crystalReport.ParameterFields.Count > 0)
                {
                    if (crystalReport.ParameterFields["FromDate"] != null)
                        crystalReport.SetParameterValue("FromDate", txtFromDate.Text);
                    
                    if (crystalReport.ParameterFields["ToDate"] != null)
                        crystalReport.SetParameterValue("ToDate", txtToDate.Text);
                    
                    if (crystalReport.ParameterFields["Status"] != null)
                        crystalReport.SetParameterValue("Status", ddlStatusFilter.SelectedValue);
                }

                // Export to Excel
                string fileName = $"DestinovaBookingReport_{DateTime.Now:yyyyMMddHHmmss}.xls";
                
                Response.Buffer = false;
                Response.ClearContent();
                Response.ClearHeaders();
                Response.ContentType = "application/vnd.ms-excel";
                Response.AddHeader("Content-Disposition", $"attachment; filename={fileName}");

                Stream stream = crystalReport.ExportToStream(ExportFormatType.Excel);
                byte[] buffer = new byte[stream.Length];
                stream.Read(buffer, 0, buffer.Length);
                
                Response.BinaryWrite(buffer);
                Response.Flush();
                Response.End();

                crystalReport.Close();
                crystalReport.Dispose();
            }
            catch (Exception ex)
            {
                ShowError("Error exporting to Excel: " + ex.Message);
            }
        }

        private DataTable GetBookingsData()
        {
            DataTable dt = new DataTable("Bookings");

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = @"
                        SELECT 
                            b.BookingId,
                            b.UserId,
                            u.FirstName + ' ' + u.LastName AS CustomerName,
                            u.Email AS CustomerEmail,
                            d.Name AS DestinationName,
                            d.Category AS DestinationCategory,
                            b.TravelDate,
                            b.NumberOfAdults,
                            b.NumberOfChildren,
                            b.TotalAmount,
                            b.BookingStatus,
                            b.DateOfBooking,
                            b.TravelerFirstName,
                            b.TravelerLastName,
                            b.TravelerEmail,
                            b.TravelerPhone
                        FROM Bookings b
                        JOIN Users u ON b.UserId = u.Id
                        JOIN Destinations d ON b.DestinationId = d.Id
                        WHERE 1=1";

                    // Apply filters
                    if (!string.IsNullOrEmpty(txtFromDate.Text))
                    {
                        query += " AND b.DateOfBooking >= @FromDate";
                    }

                    if (!string.IsNullOrEmpty(txtToDate.Text))
                    {
                        // Add 1 day to include the end date
                        query += " AND b.DateOfBooking < DATEADD(day, 1, @ToDate)";
                    }

                    if (ddlStatusFilter.SelectedValue != "All")
                    {
                        query += " AND b.BookingStatus = @Status";
                    }

                    query += " ORDER BY b.DateOfBooking DESC";

                    SqlCommand cmd = new SqlCommand(query, con);

                    if (!string.IsNullOrEmpty(txtFromDate.Text))
                        cmd.Parameters.AddWithValue("@FromDate", Convert.ToDateTime(txtFromDate.Text));

                    if (!string.IsNullOrEmpty(txtToDate.Text))
                        cmd.Parameters.AddWithValue("@ToDate", Convert.ToDateTime(txtToDate.Text));

                    if (ddlStatusFilter.SelectedValue != "All")
                        cmd.Parameters.AddWithValue("@Status", ddlStatusFilter.SelectedValue);

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(dt);
                }
            }
            catch (Exception ex)
            {
                // Provide a more detailed error message
                throw new Exception("Error retrieving bookings data. Please ensure the database schema is correct and all tables (Bookings, Users, Destinations) exist. Details: " + ex.Message, ex);
            }

            return dt;
        }

        private void ShowInfo(string message)
        {
            pnlInfo.Visible = true;
            pnlError.Visible = false;
            lblInfo.Text = message;
        }

        private void ShowError(string message)
        {
            pnlError.Visible = true;
            pnlInfo.Visible = false;
            lblError.Text = message;
        }
    }
}
