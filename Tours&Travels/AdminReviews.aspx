<%@ Page Title="Manage Reviews - Admin" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminReviews.aspx.cs" Inherits="Tours_Travels.AdminReviews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Admin Reviews Styles */
        .admin-header {
            background: linear-gradient(135deg, #1d5e33 0%, #2d7a4a 100%);
            padding: 100px 0 60px;
            color: #ffffff;
        }

        .admin-header-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .admin-title {
            font-size: 42px;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .admin-subtitle {
            font-size: 18px;
            opacity: 0.9;
        }

        .admin-container {
            max-width: 1400px;
            margin: -40px auto 60px;
            padding: 0 20px;
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 24px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: #ffffff;
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            display: flex;
            align-items: center;
            gap: 20px;
            transition: all 0.3s;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
        }

        .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
        }

        .stat-icon.green {
            background: linear-gradient(135deg, #1d5e33, #2d7a4a);
            color: #ffffff;
        }

        .stat-icon.gold {
            background: linear-gradient(135deg, #c9a877, #b89666);
            color: #ffffff;
        }

        .stat-icon.orange {
            background: linear-gradient(135deg, #ea580c, #fb923c);
            color: #ffffff;
        }

        .stat-icon.blue {
            background: linear-gradient(135deg, #1e40af, #3b82f6);
            color: #ffffff;
        }

        .stat-info h3 {
            font-size: 32px;
            font-weight: 700;
            color: #1d5e33;
            margin-bottom: 5px;
        }

        .stat-info p {
            font-size: 14px;
            color: #6b7280;
            margin: 0;
        }

        .filter-bar {
            background: #ffffff;
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            margin-bottom: 30px;
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            align-items: center;
        }

        .filter-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
            flex: 1;
            min-width: 200px;
        }

        .filter-label {
            font-size: 14px;
            font-weight: 600;
            color: #1d5e33;
        }

        .filter-control {
            padding: 12px 16px;
            border: 2px solid #e5e7eb;
            border-radius: 10px;
            font-size: 15px;
            transition: all 0.3s;
        }

        .filter-control:focus {
            outline: none;
            border-color: #1d5e33;
        }

        .btn-primary {
            padding: 12px 28px;
            background: #1d5e33;
            border: none;
            border-radius: 10px;
            color: #ffffff;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            align-self: flex-end;
        }

        .btn-primary:hover {
            background: #2d7a4a;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(29, 94, 51, 0.3);
        }

        .reviews-container {
            background: #ffffff;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            overflow: hidden;
        }

        .container-header {
            padding: 25px 30px;
            border-bottom: 2px solid #f3f4f6;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .container-header h2 {
            font-size: 24px;
            font-weight: 700;
            color: #1d5e33;
            margin: 0;
        }

        .bulk-actions {
            display: flex;
            gap: 12px;
        }

        .btn-success {
            padding: 10px 20px;
            background: #10b981;
            border: none;
            border-radius: 8px;
            color: #ffffff;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-success:hover {
            background: #059669;
        }

        .btn-danger {
            padding: 10px 20px;
            background: #ef4444;
            border: none;
            border-radius: 8px;
            color: #ffffff;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-danger:hover {
            background: #dc2626;
        }

        .reviews-table {
            width: 100%;
            border-collapse: collapse;
        }

        .reviews-table thead {
            background: #f8f9fa;
        }

        .reviews-table th {
            padding: 18px 20px;
            text-align: left;
            font-size: 14px;
            font-weight: 600;
            color: #1d5e33;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .reviews-table td {
            padding: 20px;
            border-bottom: 1px solid #f3f4f6;
            font-size: 15px;
            color: #374151;
            vertical-align: top;
        }

        .reviews-table tr:hover {
            background: #f8f9fa;
        }

        .reviewer-info {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .reviewer-avatar {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            object-fit: cover;
        }

        .reviewer-details h4 {
            font-size: 15px;
            font-weight: 600;
            color: #1d5e33;
            margin-bottom: 3px;
        }

        .reviewer-details p {
            font-size: 13px;
            color: #6b7280;
            margin: 0;
        }

        .star-rating {
            display: flex;
            gap: 3px;
            font-size: 18px;
        }

        .star-filled {
            color: #fbbf24;
        }

        .star-empty {
            color: #e5e7eb;
        }

        .review-text {
            max-width: 400px;
            line-height: 1.6;
            color: #374151;
        }

        .status-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 6px 14px;
            border-radius: 50px;
            font-size: 13px;
            font-weight: 600;
        }

        .status-approved {
            background: #d1fae5;
            color: #065f46;
        }

        .status-pending {
            background: #fef3c7;
            color: #92400e;
        }

        .status-rejected {
            background: #fee2e2;
            color: #991b1b;
        }

        .verified-badge {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            padding: 4px 10px;
            background: #dbeafe;
            color: #1e40af;
            border-radius: 50px;
            font-size: 12px;
            font-weight: 600;
        }

        .action-buttons {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
        }

        .btn-action {
            padding: 8px 16px;
            border: none;
            border-radius: 8px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .btn-approve {
            background: #d1fae5;
            color: #065f46;
        }

        .btn-approve:hover {
            background: #065f46;
            color: #ffffff;
        }

        .btn-reject {
            background: #fee2e2;
            color: #991b1b;
        }

        .btn-reject:hover {
            background: #991b1b;
            color: #ffffff;
        }

        .btn-delete {
            background: #f3f4f6;
            color: #6b7280;
        }

        .btn-delete:hover {
            background: #374151;
            color: #ffffff;
        }

        .btn-view {
            background: #dbeafe;
            color: #1e40af;
        }

        .btn-view:hover {
            background: #1e40af;
            color: #ffffff;
        }

        @media (max-width: 1024px) {
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .filter-bar {
                flex-direction: column;
            }

            .filter-group {
                width: 100%;
            }
        }

        @media (max-width: 768px) {
            .admin-title {
                font-size: 32px;
            }

            .stats-grid {
                grid-template-columns: 1fr;
            }

            .reviews-table {
                font-size: 13px;
            }

            .reviews-table th,
            .reviews-table td {
                padding: 12px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Admin Header -->
    <section class="admin-header">
        <div class="admin-header-content">
            <h1 class="admin-title">
                <i class="las la-star"></i> Review Moderation
            </h1>
            <p class="admin-subtitle">Manage and moderate customer reviews for destinations</p>
        </div>
    </section>

    <!-- Admin Container -->
    <div class="admin-container">
        <!-- Statistics -->
        <div class="stats-grid">
            <div class="stat-card" data-aos="fade-up">
                <div class="stat-icon green">
                    <i class="las la-comments"></i>
                </div>
                <div class="stat-info">
                    <h3><asp:Literal ID="litTotalReviews" runat="server">0</asp:Literal></h3>
                    <p>Total Reviews</p>
                </div>
            </div>
            <div class="stat-card" data-aos="fade-up" data-aos-delay="100">
                <div class="stat-icon gold">
                    <i class="las la-check-circle"></i>
                </div>
                <div class="stat-info">
                    <h3><asp:Literal ID="litApprovedReviews" runat="server">0</asp:Literal></h3>
                    <p>Approved Reviews</p>
                </div>
            </div>
            <div class="stat-card" data-aos="fade-up" data-aos-delay="200">
                <div class="stat-icon orange">
                    <i class="las la-clock"></i>
                </div>
                <div class="stat-info">
                    <h3><asp:Literal ID="litPendingReviews" runat="server">0</asp:Literal></h3>
                    <p>Pending Reviews</p>
                </div>
            </div>
            <div class="stat-card" data-aos="fade-up" data-aos-delay="300">
                <div class="stat-icon blue">
                    <i class="las la-star"></i>
                </div>
                <div class="stat-info">
                    <h3><asp:Literal ID="litAvgRating" runat="server">0.0</asp:Literal></h3>
                    <p>Average Rating</p>
                </div>
            </div>
        </div>

        <!-- Filter Bar -->
        <div class="filter-bar" data-aos="fade-up">
            <div class="filter-group">
                <label class="filter-label">Filter by Rating</label>
                <asp:DropDownList ID="ddlRatingFilter" runat="server" CssClass="filter-control">
                    <asp:ListItem Value="">All Ratings</asp:ListItem>
                    <asp:ListItem Value="5">⭐⭐⭐⭐⭐ 5 Stars</asp:ListItem>
                    <asp:ListItem Value="4">⭐⭐⭐⭐ 4 Stars</asp:ListItem>
                    <asp:ListItem Value="3">⭐⭐⭐ 3 Stars</asp:ListItem>
                    <asp:ListItem Value="2">⭐⭐ 2 Stars</asp:ListItem>
                    <asp:ListItem Value="1">⭐ 1 Star</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="filter-group">
                <label class="filter-label">Filter by Status</label>
                <asp:DropDownList ID="ddlStatusFilter" runat="server" CssClass="filter-control">
                    <asp:ListItem Value="">All Status</asp:ListItem>
                    <asp:ListItem Value="1">Approved</asp:ListItem>
                    <asp:ListItem Value="0">Pending</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="filter-group">
                <label class="filter-label">Filter by Destination</label>
                <asp:DropDownList ID="ddlDestinationFilter" runat="server" CssClass="filter-control">
                </asp:DropDownList>
            </div>
            <asp:Button ID="btnApplyFilters" runat="server" Text="🔍 Apply Filters" CssClass="btn-primary" OnClick="btnApplyFilters_Click" />
        </div>

        <!-- Reviews Table -->
        <div class="reviews-container" data-aos="fade-up">
            <div class="container-header">
                <h2>Customer Reviews</h2>
            </div>

            <asp:GridView ID="gvReviews" runat="server" CssClass="reviews-table" AutoGenerateColumns="False" 
                          OnRowCommand="gvReviews_RowCommand" DataKeyNames="Id">
                <Columns>
                    <asp:TemplateField HeaderText="Customer">
                        <ItemTemplate>
                            <div class="reviewer-info">
                                <img src="https://ui-avatars.com/api/?name=<%# Eval("CustomerName") %>&size=45&background=1d5e33&color=fff" 
                                     alt="Avatar" class="reviewer-avatar">
                                <div class="reviewer-details">
                                    <h4><%# Eval("CustomerName") %></h4>
                                    <p><%# Eval("CustomerEmail") %></p>
                                    <%# Convert.ToBoolean(Eval("IsVerified")) ? "<span class='verified-badge'><i class='las la-check-circle'></i> Verified</span>" : "" %>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Destination">
                        <ItemTemplate>
                            <strong><%# Eval("DestinationName") %></strong>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Rating">
                        <ItemTemplate>
                            <div class="star-rating">
                                <%# GetStarRating(Convert.ToInt32(Eval("Rating"))) %>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Review">
                        <ItemTemplate>
                            <div class="review-text">
                                <%# Eval("ReviewText") %>
                            </div>
                            <p style="font-size: 12px; color: #9ca3af; margin-top: 8px;">
                                <i class="las la-calendar"></i> <%# Eval("ReviewDate", "{0:MMM dd, yyyy}") %>
                            </p>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <span class='<%# Convert.ToBoolean(Eval("IsApproved")) ? "status-badge status-approved" : "status-badge status-pending" %>'>
                                <%# Convert.ToBoolean(Eval("IsApproved")) ? "✓ Approved" : "⏳ Pending" %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <div class="action-buttons">
                                <asp:Button ID="btnApprove" runat="server" Text="✓ Approve" CssClass="btn-action btn-approve" 
                                           CommandName="ApproveReview" CommandArgument='<%# Eval("Id") %>' 
                                           Visible='<%# !Convert.ToBoolean(Eval("IsApproved")) %>' />
                                <asp:Button ID="btnReject" runat="server" Text="✕ Reject" CssClass="btn-action btn-reject" 
                                           CommandName="RejectReview" CommandArgument='<%# Eval("Id") %>' 
                                           Visible='<%# Convert.ToBoolean(Eval("IsApproved")) %>' />
                                <asp:Button ID="btnDelete" runat="server" Text="🗑️ Delete" CssClass="btn-action btn-delete" 
                                           CommandName="DeleteReview" CommandArgument='<%# Eval("Id") %>' 
                                           OnClientClick="return confirm('Are you sure you want to delete this review?');" />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
