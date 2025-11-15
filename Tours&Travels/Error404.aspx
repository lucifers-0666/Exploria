<%@ Page Title="Page Not Found - Exploria Tours" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Error404.aspx.cs" Inherits="Tours_Travels.Error404" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- AOS animations -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>

    <style>
        .error-container {
            min-height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 60px 24px;
            background: linear-gradient(180deg, #f3f4f6 0%, #f9fafb 40%, #fefcf8 100%);
        }

        .error-content {
            max-width: 900px;
            text-align: center;
        }

        .error-animation {
            margin-bottom: 40px;
            position: relative;
        }

        .error-404 {
            font-size: 180px;
            font-weight: 900;
            color: #1d5e33;
            line-height: 1;
            margin-bottom: 20px;
            text-shadow: 4px 4px 0 rgba(201, 168, 119, 0.25);
            animation: float404 3s ease-in-out infinite;
        }

        @keyframes float404 {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-14px); }
        }

        .error-icon {
            width: 84px;
            height: 84px;
            border-radius: 999px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto;
            background: radial-gradient(circle, #f5e8d8, #c9a877);
            color: #1d5e33;
            font-size: 42px;
            box-shadow: 0 18px 40px rgba(0, 0, 0, 0.12);
            position: relative;
        }

        .error-icon::before {
            content: "";
            position: absolute;
            inset: -8px;
            border-radius: inherit;
            border: 2px dashed rgba(201, 168, 119, 0.5);
        }

        .error-title {
            font-size: 32px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 10px;
        }

        .error-subtitle {
            font-size: 16px;
            color: #6b7280;
            margin-bottom: 36px;
            line-height: 1.7;
        }

        /* Search bar */
        .error-search {
            max-width: 620px;
            margin: 0 auto 40px;
            background: #ffffff;
            border-radius: 999px;
            padding: 6px;
            display: flex;
            gap: 10px;
            box-shadow: 0 18px 45px rgba(15, 23, 42, 0.12);
        }

        .error-search-input {
            flex: 1;
            border: none;
            padding: 14px 20px;
            font-size: 15px;
            border-radius: 999px;
            background: transparent;
        }

        .error-search-input::placeholder {
            color: #9ca3af;
        }

        .error-search-input:focus {
            outline: none;
        }

        .error-search-btn {
            background: linear-gradient(135deg, #1d5e33 0%, #2a7d4a 100%);
            color: #ffffff;
            border: none;
            padding: 13px 32px;
            border-radius: 999px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.25s ease;
            box-shadow: 0 14px 32px rgba(29, 94, 51, 0.5);
        }

        .error-search-btn:hover {
            transform: translateY(-1px);
            box-shadow: 0 18px 40px rgba(29, 94, 51, 0.6);
        }

        /* CTAs */
        .error-actions {
            display: flex;
            gap: 14px;
            justify-content: center;
            flex-wrap: wrap;
            margin-bottom: 52px;
        }

        .action-btn {
            padding: 12px 26px;
            border-radius: 12px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.25s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .action-btn-primary {
            background: linear-gradient(135deg, #c9a877 0%, #d4b889 100%);
            color: #ffffff;
            border: none;
            box-shadow: 0 14px 32px rgba(201, 168, 119, 0.45);
        }

        .action-btn-primary:hover {
            transform: translateY(-1px);
            box-shadow: 0 18px 40px rgba(201, 168, 119, 0.6);
        }

        .action-btn-secondary {
            background: #ffffff;
            color: #1d5e33;
            border: 1px solid #1d5e33;
        }

        .action-btn-secondary:hover {
            background: #1d5e33;
            color: #ffffff;
        }

        /* Popular destinations + helpers */
        .popular-destinations {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 24px 70px;
        }

        .section-header {
            text-align: center;
            margin-bottom: 36px;
        }

        .section-title {
            font-size: 24px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 8px;
        }

        .section-subtitle {
            font-size: 14px;
            color: #6b7280;
        }

        .destinations-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 24px;
        }

        .destination-card {
            background: #ffffff;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 8px 26px rgba(15, 23, 42, 0.12);
            transition: all 0.25s ease;
            text-decoration: none;
            color: inherit;
        }

        .destination-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 14px 40px rgba(15, 23, 42, 0.16);
        }

        .card-image {
            width: 100%;
            height: 190px;
            object-fit: cover;
        }

        .card-content {
            padding: 16px 18px 18px;
        }

        .card-title {
            font-size: 16px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 4px;
        }

        .card-location {
            font-size: 13px;
            color: #6b7280;
            margin-bottom: 8px;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .card-price {
            font-size: 15px;
            font-weight: 700;
            color: #1d5e33;
        }

        .helpful-links {
            background: #ffffff;
            border-radius: 16px;
            padding: 32px 30px;
            max-width: 800px;
            margin: 0 auto 40px;
            box-shadow: 0 10px 32px rgba(15, 23, 42, 0.12);
        }

        .links-title {
            font-size: 20px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 18px;
            text-align: center;
        }

        .links-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(190px, 1fr));
            gap: 14px;
        }

        .quick-link {
            padding: 12px 14px;
            background: #f3f4f6;
            border-radius: 12px;
            text-decoration: none;
            color: #374151;
            transition: all 0.25s ease;
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 14px;
            font-weight: 500;
        }

        .quick-link:hover {
            background: #1d5e33;
            color: #ffffff;
            transform: translateX(3px);
        }

        .quick-link i {
            font-size: 20px;
            color: #c9a877;
        }

        .quick-link:hover i {
            color: #ffffff;
        }

        @media (max-width: 768px) {
            .error-404 {
                font-size: 120px;
            }
            .error-title {
                font-size: 24px;
            }
            .error-subtitle {
                font-size: 14px;
            }
            .error-search {
                flex-direction: column;
                border-radius: 24px;
            }
            .error-search-btn {
                width: 100%;
                justify-content: center;
            }
            .error-actions {
                flex-direction: column;
            }
            .action-btn {
                width: 100%;
                justify-content: center;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="error-container">
        <div class="error-content">
            <div class="error-animation">
                <div class="error-404" data-aos="zoom-in">404</div>
                <!-- Use icon font instead of emoji -->
                <div class="error-icon" data-aos="fade-up" data-aos-delay="200">
                    <i class="las la-plane-departure"></i>
                </div>
            </div>

            <h1 class="error-title" data-aos="fade-up" data-aos-delay="300">
                Oops! Looks Like You're Lost
            </h1>
            <p class="error-subtitle" data-aos="fade-up" data-aos-delay="400">
                The page you're looking for seems to have wandered off on its own adventure.<br />
                Don't worry, we'll help you find your way back!
            </p>

            <div class="error-search" data-aos="fade-up" data-aos-delay="500">
                <asp:TextBox ID="txtSearch" runat="server"
                    CssClass="error-search-input"
                    placeholder="Search for destinations, packages, or locations..."></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server"
                    Text="Search"
                    CssClass="error-search-btn"
                    OnClick="btnSearch_Click" />
            </div>

            <div class="error-actions" data-aos="fade-up" data-aos-delay="600">
                <asp:Button ID="btnGoHome" runat="server"
                    Text="Go to Homepage"
                    CssClass="action-btn action-btn-primary"
                    OnClick="btnGoHome_Click" />
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
                        <i class="las la-home"></i><span>Home</span>
                    </a>
                    <a href="/Destination.aspx" class="quick-link">
                        <i class="las la-map-marked-alt"></i><span>Destinations</span>
                    </a>
                    <a href="/Deals.aspx" class="quick-link">
                        <i class="las la-tags"></i><span>Special Deals</span>
                    </a>
                    <a href="/Gallery.aspx" class="quick-link">
                        <i class="las la-images"></i><span>Gallery</span>
                    </a>
                    <a href="/Testimonials.aspx" class="quick-link">
                        <i class="las la-quote-left"></i><span>Testimonials</span>
                    </a>
                    <a href="/FAQ.aspx" class="quick-link">
                        <i class="las la-question-circle"></i><span>FAQ</span>
                    </a>
                    <a href="/About.aspx" class="quick-link">
                        <i class="las la-info-circle"></i><span>About Us</span>
                    </a>
                    <a href="/Contact.aspx" class="quick-link">
                        <i class="las la-envelope"></i><span>Contact</span>
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
                <a href='<%# "ViewDetails.aspx?id=" + Eval("Id") %>'
                   class="destination-card"
                   data-aos="fade-up" data-aos-delay="100">
                    <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("DestinationName") %>' class="card-image" />
                    <div class="card-content">
                        <h3 class="card-title"><%# Eval("DestinationName") %></h3>
                        <div class="card-location">
                            <i class="las la-map-marker"></i>
                            <span><%# Eval("Location") %></span>
                        </div>
                        <div class="card-price">
                            Starting from ₹<%# Eval("Price", "{0:N0}") %>
                        </div>
                    </div>
                </a>
            </ItemTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            if (window.AOS) {
                AOS.init({ duration: 800, once: true, offset: 60 });
            }
        });
    </script>
</asp:Content>
