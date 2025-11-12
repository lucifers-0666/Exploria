# 🧪 Test Crystal Reports - Quick Guide

## ✅ Report File Detected
- ✅ `BookingSummaryReport.rpt` found in `Reports/` folder
- ✅ Report copied to `bin/Reports/` folder

---

## 🚀 Testing Steps

### 1. **Build the Project**
In Visual Studio:
```
Press Ctrl+Shift+B
Or: Build → Rebuild Solution
```

**Expected Result:** Build succeeds with 0 errors

---

### 2. **Run the Application**
```
Press F5 (or Ctrl+F5 for no debugging)
```

---

### 3. **Login as Admin**
1. Navigate to Login page
2. Use admin credentials
3. Login successfully

---

### 4. **Navigate to Reports Page**
Go to: `AdminBookingReports.aspx`

Or use URL: `http://localhost:[port]/AdminBookingReports.aspx`

---

### 5. **Generate Report**

#### Test 1: Default Report (All Data)
1. Leave filters as default (last 30 days)
2. Status: "All Statuses"
3. Click **"Generate Report"** button

**Expected Result:**
- ✅ Crystal Reports viewer loads
- ✅ Shows booking data in hierarchical format
- ✅ Groups by Destination → Traveler → Date → Status
- ✅ Shows summaries (Total Amount, Booking Count)

#### Test 2: Filtered Report
1. Set **From Date**: (e.g., 2025-01-01)
2. Set **To Date**: (e.g., 2025-11-12)
3. Status: "Confirmed"
4. Click **"Generate Report"**

**Expected Result:**
- ✅ Shows only confirmed bookings
- ✅ Shows only bookings in date range

#### Test 3: Export to PDF
1. Generate a report first
2. Click **"Export to PDF"** button

**Expected Result:**
- ✅ Downloads PDF file: `DestinovaBookingReport_YYYYMMDDHHMMSS.pdf`
- ✅ PDF contains formatted report

#### Test 4: Export to Excel
1. Generate a report first
2. Click **"Export to Excel"** button

**Expected Result:**
- ✅ Downloads Excel file: `DestinovaBookingReport_YYYYMMDDHHMMSS.xls`
- ✅ Excel contains report data

---

## 🔍 What Method Did You Use?

Please tell me which method you used to create the report so I can adjust the code if needed:

### **Option A: Used Project Data → ADO.NET DataSets → ReportsDataSet**
✅ This is what the code expects (current implementation)
- No code changes needed
- Report should work immediately

### **Option B: Used Create New Connection → SQL Server**
⚠️ Code adjustment needed
- Need to update code to use `report.Load()` instead of `SetDataSource()`
- Need to configure database connection in report

### **Option C: Used ODBC/OLEDB Connection**
⚠️ Code adjustment needed
- Need to set connection credentials dynamically

### **Option D: Created Blank Report (No Data Source)**
⚠️ Code adjustment needed
- Need to manually add fields to report
- Need to verify field names match dataset

---

## 🐛 Common Issues & Solutions

### Issue 1: "Report file not found"
**Solution:**
```csharp
// Check if file exists at this path
string reportPath = Server.MapPath("~/Reports/BookingSummaryReport.rpt");
```
- Right-click `.rpt` file → **Properties**
- Set "**Build Action**" = **Content**
- Set "**Copy to Output Directory**" = **Copy if newer**

### Issue 2: "No data found"
**Possible Causes:**
- Database has no bookings in date range
- SQL connection string incorrect
- Table/column names don't match

**Quick Fix:**
1. Check if Bookings table has data
2. Try "All Statuses" and wider date range

### Issue 3: "Database logon failed"
**If you used database connection in report:**
```csharp
// Add this after report.Load() in code:
crystalReport.SetDatabaseLogon("username", "password", "server", "database");
```

### Issue 4: "Field not found"
**If report expects different field names:**
- Report field names must match DataSet column names exactly
- Check: BookingId, UserId, DestinationId, etc.

### Issue 5: "Report shows wrong data"
**Solution:**
- Clear browser cache
- Rebuild solution (Ctrl+Shift+B)
- Restart IIS Express

---

## 📝 What to Check

### In Visual Studio:
1. **Solution Explorer** → Find `BookingSummaryReport.rpt`
2. **Properties Window** (press F4):
   - Build Action: **Content**
   - Copy to Output Directory: **Copy if newer**

### In Crystal Report Designer:
1. Double-click `.rpt` file to open designer
2. Check **Database** → **Database Expert**
3. What do you see under "Selected Tables"?
   - ✅ If you see "ReportsDataSet.Bookings" → Perfect!
   - ⚠️ If you see SQL connection → Need to adjust code

---

## 🧪 Quick Database Check

Run this in SQL Server Management Studio to verify data exists:

```sql
-- Check if bookings exist
SELECT COUNT(*) as TotalBookings FROM Bookings;

-- Check recent bookings
SELECT TOP 10 
    BookingId, 
    UserId, 
    DestinationId, 
    TravelDate, 
    TotalAmount, 
    BookingStatus,
    DateOfBooking
FROM Bookings
ORDER BY DateOfBooking DESC;
```

---

## 📊 Expected Output

If everything works, you should see:

```
┌─────────────────────────────────────────┐
│  Destinova Booking Summary Report       │
│  From: 01-Nov-2025  To: 12-Nov-2025     │
└─────────────────────────────────────────┘

📍 Destination: [DestinationId]
   👤 Traveler: [LastName], [FirstName]
      📅 Date: [BookingDate]
         Status: [Confirmed/Pending]
         Booking ID: XXX
         Adults: X, Children: X
         Amount: ₹X,XXX

   💰 Subtotal: ₹XX,XXX | X Bookings

═══════════════════════════════════════════
📊 Grand Total: ₹XXX,XXX | XX Bookings
═══════════════════════════════════════════
```

---

## ⚡ Quick Test Commands

### Test if report file is accessible:
```csharp
// Add this temporary code to check
string reportPath = Server.MapPath("~/Reports/BookingSummaryReport.rpt");
Response.Write("Report exists: " + System.IO.File.Exists(reportPath));
Response.Write("<br>Path: " + reportPath);
```

---

## 🔧 Code Adjustments Based on Your Method

### If you tell me:
1. **How you created the report** (which wizard option)
2. **What data source you selected** (DataSet, SQL, ODBC, etc.)
3. **Any error messages you see**

I can provide exact code modifications needed!

---

## 📞 Next Steps

1. **Run the application** (F5)
2. **Navigate to** `AdminBookingReports.aspx`
3. **Click "Generate Report"**
4. **Tell me:**
   - ✅ Does it work?
   - ⚠️ What error do you see?
   - 📸 Screenshot of the result

Then I'll help you fix any issues! 🚀
