# 📊 DATABASE ANALYSIS & CRYSTAL REPORTS SETUP GUIDE

## 🎯 Executive Summary

This document provides a comprehensive analysis of your **Exploria Tours & Travels** project database and step-by-step instructions for setting up Crystal Reports in Visual Studio.

---

## 📂 PROJECT OVERVIEW

| Property | Details |
|----------|---------|
| **Project Name** | Exploria - Tours & Travels Booking System |
| **Framework** | ASP.NET Web Forms (.NET Framework 4.7.2) |
| **Database** | SQL Server LocalDB |
| **Database Name** | ToursTravels.mdf |
| **Database Location** | `D:\Exploria\Tours&Travels\App_Data\ToursTravels.mdf` |
| **Connection String** | Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\Exploria\Tours&Travels\App_Data\ToursTravels.mdf;Initial Catalog=ToursTravels;Integrated Security=True |
| **Data Access** | ADO.NET (SqlConnection, SqlCommand, SqlDataReader, SqlDataAdapter) |

---

## 🗄️ DATABASE STRUCTURE ANALYSIS

### **Core Tables (4 Primary Tables)**

#### **1. Users Table** ✅
```sql
Table: Users (or Registration)
Purpose: Store user accounts, authentication, and profiles

Columns:
├─ Id                INT PRIMARY KEY IDENTITY(1,1)
├─ FirstName         NVARCHAR(MAX) NOT NULL
├─ LastName          NVARCHAR(MAX) NOT NULL
├─ Email             NVARCHAR(MAX) NOT NULL UNIQUE
├─ Password          NVARCHAR(MAX) NOT NULL
├─ Phone             NVARCHAR(MAX) NOT NULL
├─ Country           NVARCHAR(MAX) NOT NULL
├─ State             NVARCHAR(MAX) NOT NULL
├─ City              NVARCHAR(MAX) NOT NULL
├─ Image             NVARCHAR(MAX) NULL (Profile picture path)
├─ Role              NVARCHAR(MAX) DEFAULT 'users' (admin/users)
└─ EmailVerified     BIT DEFAULT 0 (Email verification status)

Used in:
- Login.aspx (Authentication)
- Register.aspx (User registration)
- Profile.aspx (Profile management)
- AdminUserManagement.aspx (Admin panel)
- All user-related operations
```

#### **2. Destinations Table** ✅
```sql
Table: Destinations
Purpose: Store travel destinations, packages, and tour information

Columns:
├─ Id                INT PRIMARY KEY IDENTITY(1,1)
├─ Name              NVARCHAR(MAX) NOT NULL (Destination name)
├─ Tagline           NVARCHAR(MAX) NULL (Marketing tagline)
├─ Duration          NVARCHAR(MAX) NULL (Trip duration: "5 Days, 4 Nights")
├─ GroupSize         NVARCHAR(MAX) NULL (Max group size)
├─ Region            NVARCHAR(MAX) NULL (Geographic region)
├─ Description       NVARCHAR(MAX) NOT NULL (Full description)
├─ Included          NVARCHAR(MAX) NULL (What's included in package)
├─ Price             DECIMAL(10,2) NOT NULL (Per person cost)
├─ Category          NVARCHAR(MAX) NOT NULL (Adventure/Cultural/Beach/etc.)
├─ MainImage         NVARCHAR(MAX) NOT NULL (Primary image path)
├─ Image             NVARCHAR(MAX) NULL (Additional images)
└─ DateAdded         DATETIME DEFAULT GETDATE()

Used in:
- Destination.aspx (Browse destinations)
- ViewDetails.aspx (Single destination details)
- AddDestinations.aspx (Add new destinations)
- AdminDestinations.aspx (Manage destinations)
- Home.aspx (Featured destinations)
```

#### **3. Bookings Table** ✅ ⭐ **MOST IMPORTANT FOR REPORTS**
```sql
Table: Bookings
Purpose: Store all booking/reservation information

Columns:
├─ BookingId             INT PRIMARY KEY IDENTITY(1,1)
├─ UserId                INT FOREIGN KEY → Users(Id)
├─ DestinationId         INT FOREIGN KEY → Destinations(Id)
├─ TravelerFirstName     NVARCHAR(MAX) NOT NULL
├─ TravelerLastName      NVARCHAR(MAX) NOT NULL
├─ TravelerEmail         NVARCHAR(MAX) NOT NULL
├─ TravelerPhone         NVARCHAR(MAX) NULL
├─ TravelDate            DATE NOT NULL (Trip date)
├─ NumberOfAdults        INT NOT NULL
├─ NumberOfChildren      INT DEFAULT 0
├─ TotalAmount           DECIMAL(10,2) NOT NULL (Calculated total)
├─ BookingStatus         NVARCHAR(50) DEFAULT 'Pending'
│                        CHECK (BookingStatus IN ('Pending', 'Confirmed', 'Cancelled', 'Completed'))
└─ DateOfBooking         DATETIME DEFAULT GETDATE() (When booking was made)

Relationships:
- Bookings.UserId → Users.Id (Many-to-One)
- Bookings.DestinationId → Destinations.Id (Many-to-One)

Used in:
- bookingConfirmation.aspx (Create bookings)
- MyBookings.aspx (User booking history)
- AdminBookings.aspx (Admin view all bookings)
- AdminBookingReports.aspx (Crystal Reports) 🎯
```

