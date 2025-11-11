<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Tours_Travels.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .dashboard-container { max-width: 1400px; margin: 120px auto 60px; padding: 0 20px; }
        .page-header { text-align: center; margin-bottom: 40px; }
        .page-header h1 { font-size: 36px; font-weight: 700; color: #164426; margin-bottom: 12px; }
        .welcome-card { background: linear-gradient(135deg, #1d5e33 0%, #2a7d4a 100%); color: white; border-radius: 20px; padding: 40px; margin-bottom: 40px; box-shadow: 0 10px 40px rgba(29, 94, 51, 0.3); }
        .welcome-card h2 { font-size: 32px; font-weight: 700; margin-bottom: 12px; }
        .welcome-card p { font-size: 18px; opacity: 0.9; }
        .stats-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 24px; margin-bottom: 40px; }
        .stat-card { background: white; border-radius: 16px; padding: 24px; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08); transition: transform 300ms ease; }
        .stat-card:hover { transform: translateY(-4px); }
        .stat-icon { width: 64px; height: 64px; border-radius: 12px; display: flex; align-items: center; justify-content: center; font-size: 32px; margin-bottom: 16px; }
        .stat-icon.bookings { background: #e8f4ed; color: #1d5e33; }
        .stat-icon.destinations { background: #f5e8d8; color: #c9a877; }
        .stat-icon.spent { background: #cfe2ff; color: #084298; }
        .stat-icon.wishlist { background: #f8d7da; color: #842029; }
        .stat-value { font-size: 36px; font-weight: 700; color: #164426; margin-bottom: 8px; }
        .stat-label { color: #6b7280; font-size: 14px; }
        .content-grid { display: grid; grid-template-columns: 2fr 1fr; gap: 32px; }
        @media (max-width: 968px) { .content-grid { grid-template-columns: 1fr; } }
        .card { background: white; border-radius: 16px; padding: 32px; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08); }
        .card-title { font-size: 24px; font-weight: 600; color: #164426; margin-bottom: 24px; display: flex; align-items: center; gap: 12px; }
        .card-title i { font-size: 28px; color: #c9a877; }
        .booking-item { display: flex; gap: 16px; padding: 20px; background: #f9fafb; border-radius: 12px; margin-bottom: 16px; transition: all 300ms ease; }
        .booking-item:hover { background: #f5e8d8; transform: translateX(4px); }
        .booking-image { width: 100px; height: 100px; border-radius: 8px; object-fit: cover; }
        .booking-details { flex: 1; }
        .booking-details h3 { font-size: 18px; font-weight: 600; color: #164426; margin-bottom: 8px; }
        .booking-details p { font-size: 14px; color: #6b7280; margin-bottom: 4px; }
        .status-badge { padding: 6px 12px; border-radius: 20px; font-size: 12px; font-weight: 600; display: inline-block; }
        .status-confirmed { background: #d1f4e0; color: #0f5132; }
        .status-pending { background: #fff3cd; color: #856404; }
        .quick-actions { display: grid; gap: 16px; }
        .action-btn { display: flex; align-items: center; gap: 12px; padding: 16px; border-radius: 12px; text-decoration: none; transition: all 300ms ease; font-weight: 600; }
        .action-btn i { font-size: 24px; }
        .action-explore { background: #e8f4ed; color: #1d5e33; }
        .action-explore:hover { background: #1d5e33; color: white; }
        .action-profile { background: #f5e8d8; color: #c9a877; }
        .action-profile:hover { background: #c9a877; color: white; }
        .action-support { background: #cfe2ff; color: #084298; }
        .action-support:hover { background: #084298; color: white; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="dashboard-container">
        <div class="welcome-card">
            <h2>Welcome back, <asp:Label ID="lblUserName" runat="server"></asp:Label>! 👋</h2>
            <p>Ready for your next adventure? Explore new destinations and plan your dream vacation.</p>
        </div>

        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-icon bookings"><i class="las la-suitcase"></i></div>
                <div class="stat-value"><asp:Label ID="lblTotalBookings" runat="server" Text="0"></asp:Label></div>
                <div class="stat-label">Total Bookings</div>
            </div>
            <div class="stat-card">
                <div class="stat-icon destinations"><i class="las la-map-marked-alt"></i></div>
                <div class="stat-value"><asp:Label ID="lblVisitedDestinations" runat="server" Text="0"></asp:Label></div>
                <div class="stat-label">Destinations Visited</div>
            </div>
            <div class="stat-card">
                <div class="stat-icon spent"><i class="las la-wallet"></i></div>
                <div class="stat-value">₹<asp:Label ID="lblTotalSpent" runat="server" Text="0"></asp:Label></div>
                <div class="stat-label">Total Spent</div>
            </div>
            <div class="stat-card">
                <div class="stat-icon wishlist"><i class="las la-heart"></i></div>
                <div class="stat-value"><asp:Label ID="lblWishlistCount" runat="server" Text="0"></asp:Label></div>
                <div class="stat-label">Wishlist Items</div>
            </div>
        </div>

        <div class="content-grid">
            <div class="card">
                <h2 class="card-title"><i class="las la-calendar-check"></i>Recent Bookings</h2>
                <asp:Repeater ID="rptRecentBookings" runat="server">
                    <ItemTemplate>
                        <div class="booking-item">
                            <img src='<%# Eval("MainImage") %>' alt="Destination" class="booking-image" />
                            <div class="booking-details">
                                <h3><%# Eval("DestinationName") %></h3>
                                <p><i class="las la-calendar"></i> Travel Date: <%# Convert.ToDateTime(Eval("TravelDate")).ToString("MMM dd, yyyy") %></p>
                                <p><i class="las la-users"></i> <%# Eval("NumberOfAdults") %> Adults, <%# Eval("NumberOfChildren") %> Children</p>
                                <span class='status-badge status-<%# Eval("BookingStatus").ToString().ToLower() %>'><%# Eval("BookingStatus") %></span>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:Panel ID="pnlNoBookings" runat="server" Visible="false">
                    <div style="text-align: center; padding: 40px; color: #6b7280;">
                        <i class="las la-inbox" style="font-size: 64px; color: #c9a877;"></i>
                        <h3>No bookings yet</h3>
                        <p>Start exploring and book your first trip!</p>
                    </div>
                </asp:Panel>
            </div>

            <div>
                <div class="card">
                    <h2 class="card-title"><i class="las la-bolt"></i>Quick Actions</h2>
                    <div class="quick-actions">
                        <a href="Destination.aspx" class="action-btn action-explore">
                            <i class="las la-compass"></i>
                            <span>Explore Destinations</span>
                        </a>
                        <a href="Profile.aspx" class="action-btn action-profile">
                            <i class="las la-user-circle"></i>
                            <span>Edit Profile</span>
                        </a>
                        <a href="MyBookings.aspx" class="action-btn action-explore">
                            <i class="las la-list-ul"></i>
                            <span>View All Bookings</span>
                        </a>
                        <a href="Wishlist.aspx" class="action-btn action-profile">
                            <i class="las la-heart"></i>
                            <span>My Wishlist</span>
                        </a>
                        <a href="Contact.aspx" class="action-btn action-support">
                            <i class="las la-headset"></i>
                            <span>Contact Support</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
