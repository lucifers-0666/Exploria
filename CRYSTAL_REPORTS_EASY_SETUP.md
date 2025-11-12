# Crystal Reports - Easy Setup Guide 🚀

## ✅ Quick Setup (5 Steps)

### Step 1: Install Crystal Reports Runtime
1. Download **SAP Crystal Reports for Visual Studio** (free):
   - For VS 2019/2022: https://wiki.scn.sap.com/wiki/display/BOBJ/Crystal+Reports%2C+Developer+for+Visual+Studio+Downloads
   - Install: `CRforVS_13_0_X.exe`

2. Restart Visual Studio after installation

---

### Step 2: Add References (Already Done ✓)
Your project already has these references:
- ✅ `CrystalDecisions.CrystalReports.Engine`
- ✅ `CrystalDecisions.ReportSource`
- ✅ `CrystalDecisions.Shared`
- ✅ `CrystalDecisions.Web`

---

### Step 3: Create Report File (.rpt)

#### Option A: Using Visual Studio (Recommended)
1. Right-click on project → **Add** → **New Item**
2. Search for "Crystal Report"
3. Name it: `BookingSummaryReport.rpt`
4. Click **Add**
5. Choose "**Using the Report Wizard**" → Click **OK**
6. Select "**Standard**" → Click **OK**

#### Report Wizard Steps:

**⚠️ PROBLEM: Can't see your database tables in wizard?**

**SOLUTION: Skip the wizard! Create blank report and use DataTable instead.**

**Better Approach:**
1. In wizard, click **Cancel** (Yes, cancel it!)
2. Choose "**As a Blank Report**" → Click **OK**
3. You'll get an empty report designer
4. **Don't add any database connections**
5. We'll bind data from code (much easier!)

**Then add these fields manually in the report:**
- Right-click report → **Database** → **Database Expert**
- Click "**Create New Connection**" → **ADO.NET**
- **Skip this!** Just close it
- We'll use **SetDataSource()** in code instead

