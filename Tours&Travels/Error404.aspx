<%@ Page Title="Page Not Found - Exploria Tours" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Error404.aspx.cs" Inherits="Tours_Travels.Error404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .error-container {
            min-height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 60px 24px;
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
        }

        .error-content {
            max-width: 800px;
            text-align: center;
        }

        .error-animation {
            margin-bottom: 48px;
            position: relative;
        }

        .error-404 {
            font-size: 180px;
            font-weight: 900;
            color: #1d5e33;
            line-height: 1;
            margin-bottom: 24px;
            text-shadow: 4px 4px 0 rgba(201, 168, 119, 0.3);
            animation: float 3s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-20px); }
        }

        .error-icon {
            font-size: 120px;
            color: #c9a877;
            animation: rotate 4s linear infinite;
        }

        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .error-title {
            font-size: 48px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 16px;
        }

        .error-subtitle {
            font-size: 20px;
            color: #6b7280;
            margin-bottom: 48px;
            line-height: 1.6;
        }

        .error-search {
            max-width: 600px;
            margin: 0 auto 48px;
            background: white;
            border-radius: 60px;
            padding: 8px;
            display: flex;
            gap: 12px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.1);
        }

        .error-search-input {
            flex: 1;
            border: none;
            padding: 16px 24px;
            font-size: 16px;
            border-radius: 50px;
            background: transparent;
        }

        .error-search-input:focus {
            outline: none;
        }

        .error-search-btn {
            background: linear-gradient(135deg, #1d5e33 0%, #2d7a4a 100%);
            color: white;
            border: none;
            padding: 16px 40px;
            border-radius: 50px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 300ms ease;
        }

        .error-search-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(29, 94, 51, 0.4);
        }

        .error-actions {
            display: flex;
            gap: 16px;
            justify-content: center;
            flex-wrap: wrap;
            margin-bottom: 64px;
        }

        .action-btn {
            padding: 16px 32px;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 300ms ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .action-btn-primary {
            background: linear-gradient(135deg, #c9a877 0%, #d4b889 100%);
            color: white;
            border: none;
        }

        .action-btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(201, 168, 119, 0.4);
        }

        .action-btn-secondary {
            background: white;
            color: #1d5e33;
            border: 2px solid #1d5e33;
        }

        .action-btn-secondary:hover {
            background: #1d5e33;
            color: white;
        }

        .popular-destinations {
            max-width: 1200px;
            margin: 0 auto;
            padding: 60px 24px;
        }

        .section-header {
            text-align: center;
            margin-bottom: 48px;
        }

        .section-title {
            font-size: 36px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 12px;
        }

        .section-subtitle {
            font-size: 18px;
            color: #6b7280;
        }

        .destinations-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 32px;
        }

        .destination-card {
            background: white;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            transition: all 300ms ease;
            text-decoration: none;
            color: inherit;
        }

        .destination-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 40px rgba(0,0,0,0.15);
        }

        .card-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .card-content {
            padding: 20px;
        }

        .card-title {
            font-size: 20px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 8px;
        }

        .card-location {
            font-size: 14px;
            color: #6b7280;
            margin-bottom: 12px;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .card-price {
            font-size: 18px;
            font-weight: 700;
            color: #1d5e33;
        }

        .helpful-links {
            background: white;
            border-radius: 16px;
            padding: 40px;
            max-width: 800px;
            margin: 0 auto;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
        }

        .links-title {
            font-size: 24px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 24px;
            text-align: center;
        }

        .links-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 16px;
        }

        .quick-link {
            padding: 16px;
            background: #f8f9fa;
            border-radius: 12px;
            text-decoration: none;
            color: #374151;
            transition: all 300ms ease;
            display: flex;
            align-items: center;
            gap: 12px;
            font-weight: 500;
        }

        .quick-link:hover {
            background: #1d5e33;
            color: white;
            transform: translateX(4px);
        }

        .quick-link i {
            font-size: 24px;
            color: #c9a877;
        }

        .quick-link:hover i {
            color: white;
        }

        @media (max-width: 768px) {
            .error-404 {
                font-size: 100px;
            }

            .error-title {
                font-size: 32px;
            }

            .error-subtitle {
                font-size: 16px;
            }

            .error-actions {
                flex-direction: column;
            }

            .action-btn {
                width: 100%;
                justify-content: center;
            }

            .destinations-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="error-container">
        <div class="error-content">
            <div class="error-animation">
                <div class="error-404" data-aos="zoom-in">404</div>
                <div class="error-icon" data-aos="fade-up" data-aos-delay="200">✈️</div>
            </div>

            <h1 class="error-title" data-aos="fade-up" data-aos-delay="300">
                Oops! Looks Like You're Lost
            </h1>
            <p class="error-subtitle" data-aos="fade-up" data-aos-delay="400">
                The page you're looking for seems to have wandered off on its own adventure.<br />
                Don't worry, we'll help you find your way back!
            </p>

            <div class="error-search" data-aos="fade-up" data-aos-delay="500">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="error-search-input" placeholder="Search for destinations, packages, or locations..."></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="error-search-btn" OnClick="btnSearch_Click" />
            </div>

            <div class="error-actions" data-aos="fade-up" data-aos-delay="600">
                <asp:Button ID="btnGoHome" runat="server" Text="Go to Homepage" CssClass="action-btn action-btn-primary" OnClick="btnGoHome_Click" />
                <a href="/Destination.aspx" class="action-btn action-btn-secondary">
                    <i class="las la-map-marked-alt"></i>
                    Browse Destinations
                </a>
                <a href="/Contact.aspx" class="action-btn action-btn-secondary">
                    <i class="las la-envelope"></i>
                    Contact Support
                </a>
            </div>

            <div class="helpful-links" data-aos="fade-up" data-aos-delay="700">
                <h3 class="links-title">Quick Links</h3>
                <div class="links-grid">
                    <a href="/Home.aspx" class="quick-link">
                        <i class="las la-home"></i>
                        <span>Home</span>
                    </a>
                    <a href="/Destination.aspx" class="quick-link">
                        <i class="las la-map-marked-alt"></i>
                        <span>Destinations</span>
                    </a>
                    <a href="/Deals.aspx" class="quick-link">
                        <i class="las la-tags"></i>
                        <span>Special Deals</span>
                    </a>
                    <a href="/Gallery.aspx" class="quick-link">
                        <i class="las la-images"></i>
                        <span>Gallery</span>
                    </a>
                    <a href="/Testimonials.aspx" class="quick-link">
                        <i class="las la-quote-left"></i>
                        <span>Testimonials</span>
                    </a>
                    <a href="/FAQ.aspx" class="quick-link">
                        <i class="las la-question-circle"></i>
                        <span>FAQ</span>
                    </a>
                    <a href="/About.aspx" class="quick-link">
                        <i class="las la-info-circle"></i>
                        <span>About Us</span>
                    </a>
                    <a href="/Contact.aspx" class="quick-link">
                        <i class="las la-envelope"></i>
                        <span>Contact</span>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Popular Destinations -->
    <div class="popular-destinations">
        <div class="section-header" data-aos="fade-up">
            <h2 class="section-title">Popular Destinations</h2>
            <p class="section-subtitle">Explore our most loved travel destinations</p>
        </div>

        <asp:Repeater ID="rptPopularDestinations" runat="server">
            <HeaderTemplate>
                <div class="destinations-grid">
            </HeaderTemplate>
            <ItemTemplate>
                <a href='<%# "ViewDetails.aspx?id=" + Eval("Id") %>' class="destination-card" data-aos="fade-up">
                    <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("DestinationName") %>' class="card-image" />
                    <div class="card-content">
                        <h3 class="card-title"><%# Eval("DestinationName") %></h3>
                        <div class="card-location">
                            <i class="las la-map-marker"></i>
                            <span><%# Eval("Location") %></span>
                        </div>
                        <div class="card-price">Starting from ₹<%# Eval("Price", "{0:N0}") %></div>
                    </div>
                </a>
            </ItemTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
