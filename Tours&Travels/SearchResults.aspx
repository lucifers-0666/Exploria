<%@ Page Title="Search Results - Exploria Tours" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SearchResults.aspx.cs" Inherits="Tours_Travels.SearchResults" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .search-results-hero {
            background: linear-gradient(135deg, #1d5e33 0%, #2d7a4a 100%);
            padding: 120px 0 60px;
            color: white;
            position: relative;
            overflow: hidden;
        }

        .search-results-hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg width="100" height="100" xmlns="http://www.w3.org/2000/svg"><path d="M0 0h100v100H0z" fill="none"/><path d="M25 50L50 25M50 75L75 50M50 25L75 50M25 50L50 75" stroke="white" stroke-width="0.5" opacity="0.1"/></svg>');
            opacity: 0.1;
        }

        .search-hero-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 24px;
            position: relative;
            z-index: 1;
        }

        .search-title {
            font-size: 48px;
            font-weight: 700;
            margin-bottom: 16px;
            text-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .search-subtitle {
            font-size: 20px;
            opacity: 0.9;
            margin-bottom: 32px;
        }

        .quick-search-bar {
            background: white;
            border-radius: 60px;
            padding: 12px;
            display: flex;
            gap: 12px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.15);
            max-width: 900px;
        }

        .quick-search-input {
            flex: 1;
            border: none;
            padding: 16px 24px;
            font-size: 16px;
            border-radius: 50px;
            background: #f8f9fa;
        }

        .quick-search-input:focus {
            outline: none;
            background: white;
            box-shadow: 0 0 0 2px #1d5e33;
        }

        .quick-search-btn {
            background: linear-gradient(135deg, #c9a877 0%, #d4b889 100%);
            color: white;
            border: none;
            padding: 16px 40px;
            border-radius: 50px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 300ms ease;
            white-space: nowrap;
        }

        .quick-search-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(201, 168, 119, 0.4);
        }

        .results-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 60px 24px;
            display: grid;
            grid-template-columns: 280px 1fr;
            gap: 40px;
        }

        /* Filters Sidebar */
        .filters-sidebar {
            background: white;
            border-radius: 16px;
            padding: 32px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            height: fit-content;
            sticky: top 100px;
        }

        .filter-section {
            margin-bottom: 32px;
            padding-bottom: 32px;
            border-bottom: 1px solid #e5e7eb;
        }

        .filter-section:last-child {
            border-bottom: none;
            margin-bottom: 0;
            padding-bottom: 0;
        }

        .filter-title {
            font-size: 18px;
            font-weight: 700;
            color: #1d5e33;
            margin-bottom: 16px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .filter-option {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 12px;
            cursor: pointer;
        }

        .filter-checkbox {
            width: 20px;
            height: 20px;
            border: 2px solid #d1d5db;
            border-radius: 4px;
            cursor: pointer;
            accent-color: #1d5e33;
        }

        .filter-label {
            font-size: 15px;
            color: #374151;
            cursor: pointer;
        }

        .price-range-inputs {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px;
            margin-top: 12px;
        }

        .price-input {
            padding: 12px;
            border: 2px solid #e5e7eb;
            border-radius: 8px;
            font-size: 14px;
        }

        .price-input:focus {
            outline: none;
            border-color: #1d5e33;
        }

        .clear-filters-btn {
            width: 100%;
            padding: 14px;
            background: #f3f4f6;
            color: #1d5e33;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 300ms ease;
            margin-top: 24px;
        }

        .clear-filters-btn:hover {
            background: #e5e7eb;
        }

        /* Results Grid */
        .results-main {
            min-height: 600px;
        }

        .results-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 32px;
            flex-wrap: wrap;
            gap: 16px;
        }

        .results-info {
            font-size: 18px;
            color: #374151;
        }

        .results-count {
            font-weight: 700;
            color: #1d5e33;
        }

        .sort-controls {
            display: flex;
            gap: 12px;
            align-items: center;
        }

        .sort-label {
            font-size: 15px;
            color: #6b7280;
            font-weight: 500;
        }

        .sort-select {
            padding: 12px 40px 12px 16px;
            border: 2px solid #e5e7eb;
            border-radius: 8px;
            font-size: 15px;
            cursor: pointer;
            background: white;
            appearance: none;
            background-image: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" width="12" height="8"><path d="M1 1l5 5 5-5" stroke="%231d5e33" stroke-width="2" fill="none"/></svg>');
            background-repeat: no-repeat;
            background-position: right 12px center;
        }

        .sort-select:focus {
            outline: none;
            border-color: #1d5e33;
        }

        .view-toggle {
            display: flex;
            gap: 8px;
            background: #f3f4f6;
            padding: 4px;
            border-radius: 8px;
        }

        .view-btn {
            padding: 8px 16px;
            border: none;
            background: transparent;
            cursor: pointer;
            border-radius: 6px;
            color: #6b7280;
            transition: all 300ms ease;
        }

        .view-btn.active {
            background: white;
            color: #1d5e33;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .destinations-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
            gap: 32px;
            margin-bottom: 48px;
        }

        .destination-card {
            background: white;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            transition: all 300ms ease;
            cursor: pointer;
        }

        .destination-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 40px rgba(0,0,0,0.15);
        }

        .card-image-wrapper {
            position: relative;
            height: 240px;
            overflow: hidden;
        }

        .card-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 500ms ease;
        }

        .destination-card:hover .card-image {
            transform: scale(1.1);
        }

        .card-badge {
            position: absolute;
            top: 16px;
            left: 16px;
            background: rgba(255, 255, 255, 0.95);
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
            color: #1d5e33;
            backdrop-filter: blur(10px);
        }

        .card-wishlist {
            position: absolute;
            top: 16px;
            right: 16px;
            width: 40px;
            height: 40px;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 300ms ease;
            backdrop-filter: blur(10px);
        }

        .card-wishlist:hover {
            background: #1d5e33;
            color: white;
            transform: scale(1.1);
        }

        .card-content {
            padding: 24px;
        }

        .card-title {
            font-size: 22px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 12px;
        }

        .card-meta {
            display: flex;
            gap: 16px;
            margin-bottom: 16px;
            flex-wrap: wrap;
        }

        .meta-item {
            display: flex;
            align-items: center;
            gap: 6px;
            font-size: 14px;
            color: #6b7280;
        }

        .meta-item i {
            color: #c9a877;
        }

        .card-description {
            font-size: 15px;
            color: #6b7280;
            line-height: 1.6;
            margin-bottom: 16px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .card-rating {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 16px;
        }

        .stars {
            color: #fbbf24;
            font-size: 16px;
        }

        .rating-text {
            font-size: 14px;
            color: #6b7280;
        }

        .card-footer {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding-top: 16px;
            border-top: 1px solid #e5e7eb;
        }

        .card-price {
            display: flex;
            flex-direction: column;
        }

        .price-label {
            font-size: 13px;
            color: #6b7280;
        }

        .price-value {
            font-size: 26px;
            font-weight: 700;
            color: #1d5e33;
        }

        .card-btn {
            padding: 12px 24px;
            background: linear-gradient(135deg, #c9a877 0%, #d4b889 100%);
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 300ms ease;
        }

        .card-btn:hover {
            transform: translateX(4px);
            box-shadow: 0 4px 12px rgba(201, 168, 119, 0.4);
        }

        .no-results {
            text-align: center;
            padding: 80px 24px;
            background: white;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
        }

        .no-results-icon {
            font-size: 80px;
            color: #d1d5db;
            margin-bottom: 24px;
        }

        .no-results-title {
            font-size: 28px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 12px;
        }

        .no-results-text {
            font-size: 16px;
            color: #6b7280;
            margin-bottom: 32px;
        }

        .pagination {
            display: flex;
            justify-content: center;
            gap: 8px;
            margin-top: 48px;
        }

        .page-btn {
            width: 44px;
            height: 44px;
            border: 2px solid #e5e7eb;
            background: white;
            border-radius: 8px;
            cursor: pointer;
            font-weight: 600;
            color: #374151;
            transition: all 300ms ease;
        }

        .page-btn:hover {
            border-color: #1d5e33;
            color: #1d5e33;
        }

        .page-btn.active {
            background: #1d5e33;
            border-color: #1d5e33;
            color: white;
        }

        @media (max-width: 1024px) {
            .results-container {
                grid-template-columns: 1fr;
            }

            .filters-sidebar {
                display: none;
            }
        }

        @media (max-width: 768px) {
            .search-title {
                font-size: 32px;
            }

            .destinations-grid {
                grid-template-columns: 1fr;
            }

            .quick-search-bar {
                flex-direction: column;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hero Section -->
    <div class="search-results-hero">
        <div class="search-hero-content">
            <h1 class="search-title" data-aos="fade-up">
                <asp:Label ID="lblSearchTitle" runat="server" Text="Search Results"></asp:Label>
            </h1>
            <p class="search-subtitle" data-aos="fade-up" data-aos-delay="100">
                <asp:Label ID="lblSearchQuery" runat="server"></asp:Label>
            </p>
            
            <div class="quick-search-bar" data-aos="fade-up" data-aos-delay="200">
                <asp:TextBox ID="txtQuickSearch" runat="server" CssClass="quick-search-input" placeholder="Search destinations, activities, locations..."></asp:TextBox>
                <asp:Button ID="btnQuickSearch" runat="server" Text="Search" CssClass="quick-search-btn" OnClick="btnQuickSearch_Click" />
            </div>
        </div>
    </div>

    <!-- Results Container -->
    <div class="results-container">
        <!-- Filters Sidebar -->
        <aside class="filters-sidebar" data-aos="fade-right">
            <div class="filter-section">
                <h3 class="filter-title">
                    <i class="las la-sliders-h"></i>
                    Price Range
                </h3>
                <div class="price-range-inputs">
                    <asp:TextBox ID="txtMinPrice" runat="server" CssClass="price-input" placeholder="Min ₹" TextMode="Number"></asp:TextBox>
                    <asp:TextBox ID="txtMaxPrice" runat="server" CssClass="price-input" placeholder="Max ₹" TextMode="Number"></asp:TextBox>
                </div>
            </div>

            <div class="filter-section">
                <h3 class="filter-title">
                    <i class="las la-tag"></i>
                    Category
                </h3>
                <asp:CheckBoxList ID="chkCategory" runat="server" CssClass="filter-options">
                    <asp:ListItem Value="Adventure">Adventure</asp:ListItem>
                    <asp:ListItem Value="Beach">Beach</asp:ListItem>
                    <asp:ListItem Value="Cultural">Cultural</asp:ListItem>
                    <asp:ListItem Value="Mountain">Mountain</asp:ListItem>
                    <asp:ListItem Value="Wildlife">Wildlife</asp:ListItem>
                    <asp:ListItem Value="Historical">Historical</asp:ListItem>
                </asp:CheckBoxList>
            </div>

            <div class="filter-section">
                <h3 class="filter-title">
                    <i class="las la-clock"></i>
                    Duration
                </h3>
                <asp:CheckBoxList ID="chkDuration" runat="server" CssClass="filter-options">
                    <asp:ListItem Value="1-3">1-3 Days</asp:ListItem>
                    <asp:ListItem Value="4-7">4-7 Days</asp:ListItem>
                    <asp:ListItem Value="8-14">8-14 Days</asp:ListItem>
                    <asp:ListItem Value="15+">15+ Days</asp:ListItem>
                </asp:CheckBoxList>
            </div>

            <div class="filter-section">
                <h3 class="filter-title">
                    <i class="las la-star"></i>
                    Rating
                </h3>
                <asp:CheckBoxList ID="chkRating" runat="server" CssClass="filter-options">
                    <asp:ListItem Value="4.5">4.5+ Stars</asp:ListItem>
                    <asp:ListItem Value="4.0">4.0+ Stars</asp:ListItem>
                    <asp:ListItem Value="3.5">3.5+ Stars</asp:ListItem>
                    <asp:ListItem Value="3.0">3.0+ Stars</asp:ListItem>
                </asp:CheckBoxList>
            </div>

            <asp:Button ID="btnApplyFilters" runat="server" Text="Apply Filters" CssClass="quick-search-btn" style="width: 100%; margin-top: 24px;" OnClick="btnApplyFilters_Click" />
            <asp:Button ID="btnClearFilters" runat="server" Text="Clear All Filters" CssClass="clear-filters-btn" OnClick="btnClearFilters_Click" />
        </aside>

        <!-- Results Main -->
        <main class="results-main">
            <!-- Results Header -->
            <div class="results-header" data-aos="fade-up">
                <div class="results-info">
                    Showing <span class="results-count"><asp:Label ID="lblResultsCount" runat="server" Text="0"></asp:Label></span> destinations
                </div>
                
                <div class="sort-controls">
                    <span class="sort-label">Sort by:</span>
                    <asp:DropDownList ID="ddlSortBy" runat="server" CssClass="sort-select" AutoPostBack="true" OnSelectedIndexChanged="ddlSortBy_SelectedIndexChanged">
                        <asp:ListItem Value="relevance">Relevance</asp:ListItem>
                        <asp:ListItem Value="price_asc">Price: Low to High</asp:ListItem>
                        <asp:ListItem Value="price_desc">Price: High to Low</asp:ListItem>
                        <asp:ListItem Value="rating">Highest Rated</asp:ListItem>
                        <asp:ListItem Value="popular">Most Popular</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <!-- Destinations Grid -->
            <asp:Repeater ID="rptDestinations" runat="server">
                <HeaderTemplate>
                    <div class="destinations-grid">
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="destination-card" data-aos="fade-up">
                        <div class="card-image-wrapper">
                            <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("DestinationName") %>' class="card-image" />
                            <div class="card-badge"><%# Eval("Category") %></div>
                            <div class="card-wishlist">
                                <i class="las la-heart"></i>
                            </div>
                        </div>
                        <div class="card-content">
                            <h3 class="card-title"><%# Eval("DestinationName") %></h3>
                            <div class="card-meta">
                                <div class="meta-item">
                                    <i class="las la-map-marker"></i>
                                    <span><%# Eval("Location") %></span>
                                </div>
                                <div class="meta-item">
                                    <i class="las la-clock"></i>
                                    <span><%# Eval("Duration") %></span>
                                </div>
                            </div>
                            <p class="card-description"><%# Eval("Description") %></p>
                            <div class="card-rating">
                                <div class="stars">
                                    ★★★★★
                                </div>
                                <span class="rating-text">4.8 (234 reviews)</span>
                            </div>
                            <div class="card-footer">
                                <div class="card-price">
                                    <span class="price-label">Starting from</span>
                                    <span class="price-value">₹<%# Eval("Price", "{0:N0}") %></span>
                                </div>
                                <a href='<%# "ViewDetails.aspx?id=" + Eval("Id") %>' class="card-btn">View Details</a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>

            <!-- No Results -->
            <asp:Panel ID="pnlNoResults" runat="server" CssClass="no-results" Visible="false">
                <div class="no-results-icon">🔍</div>
                <h2 class="no-results-title">No destinations found</h2>
                <p class="no-results-text">Try adjusting your filters or search query to find what you're looking for.</p>
                <asp:Button ID="btnBrowseAll" runat="server" Text="Browse All Destinations" CssClass="quick-search-btn" OnClick="btnBrowseAll_Click" />
            </asp:Panel>
        </main>
    </div>
</asp:Content>