**Design your report layout:**
1. Drag **Text Object** to Page Header: "Booking Summary Report"
2. In **Details** section, add these fields (we'll bind from code):
   - Create placeholders using Text Objects
   - Or leave blank - data will appear automatically

---

### Step 3B: EASIEST WAY - Skip Crystal Report File Entirely! ⭐

**You don't even need a .rpt file!** Just use GridView instead:

#### Replace Crystal Reports with GridView (5 minutes):

**1. Update ASPX (remove Crystal Reports viewer):**
```xml
<!-- Replace the Crystal Reports viewer with this: -->
<div class="report-viewer-container">
    <asp:GridView ID="gvBookings" runat="server" 
        AutoGenerateColumns="false" 
        CssClass="table table-striped table-bordered"
        HeaderStyle-BackColor="#164426"
        HeaderStyle-ForeColor="White"
        HeaderStyle-Font-Bold="true">
        <Columns>
            <asp:BoundField DataField="BookingId" HeaderText="Booking ID" />
            <asp:BoundField DataField="DateOfBooking" HeaderText="Booking Date" DataFormatString="{0:dd-MMM-yyyy}" />
            <asp:BoundField DataField="DestinationName" HeaderText="Destination" />
            <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" />
            <asp:BoundField DataField="TravelerEmail" HeaderText="Email" />
            <asp:BoundField DataField="TravelerPhone" HeaderText="Phone" />
            <asp:BoundField DataField="TravelDate" HeaderText="Travel Date" DataFormatString="{0:dd-MMM-yyyy}" />
            <asp:BoundField DataField="NumberOfAdults" HeaderText="Adults" />
            <asp:BoundField DataField="NumberOfChildren" HeaderText="Children" />
            <asp:BoundField DataField="TotalAmount" HeaderText="Total Amount" DataFormatString="{0:C}" />
            <asp:BoundField DataField="BookingStatus" HeaderText="Status" />
        </Columns>
    </asp:GridView>
</div>
```

**2. Update Code-Behind (replace Crystal Reports code):**
```csharp
protected void btnGenerateReport_Click(object sender, EventArgs e)
{
    try
    {
        DataTable bookingsData = GetBookingsData();

        if (bookingsData.Rows.Count == 0)
        {
            ShowError("No data found for the selected criteria.");
            return;
        }

        // Bind to GridView
        gvBookings.DataSource = bookingsData;
        gvBookings.DataBind();

        ShowInfo($"Report generated successfully! Found {bookingsData.Rows.Count} bookings.");
    }
    catch (Exception ex)
    {
        ShowError("Error generating report: " + ex.Message);
    }
}

protected void btnExportPDF_Click(object sender, EventArgs e)
{
    ShowError("PDF export requires Crystal Reports. Use Excel export instead.");
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

        // Export to Excel
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", 
            $"attachment;filename=BookingReport_{DateTime.Now:yyyyMMddHHmmss}.xls");
        Response.Charset = "";
        Response.ContentType = "application/vnd.ms-excel";

        using (StringWriter sw = new StringWriter())
        {
            using (HtmlTextWriter hw = new HtmlTextWriter(sw))
            {
                // Create a temporary GridView for export
                GridView gvExport = new GridView();
                gvExport.DataSource = bookingsData;
                gvExport.DataBind();

                // Apply styling
                gvExport.HeaderRow.BackColor = System.Drawing.Color.FromArgb(22, 68, 38);
                gvExport.HeaderRow.ForeColor = System.Drawing.Color.White;
                gvExport.HeaderRow.Font.Bold = true;

                foreach (GridViewRow row in gvExport.Rows)
                {
                    row.BackColor = System.Drawing.Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        cell.BackColor = gvExport.HeaderRow.BackColor;
                    }
                }

                gvExport.RenderControl(hw);

                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }
    }
    catch (Exception ex)
    {
        ShowError("Error exporting to Excel: " + ex.Message);
    }
}

// Add this required method for GridView export
public override void VerifyRenderingInServerForm(Control control)
{
    // Required to export GridView
}
```

**✅ Done! No Crystal Reports installation needed!**

---

### Step 4: Create Reports Folder & Save
```
d:\Exploria\Tours&Travels\
└── Reports\
    └── BookingSummaryReport.rpt
```

1. Create folder: `Reports` in your project
2. Move/Save your `.rpt` file there
3. Right-click `.rpt` → **Properties**
4. Set "**Copy to Output Directory**" → "**Copy if newer**"

---

### Step 5: Use in Your ASPX Page (Already Done ✓)

Your `AdminBookingReports.aspx` already has:
```xml
<%@ Register Assembly="CrystalDecisions.Web" 
    Namespace="CrystalDecisions.Web" 
    TagPrefix="CR" %>

<CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" />
```

---

## 🎯 Alternative: Create Report Programmatically

### Option B: Without Report Wizard (Dynamic DataTable)

#### 1. Create Simple Report
```csharp
// In your code-behind
private void GenerateSimpleReport()
{
    // Get data
    DataTable dt = GetBookingsData();
    
    // Create report
    ReportDocument report = new ReportDocument();
    string reportPath = Server.MapPath("~/Reports/BookingSummaryReport.rpt");
    
    // Load & bind
    report.Load(reportPath);
    report.SetDataSource(dt);
    
    // Show in viewer
    CrystalReportViewer1.ReportSource = report;
}
```

#### 2. No .rpt File Needed - Use ReportDocument
```csharp
// Create report from DataTable directly
private void CreateReportFromDataTable()
{
    DataTable dt = GetBookingsData();
    
    // Create basic report
    ReportDocument report = new ReportDocument();
    
    // Set data
    report.SetDataSource(dt);
    
    // Optional: Add parameters
    report.SetParameterValue("ReportTitle", "Booking Summary");
    report.SetParameterValue("DateRange", $"{txtFromDate.Text} to {txtToDate.Text}");
    
    CrystalReportViewer1.ReportSource = report;
}
```

---

## 🔧 Easy Alternative: GridView Export (No Crystal Reports)

If Crystal Reports is too complex, use **GridView with Export**:

### ASPX Page:
```xml
<asp:GridView ID="gvBookings" runat="server" AutoGenerateColumns="false" 
    CssClass="table table-striped">
    <Columns>
        <asp:BoundField DataField="BookingId" HeaderText="Booking ID" />
        <asp:BoundField DataField="DateOfBooking" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />
        <asp:BoundField DataField="DestinationName" HeaderText="Destination" />
        <asp:BoundField DataField="CustomerName" HeaderText="Customer" />
        <asp:BoundField DataField="TotalAmount" HeaderText="Amount" DataFormatString="{0:C}" />
        <asp:BoundField DataField="BookingStatus" HeaderText="Status" />
    </Columns>
</asp:GridView>

<asp:Button ID="btnExportExcel" runat="server" Text="Export to Excel" OnClick="btnExportExcel_Click" />
```

### Code-Behind:
```csharp
protected void btnGenerateReport_Click(object sender, EventArgs e)
{
    DataTable dt = GetBookingsData();
    gvBookings.DataSource = dt;
    gvBookings.DataBind();
}

protected void btnExportExcel_Click(object sender, EventArgs e)
{
    Response.Clear();
    Response.Buffer = true;
    Response.AddHeader("content-disposition", $"attachment;filename=BookingReport_{DateTime.Now:yyyyMMddHHmmss}.xls");
    Response.Charset = "";
    Response.ContentType = "application/vnd.ms-excel";
    
    using (StringWriter sw = new StringWriter())
    {
        HtmlTextWriter hw = new HtmlTextWriter(sw);
        gvBookings.RenderControl(hw);
        Response.Output.Write(sw.ToString());
        Response.Flush();
        Response.End();
    }
}

public override void VerifyRenderingInServerForm(Control control)
{
    // Required for export
}
```

---

## 📦 Best Practices

### 1. Connection String in Report
Don't hardcode in .rpt file. Set dynamically:
```csharp
report.SetDatabaseLogon("username", "password", "server", "database");
```

### 2. Dispose Reports
```csharp
protected void Page_Unload(object sender, EventArgs e)
{
    if (CrystalReportViewer1.ReportSource != null)
    {
        ((ReportDocument)CrystalReportViewer1.ReportSource).Close();
        ((ReportDocument)CrystalReportViewer1.ReportSource).Dispose();
    }
}
```

### 3. Error Handling
```csharp
try
{
    report.Load(reportPath);
}
catch (Exception ex)
{
    lblError.Text = "Report file not found: " + ex.Message;
    // Fallback to GridView
    ShowGridView();
}
```

---

## 🚀 Recommended: Use ReportViewer (Modern Alternative)

### Install Microsoft ReportViewer
```powershell
Install-Package Microsoft.ReportingServices.ReportViewerControl.WebForms
```

### ASPX:
```xml
<%@ Register Assembly="Microsoft.ReportViewer.WebForms" 
    Namespace="Microsoft.Reporting.WebForms" 
    TagPrefix="rsweb" %>

<rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Height="800px" />
```

### Code:
```csharp
ReportViewer1.ProcessingMode = ProcessingMode.Local;
ReportViewer1.LocalReport.ReportPath = Server.MapPath("~/Reports/BookingReport.rdlc");
ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource("BookingsDataSet", dt));
ReportViewer1.LocalReport.Refresh();
```

---

## ✅ Quick Checklist

- [ ] Install Crystal Reports Runtime
- [ ] Create Reports folder
- [ ] Add .rpt file to project
- [ ] Set "Copy to Output Directory" = "Copy if newer"
- [ ] Build project (Ctrl+Shift+B)
- [ ] Test report generation

---

## 🆘 Common Issues

### Issue 1: "Could not load file CrystalDecisions.Web"
**Solution**: Install Crystal Reports runtime

### Issue 2: "Report file not found"
**Solution**: Check file path and "Copy to Output Directory" setting

### Issue 3: "Database logon failed"
**Solution**: Set connection dynamically in code

### Issue 4: Report shows old data
**Solution**: Dispose report properly in Page_Unload

---

## 🎯 Easiest Method Summary

**For Quick Setup (Recommended):**
1. Skip Crystal Reports entirely
2. Use **GridView with Export to Excel** (code above)
3. Takes 5 minutes to implement
4. No runtime installation needed
5. Works immediately

**For Professional Reports:**
1. Install Crystal Reports Runtime
2. Create .rpt file using wizard
3. Set data source in code
4. Takes 30 minutes setup

---

## 📞 Next Steps

1. Choose your approach (GridView or Crystal Reports)
2. Test with sample data
3. Customize report layout
4. Add export functionality

**Your project already has Crystal Reports references, so you're 50% done!** Just create the .rpt file and test it.
