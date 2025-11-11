<%@ Page Title="Travel Guide & Blog - Exploria Tours" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="Tours_Travels.Blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .blog-hero {
            background: linear-gradient(135deg, rgba(29, 94, 51, 0.95), rgba(45, 122, 74, 0.95)), 
                        url('https://images.unsplash.com/photo-1488646953014-85cb44e25828?w=1920') center/cover;
            padding: 120px 0 80px;
            color: white;
            text-align: center;
        }

        .blog-hero-content {
            max-width: 800px;
            margin: 0 auto;
            padding: 0 24px;
        }

        .hero-title {
            font-size: 56px;
            font-weight: 700;
            margin-bottom: 16px;
            text-shadow: 0 2px 4px rgba(0,0,0,0.2);
        }

        .hero-subtitle {
            font-size: 22px;
            opacity: 0.95;
            margin-bottom: 32px;
        }

        .blog-search {
            max-width: 600px;
            margin: 0 auto;
            background: white;
            border-radius: 60px;
            padding: 8px;
            display: flex;
            gap: 12px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
        }

        .blog-search-input {
            flex: 1;
            border: none;
            padding: 16px 24px;
            font-size: 16px;
            border-radius: 50px;
            background: transparent;
        }

        .blog-search-input:focus {
            outline: none;
        }

        .blog-search-btn {
            background: linear-gradient(135deg, #c9a877 0%, #d4b889 100%);
            color: white;
            border: none;
            padding: 16px 32px;
            border-radius: 50px;
            font-weight: 600;
            cursor: pointer;
            transition: all 300ms ease;
        }

        .blog-search-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(201, 168, 119, 0.4);
        }

        .blog-categories {
            background: white;
            padding: 32px 0;
            border-bottom: 1px solid #e5e7eb;
            position: sticky;
            top: 80px;
            z-index: 100;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        }

        .categories-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 24px;
            display: flex;
            gap: 16px;
            overflow-x: auto;
            scrollbar-width: none;
        }

        .categories-container::-webkit-scrollbar {
            display: none;
        }

        .category-btn {
            padding: 12px 28px;
            background: #f3f4f6;
            border: 2px solid transparent;
            border-radius: 50px;
            font-size: 15px;
            font-weight: 600;
            color: #374151;
            cursor: pointer;
            transition: all 300ms ease;
            white-space: nowrap;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .category-btn:hover {
            background: #e5e7eb;
            transform: translateY(-2px);
        }

        .category-btn.active {
            background: linear-gradient(135deg, #1d5e33 0%, #2d7a4a 100%);
            color: white;
            border-color: #1d5e33;
        }

        .blog-container {
            max-width: 1400px;
            margin: 60px auto;
            padding: 0 24px;
        }

        .featured-section {
            margin-bottom: 80px;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 40px;
        }

        .section-title {
            font-size: 36px;
            font-weight: 700;
            color: #111827;
        }

        .view-all-link {
            color: #1d5e33;
            font-weight: 600;
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 6px;
            transition: gap 300ms;
        }

        .view-all-link:hover {
            gap: 12px;
        }

        .featured-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 32px;
        }

        .featured-main {
            position: relative;
            border-radius: 24px;
            overflow: hidden;
            height: 500px;
            cursor: pointer;
            box-shadow: 0 10px 40px rgba(0,0,0,0.15);
        }

        .featured-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 500ms ease;
        }

        .featured-main:hover .featured-image {
            transform: scale(1.05);
        }

        .featured-overlay {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            padding: 48px;
            background: linear-gradient(to top, rgba(0,0,0,0.8), transparent);
            color: white;
        }

        .featured-category {
            display: inline-block;
            padding: 6px 16px;
            background: #c9a877;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 16px;
        }

        .featured-title {
            font-size: 32px;
            font-weight: 700;
            margin-bottom: 12px;
            line-height: 1.3;
        }

        .featured-meta {
            display: flex;
            align-items: center;
            gap: 24px;
            font-size: 14px;
            opacity: 0.9;
        }

        .meta-item {
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .featured-sidebar {
            display: flex;
            flex-direction: column;
            gap: 24px;
        }

        .sidebar-post {
            background: white;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            transition: all 300ms ease;
            cursor: pointer;
            display: flex;
            gap: 16px;
        }

        .sidebar-post:hover {
            transform: translateX(4px);
            box-shadow: 0 8px 30px rgba(0,0,0,0.15);
        }

        .sidebar-image {
            width: 140px;
            height: 140px;
            object-fit: cover;
            flex-shrink: 0;
        }

        .sidebar-content {
            padding: 16px 16px 16px 0;
            flex: 1;
        }

        .sidebar-category {
            font-size: 12px;
            color: #c9a877;
            font-weight: 600;
            text-transform: uppercase;
            margin-bottom: 8px;
        }

        .sidebar-title {
            font-size: 16px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 8px;
            line-height: 1.4;
        }

        .sidebar-date {
            font-size: 13px;
            color: #6b7280;
        }

        .blog-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(360px, 1fr));
            gap: 32px;
            margin-bottom: 80px;
        }

        .blog-card {
            background: white;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            transition: all 300ms ease;
            cursor: pointer;
        }

        .blog-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 40px rgba(0,0,0,0.15);
        }

        .blog-image {
            width: 100%;
            height: 240px;
            object-fit: cover;
            transition: transform 500ms ease;
        }

        .blog-card:hover .blog-image {
            transform: scale(1.1);
        }

        .blog-content {
            padding: 28px;
        }

        .blog-category {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 6px 14px;
            background: #e8f4ed;
            color: #1d5e33;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 16px;
        }

        .blog-title {
            font-size: 22px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 12px;
            line-height: 1.4;
        }

        .blog-excerpt {
            font-size: 15px;
            color: #6b7280;
            line-height: 1.6;
            margin-bottom: 20px;
            display: -webkit-box;
            -webkit-line-clamp: 3;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .blog-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding-top: 20px;
            border-top: 1px solid #e5e7eb;
        }

        .blog-author {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .author-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(135deg, #1d5e33 0%, #2d7a4a 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 700;
            font-size: 14px;
        }

        .author-info {
            display: flex;
            flex-direction: column;
            gap: 2px;
        }

        .author-name {
            font-size: 14px;
            font-weight: 600;
            color: #111827;
        }

        .blog-date {
            font-size: 13px;
            color: #6b7280;
        }

        .blog-stats {
            display: flex;
            gap: 16px;
            font-size: 14px;
            color: #6b7280;
        }

        .stat {
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .newsletter-section {
            background: linear-gradient(135deg, #e8f4ed 0%, #f8f9fa 100%);
            border-radius: 24px;
            padding: 60px 48px;
            text-align: center;
            margin-bottom: 60px;
        }

        .newsletter-icon {
            font-size: 64px;
            margin-bottom: 24px;
        }

        .newsletter-title {
            font-size: 32px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 12px;
        }

        .newsletter-text {
            font-size: 18px;
            color: #6b7280;
            margin-bottom: 32px;
        }

        .newsletter-form {
            max-width: 500px;
            margin: 0 auto;
            display: flex;
            gap: 12px;
        }

        .newsletter-input {
            flex: 1;
            padding: 16px 24px;
            border: 2px solid #e5e7eb;
            border-radius: 12px;
            font-size: 15px;
        }

        .newsletter-input:focus {
            outline: none;
            border-color: #1d5e33;
        }

        .newsletter-btn {
            padding: 16px 32px;
            background: linear-gradient(135deg, #1d5e33 0%, #2d7a4a 100%);
            color: white;
            border: none;
            border-radius: 12px;
            font-weight: 600;
            cursor: pointer;
            transition: all 300ms ease;
        }

        .newsletter-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(29, 94, 51, 0.4);
        }

        @media (max-width: 1024px) {
            .featured-grid {
                grid-template-columns: 1fr;
            }

            .featured-sidebar {
                flex-direction: row;
                overflow-x: auto;
            }

            .sidebar-post {
                min-width: 300px;
            }
        }

        @media (max-width: 768px) {
            .hero-title {
                font-size: 36px;
            }

            .blog-grid {
                grid-template-columns: 1fr;
            }

            .newsletter-form {
                flex-direction: column;
            }

            .blog-search {
                flex-direction: column;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hero Section -->
    <div class="blog-hero">
        <div class="blog-hero-content">
            <h1 class="hero-title" data-aos="fade-up">Travel Guide & Blog</h1>
            <p class="hero-subtitle" data-aos="fade-up" data-aos-delay="100">
                Discover travel tips, destination guides, and insider stories
            </p>
            
            <div class="blog-search" data-aos="fade-up" data-aos-delay="200">
                <asp:TextBox ID="txtBlogSearch" runat="server" CssClass="blog-search-input" placeholder="Search articles, destinations, tips..."></asp:TextBox>
                <asp:Button ID="btnBlogSearch" runat="server" Text="Search" CssClass="blog-search-btn" OnClick="btnBlogSearch_Click" />
            </div>
        </div>
    </div>

    <!-- Categories Navigation -->
    <div class="blog-categories">
        <div class="categories-container">
            <asp:Button ID="btnCatAll" runat="server" Text="All Posts" CssClass="category-btn active" OnClick="btnCategory_Click" CommandArgument="All" />
            <asp:Button ID="btnCatAdventure" runat="server" Text="🏔️ Adventure" CssClass="category-btn" OnClick="btnCategory_Click" CommandArgument="Adventure" />
            <asp:Button ID="btnCatBeach" runat="server" Text="🏖️ Beach & Islands" CssClass="category-btn" OnClick="btnCategory_Click" CommandArgument="Beach" />
            <asp:Button ID="btnCatCulture" runat="server" Text="🎭 Culture & Heritage" CssClass="category-btn" OnClick="btnCategory_Click" CommandArgument="Culture" />
            <asp:Button ID="btnCatFood" runat="server" Text="🍽️ Food & Cuisine" CssClass="category-btn" OnClick="btnCategory_Click" CommandArgument="Food" />
            <asp:Button ID="btnCatTips" runat="server" Text="💡 Travel Tips" CssClass="category-btn" OnClick="btnCategory_Click" CommandArgument="Tips" />
            <asp:Button ID="btnCatGuides" runat="server" Text="📚 Destination Guides" CssClass="category-btn" OnClick="btnCategory_Click" CommandArgument="Guides" />
        </div>
    </div>

    <!-- Blog Container -->
    <div class="blog-container">
        <!-- Featured Section -->
        <section class="featured-section">
            <div class="section-header" data-aos="fade-up">
                <h2 class="section-title">Featured Stories</h2>
            </div>

            <asp:Repeater ID="rptFeatured" runat="server">
                <HeaderTemplate>
                    <div class="featured-grid">
                </HeaderTemplate>
                <ItemTemplate>
                    <%# Container.ItemIndex == 0 ? "<div class='featured-main' onclick=\"location.href='BlogDetails.aspx?id=" + Eval("Id") + "'\">" : "" %>
                    <%# Container.ItemIndex == 0 ? "<img src='" + Eval("ImageUrl") + "' alt='" + Eval("Title") + "' class='featured-image' />" : "" %>
                    <%# Container.ItemIndex == 0 ? "<div class='featured-overlay'><span class='featured-category'>" + Eval("Category") + "</span><h3 class='featured-title'>" + Eval("Title") + "</h3><div class='featured-meta'><span class='meta-item'><i class='las la-user'></i>" + Eval("Author") + "</span><span class='meta-item'><i class='las la-calendar'></i>" + Convert.ToDateTime(Eval("PublishedDate")).ToString("MMM dd, yyyy") + "</span><span class='meta-item'><i class='las la-eye'></i>" + Eval("ViewCount") + " views</span></div></div></div>" : "" %>
                    
                    <%# Container.ItemIndex == 1 ? "<div class='featured-sidebar'>" : "" %>
                    <%# Container.ItemIndex > 0 ? "<div class='sidebar-post' onclick=\"location.href='BlogDetails.aspx?id=" + Eval("Id") + "'\">" : "" %>
                    <%# Container.ItemIndex > 0 ? "<img src='" + Eval("ImageUrl") + "' alt='" + Eval("Title") + "' class='sidebar-image' />" : "" %>
                    <%# Container.ItemIndex > 0 ? "<div class='sidebar-content'><div class='sidebar-category'>" + Eval("Category") + "</div><h4 class='sidebar-title'>" + Eval("Title") + "</h4><div class='sidebar-date'>" + Convert.ToDateTime(Eval("PublishedDate")).ToString("MMM dd, yyyy") + "</div></div></div>" : "" %>
                </ItemTemplate>
                <FooterTemplate>
                    </div></div>
                </FooterTemplate>
            </asp:Repeater>
        </section>

        <!-- All Posts Grid -->
        <section>
            <div class="section-header" data-aos="fade-up">
                <h2 class="section-title">
                    <asp:Label ID="lblSectionTitle" runat="server" Text="Latest Articles"></asp:Label>
                </h2>
                <asp:Label ID="lblPostCount" runat="server" CssClass="view-all-link" Text="0 articles"></asp:Label>
            </div>

            <asp:Repeater ID="rptBlogPosts" runat="server">
                <HeaderTemplate>
                    <div class="blog-grid">
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="blog-card" data-aos="fade-up" onclick="location.href='BlogDetails.aspx?id=<%# Eval("Id") %>'">
                        <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Title") %>' class="blog-image" />
                        <div class="blog-content">
                            <span class="blog-category">
                                <i class="las la-tag"></i>
                                <%# Eval("Category") %>
                            </span>
                            <h3 class="blog-title"><%# Eval("Title") %></h3>
                            <p class="blog-excerpt"><%# Eval("Excerpt") %></p>
                            <div class="blog-footer">
                                <div class="blog-author">
                                    <div class="author-avatar">
                                        <%# Eval("Author").ToString().Substring(0, 1).ToUpper() %>
                                    </div>
                                    <div class="author-info">
                                        <div class="author-name"><%# Eval("Author") %></div>
                                        <div class="blog-date"><%# Convert.ToDateTime(Eval("PublishedDate")).ToString("MMM dd, yyyy") %></div>
                                    </div>
                                </div>
                                <div class="blog-stats">
                                    <span class="stat">
                                        <i class="las la-eye"></i>
                                        <%# Eval("ViewCount") %>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
        </section>

        <!-- Newsletter Section -->
        <section class="newsletter-section" data-aos="fade-up">
            <div class="newsletter-icon">📬</div>
            <h2 class="newsletter-title">Get Travel Inspiration in Your Inbox</h2>
            <p class="newsletter-text">Subscribe to receive the latest travel tips, destination guides, and exclusive deals.</p>
            <div class="newsletter-form">
                <asp:TextBox ID="txtNewsletterEmail" runat="server" CssClass="newsletter-input" placeholder="Enter your email address" TextMode="Email"></asp:TextBox>
                <asp:Button ID="btnSubscribe" runat="server" Text="Subscribe" CssClass="newsletter-btn" OnClick="btnSubscribe_Click" />
            </div>
        </section>
    </div>
</asp:Content>