#### **4. Contacts Table** ✅
```sql
Table: Contacts
Purpose: Store contact form submissions and inquiries

Columns:
├─ Id                INT PRIMARY KEY IDENTITY(1,1)
├─ Name              NVARCHAR(MAX) NOT NULL
├─ Email             NVARCHAR(MAX) NOT NULL
├─ Subject           NVARCHAR(MAX) NOT NULL
└─ Message           NVARCHAR(MAX) NOT NULL

Used in:
- Contact.aspx (Contact form submissions)
```

---

### **Additional Tables (Phase 2 & 3)**

#### **5. DestinationReviews Table** ✅
```sql
Table: DestinationReviews
Purpose: Customer reviews and ratings

Columns:
├─ Id                    INT PRIMARY KEY IDENTITY(1,1)
├─ DestinationId         INT NOT NULL
├─ DestinationName       NVARCHAR(255)
├─ UserId                INT
├─ CustomerName          NVARCHAR(255) NOT NULL
├─ CustomerEmail         NVARCHAR(255)
├─ Rating                INT NOT NULL CHECK (Rating >= 1 AND Rating <= 5)
├─ ReviewText            NVARCHAR(MAX) NOT NULL
├─ ReviewDate            DATETIME NOT NULL DEFAULT GETDATE()
├─ IsVerified            BIT NOT NULL DEFAULT 0 (Verified traveler)
├─ HelpfulCount          INT NOT NULL DEFAULT 0
└─ IsApproved            BIT NOT NULL DEFAULT 1 (Admin approval)

Used in:
- Reviews.aspx (Submit and display reviews)
- AdminReviews.aspx (Moderate reviews)
```

#### **6. BlogPosts Table** ✅
```sql
Table: BlogPosts
Purpose: Travel blog articles and guides

Columns:
├─ Id                INT PRIMARY KEY IDENTITY(1,1)
├─ Title             NVARCHAR(MAX) NOT NULL
├─ Excerpt           NVARCHAR(MAX) NULL
├─ Content           NVARCHAR(MAX) NOT NULL
├─ Category          NVARCHAR(100) NULL
├─ Author            NVARCHAR(255) NULL
├─ ImageUrl          NVARCHAR(MAX) NULL
├─ PublishedDate     DATETIME DEFAULT GETDATE()
├─ ViewCount         INT DEFAULT 0
├─ IsFeatured        BIT DEFAULT 0
├─ IsPublished       BIT DEFAULT 1
└─ Tags              NVARCHAR(MAX) NULL

Used in:
- Blog.aspx (Display blog posts)
- BlogDetails.aspx (Single blog post)
- AdminBlog.aspx (Manage blog posts)
```

#### **7. BlogComments Table** ✅
```sql
Table: BlogComments
Purpose: Comments on blog posts

Columns:
├─ Id                INT PRIMARY KEY IDENTITY(1,1)
├─ BlogId            INT NOT NULL → BlogPosts(Id)
├─ CommenterName     NVARCHAR(255)
├─ CommenterEmail    NVARCHAR(255)
├─ CommentText       NVARCHAR(MAX)
├─ CommentDate       DATETIME DEFAULT GETDATE()
└─ IsApproved        BIT DEFAULT 1

Used in:
- BlogDetails.aspx (Display and submit comments)
```

#### **8. NewsletterSubscriptions Table** ✅
```sql
Table: NewsletterSubscriptions
Purpose: Email newsletter subscriptions

Columns:
├─ Id                INT PRIMARY KEY IDENTITY(1,1)
├─ Email             NVARCHAR(255) UNIQUE
├─ SubscribedDate    DATETIME DEFAULT GETDATE()
└─ IsActive          BIT DEFAULT 1

Used in:
- Newsletter.aspx (Newsletter subscriptions)
- Footer newsletter signup
```

#### **9. EmailVerificationTokens Table** ✅
```sql
Table: EmailVerificationTokens
Purpose: Email verification tokens for user registration

Columns:
├─ Id                INT PRIMARY KEY IDENTITY(1,1)
├─ UserId            INT NOT NULL
├─ Email             NVARCHAR(255) NOT NULL
├─ Token             NVARCHAR(255) NOT NULL
├─ CreatedDate       DATETIME DEFAULT GETDATE()
├─ ExpiryDate        DATETIME NOT NULL
└─ IsUsed            BIT DEFAULT 0

Used in:
- EmailVerification.aspx (Verify user emails)
- Register.aspx (Send verification emails)
```

---

## 📊 DATABASE RELATIONSHIPS

```
┌─────────────────┐          ┌──────────────────┐          ┌────────────────┐
│     USERS       │          │   DESTINATIONS   │          │   BOOKINGS     │
│  (Registration) │          │                  │          │                │
├─────────────────┤          ├──────────────────┤          ├────────────────┤
│ 🔑 Id (PK)      │◄─────────┤ 🔑 Id (PK)       │◄─────────┤ 🔑 BookingId   │
│ FirstName       │   1   │  │ Name             │   1   │  │ 🔗 UserId (FK) │
│ LastName        │       │  │ Price            │       │  │ 🔗 DestId (FK) │
│ Email           │       N  │ Duration         │       N  │ TravelDate     │
│ Password        │          │ Category         │          │ TotalAmount    │
│ Role            │          │ MainImage        │          │ BookingStatus  │
└─────────────────┘          └──────────────────┘          └────────────────┘
        │                             │
        │ 1                           │ 1
        │                             │
        │ N                           │ N
┌───────▼─────────────┐      ┌────────▼────────────────┐
│ EmailVerificationTkn│      │  DestinationReviews     │
└─────────────────────┘      └─────────────────────────┘

┌──────────────────┐          ┌──────────────────┐
│   BlogPosts      │◄─────────┤  BlogComments    │
│                  │   1   N  │                  │
└──────────────────┘          └──────────────────┘

┌──────────────────────────┐  ┌────────────────┐
│ NewsletterSubscriptions  │  │   Contacts     │
│ (Independent)            │  │ (Independent)  │
└──────────────────────────┘  └────────────────┘
```

