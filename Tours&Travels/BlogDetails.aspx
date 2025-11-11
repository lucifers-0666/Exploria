<%@ Page Title="Blog Article - Exploria" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BlogDetails.aspx.cs" Inherits="Tours_Travels.BlogDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Blog Details Styles */
        .blog-details-hero {
            background: linear-gradient(135deg, #1d5e33 0%, #2d7a4a 100%);
            padding: 120px 0 60px;
            position: relative;
            overflow: hidden;
        }

        .blog-details-hero::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="rgba(255,255,255,0.05)" d="M0,96L48,112C96,128,192,160,288,160C384,160,480,128,576,128C672,128,768,160,864,165.3C960,171,1056,149,1152,128C1248,107,1344,85,1392,74.7L1440,64L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>') no-repeat bottom;
            background-size: cover;
            opacity: 0.3;
        }

        .blog-breadcrumb {
            display: flex;
            align-items: center;
            gap: 12px;
            color: rgba(255, 255, 255, 0.8);
            font-size: 14px;
            margin-bottom: 20px;
        }

        .blog-breadcrumb a {
            color: #c9a877;
            text-decoration: none;
            transition: all 0.3s;
        }

        .blog-breadcrumb a:hover {
            color: #ffffff;
        }

        .blog-breadcrumb i {
            font-size: 12px;
        }

        .blog-header {
            max-width: 900px;
            margin: 0 auto;
            text-align: center;
            position: relative;
            z-index: 2;
        }

        .blog-category-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 20px;
            background: rgba(201, 168, 119, 0.2);
            border: 2px solid #c9a877;
            border-radius: 50px;
            color: #ffffff;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .blog-title {
            font-size: 48px;
            font-weight: 700;
            color: #ffffff;
            line-height: 1.2;
            margin-bottom: 20px;
        }

        .blog-meta {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
            color: rgba(255, 255, 255, 0.9);
            font-size: 15px;
        }

        .blog-meta-item {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .blog-meta-item i {
            color: #c9a877;
            font-size: 18px;
        }

        .blog-content-wrapper {
            padding: 60px 0;
            background: #f8f9fa;
        }

        .blog-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: grid;
            grid-template-columns: 1fr 350px;
            gap: 40px;
        }

        .blog-main-content {
            background: #ffffff;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        }

        .blog-featured-image {
            width: 100%;
            height: 500px;
            object-fit: cover;
        }

        .blog-content {
            padding: 40px;
        }

        .blog-content h2 {
            font-size: 32px;
            font-weight: 700;
            color: #1d5e33;
            margin: 30px 0 15px;
        }

        .blog-content h3 {
            font-size: 24px;
            font-weight: 600;
            color: #2d7a4a;
            margin: 25px 0 12px;
        }

        .blog-content p {
            font-size: 17px;
            line-height: 1.8;
            color: #374151;
            margin-bottom: 20px;
        }

        .blog-content ul, .blog-content ol {
            margin: 20px 0;
            padding-left: 30px;
        }

        .blog-content li {
            font-size: 17px;
            line-height: 1.8;
            color: #374151;
            margin-bottom: 10px;
        }

        .blog-content blockquote {
            border-left: 4px solid #c9a877;
            padding: 20px 30px;
            margin: 30px 0;
            background: #f8f9fa;
            border-radius: 8px;
            font-style: italic;
            color: #1d5e33;
        }

        .blog-tags {
            display: flex;
            flex-wrap: wrap;
            gap: 10px;
            padding: 30px 40px;
            border-top: 2px solid #f3f4f6;
        }

        .blog-tag {
            padding: 8px 16px;
            background: #f3f4f6;
            border-radius: 50px;
            color: #1d5e33;
            font-size: 14px;
            text-decoration: none;
            transition: all 0.3s;
        }

        .blog-tag:hover {
            background: #1d5e33;
            color: #ffffff;
            transform: translateY(-2px);
        }

        .blog-author-card {
            padding: 30px 40px;
            border-top: 2px solid #f3f4f6;
            display: flex;
            gap: 20px;
            align-items: center;
        }

        .author-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #c9a877;
        }

        .author-info h4 {
            font-size: 20px;
            font-weight: 600;
            color: #1d5e33;
            margin-bottom: 8px;
        }

        .author-info p {
            font-size: 14px;
            color: #6b7280;
            margin: 0;
        }

        .blog-sidebar {
            display: flex;
            flex-direction: column;
            gap: 30px;
        }

        .sidebar-widget {
            background: #ffffff;
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        }

        .widget-title {
            font-size: 22px;
            font-weight: 700;
            color: #1d5e33;
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 3px solid #c9a877;
        }

        .share-buttons {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 12px;
        }

        .share-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            padding: 12px 20px;
            border: none;
            border-radius: 10px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            text-decoration: none;
            color: #ffffff;
        }

        .share-btn i {
            font-size: 18px;
        }

        .share-facebook {
            background: #1877f2;
        }

        .share-twitter {
            background: #1da1f2;
        }

        .share-linkedin {
            background: #0a66c2;
        }

        .share-whatsapp {
            background: #25d366;
        }

        .share-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
        }

        .related-post-item {
            display: flex;
            gap: 15px;
            padding: 15px 0;
            border-bottom: 1px solid #f3f4f6;
            text-decoration: none;
            transition: all 0.3s;
        }

        .related-post-item:last-child {
            border-bottom: none;
        }

        .related-post-item:hover {
            transform: translateX(5px);
        }

        .related-post-image {
            width: 80px;
            height: 80px;
            border-radius: 10px;
            object-fit: cover;
        }

        .related-post-info h5 {
            font-size: 15px;
            font-weight: 600;
            color: #1d5e33;
            margin-bottom: 8px;
            line-height: 1.4;
        }

        .related-post-date {
            font-size: 13px;
            color: #6b7280;
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .newsletter-widget {
            background: linear-gradient(135deg, #1d5e33 0%, #2d7a4a 100%);
            color: #ffffff;
        }

        .newsletter-widget .widget-title {
            color: #ffffff;
            border-bottom-color: #c9a877;
        }

        .newsletter-widget p {
            font-size: 14px;
            line-height: 1.6;
            margin-bottom: 20px;
            opacity: 0.9;
        }

        .newsletter-form {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .newsletter-input {
            padding: 12px 16px;
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 10px;
            font-size: 15px;
            background: rgba(255, 255, 255, 0.1);
            color: #ffffff;
            transition: all 0.3s;
        }

        .newsletter-input::placeholder {
            color: rgba(255, 255, 255, 0.6);
        }

        .newsletter-input:focus {
            outline: none;
            border-color: #c9a877;
            background: rgba(255, 255, 255, 0.15);
        }

        .newsletter-btn {
            padding: 12px 24px;
            background: #c9a877;
            border: none;
            border-radius: 10px;
            color: #ffffff;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }

        .newsletter-btn:hover {
            background: #b89666;
            transform: translateY(-2px);
        }

        .comments-section {
            margin-top: 40px;
            padding: 40px;
            background: #ffffff;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        }

        .comments-title {
            font-size: 28px;
            font-weight: 700;
            color: #1d5e33;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .comment-form {
            background: #f8f9fa;
            padding: 30px;
            border-radius: 12px;
            margin-bottom: 40px;
        }

        .form-row {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            margin-bottom: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .form-group label {
            font-size: 14px;
            font-weight: 600;
            color: #1d5e33;
        }

        .form-group input,
        .form-group textarea {
            padding: 12px 16px;
            border: 2px solid #e5e7eb;
            border-radius: 10px;
            font-size: 15px;
            transition: all 0.3s;
            font-family: 'Inter', sans-serif;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #1d5e33;
        }

        .form-group textarea {
            resize: vertical;
            min-height: 120px;
        }

        .submit-comment-btn {
            padding: 14px 32px;
            background: #1d5e33;
            border: none;
            border-radius: 10px;
            color: #ffffff;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }

        .submit-comment-btn:hover {
            background: #2d7a4a;
            transform: translateY(-2px);
        }

        .comments-list {
            display: flex;
            flex-direction: column;
            gap: 25px;
        }

        .comment-item {
            display: flex;
            gap: 20px;
            padding: 25px;
            background: #f8f9fa;
            border-radius: 12px;
            border-left: 4px solid #c9a877;
        }

        .comment-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
        }

        .comment-content h5 {
            font-size: 16px;
            font-weight: 600;
            color: #1d5e33;
            margin-bottom: 5px;
        }

        .comment-date {
            font-size: 13px;
            color: #6b7280;
            margin-bottom: 10px;
        }

        .comment-text {
            font-size: 15px;
            line-height: 1.6;
            color: #374151;
        }

        @media (max-width: 1024px) {
            .blog-container {
                grid-template-columns: 1fr;
            }

            .blog-sidebar {
                order: 2;
            }

            .blog-title {
                font-size: 36px;
            }
        }

        @media (max-width: 768px) {
            .blog-details-hero {
                padding: 80px 0 40px;
            }

            .blog-title {
                font-size: 28px;
            }

            .blog-meta {
                gap: 15px;
                font-size: 14px;
            }

            .blog-content {
                padding: 30px 20px;
            }

            .blog-featured-image {
                height: 300px;
            }

            .form-row {
                grid-template-columns: 1fr;
            }

            .share-buttons {
                grid-template-columns: 1fr;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Blog Details Hero -->
    <section class="blog-details-hero">
        <div style="max-width: 1200px; margin: 0 auto; padding: 0 20px;">
            <div class="blog-breadcrumb">
                <a href="Home.aspx"><i class="las la-home"></i> Home</a>
                <i class="las la-angle-right"></i>
                <a href="Blog.aspx">Travel Blog</a>
                <i class="las la-angle-right"></i>
                <span>Article</span>
            </div>
            <div class="blog-header">
                <div class="blog-category-badge">
                    <asp:Literal ID="litCategoryIcon" runat="server"></asp:Literal>
                    <asp:Literal ID="litCategory" runat="server"></asp:Literal>
                </div>
                <h1 class="blog-title">
                    <asp:Literal ID="litTitle" runat="server"></asp:Literal>
                </h1>
                <div class="blog-meta">
                    <div class="blog-meta-item">
                        <i class="las la-user-circle"></i>
                        <span>By <asp:Literal ID="litAuthor" runat="server"></asp:Literal></span>
                    </div>
                    <div class="blog-meta-item">
                        <i class="las la-calendar"></i>
                        <asp:Literal ID="litPublishedDate" runat="server"></asp:Literal>
                    </div>
                    <div class="blog-meta-item">
                        <i class="las la-eye"></i>
                        <asp:Literal ID="litViewCount" runat="server"></asp:Literal> views
                    </div>
                    <div class="blog-meta-item">
                        <i class="las la-clock"></i>
                        <asp:Literal ID="litReadTime" runat="server"></asp:Literal> min read
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Blog Content -->
    <section class="blog-content-wrapper">
        <div class="blog-container">
            <!-- Main Content -->
            <div>
                <article class="blog-main-content" data-aos="fade-up">
                    <asp:Image ID="imgFeatured" runat="server" CssClass="blog-featured-image" AlternateText="Blog Featured Image" />
                    
                    <div class="blog-content">
                        <asp:Literal ID="litContent" runat="server"></asp:Literal>
                    </div>

                    <!-- Tags -->
                    <div class="blog-tags">
                        <asp:Repeater ID="rptTags" runat="server">
                            <ItemTemplate>
                                <a href="Blog.aspx?tag=<%# Container.DataItem %>" class="blog-tag">
                                    <i class="las la-tag"></i> <%# Container.DataItem %>
                                </a>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <!-- Author Card -->
                    <div class="blog-author-card">
                        <img src="https://ui-avatars.com/api/?name=<asp:Literal ID='litAuthorName' runat='server'></asp:Literal>&size=80&background=1d5e33&color=fff" alt="Author" class="author-avatar">
                        <div class="author-info">
                            <h4><asp:Literal ID="litAuthorName2" runat="server"></asp:Literal></h4>
                            <p>Travel Enthusiast & Content Creator</p>
                            <p>Exploring the world one destination at a time.</p>
                        </div>
                    </div>
                </article>

                <!-- Comments Section -->
                <div class="comments-section" data-aos="fade-up">
                    <h3 class="comments-title">
                        <i class="las la-comments"></i>
                        <asp:Literal ID="litCommentCount" runat="server">0</asp:Literal> Comments
                    </h3>

                    <!-- Comment Form -->
                    <div class="comment-form">
                        <h4 style="font-size: 20px; color: #1d5e33; margin-bottom: 20px;">Leave a Comment</h4>
                        <div class="form-row">
                            <div class="form-group">
                                <label>Your Name *</label>
                                <asp:TextBox ID="txtCommentName" runat="server" placeholder="Enter your name" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label>Your Email *</label>
                                <asp:TextBox ID="txtCommentEmail" runat="server" TextMode="Email" placeholder="Enter your email" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group" style="margin-bottom: 20px;">
                            <label>Your Comment *</label>
                            <asp:TextBox ID="txtCommentText" runat="server" TextMode="MultiLine" placeholder="Share your thoughts..." CssClass="form-control"></asp:TextBox>
                        </div>
                        <asp:Button ID="btnSubmitComment" runat="server" Text="Post Comment" CssClass="submit-comment-btn" OnClick="btnSubmitComment_Click" />
                    </div>

                    <!-- Comments List -->
                    <div class="comments-list">
                        <asp:Repeater ID="rptComments" runat="server">
                            <ItemTemplate>
                                <div class="comment-item" data-aos="fade-up">
                                    <img src="https://ui-avatars.com/api/?name=<%# Eval("CommenterName") %>&size=50&background=c9a877&color=fff" alt="Commenter" class="comment-avatar">
                                    <div class="comment-content">
                                        <h5><%# Eval("CommenterName") %></h5>
                                        <div class="comment-date">
                                            <i class="las la-clock"></i>
                                            <%# Eval("CommentDate", "{0:MMM dd, yyyy 'at' hh:mm tt}") %>
                                        </div>
                                        <p class="comment-text"><%# Eval("CommentText") %></p>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>

            <!-- Sidebar -->
            <aside class="blog-sidebar">
                <!-- Share Widget -->
                <div class="sidebar-widget" data-aos="fade-left">
                    <h3 class="widget-title">Share Article</h3>
                    <div class="share-buttons">
                        <asp:HyperLink ID="lnkShareFacebook" runat="server" CssClass="share-btn share-facebook" Target="_blank">
                            <i class="lab la-facebook-f"></i>
                            Facebook
                        </asp:HyperLink>
                        <asp:HyperLink ID="lnkShareTwitter" runat="server" CssClass="share-btn share-twitter" Target="_blank">
                            <i class="lab la-twitter"></i>
                            Twitter
                        </asp:HyperLink>
                        <asp:HyperLink ID="lnkShareLinkedIn" runat="server" CssClass="share-btn share-linkedin" Target="_blank">
                            <i class="lab la-linkedin-in"></i>
                            LinkedIn
                        </asp:HyperLink>
                        <asp:HyperLink ID="lnkShareWhatsApp" runat="server" CssClass="share-btn share-whatsapp" Target="_blank">
                            <i class="lab la-whatsapp"></i>
                            WhatsApp
                        </asp:HyperLink>
                    </div>
                </div>

                <!-- Related Posts Widget -->
                <div class="sidebar-widget" data-aos="fade-left" data-aos-delay="100">
                    <h3 class="widget-title">Related Articles</h3>
                    <asp:Repeater ID="rptRelatedPosts" runat="server">
                        <ItemTemplate>
                            <a href="BlogDetails.aspx?id=<%# Eval("Id") %>" class="related-post-item">
                                <img src="<%# Eval("ImageUrl") %>" alt="Related Post" class="related-post-image">
                                <div class="related-post-info">
                                    <h5><%# Eval("Title") %></h5>
                                    <div class="related-post-date">
                                        <i class="las la-calendar"></i>
                                        <%# Eval("PublishedDate", "{0:MMM dd, yyyy}") %>
                                    </div>
                                </div>
                            </a>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <!-- Newsletter Widget -->
                <div class="sidebar-widget newsletter-widget" data-aos="fade-left" data-aos-delay="200">
                    <h3 class="widget-title">Subscribe to Newsletter</h3>
                    <p>Get the latest travel tips and stories delivered to your inbox!</p>
                    <div class="newsletter-form">
                        <asp:TextBox ID="txtNewsletterEmail" runat="server" TextMode="Email" placeholder="Enter your email" CssClass="newsletter-input"></asp:TextBox>
                        <asp:Button ID="btnSubscribe" runat="server" Text="Subscribe Now" CssClass="newsletter-btn" OnClick="btnSubscribe_Click" />
                    </div>
                </div>
            </aside>
        </div>
    </section>
</asp:Content>
