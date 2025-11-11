# 🎯 Step-by-Step: Crystal Reports in Visual Studio

## ⚠️ IMPORTANT: Do These Steps in VISUAL STUDIO (Not VS Code!)

---

## 📋 **STEP 1: Install Crystal Reports for Visual Studio**

### **1.1 Download Crystal Reports**

1. Open your web browser
2. Go to: **https://wiki.scn.sap.com/wiki/display/BOBJ/Crystal+Reports%2C+Developer+for+Visual+Studio+Downloads**
3. Scroll down to find **"Crystal Reports for Visual Studio (Latest Version)"**
4. Click the download link for your Visual Studio version:
   - For Visual Studio 2022: **CRforVS_13_0_33.exe** or latest
   - For Visual Studio 2019: **CRforVS_13_0_32.exe**
   - For Visual Studio 2017: Use compatible version

### **1.2 Install Crystal Reports**

1. **Close Visual Studio** if it's open
2. **Run the installer** (CRforVS_13_0_xx.exe)
3. Click **"Accept"** on license agreement
4. Click **"Next"**
5. Choose installation path (default is fine)
6. Click **"Install"**
7. Wait 5-10 minutes for installation to complete
8. Click **"Finish"**
9. **Restart your computer** (recommended)

### **1.3 Verify Installation**

1. Open **Visual Studio**
2. Go to **Extensions** → **Manage Extensions**
3. Search for **"Crystal Reports"**
4. You should see **"SAP Crystal Reports"** installed ✅

---

## 📋 **STEP 2: Open Your Project in Visual Studio**

1. Open **Visual Studio**
2. Click **"Open a project or solution"**
3. Navigate to: **`d:\Exploria\Tours&Travels.sln`**
4. Click **"Open"**
5. Wait for solution to load

---

## 📋 **STEP 3: Add Crystal Reports References**

### **3.1 Add References**

1. In **Solution Explorer** (right side), find your project: **"Tours&Travels"**
2. Expand the project if collapsed
3. Right-click on **"References"**
4. Click **"Add Reference..."**

### **3.2 Find Crystal Reports DLLs**

In the Reference Manager window:

1. Click on **"Assemblies"** in the left panel
2. Click on **"Extensions"** under Assemblies
3. In the search box (top right), type: **"Crystal"**

### **3.3 Select These 4 Assemblies** (Check the boxes):

- ✅ **CrystalDecisions.CrystalReports.Engine**
- ✅ **CrystalDecisions.ReportSource**
- ✅ **CrystalDecisions.Shared**
- ✅ **CrystalDecisions.Web**

4. Click **"OK"**
5. Wait for references to be added

### **3.4 Verify References Added**

1. In Solution Explorer, expand **"References"** folder
2. Scroll down and verify you see:
   ```
   ✅ CrystalDecisions.CrystalReports.Engine
   ✅ CrystalDecisions.ReportSource
   ✅ CrystalDecisions.Shared
   ✅ CrystalDecisions.Web
   ```

---

## 📋 **STEP 4: Create Reports Folder**

1. In **Solution Explorer**, right-click on your project **"Tours&Travels"**
2. Select **Add** → **New Folder**
3. Type the folder name: **`Reports`**
4. Press **Enter**
5. You should now see a **"Reports"** folder in your project ✅

---

## 📋 **STEP 5: Create Your First Crystal Report**

### **5.1 Add New Crystal Report**

1. Right-click on the **"Reports"** folder you just created
2. Select **Add** → **New Item...**
3. In the "Add New Item" dialog:
   - In the search box (top right), type: **"Crystal"**
   - You should see **"Crystal Report"** template
   - Click on **"Crystal Report"**
   - At the bottom, name it: **`BookingSummaryReport.rpt`**
4. Click **"Add"**

### **5.2 Crystal Reports Gallery Opens**

A window titled **"Crystal Reports Gallery"** will appear:

1. Select: **"Using the Report Wizard"** (should be selected by default)
2. Choose: **"Standard"** report type
3. Click **"OK"**

---

## 📋 **STEP 6: Standard Report Creation Wizard**

### **6.1 Available Data Sources (Step 1)**

The **"Standard Report Creation Wizard"** opens:

1. You'll see **"Available Data Sources"** on the left
2. Expand: **"Create New Connection"**
3. Expand: **"OLE DB (ADO)"**
4. Click on **"OLE DB (ADO)"**
5. A new window **"OLE DB (ADO)"** opens

### **6.2 Configure Database Connection**

In the OLE DB window:

