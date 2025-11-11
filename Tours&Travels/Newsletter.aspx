<%@ Page Title="Newsletter - Exploria" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Newsletter.aspx.cs" Inherits="Tours_Travels.Newsletter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Newsletter Management Styles */
        .newsletter-hero {
            background: linear-gradient(135deg, #1d5e33 0%, #2d7a4a 100%);
            padding: 120px 0 80px;
            position: relative;
            overflow: hidden;
        }

        .newsletter-hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="rgba(255,255,255,0.05)" d="M0,96L48,112C96,128,192,160,288,160C384,160,480,128,576,128C672,128,768,160,864,165.3C960,171,1056,149,1152,128C1248,107,1344,85,1392,74.7L1440,64L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>') no-repeat bottom;
            background-size: cover;
        }

        .hero-content {
            max-width: 800px;
            margin: 0 auto;
            text-align: center;
            position: relative;
            z-index: 2;
        }

        .newsletter-icon {
            font-size: 80px;
            color: #c9a877;
            margin-bottom: 20px;
            animation: pulse 2s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.1); }
        }

        .hero-title {
            font-size: 52px;
            font-weight: 700;
            color: #ffffff;
            margin-bottom: 20px;
            line-height: 1.2;
        }

        .hero-subtitle {
            font-size: 20px;
            color: rgba(255, 255, 255, 0.9);
            line-height: 1.6;
        }

        .newsletter-container {
            max-width: 900px;
            margin: -40px auto 80px;
            padding: 0 20px;
        }

        .action-card {
            background: #ffffff;
            border-radius: 16px;
            padding: 40px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            margin-bottom: 30px;
        }

        .card-header {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 3px solid #c9a877;
        }

        .card-icon {
            width: 60px;
            height: 60px;
            background: linear-gradient(135deg, #1d5e33, #2d7a4a);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 30px;
            color: #ffffff;
        }

        .card-title {
            font-size: 28px;
            font-weight: 700;
            color: #1d5e33;
            margin-bottom: 5px;
        }

        .card-subtitle {
            font-size: 14px;
            color: #6b7280;
            margin: 0;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-group label {
            display: block;
            font-size: 15px;
            font-weight: 600;
            color: #1d5e33;
            margin-bottom: 10px;
        }

        .form-control {
            width: 100%;
            padding: 14px 18px;
            border: 2px solid #e5e7eb;
            border-radius: 10px;
            font-size: 16px;
            transition: all 0.3s;
            font-family: 'Inter', sans-serif;
        }

        .form-control:focus {
            outline: none;
            border-color: #1d5e33;
            box-shadow: 0 0 0 3px rgba(29, 94, 51, 0.1);
        }

        .btn-primary {
            padding: 14px 32px;
            background: #1d5e33;
            border: none;
            border-radius: 10px;
            color: #ffffff;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }

        .btn-primary:hover {
            background: #2d7a4a;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(29, 94, 51, 0.3);
        }

        .btn-danger {
            padding: 14px 32px;
            background: #ef4444;
            border: none;
            border-radius: 10px;
            color: #ffffff;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 10px;
        }

        .btn-danger:hover {
            background: #dc2626;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(239, 68, 68, 0.3);
        }

        .alert {
            padding: 16px 20px;
            border-radius: 10px;
            margin-bottom: 25px;
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 15px;
            font-weight: 500;
        }

        .alert-success {
            background: #d1fae5;
            color: #065f46;
            border-left: 4px solid #10b981;
        }

        .alert-info {
            background: #dbeafe;
            color: #1e40af;
            border-left: 4px solid #3b82f6;
        }

        .alert-warning {
            background: #fef3c7;
            color: #92400e;
            border-left: 4px solid #f59e0b;
        }

        .alert-error {
            background: #fee2e2;
            color: #991b1b;
            border-left: 4px solid #ef4444;
        }

        .subscription-info {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 25px;
            margin-bottom: 25px;
        }

        .info-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 12px 0;
            border-bottom: 1px solid #e5e7eb;
        }

        .info-row:last-child {
            border-bottom: none;
        }

        .info-label {
            font-size: 14px;
            font-weight: 600;
            color: #6b7280;
        }

        .info-value {
            font-size: 15px;
            font-weight: 600;
            color: #1d5e33;
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

        .status-active {
            background: #d1fae5;
            color: #065f46;
        }

        .status-inactive {
            background: #fee2e2;
            color: #991b1b;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-top: 30px;
        }

        .feature-item {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 20px;
            background: #f8f9fa;
            border-radius: 10px;
        }

        .feature-icon {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, #c9a877, #b89666);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            color: #ffffff;
        }

        .feature-text {
            font-size: 14px;
            font-weight: 600;
            color: #374151;
        }

        @media (max-width: 768px) {
            .hero-title {
                font-size: 36px;
            }

            .newsletter-icon {
                font-size: 60px;
            }

            .action-card {
                padding: 25px;
            }

            .features-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hero Section -->
    <section class="newsletter-hero">
        <div class="hero-content">
            <div class="newsletter-icon">
                <i class="las la-envelope-open-text"></i>
            </div>
            <h1 class="hero-title">Newsletter Preferences</h1>
            <p class="hero-subtitle">Manage your email subscription and stay updated with travel stories</p>
        </div>
    </section>

    <!-- Newsletter Container -->
    <div class="newsletter-container">
        <!-- Subscribe Section -->
        <asp:Panel ID="pnlSubscribe" runat="server" Visible="true">
            <div class="action-card" data-aos="fade-up">
                <div class="card-header">
                    <div class="card-icon">
                        <i class="las la-bell"></i>
                    </div>
                    <div>
                        <h2 class="card-title">Subscribe to Newsletter</h2>
                        <p class="card-subtitle">Get the latest travel tips, deals, and stories</p>
                    </div>
                </div>

                <asp:Panel ID="pnlSubscribeMessage" runat="server" Visible="false"></asp:Panel>

                <div class="form-group">
                    <label>Your Email Address</label>
                    <asp:TextBox ID="txtSubscribeEmail" runat="server" TextMode="Email" CssClass="form-control" 
                                placeholder="enter@example.com"></asp:TextBox>
                </div>

                <asp:Button ID="btnSubscribe" runat="server" Text="📬 Subscribe Now" CssClass="btn-primary" OnClick="btnSubscribe_Click" />

                <!-- Features -->
                <div class="features-grid">
                    <div class="feature-item">
                        <div class="feature-icon">
                            <i class="las la-paper-plane"></i>
                        </div>
                        <span class="feature-text">Weekly Updates</span>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">
                            <i class="las la-tags"></i>
                        </div>
                        <span class="feature-text">Exclusive Deals</span>
                    </div>
                    <div class="feature-item">
                        <div class="feature-icon">
                            <i class="las la-book-open"></i>
                        </div>
                        <span class="feature-text">Travel Guides</span>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <!-- Manage Subscription Section -->
        <asp:Panel ID="pnlManage" runat="server" Visible="false">
            <div class="action-card" data-aos="fade-up">
                <div class="card-header">
                    <div class="card-icon">
                        <i class="las la-cog"></i>
                    </div>
                    <div>
                        <h2 class="card-title">Manage Subscription</h2>
                        <p class="card-subtitle">Update or cancel your newsletter subscription</p>
                    </div>
                </div>

                <asp:Panel ID="pnlManageMessage" runat="server" Visible="false"></asp:Panel>

                <!-- Subscription Info -->
                <div class="subscription-info">
                    <div class="info-row">
                        <span class="info-label">Email Address</span>
                        <span class="info-value">
                            <asp:Literal ID="litEmail" runat="server"></asp:Literal>
                        </span>
                    </div>
                    <div class="info-row">
                        <span class="info-label">Subscribed Date</span>
                        <span class="info-value">
                            <asp:Literal ID="litSubscribedDate" runat="server"></asp:Literal>
                        </span>
                    </div>
                    <div class="info-row">
                        <span class="info-label">Status</span>
                        <span class="info-value">
                            <asp:Literal ID="litStatus" runat="server"></asp:Literal>
                        </span>
                    </div>
                </div>

                <div style="display: flex; gap: 15px;">
                    <asp:Button ID="btnUnsubscribe" runat="server" Text="🔕 Unsubscribe" CssClass="btn-danger" 
                               OnClick="btnUnsubscribe_Click" OnClientClick="return confirm('Are you sure you want to unsubscribe from our newsletter?');" />
                    <asp:Button ID="btnResubscribe" runat="server" Text="🔔 Resubscribe" CssClass="btn-primary" 
                               OnClick="btnResubscribe_Click" Visible="false" />
                </div>
            </div>
        </asp:Panel>

        <!-- Check Status Section -->
        <div class="action-card" data-aos="fade-up" data-aos-delay="100">
            <div class="card-header">
                <div class="card-icon">
                    <i class="las la-search"></i>
                </div>
                <div>
                    <h2 class="card-title">Check Subscription Status</h2>
                    <p class="card-subtitle">Enter your email to view your subscription details</p>
                </div>
            </div>

            <asp:Panel ID="pnlCheckMessage" runat="server" Visible="false"></asp:Panel>

            <div class="form-group">
                <label>Your Email Address</label>
                <asp:TextBox ID="txtCheckEmail" runat="server" TextMode="Email" CssClass="form-control" 
                            placeholder="enter@example.com"></asp:TextBox>
            </div>

            <asp:Button ID="btnCheckStatus" runat="server" Text="🔍 Check Status" CssClass="btn-primary" OnClick="btnCheckStatus_Click" />
        </div>
    </div>
</asp:Content>
