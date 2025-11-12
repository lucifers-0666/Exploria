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
                ReportDocument report = (ReportDocument)CrystalReportViewer1.ReportSource;
                report.Close();
                report.Dispose();
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

                // Step 2: Fill the Bookings table in the dataset
                foreach (DataRow row in bookingsData.Rows)
                {
                    ds.Bookings.AddBookingsRow(
                        Convert.ToInt32(row["BookingId"]),
                        Convert.ToInt32(row["UserId"]),
                        row["DestinationId"].ToString(),
                        Convert.ToDateTime(row["TravelDate"]),
                        Convert.ToInt32(row["NumberOfAdults"]),
                        row["NumberOfChildren"] != DBNull.Value ? Convert.ToInt32(row["NumberOfChildren"]) : 0,
                        Convert.ToDecimal(row["TotalAmount"]),
                        row["BookingStatus"]?.ToString(),
                        row["TravelerFirstName"]?.ToString(),
                        row["TravelerLastName"]?.ToString(),
                        row["TravelerEmail"]?.ToString(),
                        row["TravelerPhone"]?.ToString(),
                        row["DateOfBooking"] != DBNull.Value ? Convert.ToDateTime(row["DateOfBooking"]) : DateTime.Now
                    );
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

                // Fill the dataset
                foreach (DataRow row in bookingsData.Rows)
                {
                    ds.Bookings.AddBookingsRow(
                        Convert.ToInt32(row["BookingId"]),
                        Convert.ToInt32(row["UserId"]),
                        row["DestinationId"].ToString(),
                        Convert.ToDateTime(row["TravelDate"]),
                        Convert.ToInt32(row["NumberOfAdults"]),
                        row["NumberOfChildren"] != DBNull.Value ? Convert.ToInt32(row["NumberOfChildren"]) : 0,
                        Convert.ToDecimal(row["TotalAmount"]),
                        row["BookingStatus"]?.ToString(),
                        row["TravelerFirstName"]?.ToString(),
                        row["TravelerLastName"]?.ToString(),
                        row["TravelerEmail"]?.ToString(),
                        row["TravelerPhone"]?.ToString(),
                        row["DateOfBooking"] != DBNull.Value ? Convert.ToDateTime(row["DateOfBooking"]) : DateTime.Now
                    );
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

                // Fill the dataset
                foreach (DataRow row in bookingsData.Rows)
                {
                    ds.Bookings.AddBookingsRow(
                        Convert.ToInt32(row["BookingId"]),
                        Convert.ToInt32(row["UserId"]),
                        row["DestinationId"].ToString(),
                        Convert.ToDateTime(row["TravelDate"]),
                        Convert.ToInt32(row["NumberOfAdults"]),
                        row["NumberOfChildren"] != DBNull.Value ? Convert.ToInt32(row["NumberOfChildren"]) : 0,
                        Convert.ToDecimal(row["TotalAmount"]),
                        row["BookingStatus"]?.ToString(),
                        row["TravelerFirstName"]?.ToString(),
                        row["TravelerLastName"]?.ToString(),
                        row["TravelerEmail"]?.ToString(),
                        row["TravelerPhone"]?.ToString(),
                        row["DateOfBooking"] != DBNull.Value ? Convert.ToDateTime(row["DateOfBooking"]) : DateTime.Now
                    );
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
            DataTable dt = new DataTable();

            try
            {
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    string query = @"
                        SELECT 
                            b.BookingId,
                            b.UserId,
                            CAST(b.DestinationId AS NVARCHAR(50)) AS DestinationId,
                            b.TravelDate,
                            b.NumberOfAdults,
                            ISNULL(b.NumberOfChildren, 0) AS NumberOfChildren,
                            b.TotalAmount,
                            ISNULL(b.BookingStatus, 'Pending') AS BookingStatus,
                            ISNULL(b.TravelerFirstName, u.FirstName) AS TravelerFirstName,
                            ISNULL(b.TravelerLastName, u.LastName) AS TravelerLastName,
                            ISNULL(b.TravelerEmail, u.Email) AS TravelerEmail,
                            ISNULL(b.TravelerPhone, u.Phone) AS TravelerPhone,
                            ISNULL(b.DateOfBooking, GETDATE()) AS DateOfBooking
                        FROM Bookings b
                        INNER JOIN Users u ON b.UserId = u.Id
                        WHERE 1=1";

                    // Apply filters
                    if (!string.IsNullOrEmpty(txtFromDate.Text))
                    {
                        query += " AND b.DateOfBooking >= @FromDate";
                    }

                    if (!string.IsNullOrEmpty(txtToDate.Text))
                    {
                        query += " AND b.DateOfBooking <= @ToDate";
                    }

                    if (ddlStatusFilter.SelectedValue != "All")
                    {
                        query += " AND b.BookingStatus = @Status";
                    }

                    query += " ORDER BY b.DestinationId, b.TravelerLastName, b.DateOfBooking DESC, b.BookingStatus";

                    SqlCommand cmd = new SqlCommand(query, con);

                    if (!string.IsNullOrEmpty(txtFromDate.Text))
                        cmd.Parameters.AddWithValue("@FromDate", txtFromDate.Text);

                    if (!string.IsNullOrEmpty(txtToDate.Text))
                        cmd.Parameters.AddWithValue("@ToDate", txtToDate.Text);

                    if (ddlStatusFilter.SelectedValue != "All")
                        cmd.Parameters.AddWithValue("@Status", ddlStatusFilter.SelectedValue);

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    adapter.Fill(dt);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error retrieving bookings data: " + ex.Message);
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