**Key Relationships:**
- ✅ **Users** → **Bookings** (1:N) - One user can have multiple bookings
- ✅ **Destinations** → **Bookings** (1:N) - One destination can be booked multiple times
- ✅ **Destinations** → **DestinationReviews** (1:N) - One destination can have many reviews
- ✅ **Users** → **EmailVerificationTokens** (1:N) - One user can have multiple tokens
- ✅ **BlogPosts** → **BlogComments** (1:N) - One blog post can have many comments

---

## 🎯 CRYSTAL REPORTS DATA REQUIREMENTS

### **Report: Booking Summary Report**

**Purpose:** Generate comprehensive booking reports with filters

**Data Source Query:**
```sql
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
WHERE b.DateOfBooking BETWEEN @FromDate AND @ToDate
  AND (b.BookingStatus = @Status OR @Status = 'All')
ORDER BY b.DateOfBooking DESC
```

**Report Parameters:**
1. **FromDate** (Date) - Start date for report
2. **ToDate** (Date) - End date for report
3. **Status** (String) - Booking status filter (All/Pending/Confirmed/Cancelled/Completed)

**Report Fields:**
- BookingId (INT)
- DateOfBooking (DATETIME)
- DestinationName (NVARCHAR)
- CustomerName (NVARCHAR - Concatenated)
- TravelerEmail (NVARCHAR)
- TravelerPhone (NVARCHAR)
- TravelDate (DATE)
- NumberOfAdults (INT)
- NumberOfChildren (INT)
- TotalAmount (DECIMAL)
- BookingStatus (NVARCHAR)

**Calculated Fields:**
- Total Revenue: SUM(TotalAmount)
- Total Bookings: COUNT(BookingId)
- Total Travelers: SUM(NumberOfAdults + NumberOfChildren)
- Average Booking Value: AVG(TotalAmount)

**Grouping Options:**
- Group by DestinationName (for destination performance)
- Group by BookingStatus (for status breakdown)
- Group by Month/Year (for trend analysis)

---

## 🚀 CRYSTAL REPORTS SETUP IN VISUAL STUDIO

### **Prerequisites**

✅ Visual Studio 2017/2019/2022 installed  
✅ .NET Framework 4.7.2  
✅ SQL Server LocalDB  
✅ Crystal Reports for Visual Studio (SAP)

---

### **STEP 1: Install Crystal Reports for Visual Studio**

#### **1.1 Download Crystal Reports**

