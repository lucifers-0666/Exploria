<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertTestData.aspx.cs" Inherits="Tours_Travels.InsertTestData" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Insert Test Booking Data</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background: #f5f5f5;
        }
        .container {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        h1 {
            color: #164426;
            margin-bottom: 20px;
        }
        .btn {
            background: #164426;
            color: white;
            padding: 12px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin: 10px 5px;
        }
        .btn:hover {
            background: #2a7d4a;
        }
        .btn-danger {
            background: #dc3545;
        }
        .btn-danger:hover {
            background: #c82333;
        }
        .message {
            padding: 15px;
            margin: 20px 0;
            border-radius: 5px;
        }
        .success {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
        .info {
            background: #d1ecf1;
            color: #0c5460;
            border: 1px solid #bee5eb;
        }
        .stats {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 15px;
            margin: 20px 0;
        }
        .stat-card {
            background: #164426;
            color: white;
            padding: 20px;
            border-radius: 5px;
            text-align: center;
        }
        .stat-card h3 {
            margin: 0 0 10px 0;
            font-size: 32px;
        }
        .stat-card p {
            margin: 0;
            opacity: 0.9;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>🎯 Insert Test Booking Data</h1>
            
            <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="message">
                <asp:Label ID="lblMessage" runat="server"></asp:Label>
            </asp:Panel>

            <div class="info message">
                <strong>ℹ️ Note:</strong> This will insert 15 dummy bookings for testing Crystal Reports.
                <br />The data includes various booking statuses: Confirmed, Pending, Cancelled, and Completed.
            </div>

            <div>
                <asp:Button ID="btnInsertData" runat="server" Text="Insert Test Data" CssClass="btn" OnClick="btnInsertData_Click" />
                <asp:Button ID="btnClearData" runat="server" Text="Clear Test Data" CssClass="btn btn-danger" OnClick="btnClearData_Click" OnClientClick="return confirm('Are you sure you want to delete all test bookings?');" />
            </div>

            <asp:Panel ID="pnlStats" runat="server" Visible="false">
                <h2 style="margin-top: 30px;">📊 Current Booking Statistics</h2>
                <div class="stats">
                    <div class="stat-card">
                        <h3><asp:Label ID="lblTotalBookings" runat="server" Text="0"></asp:Label></h3>
                        <p>Total Bookings</p>
                    </div>
                    <div class="stat-card" style="background: #28a745;">
                        <h3><asp:Label ID="lblConfirmed" runat="server" Text="0"></asp:Label></h3>
                        <p>Confirmed</p>
                    </div>
                    <div class="stat-card" style="background: #ffc107;">
                        <h3><asp:Label ID="lblPending" runat="server" Text="0"></asp:Label></h3>
                        <p>Pending</p>
                    </div>
                    <div class="stat-card" style="background: #dc3545;">
                        <h3><asp:Label ID="lblCancelled" runat="server" Text="0"></asp:Label></h3>
                        <p>Cancelled</p>
                    </div>
                </div>
                
                <div style="margin-top: 20px; text-align: center;">
                    <a href="AdminBookingReports.aspx" class="btn">📊 Go to Crystal Reports</a>
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