1. Click the **"Provider"** dropdown
2. Scroll and select: **"Microsoft OLE DB Provider for SQL Server"**
3. Click **"Next >>"**

4. Fill in **Connection** tab:
   ```
   Server: (local)  OR  localhost  OR  .\SQLEXPRESS
   OR your SQL Server name: _________________
   
   ☑ Use Integrated Security (Windows Authentication)
   OR
   ☐ Use Integrated Security
      User ID: sa (or your SQL username)
      Password: ________ (your SQL password)
   
   Database: ToursDB (or your database name)
   ```

5. Click **"Test Connection"** to verify
6. You should see: **"Test connection succeeded"** ✅
7. Click **"OK"**
8. Click **"Finish"**

### **6.3 Select Tables**

Back in the Report Wizard:

1. Your database connection should now appear in **"Available Data Sources"**
2. Expand your connection
3. Expand **"Tables"**
4. You'll see your database tables

5. **Select these tables** (click on each and click the **>** arrow to move to right):
   - **Bookings** → Click **>**
   - **Destinations** → Click **>**
   - **Users** → Click **>**

6. All three tables should now be in **"Selected Tables"** on the right
7. Click **"Next >"**

---

## 📋 **STEP 7: Link Tables (Step 2)**

1. You'll see the **"Links"** screen
2. Visual Studio should **automatically detect** the relationships:
   ```
   Bookings.DestinationId → Destinations.Id
   Bookings.UserId → Users.Id
   ```

3. **Verify the links** (you should see lines connecting the tables)
4. If links are missing:
   - Click **"Link"** button
   - Select: **Bookings.DestinationId**
   - Link to: **Destinations.Id**
   - Repeat for: **Bookings.UserId** → **Users.Id**

5. Click **"Next >"**

---

## 📋 **STEP 8: Select Fields (Step 3)**

### **8.1 Choose Report Fields**

You'll see **"Available Fields"** on the left:

1. Expand **"Bookings"** table
2. Select these fields and click **>** to add:
   - ✅ **BookingId**
   - ✅ **DateOfBooking**
   - ✅ **TravelDate**
   - ✅ **NumberOfAdults**
   - ✅ **NumberOfChildren**
   - ✅ **TotalAmount**
   - ✅ **BookingStatus**
   - ✅ **TravelerEmail**

3. Expand **"Destinations"** table
4. Select:
   - ✅ **Name** (this will be the destination name)

5. Expand **"Users"** table
6. Select:
   - ✅ **FirstName**
   - ✅ **LastName**

### **8.2 Verify Selected Fields**

You should have **11 fields** in the **"Fields to Display"** box on the right.

7. Click **"Next >"**

---

## 📋 **STEP 9: Grouping (Step 4)**

1. This step is **optional** (for grouping data)
2. If you want to group by destination or status:
   - Select **Destinations.Name** from available fields
   - Click **>** to add to grouping
3. Or just click **"Next >"** to skip grouping

---

## 📋 **STEP 10: Summaries (Step 5)**

1. You'll see **"Summarized Fields"**
2. Let's add a **Total Amount Summary**:
   - In **"Available Fields"**, find **Bookings.TotalAmount**
   - Click **>** to add it
   - It will default to **"Sum"** which is perfect ✅

3. Click **"Next >"**

---

## 📋 **STEP 11: Chart (Step 6)**

1. This step is **optional** (for adding charts)
2. For now, just click **"Next >"** to skip

---

## 📋 **STEP 12: Record Selection (Step 7)**

1. This is for filtering - we'll handle this in code
2. Just click **"Next >"** to skip

---

## 📋 **STEP 13: Template Style (Step 8)**

1. Choose a style you like:
   - **Standard** (simple and clean)
   - **Blue-Green**
   - **Maroon**
   - **Red-Grey**
   etc.

2. Click on any style to preview
3. Select your preferred style
4. Click **"Finish"**

---

## 📋 **STEP 14: Report Designer Opens! 🎉**

### **14.1 You Did It!**

The **Crystal Reports Designer** should now open showing your report!

You'll see:
- **Report Header** section
- **Page Header** section (with field names)
- **Details** section (with data fields)
- **Report Footer** section
- **Page Footer** section

### **14.2 Customize the Report (Optional)**

**Add a Title:**
1. Click in the **Report Header** section
2. Go to menu: **Insert** → **Text Object**
3. Type: **"Booking Summary Report"**
4. Format it (make it bigger, bold, centered)

**Add Company Name:**
1. Add another text object
2. Type: **"Exploria Tours & Travels"**

