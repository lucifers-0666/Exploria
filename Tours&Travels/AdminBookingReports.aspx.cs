using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
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

        protected void btnGenerateReport_Click(object sender, EventArgs e)
        {
            try
            {
                // Get the data based on filters
                DataTable bookingsData = GetBookingsData();

                if (bookingsData.Rows.Count == 0)
                {
                    ShowError("No data found for the selected criteria.");
                    return;
                }

                // Load the appropriate Crystal Report
                ReportDocument crystalReport = new ReportDocument();
                string reportPath = Server.MapPath("~/Reports/BookingSummaryReport.rpt");

                // Check if report file exists
                if (!File.Exists(reportPath))
                {
                    ShowError("Report file not found. Please create the report file in Visual Studio first.");
                    return;
                }

                crystalReport.Load(reportPath);

                // Set the data source
                crystalReport.SetDataSource(bookingsData);

                // Set parameters if needed
                crystalReport.SetParameterValue("FromDate", txtFromDate.Text);
                crystalReport.SetParameterValue("ToDate", txtToDate.Text);
                crystalReport.SetParameterValue("Status", ddlStatusFilter.SelectedValue);

                // Bind to viewer
                CrystalReportViewer1.ReportSource = crystalReport;
                CrystalReportViewer1.DataBind();

                ShowInfo("Report generated successfully!");
            }
            catch (Exception ex)
            {
                ShowError("Error generating report: " + ex.Message);
            }
        }

        protected void btnExportPDF_Click(object sender, EventArgs e)
        {
            try
            {
                DataTable bookingsData = GetBookingsData();

                if (bookingsData.Rows.Count == 0)
                {
                    ShowError("No data found to export.");
                    return;
                }

                ReportDocument crystalReport = new ReportDocument();
                string reportPath = Server.MapPath("~/Reports/BookingSummaryReport.rpt");

                if (!File.Exists(reportPath))
                {
                    ShowError("Report file not found.");
                    return;
                }

                crystalReport.Load(reportPath);
                crystalReport.SetDataSource(bookingsData);

                // Set parameters
                crystalReport.SetParameterValue("FromDate", txtFromDate.Text);
                crystalReport.SetParameterValue("ToDate", txtToDate.Text);
                crystalReport.SetParameterValue("Status", ddlStatusFilter.SelectedValue);

                // Export to PDF
                string fileName = $"BookingReport_{DateTime.Now:yyyyMMddHHmmss}.pdf";
                
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
                DataTable bookingsData = GetBookingsData();

                if (bookingsData.Rows.Count == 0)
                {
                    ShowError("No data found to export.");
                    return;
                }

                ReportDocument crystalReport = new ReportDocument();
                string reportPath = Server.MapPath("~/Reports/BookingSummaryReport.rpt");

                if (!File.Exists(reportPath))
                {
                    ShowError("Report file not found.");
                    return;
                }

                crystalReport.Load(reportPath);
                crystalReport.SetDataSource(bookingsData);

                // Set parameters
                crystalReport.SetParameterValue("FromDate", txtFromDate.Text);
                crystalReport.SetParameterValue("ToDate", txtToDate.Text);
                crystalReport.SetParameterValue("Status", ddlStatusFilter.SelectedValue);

                // Export to Excel
                string fileName = $"BookingReport_{DateTime.Now:yyyyMMddHHmmss}.xlsx";
                
                Response.Buffer = false;
                Response.ClearContent();
                Response.ClearHeaders();
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("Content-Disposition", $"attachment; filename={fileName}");

                Stream stream = crystalReport.ExportToStream(ExportFormatType.ExcelWorkbook);
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
                            b.DateOfBooking,
                            d.Name AS DestinationName,
                            CONCAT(u.FirstName, ' ', u.LastName) AS CustomerName,
                            b.TravelerEmail,
                            b.TravelerPhone,
                            b.TravelDate,
                            b.NumberOfAdults,
                            b.NumberOfChildren,
                            b.TotalAmount,
                            b.BookingStatus
                        FROM Bookings b
                        INNER JOIN Destinations d ON b.DestinationId = d.Id
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

                    query += " ORDER BY b.DateOfBooking DESC";

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