**Download Link:** [https://www.sap.com/products/technology-platform/crystal-reports.html](https://www.sap.com/products/technology-platform/crystal-reports.html)

**File to Download:** `CRforVS_13_0_33.exe` (approx. 500 MB)

**Direct Download:** [SAP Crystal Reports for Visual Studio](https://origin.softwaredownloads.sap.com/public/file/0020000001927822021)

#### **1.2 Install Crystal Reports**

```bash
Step 1: Run CRforVS_13_0_33.exe as Administrator
Step 2: Accept license agreement
Step 3: Choose installation directory (default: C:\Program Files (x86)\SAP BusinessObjects\)
Step 4: Click Install (wait 5-10 minutes)
Step 5: Restart computer when prompted
Step 6: Verify installation in Visual Studio → Extensions → Manage Extensions
```

**Installation Time:** ~10-15 minutes  
**Disk Space Required:** ~1.5 GB

---

### **STEP 2: Open Your Project in Visual Studio**

```powershell
# Option 1: Double-click solution file
Start d:\Exploria\Tours&Travels.sln

# Option 2: From Visual Studio
File → Open → Project/Solution → Navigate to d:\Exploria\Tours&Travels.sln
```

**Project Structure:**
```
Tours&Travels.sln
└── Tours&Travels (Web Application Project)
    ├── About.aspx
    ├── AdminBookingReports.aspx ← Already created! ✅
    ├── AdminBookingReports.aspx.cs ← Already created! ✅
    ├── App_Data/
    │   └── ToursTravels.mdf ← Your database
    ├── Web.config ← Connection string here
    └── [Other files...]
```

---

### **STEP 3: Add Crystal Reports References**

#### **3.1 Add Required References**

**In Visual Studio:**
```
1. Solution Explorer → Right-click "References"
2. Click "Add Reference..."
3. Go to "Assemblies" → "Extensions"
4. Search: "Crystal"
5. Check the following checkboxes:
   ☑ CrystalDecisions.CrystalReports.Engine
   ☑ CrystalDecisions.ReportSource
   ☑ CrystalDecisions.Shared
   ☑ CrystalDecisions.Web
6. Click OK
7. Wait for references to be added
```

#### **3.2 Verify References Added**

In Solution Explorer → References, you should see:
- ✅ CrystalDecisions.CrystalReports.Engine
- ✅ CrystalDecisions.ReportSource
- ✅ CrystalDecisions.Shared
- ✅ CrystalDecisions.Web

---

### **STEP 4: Create Reports Folder**

```
Solution Explorer → Right-click "Tours&Travels" project
→ Add → New Folder
→ Name: "Reports"
→ Press Enter
```

**Result:**
```
Tours&Travels/
├── App_Data/
├── CSS/
├── Reports/ ← New folder created! ✅
└── [Other folders...]
```

---

### **STEP 5: Create Crystal Report File**

#### **5.1 Add New Crystal Report**

```
1. Right-click "Reports" folder
2. Add → New Item...
3. Search: "Crystal"
4. Select: "Crystal Report"
5. Name: BookingSummaryReport.rpt
6. Click "Add"
```

#### **5.2 Crystal Report Gallery - Choose Report Type**

**Dialog appears: "Crystal Reports Gallery"**

```
☑ Using the Report Wizard
  → Select: "Standard"
→ Click OK
```

---

### **STEP 6: Crystal Report Wizard - Data Source**

⚠️ **IMPORTANT:** LocalDB connections often fail in Crystal Reports wizard. We'll create the report structure first, then connect to data programmatically in code.

#### **6.1 CREATE REPORT WITHOUT DATABASE CONNECTION (EASIEST METHOD)**

**Step 1: Skip Database Connection**
```
In Crystal Report Gallery:
☑ As a Blank Report (NOT Using the Report Wizard)
→ Click OK
```

**You'll get a blank report designer. This is correct! ✅**

**We'll add fields manually and connect to data in C# code instead.**

---

#### **6.2 Alternative: Try OLE DB Connection (If Dropdown is Empty)**

If you still want to try wizard connection:

**SOLUTION A: Type Server Name Manually**
```
Step 1: Expand "Create New Connection" → "OLE DB (ADO)"
Step 2: Click "Make New Connection"
Step 3: Provider: Microsoft OLE DB Provider for SQL Server → Next
Step 4: Connection Information dialog:

⚠️ IF DROPDOWN IS EMPTY/WHITE:
   → Don't use dropdown!
   → MANUALLY TYPE in the Server field: (LocalDB)\MSSQLLocalDB
   → Press TAB to move to next field
   → Database: ToursTravels
   → Authentication: Use Integrated Security ✅
   → Click "Test Connection"
   → Should show "Test succeeded"
   → Click "Finish"
```

**SOLUTION B: Use Full LocalDB Instance Name**

Find your LocalDB instance name first:

```powershell
# Run this in PowerShell to find instance name:
sqllocaldb info

# Then get connection info:
sqllocaldb info MSSQLLocalDB
```

Output will show something like:
```
Name: MSSQLLocalDB
Version: 13.0.4001.0 (or similar)
Shared name:
Owner: YourPCName\YourUsername
Auto-create: Yes
State: Running
Last start time: 2024-11-11 10:30:00
Instance pipe name: np:\\.\pipe\LOCALDB#HASHCODE\tsql\query
```

Use the **full pipe name** as server:
```
Server: np:\\.\pipe\LOCALDB#HASHCODE\tsql\query
(Copy exact pipe name from your output)
```

---

#### **6.3 Alternative: Create ODBC Data Source First**

**Step 1: Create System DSN**

```
1. Press Windows Key + R
2. Type: odbcad32.exe
3. Click OK (Opens ODBC Data Source Administrator)
4. Go to "System DSN" tab
5. Click "Add"
6. Select "SQL Server" driver
7. Click "Finish"

Configure:
- Name: ToursTravelsDB
- Description: Exploria Tours Database
- Server: (LocalDB)\MSSQLLocalDB
- Click "Next"
- Authentication: With Integrated Windows authentication ✅
- Click "Next"
- ✅ Change default database to: ToursTravels
- Click "Next"
- Click "Finish"
- Click "Test Data Source" → Should succeed
- Click OK to save
```

**Step 2: Use ODBC in Crystal Reports**

```
In Crystal Report Wizard:
1. Create New Connection → ODBC (RDO)
2. Select "System DSN"
3. Choose: ToursTravelsDB (the one you just created)
4. Click "Finish"
5. Expand ToursTravelsDB connection
6. You should see all tables now! ✅
```

---

#### **6.4 BEST SOLUTION: Skip Wizard, Use DataTable in Code (RECOMMENDED)**

This is what your `AdminBookingReports.aspx.cs` already does! ✅

**Advantages:**
- ✅ No connection issues in Crystal Reports
- ✅ Full control over data in C# code
- ✅ Can filter/transform data before sending to report
- ✅ More secure (no embedded credentials)

**How it works:**
```csharp
// Your C# code gets data from database
DataTable bookingsData = GetBookingsData();

// Crystal Report doesn't connect to database directly
// It just uses the DataTable you provide
crystalReport.SetDataSource(bookingsData);
```

**For this method, continue to Step 6.5 below...**

---

### **STEP 7: Create Report Structure (Using Blank Report Method)**

Since we're creating a **blank report** and using **DataTable in code**, we need to define the report structure manually:

#### **7.1 Create Field Definitions**

**In Crystal Report Designer:**

```
1. View → Field Explorer (Ctrl+Alt+T if not visible)
2. Right-click "Database Fields" → Database Expert
3. Project Data → ADO.NET DataSets
4. Click "Create New Connection" if needed, or skip
5. Actually, let's use a simpler approach...
```

**EASIER METHOD - Add Fields Directly:**

Since we'll use `SetDataSource(DataTable)` in code, we need to create a DataTable-based report:

```
1. In Crystal Report designer (blank report)
2. Database → Database Expert (or Ctrl+Alt+D)
3. Available Data Sources → Create New Connection → ADO.NET (XML)
4. Browse to a sample XML file (we'll create one)
```

**Or use EASIEST method (recommended):**

---

#### **7.2 EASIEST METHOD: Create Fields from DataTable Schema**

**Step 1: Let Crystal Reports generate from DataTable**

Your C# code passes a DataTable, so let's create the report to accept it:

```
1. In Report Designer (blank report)
2. Right-click on "Details" section
3. Insert → Text Object
4. Type: "Booking ID"
5. Right-click on "Details" again
6. Insert → Field Object
7. For now, just create text placeholders

We'll design the full layout in Step 7.3
```

**Step 2: Create Basic Layout**

```
Report Header Section:
├─ Insert → Text Object → Type: "Booking Summary Report"
├─ Make it bold, size 18pt
└─ Center align

Page Header Section:
├─ Insert → Text Object → Create column headers:
│  • Booking ID
│  • Date
│  • Destination
│  • Customer
│  • Email
│  • Phone
│  • Travel Date
│  • Adults
│  • Children
│  • Amount
│  • Status
└─ Make them bold

Details Section:
└─ Leave blank for now (we'll bind fields in code)

Report Footer Section:
├─ Insert → Text Object → "Total Revenue: "
├─ Insert → Text Object → "Total Bookings: "
└─ Insert → Text Object → "Average: "

Page Footer Section:
└─ Insert → Special Field → Page Number
```

---

#### **7.3 ALTERNATIVE: Use Wizard with ODBC (If You Created ODBC DSN)**

If you successfully created ODBC connection in Step 6.3:

**Select Tables:**
```
Available Tables (Left Panel):
├─ BlogComments
├─ BlogPosts
├─ Bookings ← Add this! ✅
├─ Contacts
├─ DestinationReviews
├─ Destinations ← Add this! ✅
├─ EmailVerificationTokens
├─ NewsletterSubscriptions
└─ Users ← Add this! ✅ (or Registration)

Selected Tables (Right Panel):
1. Click "Bookings" → Click ">" button
2. Click "Destinations" → Click ">" button
3. Click "Users" → Click ">" button

→ Click "Next"
```

**Link Tables:**
```
Automatic Links (Verify these):
✅ Bookings.UserId → Users.Id
✅ Bookings.DestinationId → Destinations.Id

If links are missing, create manually:
1. Click "Bookings.UserId"
2. Drag to "Users.Id"
3. Click "Bookings.DestinationId"
4. Drag to "Destinations.Id"

→ Click "Next"
```

**Select Fields:**
```
From Bookings:
☑ BookingId
☑ DateOfBooking
☑ TravelDate
☑ NumberOfAdults
☑ NumberOfChildren
☑ TotalAmount
☑ BookingStatus
☑ TravelerEmail
☑ TravelerPhone

From Destinations:
☑ Name (Alias as: DestinationName)

From Users:
☑ FirstName
☑ LastName

→ Click "Next"
```

**Grouping (Optional):**
```
Skip grouping for now
→ Click "Next"
```

**Summaries:**
```
☑ Sum of TotalAmount
☑ Count of BookingId

→ Click "Next"
```

**Style:**
```
Choose: Standard
→ Click "Finish"
```

---

### **STEP 13: Add Report Parameters**

**In Crystal Report Designer:**

```
1. View → Field Explorer (Ctrl+Alt+T)
2. Right-click "Parameter Fields" → New

Parameter 1: FromDate
├─ Name: FromDate
├─ Type: Date
├─ Prompting Text: "From Date"
├─ Default Value: (30 days ago)
└─ Click OK

Parameter 2: ToDate
├─ Name: ToDate
├─ Type: Date
├─ Prompting Text: "To Date"
├─ Default Value: (Today)
└─ Click OK

Parameter 3: Status
├─ Name: Status
├─ Type: String
├─ Prompting Text: "Booking Status"
├─ Allow Multiple Values: No
├─ Default Value: "All"
├─ Values:
│  • All
│  • Pending
│  • Confirmed
│  • Cancelled
│  • Completed
└─ Click OK
```

---

### **STEP 14: Design Report Layout**

**Customize your report:**

```
Report Header:
├─ Add company logo (Insert → Picture)
├─ Add report title: "Booking Summary Report"
├─ Add date range text: "From {?FromDate} to {?ToDate}"
└─ Add status filter: "Status: {?Status}"

Page Header:
└─ Column headers (BookingId, Date, Destination, Customer, etc.)

Details:
└─ Field values (already added by wizard)

Report Footer:
├─ Total Revenue: Sum({Bookings.TotalAmount})
├─ Total Bookings: Count({Bookings.BookingId})
└─ Average Value: Average({Bookings.TotalAmount})

Page Footer:
└─ Page number: "Page {PageNumber} of {TotalPageCount}"
```

**Format Currency:**
```
Right-click TotalAmount field → Format Field
→ Number tab → Currency
→ Symbol: $
→ Decimal Places: 2
→ Click OK
```

---

### **STEP 15: Set Report File Properties**

**In Solution Explorer:**

```
Right-click: Reports\BookingSummaryReport.rpt
→ Properties

Build Action: Content ✅
Copy to Output Directory: Copy if newer ✅

→ Press Ctrl+S to save
```

---

### **STEP 16: Configure Web.config**

**Open:** `Tours&Travels\Web.config`

#### **Add httpHandlers (System.web section)**

```xml
<configuration>
  <system.web>
    <!-- Existing settings -->
    <compilation debug="true" targetFramework="4.7.2" />
    <httpRuntime targetFramework="4.7.2" maxRequestLength="51200" />
    
    <!-- ADD THIS for Crystal Reports -->
    <httpHandlers>
      <add verb="GET" path="CrystalImageHandler.aspx" 
           type="CrystalDecisions.Web.CrystalImageHandler, CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" />
    </httpHandlers>
  </system.web>
</configuration>
```

#### **Add handlers (System.webServer section)**

```xml
<configuration>
  <system.webServer>
    <!-- Existing settings -->
    <defaultDocument>
      <files>
        <clear />
        <add value="Home.aspx" />
      </files>
    </defaultDocument>
    
    <!-- ADD THIS for Crystal Reports -->
    <handlers>
      <add name="CrystalImageHandler.aspx_GET" verb="GET" path="CrystalImageHandler.aspx" 
           type="CrystalDecisions.Web.CrystalImageHandler, CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" 
           preCondition="integratedMode" />
    </handlers>
    
    <validation validateIntegratedModeConfiguration="false" />
  </system.webServer>
</configuration>
```

**Save Web.config** (Ctrl+S)

---

### **STEP 17: Verify AdminBookingReports.aspx**

**File already exists!** ✅ (Created in VS Code)

**Verify Crystal Report Viewer control:**

Open: `AdminBookingReports.aspx`

```aspx
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" 
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" 
    AutoDataBind="true" 
    EnableDatabaseLogonPrompt="False" 
    EnableParameterPrompt="False" 
    HasToggleGroupTreeButton="False" />
```

---

### **STEP 18: Build Solution**

```
In Visual Studio:
1. Build → Clean Solution (Wait)
2. Build → Build Solution (Ctrl+Shift+B)
3. Check Output window for "Build succeeded"

Expected Output:
========== Build: 1 succeeded, 0 failed, 0 up-to-date, 0 skipped ==========
```

**If build fails:**
- Check all references are added
- Verify Crystal Reports is installed
- Clean and rebuild

---

### **STEP 19: Run and Test**

#### **19.1 Start Application**

```
Press F5 (or click ▶ IIS Express)
→ Browser opens: http://localhost:XXXX/Home.aspx
```

#### **19.2 Login as Admin**

```
Navigate to: /Login.aspx
Enter admin credentials:
- Email: admin@example.com (or your admin email)
- Password: [your admin password]
→ Click Login
```

#### **19.3 Navigate to Reports**

```
URL: http://localhost:XXXX/AdminBookingReports.aspx
Or click: Admin menu → Booking Reports
```

#### **19.4 Generate Report**

```
1. Set From Date: (30 days ago)
2. Set To Date: (today)
3. Select Status: All
4. Click "Generate Report" button

Expected Result:
✅ Report displays in CrystalReportViewer
✅ Shows all bookings with details
✅ Summary totals at bottom
```

#### **19.5 Test PDF Export**

```
Click "Export to PDF" button

Expected Result:
✅ PDF file downloads: BookingReport_20241111120000.pdf
✅ Opens in PDF viewer
✅ All data visible and formatted correctly
```

#### **19.6 Test Excel Export**

```
Click "Export to Excel" button

Expected Result:
✅ Excel file downloads: BookingReport_20241111120000.xlsx
✅ Opens in Excel/LibreOffice
✅ All data in tabular format
```

---

## ✅ VERIFICATION CHECKLIST

Use this checklist to verify everything is working:

```
Installation & Setup:
☐ Crystal Reports for Visual Studio installed
☐ Computer restarted after installation
☐ Visual Studio opened successfully
☐ Solution Tours&Travels.sln loaded

References:
☐ CrystalDecisions.CrystalReports.Engine added
☐ CrystalDecisions.ReportSource added
☐ CrystalDecisions.Shared added
☐ CrystalDecisions.Web added
☐ All references show (no yellow warning icons)

Project Structure:
☐ Reports folder created
☐ BookingSummaryReport.rpt exists in Reports folder
☐ Report file Build Action = Content
☐ Report file Copy to Output Directory = Copy if newer

Report Design:
☐ Database connection successful
☐ Tables added (Bookings, Destinations, Users)
☐ Tables linked correctly
☐ Fields selected and displayed
☐ Parameters created (FromDate, ToDate, Status)
☐ Summary fields added (Sum, Count, Average)
☐ Report formatted (headers, footers, currency)

Configuration:
☐ Web.config has httpHandlers section
☐ Web.config has system.webServer/handlers section
☐ Connection string correct in Web.config

Build & Run:
☐ Solution builds successfully (no errors)
☐ Application runs (F5)
☐ AdminBookingReports.aspx loads
☐ Report generates with data
☐ PDF export works
☐ Excel export works
☐ No runtime errors in browser console

Testing:
☐ Test with different date ranges
☐ Test with different status filters
☐ Test with no data (should show message)
☐ Test PDF download
☐ Test Excel download
☐ Verify data accuracy against database
```

---

## 🐛 TROUBLESHOOTING

### **Error: "Report file not found"**

**Cause:** Report file not copied to output directory

**Fix:**
```
1. Right-click BookingSummaryReport.rpt
2. Properties
3. Build Action: Content
4. Copy to Output Directory: Copy if newer
5. Clean and Rebuild solution
```

---

### **Error: "Could not load CrystalDecisions.Web"**

**Cause:** Assembly not installed or wrong version

**Fix:**
```
1. Uninstall Crystal Reports (Control Panel → Programs)
2. Restart computer
3. Reinstall CRforVS_13_0_33.exe
4. Restart computer again
5. Re-add references in Visual Studio
6. Clean and rebuild
```

---

### **Error: "Database login failed"**

**Cause:** Report trying to use different credentials

**Fix - Set Database Location in Code:**
```csharp
// In AdminBookingReports.aspx.cs
crystalReport.Load(reportPath);

// Add these lines to set database logon:
ConnectionInfo connInfo = new ConnectionInfo();
connInfo.ServerName = @"(LocalDB)\MSSQLLocalDB";
connInfo.DatabaseName = "ToursTravels";
connInfo.IntegratedSecurity = true;

TableLogOnInfo logOnInfo = new TableLogOnInfo();
logOnInfo.ConnectionInfo = connInfo;

foreach (Table table in crystalReport.Database.Tables)
{
    table.ApplyLogOnInfo(logOnInfo);
}

crystalReport.SetDataSource(bookingsData);
```

**Or use SetDataSource (recommended):**
```csharp
// This bypasses database connection entirely
DataTable dt = GetBookingsData(); // Get data from SQL
crystalReport.SetDataSource(dt); // Use DataTable directly
```

---

### **Error: "No data in report"**

**Cause:** 
- No bookings in database
- Wrong date range
- Filter too restrictive

**Fix:**
```sql
-- Check if data exists in database
SELECT COUNT(*) FROM Bookings;

-- Check date range
SELECT 
    MIN(DateOfBooking) AS FirstBooking,
    MAX(DateOfBooking) AS LastBooking
FROM Bookings;

-- If no data, add sample booking:
INSERT INTO Bookings (UserId, DestinationId, TravelerFirstName, TravelerLastName, 
    TravelerEmail, TravelerPhone, TravelDate, NumberOfAdults, NumberOfChildren, 
    TotalAmount, BookingStatus, DateOfBooking)
VALUES (1, 1, 'John', 'Doe', 'john@example.com', '1234567890', 
    GETDATE(), 2, 1, 1500.00, 'Confirmed', GETDATE());
```

---

### **Error: "Export doesn't work"**

**Cause:** Browser blocking download

**Fix:**
```
1. Disable popup blocker for localhost
2. Check browser console for errors (F12)
3. Ensure report is generated first (click Generate Report)
4. Try different browser (Chrome, Edge, Firefox)
```

---

### **Error: "Parameter prompt appears"**

**Cause:** Parameters not set in code

**Fix:**
```csharp
// Make sure these lines are in button click:
crystalReport.SetParameterValue("FromDate", txtFromDate.Text);
crystalReport.SetParameterValue("ToDate", txtToDate.Text);
crystalReport.SetParameterValue("Status", ddlStatusFilter.SelectedValue);

// In report viewer:
CrystalReportViewer1.EnableParameterPrompt = false; // ← Add this
```

---

## 📊 ADDITIONAL REPORTS TO CREATE

### **1. Revenue Report by Destination**

**Purpose:** Track which destinations generate most revenue

**Query:**
```sql
SELECT 
    d.Name AS DestinationName,
    COUNT(b.BookingId) AS TotalBookings,
    SUM(b.TotalAmount) AS TotalRevenue,
    AVG(b.TotalAmount) AS AverageBookingValue,
    SUM(b.NumberOfAdults + b.NumberOfChildren) AS TotalTravelers
FROM Destinations d
LEFT JOIN Bookings b ON d.Id = b.DestinationId
WHERE b.DateOfBooking BETWEEN @FromDate AND @ToDate
GROUP BY d.Name
ORDER BY TotalRevenue DESC
```

**Grouping:** By Destination  
**Chart:** Bar chart of revenue by destination

---

### **2. Customer Booking History Report**

**Purpose:** Individual customer booking details

**Query:**
```sql
SELECT 
    CONCAT(u.FirstName, ' ', u.LastName) AS CustomerName,
    u.Email,
    u.Phone,
    d.Name AS DestinationName,
    b.TravelDate,
    b.TotalAmount,
    b.BookingStatus,
    b.DateOfBooking
FROM Users u
INNER JOIN Bookings b ON u.Id = b.UserId
INNER JOIN Destinations d ON b.DestinationId = d.Id
WHERE u.Id = @CustomerId
ORDER BY b.DateOfBooking DESC
```

**Parameters:** CustomerId  
**Grouping:** By Customer

---

### **3. Monthly Revenue Trend Report**

**Purpose:** Track revenue trends over time

**Query:**
```sql
SELECT 
    YEAR(DateOfBooking) AS BookingYear,
    MONTH(DateOfBooking) AS BookingMonth,
    DATENAME(MONTH, DateOfBooking) AS MonthName,
    COUNT(BookingId) AS TotalBookings,
    SUM(TotalAmount) AS MonthlyRevenue
FROM Bookings
WHERE YEAR(DateOfBooking) = @Year
GROUP BY YEAR(DateOfBooking), MONTH(DateOfBooking), DATENAME(MONTH, DateOfBooking)
ORDER BY BookingYear, BookingMonth
```

**Parameters:** Year  
**Chart:** Line chart showing revenue trend

---

### **4. Booking Status Distribution Report**

**Purpose:** Overview of booking statuses

**Query:**
```sql
SELECT 
    BookingStatus,
    COUNT(BookingId) AS TotalBookings,
    SUM(TotalAmount) AS TotalRevenue,
    (COUNT(BookingId) * 100.0 / (SELECT COUNT(*) FROM Bookings)) AS PercentageOfTotal
FROM Bookings
WHERE DateOfBooking BETWEEN @FromDate AND @ToDate
GROUP BY BookingStatus
ORDER BY TotalBookings DESC
```

**Chart:** Pie chart of status distribution

---

## 💻 YOUR DEVELOPMENT WORKFLOW

### **Daily Coding in VS Code:**

```
📝 VS Code (Primary Editor)
├─ Edit .aspx files (UI)
├─ Edit .aspx.cs files (C# logic)
├─ Edit CSS files (Styling)
├─ Modify JavaScript files
├─ Add new features
└─ Save all files (Ctrl+S)

Result: Code changes saved ✅
```

### **Running & Testing in Visual Studio:**

```
▶️ Visual Studio (Run & Test)
├─ Open Tours&Travels.sln
├─ Press F5 (or ▶ IIS Express)
├─ Browser opens automatically
├─ Test your changes
├─ Check console for errors
└─ Stop debugging (Shift+F5)

Result: Application tested ✅
```

### **Report Design in Visual Studio:**

```
🎨 Visual Studio (Report Design)
├─ Open BookingSummaryReport.rpt
├─ Modify layout/formatting
├─ Add/remove fields
├─ Change colors, fonts
├─ Add images/logos
├─ Save (Ctrl+S)
├─ Press F5 to test
└─ Verify in browser

Result: Report updated ✅
```

**Key Points:**
- ✅ **Code** in VS Code (faster, better editing)
- ✅ **Run** in Visual Studio (required for ASP.NET)
- ✅ **Reports** in Visual Studio only (Crystal Reports designer)

---

## 📚 CRYSTAL REPORTS RESOURCES

### **Official Documentation:**
- [SAP Crystal Reports Documentation](https://help.sap.com/docs/SAP_CRYSTAL_REPORTS)
- [Crystal Reports Developer Center](https://www.sap.com/developer/topics/crystal-reports.html)

### **Tutorials:**
- [Crystal Reports Tutorial - TutorialsPoint](https://www.tutorialspoint.com/crystal_reports/index.htm)
- [YouTube: Crystal Reports for Beginners](https://www.youtube.com/results?search_query=crystal+reports+tutorial)

### **Forums:**
- [SAP Community - Crystal Reports](https://community.sap.com/)
- [Stack Overflow - Crystal Reports Tag](https://stackoverflow.com/questions/tagged/crystal-reports)

---

## 🎉 SUCCESS CRITERIA

After completing this guide, you should have:

✅ **Working Crystal Reports Installation**
- Crystal Reports for Visual Studio installed
- All references added to project
- Report file created and configured

✅ **Functional Booking Reports**
- AdminBookingReports.aspx page working
- Report generates with filters (date, status)
- PDF export working
- Excel export working

✅ **Professional Report Design**
- Proper formatting (currency, dates)
- Company branding (logo, colors)
- Summary totals (revenue, count, average)
- Page headers and footers

✅ **Scalable Report System**
- Can create new reports easily
- Reusable report templates
- Consistent branding across reports

---

## 📝 SUMMARY

**Your Database:**
- ✅ 9 tables (Users, Destinations, Bookings, etc.)
- ✅ Proper relationships (Foreign Keys)
- ✅ LocalDB instance running
- ✅ Connection string configured

**Your Report:**
- ✅ Joins 3 tables (Bookings, Users, Destinations)
- ✅ 11 fields displayed
- ✅ 3 parameters (FromDate, ToDate, Status)
- ✅ Summary calculations (Sum, Count, Average)
- ✅ PDF/Excel export enabled

**Next Steps:**
1. ✅ Install Crystal Reports (10 min)
2. ✅ Add references (2 min)
3. ✅ Create report folder (1 min)
4. ✅ Create .rpt file using wizard (15 min)
5. ✅ Configure Web.config (2 min)
6. ✅ Build and test (5 min)
7. ✅ Create additional reports as needed

**Total Time:** ~35-40 minutes

---

## 🎯 QUICK START COMMAND LIST

For experienced developers, here's the command/action list:

```bash
# 1. Install Crystal Reports
Download: CRforVS_13_0_33.exe
Run as Admin → Install → Restart PC

# 2. Open Project
Visual Studio → File → Open → d:\Exploria\Tours&Travels.sln

# 3. Add References
Right-click References → Add Reference → Extensions → Search "Crystal"
Add: Engine, ReportSource, Shared, Web

# 4. Create Report
Right-click project → Add → New Folder → "Reports"
Right-click Reports → Add → New Item → Crystal Report
Name: BookingSummaryReport.rpt
Wizard: Standard → Connect DB → Add tables → Select fields → Finish

# 5. Add Parameters
Field Explorer → Parameter Fields → New
Add: FromDate (Date), ToDate (Date), Status (String)

# 6. Configure Web.config
Add httpHandlers and system.webServer/handlers sections

# 7. Set Properties
Right-click .rpt → Properties → Build Action: Content, Copy: Copy if newer

# 8. Build & Run
Ctrl+Shift+B (Build)
F5 (Run)
Navigate to /AdminBookingReports.aspx
Generate report, test exports
```

---

## 📞 SUPPORT

If you encounter issues:

1. **Check this guide** - Most issues covered in Troubleshooting section
2. **Review error messages** - They usually indicate the exact problem
3. **Verify checklist** - Ensure all steps completed
4. **Check references** - Ensure all Crystal Reports DLLs are added
5. **Rebuild solution** - Clean → Build often fixes issues
6. **Restart Visual Studio** - Sometimes required after adding references

---

**🎉 Good luck with your Crystal Reports setup! You've got this! 🚀**

---

**Document Version:** 1.0  
**Last Updated:** November 11, 2025  
**Project:** Exploria - Tours & Travels  
**Author:** GitHub Copilot  
**Status:** Complete & Ready to Use ✅