**Format Fields:**
1. Right-click on **TotalAmount** field
2. Select **"Format Field"**
3. Go to **"Number"** tab
4. Select: **Currency**
5. Click **"OK"**

**Adjust Column Widths:**
1. Click and drag field borders to resize
2. Make important fields wider
3. Align fields nicely

### **14.3 Add Parameters (Important!)**

1. In **Field Explorer** (left side panel), right-click on **"Parameter Fields"**
2. Select **"New..."**

**Create Parameter 1:**
- Name: **`FromDate`**
- Type: **Date**
- Prompting text: "From Date"
- Click **"OK"**

**Create Parameter 2:**
- Right-click "Parameter Fields" again → "New..."
- Name: **`ToDate`**
- Type: **Date**
- Prompting text: "To Date"
- Click **"OK"**

**Create Parameter 3:**
- Right-click "Parameter Fields" again → "New..."
- Name: **`Status`**
- Type: **String**
- Prompting text: "Booking Status"
- Click **"OK"**

### **14.4 Save the Report**

1. Press **Ctrl+S** or click **File** → **Save**
2. Your report is saved as: **`Reports\BookingSummaryReport.rpt`** ✅

---

## 📋 **STEP 15: Configure Web.config**

### **15.1 Open Web.config**

1. In **Solution Explorer**, find and double-click: **`Web.config`**

### **15.2 Add Crystal Reports Handlers**

Find the `<system.web>` section and add this inside it:

```xml
<httpHandlers>
  <add verb="GET" path="CrystalImageHandler.aspx" 
       type="CrystalDecisions.Web.CrystalImageHandler, CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"/>
</httpHandlers>
```

Find the `<system.webServer>` section and add this inside it:

```xml
<handlers>
  <add name="CrystalImageHandler.aspx_GET" verb="GET" path="CrystalImageHandler.aspx" 
       type="CrystalDecisions.Web.CrystalImageHandler, CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" 
       preCondition="integratedMode"/>
</handlers>
```

**Full Web.config structure should look like:**

```xml
<configuration>
  <system.web>
    <compilation debug="true" targetFramework="4.x"/>
    <httpRuntime targetFramework="4.x"/>
    
    <!-- ADD THIS -->
    <httpHandlers>
      <add verb="GET" path="CrystalImageHandler.aspx" 
           type="CrystalDecisions.Web.CrystalImageHandler, CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"/>
    </httpHandlers>
  </system.web>
  
  <system.webServer>
    <!-- ADD THIS -->
    <handlers>
      <add name="CrystalImageHandler.aspx_GET" verb="GET" path="CrystalImageHandler.aspx" 
           type="CrystalDecisions.Web.CrystalImageHandler, CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" 
           preCondition="integratedMode"/>
    </handlers>
  </system.webServer>
</configuration>
```

3. Save **Web.config** (Ctrl+S)

---

## 📋 **STEP 16: Set Report File Properties**

### **16.1 Configure Build Action**

1. In **Solution Explorer**, find: **`Reports\BookingSummaryReport.rpt`**
2. Right-click on **`BookingSummaryReport.rpt`**
3. Select **"Properties"**
4. In the Properties window (bottom right):
   - **Build Action**: Change to **"Content"**
   - **Copy to Output Directory**: Change to **"Copy if newer"**

This ensures the report file is included when you run the project.

---

## 📋 **STEP 17: Build the Solution**

1. Go to menu: **Build** → **Build Solution**
   - Or press: **Ctrl+Shift+B**

2. Check **Output** window (bottom of Visual Studio)
3. You should see: **"Build succeeded"** ✅
4. If there are errors:
   - Check that all references are added
   - Check Web.config syntax
   - Check that report file exists

---

## 📋 **STEP 18: Run and Test**

### **18.1 Run the Project**

1. Press **F5** (or click **▶ IIS Express** button at top)
2. Your website should open in browser
3. Wait for it to load

### **18.2 Navigate to Report Page**

1. In the browser, add to your URL: **`/AdminBookingReports.aspx`**
   - Example: `http://localhost:12345/AdminBookingReports.aspx`
2. Press **Enter**

### **18.3 Login (if required)**

1. If redirected to login, login as **admin**
2. After login, navigate back to **AdminBookingReports.aspx**

### **18.4 Test Report Generation**

1. You should see the **"Booking Reports"** page
2. Select:
   - **Report Type**: Booking Summary Report
   - **Status Filter**: All Statuses (or any)
   - **From Date**: Choose a date (e.g., 30 days ago)
   - **To Date**: Today's date
3. Click **"Generate Report"** button

### **18.5 View Report**

