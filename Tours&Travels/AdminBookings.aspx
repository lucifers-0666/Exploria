<%@ Page Title="Admin - Manage Bookings" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminBookings.aspx.cs" Inherits="Tours_Travels.AdminBookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .admin-container {
            max-width: 1400px;
            margin: 120px auto 60px;
            padding: 0 20px;
        }

        .page-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .page-header h1 {
            font-size: 36px;
            font-weight: 700;
            color: #164426;
            margin-bottom: 12px;
        }

        .page-header p {
            color: #6b7280;
            font-size: 16px;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 24px;
            margin-bottom: 40px;
        }

        .stat-card {
            background: white;
            border-radius: 16px;
            padding: 24px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            display: flex;
            align-items: center;
            gap: 20px;
            transition: transform 300ms ease;
        }

        .stat-card:hover {
            transform: translateY(-4px);
        }

        .stat-icon {
            width: 64px;
            height: 64px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
        }

        .stat-icon.total { background: #e8f4ed; color: #1d5e33; }
        .stat-icon.confirmed { background: #d1f4e0; color: #0f5132; }
        .stat-icon.pending { background: #fff3cd; color: #856404; }
        .stat-icon.cancelled { background: #f8d7da; color: #842029; }

        .stat-info h3 {
            font-size: 32px;
            font-weight: 700;
            color: #164426;
            margin-bottom: 4px;
        }

        .stat-info p {
            color: #6b7280;
            font-size: 14px;
        }

        .filter-section {
            background: white;
            border-radius: 16px;
            padding: 24px;
            margin-bottom: 32px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        }

        .filter-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 16px;
        }

        .filter-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .filter-label {
            font-size: 14px;
            font-weight: 500;
            color: #164426;
        }

        .filter-input {
            padding: 10px 14px;
            border: 2px solid #e8f4ed;
            border-radius: 8px;
            font-size: 14px;
            transition: all 300ms ease;
        }

        .filter-input:focus {
            outline: none;
            border-color: #1d5e33;
        }

        .btn-filter {
            padding: 10px 24px;
            background: #1d5e33;
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 300ms ease;
            margin-top: auto;
        }

        .btn-filter:hover {
            background: #2a7d4a;
        }

        .bookings-table {
            background: white;
            border-radius: 16px;
            padding: 24px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            overflow-x: auto;
        }

        .data-table {
            width: 100%;
            border-collapse: collapse;
        }

        .data-table thead {
            background: #e8f4ed;
        }

        .data-table th {
            padding: 16px;
            text-align: left;
            font-weight: 600;
            color: #164426;
            font-size: 14px;
            border-bottom: 2px solid #1d5e33;
        }

        .data-table td {
            padding: 16px;
            border-bottom: 1px solid #e8f4ed;
            font-size: 14px;
            color: #374151;
        }

        .data-table tr:hover {
            background: #f5e8d8;
        }

        .status-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 600;
            display: inline-block;
        }

        .status-confirmed {
            background: #d1f4e0;
            color: #0f5132;
        }

        .status-pending {
            background: #fff3cd;
            color: #856404;
        }

        .status-cancelled {
            background: #f8d7da;
            color: #842029;
        }

        .status-completed {
            background: #cfe2ff;
            color: #084298;
        }

        .action-buttons {
            display: flex;
            gap: 8px;
        }

        .btn-action {
            padding: 8px 12px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 12px;
            font-weight: 600;
            transition: all 300ms ease;
        }

        .btn-view {
            background: #cfe2ff;
            color: #084298;
        }

        .btn-view:hover {
            background: #9ec5fe;
        }

        .btn-confirm {
            background: #d1f4e0;
            color: #0f5132;
        }

        .btn-confirm:hover {
            background: #a3e4d7;
        }

        .btn-cancel {
            background: #f8d7da;
            color: #842029;
        }

        .btn-cancel:hover {
            background: #f5c6cb;
        }

        .no-data {
            text-align: center;
            padding: 60px 20px;
            color: #6b7280;
        }

        .no-data i {
            font-size: 64px;
            color: #c9a877;
            margin-bottom: 16px;
        }

        .alert {
            padding: 16px;
            border-radius: 8px;
            margin-bottom: 24px;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .alert-success {
            background: #d1f4e0;
            color: #0f5132;
            border: 1px solid #0f5132;
        }

        .alert-error {
            background: #f8d7da;
            color: #842029;
            border: 1px solid #842029;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="admin-container">
        <div class="page-header">
            <h1>
                <i class="las la-clipboard-list" style="color: #c9a877;"></i>
                Bookings Management
            </h1>
            <p>View and manage all customer bookings</p>
        </div>

        <!-- Alert Messages -->
        <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="alert alert-success">
            <i class="las la-check-circle" style="font-size: 24px;"></i>
            <asp:Label ID="lblSuccess" runat="server"></asp:Label>
        </asp:Panel>
        <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="alert alert-error">
            <i class="las la-exclamation-circle" style="font-size: 24px;"></i>
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </asp:Panel>

        <!-- Statistics Cards -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-icon total">
                    <i class="las la-clipboard-list"></i>
                </div>
                <div class="stat-info">
                    <h3><asp:Label ID="lblTotalBookings" runat="server" Text="0"></asp:Label></h3>
                    <p>Total Bookings</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon confirmed">
                    <i class="las la-check-circle"></i>
                </div>
                <div class="stat-info">
                    <h3><asp:Label ID="lblConfirmedBookings" runat="server" Text="0"></asp:Label></h3>
                    <p>Confirmed</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon pending">
                    <i class="las la-clock"></i>
                </div>
                <div class="stat-info">
                    <h3><asp:Label ID="lblPendingBookings" runat="server" Text="0"></asp:Label></h3>
                    <p>Pending</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon cancelled">
                    <i class="las la-times-circle"></i>
                </div>
                <div class="stat-info">
                    <h3><asp:Label ID="lblCancelledBookings" runat="server" Text="0"></asp:Label></h3>
                    <p>Cancelled</p>
                </div>
            </div>
        </div>

        <!-- Filter Section -->
        <div class="filter-section">
            <div class="filter-grid">
                <div class="filter-group">
                    <label class="filter-label">Status</label>
                    <asp:DropDownList ID="ddlStatus" runat="server" CssClass="filter-input">
                        <asp:ListItem Value="" Text="All Statuses"></asp:ListItem>
                        <asp:ListItem Value="Pending" Text="Pending"></asp:ListItem>
                        <asp:ListItem Value="Confirmed" Text="Confirmed"></asp:ListItem>
                        <asp:ListItem Value="Cancelled" Text="Cancelled"></asp:ListItem>
                        <asp:ListItem Value="Completed" Text="Completed"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="filter-group">
                    <label class="filter-label">Search</label>
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="filter-input" placeholder="Booking ID, Customer name..."></asp:TextBox>
                </div>
                <div class="filter-group">
                    <label class="filter-label">From Date</label>
                    <asp:TextBox ID="txtFromDate" runat="server" CssClass="filter-input" TextMode="Date"></asp:TextBox>
                </div>
                <div class="filter-group">
                    <label class="filter-label">To Date</label>
                    <asp:TextBox ID="txtToDate" runat="server" CssClass="filter-input" TextMode="Date"></asp:TextBox>
                </div>
                <div class="filter-group">
                    <label class="filter-label">&nbsp;</label>
                    <asp:Button ID="btnFilter" runat="server" CssClass="btn-filter" Text="Apply Filters" OnClick="btnFilter_Click" />
                </div>
            </div>
        </div>

        <!-- Bookings Table -->
        <div class="bookings-table">
            <asp:GridView ID="gvBookings" runat="server" CssClass="data-table" AutoGenerateColumns="False" 
                OnRowCommand="gvBookings_RowCommand" DataKeyNames="BookingId">
                <Columns>
                    <asp:BoundField DataField="BookingId" HeaderText="Booking ID" />
                    <asp:BoundField DataField="DestinationName" HeaderText="Destination" />
                    <asp:BoundField DataField="CustomerName" HeaderText="Customer" />
                    <asp:BoundField DataField="TravelerEmail" HeaderText="Email" />
                    <asp:BoundField DataField="TravelDate" HeaderText="Travel Date" DataFormatString="{0:MMM dd, yyyy}" />
                    <asp:TemplateField HeaderText="Travelers">
                        <ItemTemplate>
                            <%# Eval("NumberOfAdults") %> Adults, <%# Eval("NumberOfChildren") %> Children
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="TotalAmount" HeaderText="Amount" DataFormatString="₹{0:N2}" />
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <span class='status-badge status-<%# Eval("BookingStatus").ToString().ToLower() %>'>
                                <%# Eval("BookingStatus") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="DateOfBooking" HeaderText="Booked On" DataFormatString="{0:MMM dd, yyyy}" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <div class="action-buttons">
                                <asp:Button ID="btnConfirm" runat="server" CssClass="btn-action btn-confirm" 
                                    Text="Confirm" CommandName="ConfirmBooking" CommandArgument='<%# Eval("BookingId") %>' 
                                    Visible='<%# Eval("BookingStatus").ToString() == "Pending" %>' />
                                <asp:Button ID="btnCancel" runat="server" CssClass="btn-action btn-cancel" 
                                    Text="Cancel" CommandName="CancelBooking" CommandArgument='<%# Eval("BookingId") %>' 
                                    OnClientClick="return confirm('Are you sure you want to cancel this booking?');" 
                                    Visible='<%# Eval("BookingStatus").ToString() != "Cancelled" %>' />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <div class="no-data">
                        <i class="las la-inbox"></i>
                        <h3>No bookings found</h3>
                        <p>No bookings match your search criteria</p>
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
