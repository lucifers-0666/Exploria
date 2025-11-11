# 📊 Crystal Reports Setup Guide for Exploria Tours & Travels

## ✅ What I Just Created for You (in VS Code)

I've created a complete **Booking Reports page** with all the code you need:

1. ✅ `AdminBookingReports.aspx` - The page layout with Crystal Report Viewer
2. ✅ `AdminBookingReports.aspx.cs` - The C# code-behind with report logic
3. ✅ `AdminBookingReports.aspx.designer.cs` - Designer file

**You can edit these files in VS Code!** But you need to do a few steps in **Visual Studio**.

---

## 🎯 What You Need to Do in Visual Studio

### **Step 1: Install Crystal Reports for Visual Studio**

1. **Download Crystal Reports:**
   - Go to: https://wiki.scn.sap.com/wiki/display/BOBJ/Crystal+Reports%2C+Developer+for+Visual+Studio+Downloads
   - Download: **SAP Crystal Reports for Visual Studio (SP 33)** or latest version
   - Choose version compatible with your Visual Studio

2. **Install:**
   - Run the installer
   - Follow the installation wizard
   - Restart Visual Studio after installation

3. **Verify Installation:**
   - Open Visual Studio
   - Go to `Tools` → `NuGet Package Manager` → `Manage NuGet Packages for Solution`
   - Search for "CrystalDecisions" - you should see it installed

---

### **Step 2: Add References to Your Project (in Visual Studio)**

1. Open your project in **Visual Studio**
2. Right-click on **References** in Solution Explorer
3. Click **Add Reference**
4. Add these assemblies:
   ```
   ✅ CrystalDecisions.CrystalReports.Engine
   ✅ CrystalDecisions.ReportSource
   ✅ CrystalDecisions.Shared
   ✅ CrystalDecisions.Web
   ```

---

### **Step 3: Create the Reports Folder**

1. In Visual Studio Solution Explorer
2. Right-click on your project (`Tours&Travels`)
3. Add → New Folder → Name it: `Reports`

---

### **Step 4: Create Your First Crystal Report (.rpt file)**

**This MUST be done in Visual Studio - VS Code cannot do this!**

#### **Option A: Create New Report (Recommended)**

1. **Right-click on the `Reports` folder**
2. **Add → New Item**
3. Search for "Crystal Report"
4. Select **"Crystal Report"**
5. Name it: `BookingSummaryReport.rpt`
6. Click **Add**

7. **Report Creation Wizard will open:**

   **Step 1: Choose Data Source**
   - Select "Create a new report using Report Wizard"
   - Click **OK**

   **Step 2: Standard Report Wizard**
   - Click **OLE DB (ADO)**
   - Browse to find "Microsoft OLE DB Provider for SQL Server"
   - Enter your connection details:
     ```
     Server: (your SQL Server name)
     Database: ToursDB (or your database name)
     User ID: (your SQL username)
     Password: (your SQL password)
     ```

   **Step 3: Choose Tables**
   - Expand your database
   - Select these tables:
     - `Bookings`
     - `Destinations`
     - `Users`
   - Click **Add** (→) to move them to selected tables
   - Click **Next**

   **Step 4: Link Tables**
   - Visual Studio will auto-link if foreign keys exist
   - Verify links:
     - `Bookings.DestinationId` → `Destinations.Id`
     - `Bookings.UserId` → `Users.Id`
   - Click **Next**

   **Step 5: Choose Fields**
   - Select fields to display in report:
     ```
     From Bookings:
     ✅ BookingId
     ✅ DateOfBooking
     ✅ TravelDate
     ✅ NumberOfAdults
     ✅ NumberOfChildren
     ✅ TotalAmount
     ✅ BookingStatus
     ✅ TravelerEmail
     
     From Destinations:
     ✅ Name (rename to DestinationName)
     
     From Users:
     ✅ FirstName
     ✅ LastName
     ```
   - Click **Next**

   **Step 6: Grouping**
   - Optionally group by: `BookingStatus` or `DestinationName`
   - Click **Next**

   **Step 7: Summaries**
   - Add sum for `TotalAmount`
   - Add count for `BookingId`
   - Click **Next**

   **Step 8: Finish**
   - Click **Finish**

8. **The Crystal Reports Designer Opens!**
   - You'll see the report layout
   - Customize as needed (fonts, colors, logos)
   - Save the report

#### **Option B: Use DataSet Instead (Simpler)**

If the above is too complex, create a simpler version:

1. **Create Report**
2. Select "As a Blank Report"
3. **Add DataSet Fields:**
   - Right-click on "Database Fields" in Field Explorer
   - Database Expert
   - Create New Connection → ADO.NET (XML)
   - Click "New" to create DataSet
   - Add a DataTable named `BookingsData`
   - Add columns matching your SQL query

---

### **Step 5: Add Report Parameters (in Visual Studio)**

1. In the Crystal Report Designer
2. **Field Explorer** → Right-click "Parameter Fields"
3. **Add Parameters:**
   ```
   Parameter Name: FromDate
   Type: Date
   
   Parameter Name: ToDate
   Type: Date
   
   Parameter Name: Status
   Type: String
   ```

---

### **Step 6: Configure Web.config**

Open `Web.config` in VS Code or Visual Studio and add:

```xml
<configuration>
  <system.web>
    <httpHandlers>
      <add verb="GET" path="CrystalImageHandler.aspx" 
           type="CrystalDecisions.Web.CrystalImageHandler, CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"/>
    </httpHandlers>
  </system.web>
  
  <system.webServer>
    <handlers>
      <add name="CrystalImageHandler.aspx_GET" verb="GET" path="CrystalImageHandler.aspx" 
           type="CrystalDecisions.Web.CrystalImageHandler, CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" 
           preCondition="integratedMode"/>
    </handlers>
  </system.webServer>
</configuration>
```

---

### **Step 7: Build and Run (in Visual Studio)**

1. **Save all files**
2. **Build the solution** (Ctrl+Shift+B)
3. **Fix any errors** (usually missing references)
4. **Run the project** (F5)
5. Navigate to: `http://localhost:xxxxx/AdminBookingReports.aspx`

---

## 🎨 Customizing Your Report (in Visual Studio)

Once the `.rpt` file is created, you can:

1. **Add Company Logo:**
   - Insert → Picture
   - Browse to your logo image

2. **Format Fields:**
   - Right-click any field → Format Field
   - Change font, color, alignment

3. **Add Totals:**
   - Right-click a number field → Insert Summary
   - Choose Sum, Count, Average, etc.

4. **Add Charts:**
   - Insert → Chart
   - Select chart type and data

5. **Add Formulas:**
   - Field Explorer → Formula Fields
   - Create custom calculations

---

## 📁 Complete File Structure

```
Tours&Travels/
├── AdminBookingReports.aspx          ✅ Created (edit in VS Code)
├── AdminBookingReports.aspx.cs       ✅ Created (edit in VS Code)
├── AdminBookingReports.aspx.designer.cs  ✅ Created
├── Reports/                           ⚠️ Create in Visual Studio
│   └── BookingSummaryReport.rpt      ⚠️ Create in Visual Studio
└── Web.config                         ✅ Edit in VS Code
```

---

## 🚀 Quick Testing Steps

After setup, test your report:

1. **Open Visual Studio**
2. **Run the project** (F5)
3. **Login as admin**
4. **Navigate to:** `AdminBookingReports.aspx`
5. **Set date range**
6. **Click "Generate Report"**
7. **View the report in browser**
8. **Click "Export to PDF"** to test PDF export

---

## 🐛 Common Issues & Solutions

### **Issue 1: "Report file not found"**
**Solution:** Make sure `BookingSummaryReport.rpt` exists in the `Reports` folder

### **Issue 2: "Could not load CrystalDecisions.Web"**
**Solution:** 
- Reinstall Crystal Reports for Visual Studio
- Check that references are added
- Verify Web.config has correct handlers

### **Issue 3: "Login failed for database"**
**Solution:** 
- In Crystal Report Designer, go to Database → Set Datasource Location
- Update connection string

### **Issue 4: Report shows but no data**
**Solution:**
- Check your SQL query in GetBookingsData()
- Verify database has data
- Check date filters

### **Issue 5: Export buttons don't work**
**Solution:**
- Make sure report is generated first
- Check Response.End() is not throwing errors
- Verify file permissions

---

## 📊 Additional Report Ideas

Once you have the basic report working, create more:

### **Revenue Report:**
```
Reports/RevenueReport.rpt
- Group by Month
- Sum TotalAmount
- Show charts
```

### **Customer Report:**
```
Reports/CustomerBookingsReport.rpt
- Group by Customer
- Show booking history
- Total spent
```

### **Destination Performance:**
```
Reports/DestinationPerformanceReport.rpt
- Group by Destination
- Count bookings
- Sum revenue
```

---

## 💡 Pro Tips

1. **Always create .rpt files in Visual Studio** - VS Code cannot do this
2. **Design reports with sample data** - easier to layout
3. **Use parameters for filtering** - more flexible reports
4. **Cache reports** - better performance
5. **Test with large datasets** - ensure performance
6. **Add page numbers and dates** - professional look
7. **Use subreports** - for complex layouts

---

## 📝 Summary: VS Code vs Visual Studio

| Task | VS Code | Visual Studio |
|------|---------|---------------|
| Write .aspx code | ✅ YES | ✅ YES |
| Write .aspx.cs code | ✅ YES | ✅ YES |
| Edit Web.config | ✅ YES | ✅ YES |
| Create .rpt files | ❌ NO | ✅ YES (Required) |
| Design report layout | ❌ NO | ✅ YES (Required) |
| Run the project | ❌ NO | ✅ YES (Required) |
| Debug Crystal Reports | ❌ NO | ✅ YES (Required) |

---

## 🎯 Next Steps

1. **Install Crystal Reports** in Visual Studio
2. **Add references** to your project
3. **Create the Reports folder**
4. **Create BookingSummaryReport.rpt**
5. **Build and test**
6. **Customize the report design**
7. **Create more report types**

---

## 📞 Need Help?

If you encounter issues:
1. Check the error message carefully
2. Verify all references are added
3. Check Web.config handlers
4. Ensure database connection works
5. Test with simple data first

**Remember:** You can write ALL the C# and ASPX code in VS Code, but you MUST use Visual Studio to create and design the `.rpt` Crystal Report files!

---

## ✅ What Works in VS Code

You just created in VS Code:
- ✅ Complete page layout (AdminBookingReports.aspx)
- ✅ Full C# business logic (AdminBookingReports.aspx.cs)
- ✅ All filtering and export functionality
- ✅ Professional UI with styling

**Only missing:** The `.rpt` report file itself - create it in Visual Studio!

Good luck! 🚀