1. The report should load below ✅
2. You should see booking data in a formatted report
3. You should see the Crystal Reports viewer with navigation controls

### **18.6 Test Export**

**Test PDF Export:**
1. Click **"Export to PDF"** button
2. A PDF file should download
3. Open the PDF - you should see your report ✅

**Test Excel Export:**
1. Click **"Export to Excel"** button
2. An Excel file should download
3. Open Excel file - you should see your data ✅

---

## 📋 **STEP 19: Troubleshooting Common Issues**

### **Issue 1: "Report file not found"**

**Fix:**
- Check that `BookingSummaryReport.rpt` exists in **Reports** folder
- Right-click report → Properties → Build Action = **Content**
- Right-click report → Properties → Copy to Output Directory = **Copy if newer**
- Rebuild solution

### **Issue 2: "Could not load file or assembly 'CrystalDecisions.Web'"**

**Fix:**
- Make sure Crystal Reports is installed
- Re-add references to the project
- Check Web.config has correct handlers
- Rebuild solution

### **Issue 3: Report shows but no data**

**Fix:**
- Check database connection string in `Web.config`
- Verify you have data in Bookings, Destinations, and Users tables
- Check that date filters are not too restrictive
- In report designer: Database → Set Datasource Location → Update connection

### **Issue 4: "Login failed for user"**

**Fix:**
- In Visual Studio, open the report file
- Go to: **Database** → **Set Datasource Location**
- Update server name and credentials
- Right-click on connection → **Update**
- Save report

### **Issue 5: Export buttons don't work**

**Fix:**
- Check browser popup blocker (allow popups)
- Check that report is generated first before exporting
- Check Output window in Visual Studio for errors
- Try running as Administrator

---

## 🎉 **SUCCESS! You Did It!**

If you can see the report and export to PDF/Excel, **you're done!** ✅

---

## 📊 **Next Steps: Create More Reports**

Now that you have one working report, create more:

### **Revenue Report**
1. Right-click **Reports** folder → Add → New Item
2. Crystal Report → **`RevenueReport.rpt`**
3. Follow same wizard steps
4. Add grouping by **Month** or **Destination**
5. Add charts for visual representation

### **Customer Bookings Report**
1. Create: **`CustomerBookingsReport.rpt`**
2. Group by **Customer Name**
3. Show all bookings per customer
4. Add total spent summary

### **Destination Performance Report**
1. Create: **`DestinationPerformanceReport.rpt`**
2. Group by **Destination**
3. Count bookings per destination
4. Show revenue per destination
5. Add pie chart

---

## 💡 **Pro Tips**

### **Tip 1: Preview Report in Designer**
- In Visual Studio, double-click the `.rpt` file
- Click the **"Main Report Preview"** tab at top
- You can see how report looks with sample data

### **Tip 2: Add Logo**
1. In report designer
2. **Insert** → **Picture**
3. Browse to your logo image
4. Place in Report Header
5. Resize and position

### **Tip 3: Format Currency**
1. Right-click TotalAmount field
2. **Format Field**
3. **Number** tab
4. Select **Currency**
5. Choose currency symbol ($, ₹, €, etc.)

### **Tip 4: Add Page Numbers**
1. In **Page Footer** section
2. **Insert** → **Special Field** → **Page Number**

### **Tip 5: Add Date/Time**
1. In **Page Footer** section
2. **Insert** → **Special Field** → **Print Date**

---

## 📝 **Summary: What You Just Did**

✅ Installed Crystal Reports for Visual Studio  
✅ Added Crystal Reports references to project  
✅ Created Reports folder  
✅ Created BookingSummaryReport.rpt file  
✅ Connected to database  
✅ Selected tables and fields  
✅ Added parameters  
✅ Configured Web.config  
✅ Built the solution  
✅ Tested report generation  
✅ Tested PDF export  
✅ Tested Excel export  

---

## 🎯 **Your Workflow from Now On**

### **For Code Changes:**
1. Edit in **VS Code** (fast and easy)
2. Save files
3. Switch to **Visual Studio**
4. Press **F5** to run and test

### **For Report Design Changes:**
1. Open **Visual Studio**
2. Double-click `.rpt` file
3. Make changes in designer
4. Save
5. Press **F5** to test

---

## ✅ **Congratulations!**

You now have **Crystal Reports** fully integrated into your Tours & Travels project! 🎉

You can:
- ✅ Generate professional reports
- ✅ Export to PDF
- ✅ Export to Excel
- ✅ Filter by date and status
- ✅ Create more reports easily

**Keep coding in VS Code and running in Visual Studio!** 🚀
