<%@ Page Title="Travel Guide & Blog - Exploria Tours" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="Tours_Travels.Blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="css/Blog.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hero Section -->
    <section class="blog-hero">
        <div class="hero-animated-bg">
            <div class="floating-shape shape-1"></div>
            <div class="floating-shape shape-2"></div>
            <div class="floating-shape shape-3"></div>
            <div class="floating-shape shape-4"></div>
        </div>
        
        <div class="blog-hero-content">
            <div class="hero-badge slide-in-top">
                <i class="bi bi-journal-bookmark"></i>
                <span>Travel Insights</span>
            </div>
            
            <h1 class="hero-title">
                <span class="title-word word-1">Travel</span>
                <span class="title-word word-2">Guide</span>
                <span class="title-word word-3">&</span>
                <span class="title-word word-4">Blog</span>
            </h1>
            
            <p class="hero-subtitle fade-in-up">
                Discover travel tips, destination guides, and insider stories from around the world
            </p>
            
            <div class="blog-search scale-in">
                <div class="search-icon-wrapper">
                    <i class="bi bi-search"></i>
                </div>
                <asp:TextBox ID="txtBlogSearch" runat="server" CssClass="blog-search-input" placeholder="Search articles, destinations, tips..."></asp:TextBox>
                <asp:Button ID="btnBlogSearch" runat="server" Text="Search" CssClass="blog-search-btn" OnClick="btnBlogSearch_Click" />
            </div>
        </div>
        
        <div class="hero-scroll-indicator">
            <div class="scroll-line"></div>
            <span class="scroll-text">Scroll to explore</span>
        </div>
    </section>

    <!-- Categories Navigation - FIXED: Using CSS for icons -->
    <section class="blog-categories">
        <div class="categories-container">
            <asp:Button ID="btnCatAll" runat="server" Text="All Posts" CssClass="category-btn active cat-all" OnClick="btnCategory_Click" CommandArgument="All" />
            <asp:Button ID="btnCatAdventure" runat="server" Text="Adventure" CssClass="category-btn cat-adventure" OnClick="btnCategory_Click" CommandArgument="Adventure" />
            <asp:Button ID="btnCatBeach" runat="server" Text="Beach & Islands" CssClass="category-btn cat-beach" OnClick="btnCategory_Click" CommandArgument="Beach" />
            <asp:Button ID="btnCatCulture" runat="server" Text="Culture & Heritage" CssClass="category-btn cat-culture" OnClick="btnCategory_Click" CommandArgument="Culture" />
            <asp:Button ID="btnCatFood" runat="server" Text="Food & Cuisine" CssClass="category-btn cat-food" OnClick="btnCategory_Click" CommandArgument="Food" />
            <asp:Button ID="btnCatTips" runat="server" Text="Travel Tips" CssClass="category-btn cat-tips" OnClick="btnCategory_Click" CommandArgument="Tips" />
            <asp:Button ID="btnCatGuides" runat="server" Text="Destination Guides" CssClass="category-btn cat-guides" OnClick="btnCategory_Click" CommandArgument="Guides" />
        </div>
    </section>

    <!-- Blog Container -->
    <div class="blog-container">
        <!-- Featured Section -->
        <section class="featured-section">
            <div class="section-header">
                <div class="section-title-wrapper">
                    <span class="section-label">
                        <i class="bi bi-star-fill"></i>
                        Editor's Pick
                    </span>
                    <h2 class="section-title">Featured Stories</h2>
                    <div class="title-decoration">
                        <span class="deco-line"></span>
                        <span class="deco-dot"></span>
                    </div>
                </div>
            </div>

            <asp:Repeater ID="rptFeatured" runat="server">
                <HeaderTemplate>
                    <div class="featured-grid">
                </HeaderTemplate>
                <ItemTemplate>
                    <%# Container.ItemIndex == 0 ? "<div class='featured-main' data-animate='slide-right' onclick=\"location.href='BlogDetails.aspx?id=" + Eval("Id") + "'\">" : "" %>
                    <%# Container.ItemIndex == 0 ? "<div class='featured-image-wrapper'><img src='" + Eval("ImageUrl") + "' alt='" + Eval("Title") + "' class='featured-image' /><div class='image-overlay-effect'></div></div>" : "" %>
                    <%# Container.ItemIndex == 0 ? "<div class='featured-overlay'><div class='featured-content-wrapper'><span class='featured-category'><i class='bi bi-tag-fill'></i>" + Eval("Category") + "</span><h3 class='featured-title'>" + Eval("Title") + "</h3><p class='featured-excerpt'>" + Eval("Excerpt") + "</p><div class='featured-meta'><span class='meta-item'><i class='bi bi-person-circle'></i>" + Eval("Author") + "</span><span class='meta-item'><i class='bi bi-calendar-event'></i>" + Convert.ToDateTime(Eval("PublishedDate")).ToString("MMM dd, yyyy") + "</span><span class='meta-item'><i class='bi bi-eye'></i>" + Eval("ViewCount") + " views</span></div><div class='read-more-link'><span>Read Full Story</span><i class='bi bi-arrow-right'></i></div></div></div></div>" : "" %>
                    
                    <%# Container.ItemIndex == 1 ? "<div class='featured-sidebar'>" : "" %>
                    <%# Container.ItemIndex > 0 ? "<div class='sidebar-post' data-animate='slide-left' data-delay='" + ((Container.ItemIndex - 1) * 100) + "' onclick=\"location.href='BlogDetails.aspx?id=" + Eval("Id") + "'\">" : "" %>
                    <%# Container.ItemIndex > 0 ? "<div class='sidebar-image-wrapper'><img src='" + Eval("ImageUrl") + "' alt='" + Eval("Title") + "' class='sidebar-image' /><div class='sidebar-overlay'></div></div>" : "" %>
                    <%# Container.ItemIndex > 0 ? "<div class='sidebar-content'><span class='sidebar-category'><i class='bi bi-bookmark'></i>" + Eval("Category") + "</span><h4 class='sidebar-title'>" + Eval("Title") + "</h4><div class='sidebar-meta'><span class='sidebar-date'><i class='bi bi-clock'></i>" + Convert.ToDateTime(Eval("PublishedDate")).ToString("MMM dd") + "</span><span class='sidebar-views'><i class='bi bi-eye'></i>" + Eval("ViewCount") + "</span></div></div></div>" : "" %>
                </ItemTemplate>
                <FooterTemplate>
                    </div></div>
                </FooterTemplate>
            </asp:Repeater>
        </section>

        <!-- Latest Articles Section -->
        <section class="articles-section">
            <div class="section-header">
                <div class="section-title-wrapper">
                    <span class="section-label">
                        <i class="bi bi-newspaper"></i>
                        Fresh Content
                    </span>
                    <h2 class="section-title">
                        <asp:Label ID="lblSectionTitle" runat="server" Text="Latest Articles"></asp:Label>
                    </h2>
                    <div class="title-decoration">
                        <span class="deco-line"></span>
                        <span class="deco-dot"></span>
                    </div>
                </div>
                <div class="article-count">
                    <div class="count-badge">
                        <asp:Label ID="lblPostCount" runat="server" Text="0"></asp:Label>
                    </div>
                    <span class="count-label">Articles</span>
                </div>
            </div>

            <asp:Repeater ID="rptBlogPosts" runat="server">
                <HeaderTemplate>
                    <div class="blog-grid">
                </HeaderTemplate>
                <ItemTemplate>
                    <article class="blog-card" data-animate="fade-scale" onclick="location.href='BlogDetails.aspx?id=<%# Eval("Id") %>'">
                        <div class="card-image-wrapper">
                            <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Title") %>' class="blog-image" loading="lazy" />
                            <div class="card-overlay"></div>
                            <div class="card-hover-effect"></div>
                            <span class="blog-category-badge">
                                <i class="bi bi-tag"></i>
                                <%# Eval("Category") %>
                            </span>
                        </div>
                        
                        <div class="blog-content">
                            <div class="content-header">
                                <h3 class="blog-title"><%# Eval("Title") %></h3>
                            </div>
                            
                            <p class="blog-excerpt"><%# Eval("Excerpt") %></p>
                            
                            <div class="blog-footer">
                                <div class="blog-author">
                                    <div class="author-avatar">
                                        <span class="avatar-text"><%# Eval("Author").ToString().Substring(0, 1).ToUpper() %></span>
                                        <div class="avatar-ring"></div>
                                    </div>
                                    <div class="author-info">
                                        <div class="author-name"><%# Eval("Author") %></div>
                                        <div class="blog-date">
                                            <i class="bi bi-calendar3"></i>
                                            <%# Convert.ToDateTime(Eval("PublishedDate")).ToString("MMM dd, yyyy") %>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="blog-stats">
                                    <span class="stat-item">
                                        <i class="bi bi-eye"></i>
                                        <%# Eval("ViewCount") %>
                                    </span>
                                </div>
                            </div>
                            
                            <div class="read-more-wrapper">
                                <span class="read-more-text">Read More</span>
                                <i class="bi bi-arrow-right-circle"></i>
                            </div>
                        </div>
                    </article>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
        </section>

        <!-- Newsletter Section -->
        <section class="newsletter-section">
            <div class="newsletter-bg-pattern">
                <div class="pattern-dot"></div>
                <div class="pattern-dot"></div>
                <div class="pattern-dot"></div>
                <div class="pattern-dot"></div>
            </div>
            
            <div class="newsletter-content">
                <div class="newsletter-icon-wrapper">
                    <div class="icon-circle">
                        <i class="bi bi-envelope-heart"></i>
                    </div>
                    <div class="icon-pulse"></div>
                </div>
                
                <h2 class="newsletter-title">
                    <span class="title-highlight">Travel Inspiration</span>
                    <span class="title-main">in Your Inbox</span>
                </h2>
                
                <p class="newsletter-text">
                    Subscribe to receive the latest travel tips, destination guides, and exclusive deals.
                </p>
                
                <div class="newsletter-form">
                    <div class="form-input-wrapper">
                        <i class="bi bi-envelope"></i>
                        <asp:TextBox ID="txtNewsletterEmail" runat="server" CssClass="newsletter-input" placeholder="Enter your email address" TextMode="Email"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnSubscribe" runat="server" Text="Subscribe" CssClass="newsletter-btn" OnClick="btnSubscribe_Click" />
                </div>
                
                <div class="newsletter-privacy">
                    <i class="bi bi-shield-check"></i>
                    <span>We respect your privacy. Unsubscribe anytime.</span>
                </div>
            </div>
        </section>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            
            // Staggered Animation on Scroll
            const animateOnScroll = () => {
                const elements = document.querySelectorAll('[data-animate]');
                
                const observer = new IntersectionObserver((entries) => {
                    entries.forEach(entry => {
                        if (entry.isIntersecting) {
                            const delay = entry.target.dataset.delay || 0;
                            setTimeout(() => {
                                entry.target.classList.add('animated');
                            }, delay);
                            observer.unobserve(entry.target);
                        }
                    });
                }, {
                    threshold: 0.1,
                    rootMargin: '0px 0px -50px 0px'
                });
                
                elements.forEach(el => observer.observe(el));
            };
            
            animateOnScroll();
            
            // Category Button Animations
            const categoryBtns = document.querySelectorAll('.category-btn');
            categoryBtns.forEach((btn, index) => {
                btn.style.animationDelay = `${index * 0.05}s`;
            });
            
            // Blog Cards Hover Effect
            const blogCards = document.querySelectorAll('.blog-card');
            blogCards.forEach(card => {
                card.addEventListener('mouseenter', function() {
                    this.style.setProperty('--hover-scale', '1.05');
                });
                
                card.addEventListener('mouseleave', function() {
                    this.style.setProperty('--hover-scale', '1');
                });
            });
            
            // Hero Title Word Animation
            const titleWords = document.querySelectorAll('.title-word');
            titleWords.forEach((word, index) => {
                word.style.animationDelay = `${index * 0.1}s`;
            });
            
            // Parallax Effect for Hero
            window.addEventListener('scroll', () => {
                const scrolled = window.pageYOffset;
                const hero = document.querySelector('.blog-hero');
                const heroContent = document.querySelector('.blog-hero-content');
                
                if (hero && scrolled < hero.offsetHeight) {
                    heroContent.style.transform = `translateY(${scrolled * 0.5}px)`;
                    heroContent.style.opacity = 1 - (scrolled / hero.offsetHeight);
                }
            });
            
            // Newsletter Form Animation
            const newsletterInput = document.querySelector('.newsletter-input');
            if (newsletterInput) {
                newsletterInput.addEventListener('focus', function() {
                    this.parentElement.classList.add('focused');
                });
                
                newsletterInput.addEventListener('blur', function() {
                    if (!this.value) {
                        this.parentElement.classList.remove('focused');
                    }
                });
            }
            
            // Search Input Animation
            const searchInput = document.querySelector('.blog-search-input');
            if (searchInput) {
                searchInput.addEventListener('focus', function() {
                    this.closest('.blog-search').classList.add('search-focused');
                });
                
                searchInput.addEventListener('blur', function() {
                    this.closest('.blog-search').classList.remove('search-focused');
                });
            }
            
        });
    </script>
</asp:Content>
