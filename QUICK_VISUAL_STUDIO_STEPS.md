# 🎯 CRYSTAL REPORTS - VISUAL STUDIO STEPS (Quick Reference)

## ⚡ 10 SIMPLE STEPS

### 1️⃣ INSTALL CRYSTAL REPORTS
- Download: https://wiki.scn.sap.com/wiki/display/BOBJ/Crystal+Reports
- Run: CRforVS_13_0_33.exe
- Install and restart computer

### 2️⃣ OPEN PROJECT
- Visual Studio → Open → `d:\Exploria\Tours&Travels.sln`

### 3️⃣ ADD REFERENCES
- Right-click "References" → Add Reference
- Check these 4:
  - ✅ CrystalDecisions.CrystalReports.Engine
  - ✅ CrystalDecisions.ReportSource
  - ✅ CrystalDecisions.Shared
  - ✅ CrystalDecisions.Web

### 4️⃣ CREATE FOLDER
- Right-click project → Add → New Folder → Name: "Reports"

### 5️⃣ CREATE REPORT
- Right-click "Reports" → Add → New Item → Crystal Report
- Name: `BookingSummaryReport.rpt`

### 6️⃣ WIZARD: CONNECT DATABASE
- Using Report Wizard → Standard
- Create New Connection → OLE DB
- Provider: Microsoft OLE DB for SQL Server
- Server: `localhost` or `.\SQLEXPRESS`
- Database: `ToursDB`
- Test Connection → Finish

### 7️⃣ WIZARD: SELECT TABLES & FIELDS
- Add Tables: Bookings, Destinations, Users
- Links: Auto (verify Bookings→Destinations, Bookings→Users)
- Fields: BookingId, DateOfBooking, TravelDate, NumberOfAdults, 
          NumberOfChildren, TotalAmount, BookingStatus, TravelerEmail,
          Destinations.Name, Users.FirstName, Users.LastName

### 8️⃣ ADD PARAMETERS
- Field Explorer → Parameter Fields → New
- Create 3 parameters:
  - FromDate (Date)
  - ToDate (Date)
  - Status (String)

### 9️⃣ CONFIGURE WEB.CONFIG
Add to `<system.web>`:
```xml
<httpHandlers>
  <add verb="GET" path="CrystalImageHandler.aspx" 
       type="CrystalDecisions.Web.CrystalImageHandler, CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"/>
</httpHandlers>
```

Add to `<system.webServer>`:
```xml
<handlers>
  <add name="CrystalImageHandler.aspx_GET" verb="GET" path="CrystalImageHandler.aspx" 
       type="CrystalDecisions.Web.CrystalImageHandler, CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" 
       preCondition="integratedMode"/>
</handlers>
```

### 🔟 BUILD & RUN
- Build Solution: `Ctrl+Shift+B`
- Run: `F5`
- Navigate to: `/AdminBookingReports.aspx`
- Generate report and test exports

---

## ✅ DONE! 

**Time:** ~35 minutes  
**Result:** Working Crystal Reports with PDF/Excel export

---

## 🔄 YOUR WORKFLOW AFTER SETUP

**Coding:** VS Code (write code) → Save  
**Testing:** Visual Studio → F5 (run)  
**Report Design:** Visual Studio → Open .rpt → Edit → Save

---

## 📚 FULL DETAILED GUIDES AVAILABLE:

For complete instructions, see:
- `VISUAL_STUDIO_CRYSTAL_REPORTS_STEPS.md` (detailed)
- `CRYSTAL_REPORTS_VISUAL_STEPS.txt` (flowchart)
- `CRYSTAL_REPORTS_CHECKLIST.md` (checklist)

---

**Happy Reporting! 📊🚀**
