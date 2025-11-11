<%@ Page Title="Sitemap - Exploria" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Sitemap.aspx.cs" Inherits="Tours_Travels.Sitemap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Sitemap Styles */
        .sitemap-hero {
            background: linear-gradient(135deg, #1d5e33 0%, #2d7a4a 100%);
            padding: 120px 0 80px;
            position: relative;
            overflow: hidden;
        }

        .sitemap-hero::before {
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

        .sitemap-icon {
            font-size: 80px;
            color: #c9a877;
            margin-bottom: 20px;
            animation: float 3s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-15px); }
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

        .sitemap-container {
            max-width: 1400px;
            margin: -40px auto 80px;
            padding: 0 20px;
        }

        .sitemap-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 30px;
        }

        .sitemap-category {
            background: #ffffff;
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            transition: all 0.3s;
        }

        .sitemap-category:hover {
            transform: translateY(-8px);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
        }

        .category-header {
            display: flex;
            align-items: center;
            gap: 15px;
            margin-bottom: 25px;
            padding-bottom: 20px;
            border-bottom: 3px solid #c9a877;
        }

        .category-icon {
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

        .category-info h2 {
            font-size: 24px;
            font-weight: 700;
            color: #1d5e33;
            margin-bottom: 5px;
        }

        .category-info p {
            font-size: 13px;
            color: #6b7280;
            margin: 0;
        }

        .page-list {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .page-link {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 14px 18px;
            background: #f8f9fa;
            border-radius: 10px;
            text-decoration: none;
            color: #374151;
            font-size: 15px;
            font-weight: 500;
            transition: all 0.3s;
        }

        .page-link:hover {
            background: #1d5e33;
            color: #ffffff;
            transform: translateX(8px);
        }

        .page-link i {
            font-size: 20px;
            color: #c9a877;
        }

        .page-link:hover i {
            color: #ffffff;
        }

        .page-badge {
            margin-left: auto;
            padding: 4px 10px;
            background: #c9a877;
            color: #ffffff;
            border-radius: 50px;
            font-size: 11px;
            font-weight: 600;
        }

        .page-link:hover .page-badge {
            background: #ffffff;
            color: #1d5e33;
        }

        .quick-search {
            max-width: 600px;
            margin: 0 auto 50px;
            padding: 30px;
            background: #ffffff;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        }

        .search-box {
            display: flex;
            gap: 12px;
        }

        .search-input {
            flex: 1;
            padding: 14px 20px;
            border: 2px solid #e5e7eb;
            border-radius: 10px;
            font-size: 16px;
            transition: all 0.3s;
        }

        .search-input:focus {
            outline: none;
            border-color: #1d5e33;
        }

        .search-btn {
            padding: 14px 28px;
            background: #1d5e33;
            border: none;
            border-radius: 10px;
            color: #ffffff;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .search-btn:hover {
            background: #2d7a4a;
            transform: translateY(-2px);
        }

        @media (max-width: 768px) {
            .hero-title {
                font-size: 36px;
            }

            .sitemap-icon {
                font-size: 60px;
            }

            .sitemap-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hero Section -->
    <section class="sitemap-hero">
        <div class="hero-content">
            <div class="sitemap-icon">
                <i class="las la-sitemap"></i>
            </div>
            <h1 class="hero-title">Explore Our Sitemap</h1>
            <p class="hero-subtitle">Find all pages and features available on Exploria Tours & Travels</p>
        </div>
    </section>

    <!-- Sitemap Container -->
    <div class="sitemap-container">
        <!-- Quick Search -->
        <div class="quick-search" data-aos="fade-up">
            <div class="search-box">
                <input type="text" class="search-input" id="sitemapSearch" placeholder="Search for a page..." onkeyup="filterPages()">
                <button class="search-btn">
                    <i class="las la-search"></i>
                    Search
                </button>
            </div>
        </div>

        <!-- Sitemap Grid -->
        <div class="sitemap-grid">
            <!-- Main Pages -->
            <div class="sitemap-category" data-aos="fade-up">
                <div class="category-header">
                    <div class="category-icon">
                        <i class="las la-home"></i>
                    </div>
                    <div class="category-info">
                        <h2>Main Pages</h2>
                        <p>Core pages of the website</p>
                    </div>
                </div>
                <div class="page-list">
                    <a href="Home.aspx" class="page-link">
                        <i class="las la-home"></i>
                        <span>Home</span>
                        <span class="page-badge">Main</span>
                    </a>
                    <a href="Destination.aspx" class="page-link">
                        <i class="las la-map-marked-alt"></i>
                        <span>Destinations</span>
                    </a>
                    <a href="ViewDetails.aspx" class="page-link">
                        <i class="las la-info-circle"></i>
                        <span>Destination Details</span>
                    </a>
                    <a href="SearchResults.aspx" class="page-link">
                        <i class="las la-search"></i>
                        <span>Search Results</span>
                        <span class="page-badge">New</span>
                    </a>
                    <a href="Deals.aspx" class="page-link">
                        <i class="las la-tags"></i>
                        <span>Special Deals</span>
                    </a>
                </div>
            </div>

            <!-- User Account -->
            <div class="sitemap-category" data-aos="fade-up" data-aos-delay="100">
                <div class="category-header">
                    <div class="category-icon">
                        <i class="las la-user"></i>
                    </div>
                    <div class="category-info">
                        <h2>User Account</h2>
                        <p>Authentication & profile</p>
                    </div>
                </div>
                <div class="page-list">
                    <a href="Login.aspx" class="page-link">
                        <i class="las la-sign-in-alt"></i>
                        <span>Login</span>
                    </a>
                    <a href="Register.aspx" class="page-link">
                        <i class="las la-user-plus"></i>
                        <span>Register</span>
                    </a>
                    <a href="ForgetPassword.aspx" class="page-link">
                        <i class="las la-key"></i>
                        <span>Forgot Password</span>
                    </a>
                    <a href="EmailVerification.aspx" class="page-link">
                        <i class="las la-envelope-open-text"></i>
                        <span>Email Verification</span>
                        <span class="page-badge">New</span>
                    </a>
                    <a href="Profile.aspx" class="page-link">
                        <i class="las la-user-circle"></i>
                        <span>My Profile</span>
                    </a>
                </div>
            </div>

            <!-- Bookings & Orders -->
            <div class="sitemap-category" data-aos="fade-up" data-aos-delay="200">
                <div class="category-header">
                    <div class="category-icon">
                        <i class="las la-calendar-check"></i>
                    </div>
                    <div class="category-info">
                        <h2>Bookings</h2>
                        <p>Manage your trips</p>
                    </div>
                </div>
                <div class="page-list">
                    <a href="MyBookings.aspx" class="page-link">
                        <i class="las la-list-alt"></i>
                        <span>My Bookings</span>
                    </a>
                    <a href="bookingConfirmation.aspx" class="page-link">
                        <i class="las la-check-circle"></i>
                        <span>Booking Confirmation</span>
                    </a>
                    <a href="Payment.aspx" class="page-link">
                        <i class="las la-credit-card"></i>
                        <span>Payment</span>
                    </a>
                    <a href="Wishlist.aspx" class="page-link">
                        <i class="las la-heart"></i>
                        <span>My Wishlist</span>
                    </a>
                    <a href="Dashboard.aspx" class="page-link">
                        <i class="las la-chart-line"></i>
                        <span>User Dashboard</span>
                    </a>
                </div>
            </div>

            <!-- Content & Community -->
            <div class="sitemap-category" data-aos="fade-up" data-aos-delay="300">
                <div class="category-header">
                    <div class="category-icon">
                        <i class="las la-book-open"></i>
                    </div>
                    <div class="category-info">
                        <h2>Content & Community</h2>
                        <p>Blog, reviews & more</p>
                    </div>
                </div>
                <div class="page-list">
                    <a href="Blog.aspx" class="page-link">
                        <i class="las la-book-open"></i>
                        <span>Travel Blog</span>
                        <span class="page-badge">New</span>
                    </a>
                    <a href="BlogDetails.aspx" class="page-link">
                        <i class="las la-file-alt"></i>
                        <span>Blog Article</span>
                        <span class="page-badge">New</span>
                    </a>
                    <a href="Reviews.aspx" class="page-link">
                        <i class="las la-star"></i>
                        <span>Customer Reviews</span>
                        <span class="page-badge">New</span>
                    </a>
                    <a href="Testimonials.aspx" class="page-link">
                        <i class="las la-quote-right"></i>
                        <span>Testimonials</span>
                    </a>
                    <a href="Gallery.aspx" class="page-link">
                        <i class="las la-images"></i>
                        <span>Photo Gallery</span>
                    </a>
                </div>
            </div>

            <!-- Information -->
            <div class="sitemap-category" data-aos="fade-up" data-aos-delay="400">
                <div class="category-header">
                    <div class="category-icon">
                        <i class="las la-info-circle"></i>
                    </div>
                    <div class="category-info">
                        <h2>Information</h2>
                        <p>About us & help</p>
                    </div>
                </div>
                <div class="page-list">
                    <a href="About.aspx" class="page-link">
                        <i class="las la-building"></i>
                        <span>About Us</span>
                    </a>
                    <a href="Contact.aspx" class="page-link">
                        <i class="las la-envelope"></i>
                        <span>Contact Us</span>
                    </a>
                    <a href="FAQ.aspx" class="page-link">
                        <i class="las la-question-circle"></i>
                        <span>FAQ</span>
                    </a>
                    <a href="Terms.aspx" class="page-link">
                        <i class="las la-file-contract"></i>
                        <span>Terms & Conditions</span>
                    </a>
                    <a href="Privacy.aspx" class="page-link">
                        <i class="las la-shield-alt"></i>
                        <span>Privacy Policy</span>
                    </a>
                    <a href="Sitemap.aspx" class="page-link">
                        <i class="las la-sitemap"></i>
                        <span>Sitemap</span>
                        <span class="page-badge">You're here</span>
                    </a>
                </div>
            </div>

            <!-- Admin Panel -->
            <div class="sitemap-category" data-aos="fade-up" data-aos-delay="500">
                <div class="category-header">
                    <div class="category-icon">
                        <i class="las la-shield-alt"></i>
                    </div>
                    <div class="category-info">
                        <h2>Admin Panel</h2>
                        <p>Administrative pages</p>
                    </div>
                </div>
                <div class="page-list">
                    <a href="AdminBookings.aspx" class="page-link">
                        <i class="las la-clipboard-list"></i>
                        <span>Manage Bookings</span>
                    </a>
                    <a href="AdminDestinations.aspx" class="page-link">
                        <i class="las la-map-marked"></i>
                        <span>Manage Destinations</span>
                    </a>
                    <a href="AddDestinations.aspx" class="page-link">
                        <i class="las la-plus-circle"></i>
                        <span>Add Destination</span>
                    </a>
                    <a href="AdminUserManagement.aspx" class="page-link">
                        <i class="las la-users-cog"></i>
                        <span>User Management</span>
                    </a>
                    <a href="AdminUserView.aspx" class="page-link">
                        <i class="las la-user-check"></i>
                        <span>View User Details</span>
                    </a>
                    <a href="AdminBlog.aspx" class="page-link">
                        <i class="las la-pen-fancy"></i>
                        <span>Manage Blog</span>
                        <span class="page-badge">New</span>
                    </a>
                    <a href="AdminReviews.aspx" class="page-link">
                        <i class="las la-star-half-alt"></i>
                        <span>Moderate Reviews</span>
                        <span class="page-badge">New</span>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <script>
        function filterPages() {
            const searchTerm = document.getElementById('sitemapSearch').value.toLowerCase();
            const pageLinks = document.querySelectorAll('.page-link');

            pageLinks.forEach(link => {
                const text = link.textContent.toLowerCase();
                const category = link.closest('.sitemap-category');

                if (text.includes(searchTerm)) {
                    link.style.display = 'flex';
                } else {
                    link.style.display = 'none';
                }

                // Show/hide categories based on visible links
                const visibleLinks = category.querySelectorAll('.page-link[style="display: flex;"]');
                if (searchTerm === '' || visibleLinks.length > 0) {
                    category.style.display = 'block';
                } else {
                    category.style.display = 'none';
                }
            });
        }
    </script>
</asp:Content>
