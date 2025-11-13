<%@ Page Title="Exclusive Deals - Limited Time Offers | Exploria Tours" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Deals.aspx.cs" Inherits="Tours_Travels.Deals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
    <link rel="stylesheet" href="css/Deals.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- ==========================================
         HERO SECTION - FIXED SPACING & ALIGNMENT
         ========================================== -->
    <section class="deals-hero-section">
        <!-- Animated Background -->
        <div class="hero-animated-bg">
            <div class="mesh-gradient-layer"></div>
            <!-- Floating Orbs -->
            <div class="orb-particle orb-1"></div>
            <div class="orb-particle orb-2"></div>
            <div class="orb-particle orb-3"></div>
            <div class="orb-particle orb-4"></div>
            <div class="orb-particle orb-5"></div>
            <div class="orb-particle orb-6"></div>
        </div>

        <!-- Glassmorphic Panel (FIXED DIMENSIONS) -->
        <div class="glass-panel-container">
            <div class="glass-panel">
                <!-- Limited Time Badge (FIXED SPACING) -->
                <div class="limited-time-badge" data-aos="zoom-in" data-aos-duration="800">
                    <i class="bi bi-lightning-charge-fill"></i>
                    LIMITED TIME OFFERS
                </div>

                <!-- Main Heading (FIXED LETTER SPACING) -->
                <h1 class="hero-main-heading">
                    <span class="split-word" data-aos="fade-up" data-aos-delay="200">Special</span>
                    <span class="split-word" data-aos="fade-up" data-aos-delay="400">Offers</span>
                </h1>

                <!-- Subheading (CENTERED & FIXED SPACING) -->
                <p class="hero-subheading" data-aos="fade-up" data-aos-delay="600">
                    Discover exclusive travel packages at unbeatable prices
                </p>

                <!-- Premium Search Bar (FIXED HEIGHT & SPACING) -->
                <div class="premium-search-container" data-aos="fade-up" data-aos-delay="800">
                    <div class="search-bar-wrapper">
                        <i class="bi bi-search search-icon-left"></i>
                        <input 
                            type="text" 
                            class="search-input-field" 
                            placeholder="Search destinations, packages..."
                            aria-label="Search deals"
                        />
                        <button type="button" class="search-submit-btn">
                            <span>Search</span>
                            <i class="bi bi-arrow-right"></i>
                        </button>
                    </div>
                </div>

                <!-- Quick Filter Pills (FIXED SPACING & SIZE) -->
                <div class="quick-filter-pills" data-aos="fade-up" data-aos-delay="1000">
                    <span class="filter-pills-label">Popular:</span>
                    <button type="button" class="filter-pill">Beach</button>
                    <button type="button" class="filter-pill">Mountains</button>
                    <button type="button" class="filter-pill">Adventure</button>
                    <button type="button" class="filter-pill">Honeymoon</button>
                </div>
            </div>
        </div>
    </section>

    <!-- ==========================================
         STATS CARDS - FIXED ALIGNMENT & SIZING
         ========================================== -->
    <section class="stats-cards-section">
        <div class="stats-container">
            <div class="stat-card" data-aos="fade-up" data-aos-delay="100">
                <div class="stat-icon-circle">
                    <i class="bi bi-tags-fill"></i>
                </div>
                <div class="stat-counter" data-target="25">0</div>
                <div class="stat-label">Active Deals</div>
            </div>

            <div class="stat-card" data-aos="fade-up" data-aos-delay="250">
                <div class="stat-icon-circle">
                    <i class="bi bi-percent"></i>
                </div>
                <div class="stat-counter" data-target="40">0</div>
                <div class="stat-label">Max Savings</div>
            </div>

            <div class="stat-card" data-aos="fade-up" data-aos-delay="400">
                <div class="stat-icon-circle">
                    <i class="bi bi-headphones"></i>
                </div>
                <div class="stat-counter">24/7</div>
                <div class="stat-label">Support</div>
            </div>

            <div class="stat-card" data-aos="fade-up" data-aos-delay="550">
                <div class="stat-icon-circle">
                    <i class="bi bi-shield-check"></i>
                </div>
                <div class="stat-counter" data-target="100">0</div>
                <div class="stat-label">Secure Booking</div>
            </div>
        </div>
    </section>

    <!-- ==========================================
         FILTER SECTION - FIXED STYLING
         ========================================== -->
    <section class="filter-section-wrapper">
        <div class="filter-container">
            <!-- Category Tabs (FIXED SPACING & ACTIVE STATE) -->
            <div class="category-tabs-row">
                <button type="button" class="category-tab active" data-category="all">
                    <i class="bi bi-grid-fill"></i>
                    <span>All Deals</span>
                </button>
                <button type="button" class="category-tab" data-category="beach">
                    <i class="bi bi-water"></i>
                    <span>Beach</span>
                </button>
                <button type="button" class="category-tab" data-category="mountains">
                    <i class="bi bi-snow"></i>
                    <span>Mountains</span>
                </button>
                <button type="button" class="category-tab" data-category="city">
                    <i class="bi bi-buildings"></i>
                    <span>City Breaks</span>
                </button>
                <button type="button" class="category-tab" data-category="adventure">
                    <i class="bi bi-bicycle"></i>
                    <span>Adventure</span>
                </button>
                <button type="button" class="category-tab" data-category="honeymoon">
                    <i class="bi bi-heart-fill"></i>
                    <span>Honeymoon</span>
                </button>
                <button type="button" class="category-tab" data-category="weekend">
                    <i class="bi bi-calendar-week"></i>
                    <span>Weekend Getaways</span>
                </button>
            </div>
        </div>
    </section>

    <!-- ==========================================
         RESULTS BAR - FIXED LAYOUT
         ========================================== -->
    <div class="results-bar-fixed">
        <div class="results-bar-content">
            <div class="results-left-side">
                <span class="results-text">Showing <strong class="result-number">24</strong> deals</span>
                <div class="applied-filter-chips">
                    <span class="applied-chip">
                        Beach
                        <i class="bi bi-x"></i>
                    </span>
                    <span class="applied-chip">
                        ₹10k-₹30k
                        <i class="bi bi-x"></i>
                    </span>
                </div>
            </div>
            <div class="results-right-side">
                <button type="button" class="filters-toggle-btn" id="filtersToggleBtn">
                    <i class="bi bi-funnel"></i>
                    <span>Filters</span>
                    <span class="filter-count-badge">3</span>
                </button>
                <div class="view-toggle-buttons">
                    <button type="button" class="view-toggle-btn active" data-view="grid">
                        <i class="bi bi-grid-3x3-gap"></i>
                    </button>
                    <button type="button" class="view-toggle-btn" data-view="list">
                        <i class="bi bi-list"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- ==========================================
         DEAL CARDS GRID - 6 SAMPLE CARDS
         ========================================== -->
    <section class="deals-grid-section">
        <div class="deals-grid-container">
            <div class="deals-grid">
                <!-- Card 1: Goa Beach Paradise -->
                <div class="deal-card-wrapper" data-aos="fade-up" data-aos-duration="600">
                    <div class="deal-card">
                        <div class="card-image-section">
                            <img src="images/goa-beach.jpg" alt="Goa Beach Paradise" class="card-main-image" loading="lazy" />
                            <div class="card-image-overlay">
                                <button type="button" class="quick-view-btn-card">
                                    <i class="bi bi-eye"></i>
                                    Quick View
                                </button>
                            </div>
                            <div class="discount-badge-top">
                                <i class="bi bi-lightning-fill"></i>
                                35% OFF
                            </div>
                            <button type="button" class="wishlist-heart-btn" aria-label="Add to wishlist">
                                <i class="bi bi-heart"></i>
                            </button>
                        </div>
                        <div class="card-content-section">
                            <div class="card-location">
                                <i class="bi bi-geo-alt-fill"></i>
                                Goa, India
                            </div>
                            <div class="card-rating-row">
                                <div class="rating-stars-display">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                </div>
                                <span class="rating-text">4.8 (234)</span>
                            </div>
                            <h3 class="card-title-text">Goa Beach Paradise Package</h3>
                            <div class="card-features-list">
                                <div class="feature-item-inline">
                                    <i class="bi bi-calendar3"></i>
                                    <span>5 Days • 4 Nights</span>
                                </div>
                                <div class="feature-item-inline">
                                    <i class="bi bi-building"></i>
                                    <span>4-Star Hotel</span>
                                </div>
                                <div class="feature-item-inline">
                                    <i class="bi bi-airplane-fill"></i>
                                    <span>Flights Included</span>
                                </div>
                            </div>
                            <div class="card-price-section">
                                <div class="price-display">
                                    <span class="current-price-large">₹18,999</span>
                                    <span class="original-price-strike">₹29,999</span>
                                </div>
                                <div class="savings-text">Save 37%</div>
                            </div>
                            <div class="card-actions-row">
                                <a href="ViewDetails.aspx?id=1" class="view-details-btn">
                                    View Details
                                </a>
                                <a href="ViewDetails.aspx?id=1" class="book-now-btn-card">
                                    Book Now
                                    <i class="bi bi-arrow-right"></i>
                                </a>
                            </div>
                            <button type="button" class="share-icon-btn" aria-label="Share deal">
                                <i class="bi bi-share"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Card 2: Manali Mountains -->
                <div class="deal-card-wrapper" data-aos="fade-up" data-aos-duration="600" data-aos-delay="100">
                    <div class="deal-card">
                        <div class="card-image-section">
                            <img src="images/manali-mountains.jpg" alt="Manali Mountain Adventure" class="card-main-image" loading="lazy" />
                            <div class="card-image-overlay">
                                <button type="button" class="quick-view-btn-card">
                                    <i class="bi bi-eye"></i>
                                    Quick View
                                </button>
                            </div>
                            <div class="discount-badge-top">
                                <i class="bi bi-lightning-fill"></i>
                                36% OFF
                            </div>
                            <button type="button" class="wishlist-heart-btn" aria-label="Add to wishlist">
                                <i class="bi bi-heart"></i>
                            </button>
                        </div>
                        <div class="card-content-section">
                            <div class="card-location">
                                <i class="bi bi-geo-alt-fill"></i>
                                Manali, Himachal Pradesh
                            </div>
                            <div class="card-rating-row">
                                <div class="rating-stars-display">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-half"></i>
                                </div>
                                <span class="rating-text">4.7 (189)</span>
                            </div>
                            <h3 class="card-title-text">Manali Mountain Adventure</h3>
                            <div class="card-features-list">
                                <div class="feature-item-inline">
                                    <i class="bi bi-calendar3"></i>
                                    <span>6 Days • 5 Nights</span>
                                </div>
                                <div class="feature-item-inline">
                                    <i class="bi bi-building"></i>
                                    <span>3-Star Resort</span>
                                </div>
                                <div class="feature-item-inline">
                                    <i class="bi bi-airplane-fill"></i>
                                    <span>Flights Included</span>
                                </div>
                            </div>
                            <div class="card-price-section">
                                <div class="price-display">
                                    <span class="current-price-large">₹22,499</span>
                                    <span class="original-price-strike">₹34,999</span>
                                </div>
                                <div class="savings-text">Save 36%</div>
                            </div>
                            <div class="card-actions-row">
                                <a href="ViewDetails.aspx?id=2" class="view-details-btn">
                                    View Details
                                </a>
                                <a href="ViewDetails.aspx?id=2" class="book-now-btn-card">
                                    Book Now
                                    <i class="bi bi-arrow-right"></i>
                                </a>
                            </div>
                            <button type="button" class="share-icon-btn" aria-label="Share deal">
                                <i class="bi bi-share"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Card 3: Udaipur Royal Heritage -->
                <div class="deal-card-wrapper" data-aos="fade-up" data-aos-duration="600" data-aos-delay="200">
                    <div class="deal-card">
                        <div class="card-image-section">
                            <img src="images/udaipur-palace.jpg" alt="Udaipur Royal Heritage" class="card-main-image" loading="lazy" />
                            <div class="card-image-overlay">
                                <button type="button" class="quick-view-btn-card">
                                    <i class="bi bi-eye"></i>
                                    Quick View
                                </button>
                            </div>
                            <div class="discount-badge-top">
                                <i class="bi bi-lightning-fill"></i>
                                35% OFF
                            </div>
                            <button type="button" class="wishlist-heart-btn" aria-label="Add to wishlist">
                                <i class="bi bi-heart"></i>
                            </button>
                        </div>
                        <div class="card-content-section">
                            <div class="card-location">
                                <i class="bi bi-geo-alt-fill"></i>
                                Udaipur, Rajasthan
                            </div>
                            <div class="card-rating-row">
                                <div class="rating-stars-display">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                </div>
                                <span class="rating-text">4.9 (312)</span>
                            </div>
                            <h3 class="card-title-text">Udaipur Royal Heritage Tour</h3>
                            <div class="card-features-list">
                                <div class="feature-item-inline">
                                    <i class="bi bi-calendar3"></i>
                                    <span>4 Days • 3 Nights</span>
                                </div>
                                <div class="feature-item-inline">
                                    <i class="bi bi-building"></i>
                                    <span>Palace Hotels</span>
                                </div>
                                <div class="feature-item-inline">
                                    <i class="bi bi-camera"></i>
                                    <span>Cultural Tours</span>
                                </div>
                            </div>
                            <div class="card-price-section">
                                <div class="price-display">
                                    <span class="current-price-large">₹25,999</span>
                                    <span class="original-price-strike">₹39,999</span>
                                </div>
                                <div class="savings-text">Save 35%</div>
                            </div>
                            <div class="card-actions-row">
                                <a href="ViewDetails.aspx?id=3" class="view-details-btn">
                                    View Details
                                </a>
                                <a href="ViewDetails.aspx?id=3" class="book-now-btn-card">
                                    Book Now
                                    <i class="bi bi-arrow-right"></i>
                                </a>
                            </div>
                            <button type="button" class="share-icon-btn" aria-label="Share deal">
                                <i class="bi bi-share"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Card 4: Kerala Backwaters -->
                <div class="deal-card-wrapper" data-aos="fade-up" data-aos-duration="600">
                    <div class="deal-card">
                        <div class="card-image-section">
                            <img src="images/kerala-backwaters.jpg" alt="Kerala Backwaters" class="card-main-image" loading="lazy" />
                            <div class="card-image-overlay">
                                <button type="button" class="quick-view-btn-card">
                                    <i class="bi bi-eye"></i>
                                    Quick View
                                </button>
                            </div>
                            <div class="discount-badge-top">
                                <i class="bi bi-lightning-fill"></i>
                                39% OFF
                            </div>
                            <button type="button" class="wishlist-heart-btn" aria-label="Add to wishlist">
                                <i class="bi bi-heart"></i>
                            </button>
                        </div>
                        <div class="card-content-section">
                            <div class="card-location">
                                <i class="bi bi-geo-alt-fill"></i>
                                Kerala, India
                            </div>
                            <div class="card-rating-row">
                                <div class="rating-stars-display">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                </div>
                                <span class="rating-text">4.9 (267)</span>
                            </div>
                            <h3 class="card-title-text">Kerala Backwaters Houseboat</h3>
                            <div class="card-features-list">
                                <div class="feature-item-inline">
                                    <i class="bi bi-calendar3"></i>
                                    <span>5 Days • 4 Nights</span>
                                </div>
                                <div class="feature-item-inline">
                                    <i class="bi bi-water"></i>
                                    <span>Houseboat Stay</span>
                                </div>
                                <div class="feature-item-inline">
                                    <i class="bi bi-tree"></i>
                                    <span>Nature Tours</span>
                                </div>
                            </div>
                            <div class="card-price-section">
                                <div class="price-display">
                                    <span class="current-price-large">₹19,999</span>
                                    <span class="original-price-strike">₹32,999</span>
                                </div>
                                <div class="savings-text">Save 39%</div>
                            </div>
                            <div class="card-actions-row">
                                <a href="ViewDetails.aspx?id=4" class="view-details-btn">
                                    View Details
                                </a>
                                <a href="ViewDetails.aspx?id=4" class="book-now-btn-card">
                                    Book Now
                                    <i class="bi bi-arrow-right"></i>
                                </a>
                            </div>
                            <button type="button" class="share-icon-btn" aria-label="Share deal">
                                <i class="bi bi-share"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Card 5: Jaipur Cultural Tour -->
                <div class="deal-card-wrapper" data-aos="fade-up" data-aos-duration="600" data-aos-delay="100">
                    <div class="deal-card">
                        <div class="card-image-section">
                            <img src="images/jaipur-city.jpg" alt="Jaipur Cultural Tour" class="card-main-image" loading="lazy" />
                            <div class="card-image-overlay">
                                <button type="button" class="quick-view-btn-card">
                                    <i class="bi bi-eye"></i>
                                    Quick View
                                </button>
                            </div>
                            <div class="discount-badge-top">
                                <i class="bi bi-lightning-fill"></i>
                                37% OFF
                            </div>
                            <button type="button" class="wishlist-heart-btn" aria-label="Add to wishlist">
                                <i class="bi bi-heart"></i>
                            </button>
                        </div>
                        <div class="card-content-section">
                            <div class="card-location">
                                <i class="bi bi-geo-alt-fill"></i>
                                Jaipur, Rajasthan
                            </div>
                            <div class="card-rating-row">
                                <div class="rating-stars-display">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-half"></i>
                                </div>
                                <span class="rating-text">4.6 (198)</span>
                            </div>
                            <h3 class="card-title-text">Jaipur Pink City Cultural Tour</h3>
                            <div class="card-features-list">
                                <div class="feature-item-inline">
                                    <i class="bi bi-calendar3"></i>
                                    <span>3 Days • 2 Nights</span>
                                </div>
                                <div class="feature-item-inline">
                                    <i class="bi bi-building"></i>
                                    <span>Heritage Hotels</span>
                                </div>
                                <div class="feature-item-inline">
                                    <i class="bi bi-camera-fill"></i>
                                    <span>City Tours</span>
                                </div>
                            </div>
                            <div class="card-price-section">
                                <div class="price-display">
                                    <span class="current-price-large">₹16,999</span>
                                    <span class="original-price-strike">₹26,999</span>
                                </div>
                                <div class="savings-text">Save 37%</div>
                            </div>
                            <div class="card-actions-row">
                                <a href="ViewDetails.aspx?id=5" class="view-details-btn">
                                    View Details
                                </a>
                                <a href="ViewDetails.aspx?id=5" class="book-now-btn-card">
                                    Book Now
                                    <i class="bi bi-arrow-right"></i>
                                </a>
                            </div>
                            <button type="button" class="share-icon-btn" aria-label="Share deal">
                                <i class="bi bi-share"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Card 6: Andaman Island Escape -->
                <div class="deal-card-wrapper" data-aos="fade-up" data-aos-duration="600" data-aos-delay="200">
                    <div class="deal-card">
                        <div class="card-image-section">
                            <img src="images/andaman-island.jpg" alt="Andaman Island Escape" class="card-main-image" loading="lazy" />
                            <div class="card-image-overlay">
                                <button type="button" class="quick-view-btn-card">
                                    <i class="bi bi-eye"></i>
                                    Quick View
                                </button>
                            </div>
                            <div class="discount-badge-top">
                                <i class="bi bi-lightning-fill"></i>
                                34% OFF
                            </div>
                            <button type="button" class="wishlist-heart-btn" aria-label="Add to wishlist">
                                <i class="bi bi-heart"></i>
                            </button>
                        </div>
                        <div class="card-content-section">
                            <div class="card-location">
                                <i class="bi bi-geo-alt-fill"></i>
                                Andaman & Nicobar Islands
                            </div>
                            <div class="card-rating-row">
                                <div class="rating-stars-display">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                </div>
                                <span class="rating-text">5.0 (156)</span>
                            </div>
                            <h3 class="card-title-text">Andaman Tropical Island Escape</h3>
                            <div class="card-features-list">
                                <div class="feature-item-inline">
                                    <i class="bi bi-calendar3"></i>
                                    <span>7 Days • 6 Nights</span>
                                </div>
                                <div class="feature-item-inline">
                                    <i class="bi bi-airplane-fill"></i>
                                    <span>Flights Included</span>
                                </div>
                                <div class="feature-item-inline">
                                    <i class="bi bi-water"></i>
                                    <span>Water Sports</span>
                                </div>
                            </div>
                            <div class="card-price-section">
                                <div class="price-display">
                                    <span class="current-price-large">₹32,999</span>
                                    <span class="original-price-strike">₹49,999</span>
                                </div>
                                <div class="savings-text">Save 34%</div>
                            </div>
                            <div class="card-actions-row">
                                <a href="ViewDetails.aspx?id=6" class="view-details-btn">
                                    View Details
                                </a>
                                <a href="ViewDetails.aspx?id=6" class="book-now-btn-card">
                                    Book Now
                                    <i class="bi bi-arrow-right"></i>
                                </a>
                            </div>
                            <button type="button" class="share-icon-btn" aria-label="Share deal">
                                <i class="bi bi-share"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ==========================================
         FEATURED DEAL BANNER - COMPLETELY FIXED
         ========================================== -->
    <section class="featured-banner-section" data-aos="fade-up">
        <div class="featured-card-container">
            <!-- Left Section - IMAGE (WAS MISSING) -->
            <div class="featured-left-image">
                <img src="images/bali-destination.jpg" alt="Bali Paradise" class="destination-cover-image" />
                <div class="image-dark-overlay"></div>
                
                <!-- Trending Badge (Top-Left) -->
                <div class="trending-badge">
                    <i class="bi bi-graph-up-arrow"></i>
                    <span>Trending</span>
                </div>
                
                <!-- 80% Booked Badge (Bottom-Left) -->
                <div class="booked-badge">
                    <i class="bi bi-fire"></i>
                    <span>80% Booked</span>
                </div>
            </div>

            <!-- Right Section - DETAILS (FIXED STRUCTURE) -->
            <div class="featured-right-details">
                <!-- Deal of the Day Badge -->
                <div class="deal-of-day-badge">
                    <span class="badge-shimmer-effect"></span>
                    <span class="badge-text">DEAL OF THE DAY</span>
                </div>

                <h2 class="featured-destination-name">Bali Paradise Getaway</h2>
                <p class="featured-description">Experience the magic of Bali with luxury resorts, pristine beaches, and cultural adventures.</p>

                <!-- Offer Ends In Label -->
                <div class="offer-ends-label">
                    <i class="bi bi-alarm-fill"></i>
                    <span>OFFER ENDS IN</span>
                </div>

                <!-- Countdown Timer (FIXED STYLING) -->
                <div class="countdown-timer-grid">
                    <div class="time-unit-box">
                        <span class="time-number">18</span>
                        <span class="time-label">HOURS</span>
                    </div>
                    <div class="time-unit-box">
                        <span class="time-number">45</span>
                        <span class="time-label">MINUTES</span>
                    </div>
                    <div class="time-unit-box">
                        <span class="time-number">32</span>
                        <span class="time-label">SECONDS</span>
                    </div>
                </div>

                <!-- Features Checklist -->
                <div class="features-checklist">
                    <div class="feature-check-item">
                        <div class="checkmark-circle">
                            <i class="bi bi-check"></i>
                        </div>
                        <span>5 Star Resort Stay</span>
                    </div>
                    <div class="feature-check-item">
                        <div class="checkmark-circle">
                            <i class="bi bi-check"></i>
                        </div>
                        <span>Direct Flights Included</span>
                    </div>
                    <div class="feature-check-item">
                        <div class="checkmark-circle">
                            <i class="bi bi-check"></i>
                        </div>
                        <span>Free Cancellation</span>
                    </div>
                    <div class="feature-check-item">
                        <div class="checkmark-circle">
                            <i class="bi bi-check"></i>
                        </div>
                        <span>Private Beach Access</span>
                    </div>
                    <div class="feature-check-item">
                        <div class="checkmark-circle">
                            <i class="bi bi-check"></i>
                        </div>
                        <span>Spa & Wellness Package</span>
                    </div>
                </div>

                <!-- Price Display -->
                <div class="featured-price-section">
                    <span class="featured-original-price">₹65,999</span>
                    <div class="featured-current-price">
                        <span class="price-amount">₹42,999</span>
                        <span class="price-per">/person</span>
                    </div>
                    <div class="urgency-text">
                        <i class="bi bi-fire"></i>
                        <span>Only 5 spots left!</span>
                    </div>
                </div>

                <!-- Book This Deal Button -->
                <button type="button" class="book-this-deal-button">
                    <span>Book This Deal</span>
                    <i class="bi bi-arrow-right"></i>
                </button>
            </div>
        </div>
    </section>

    <!-- Remaining Deal Cards (7-12) -->
    <section class="deals-grid-section">
        <div class="deals-grid-container">
            <div class="deals-grid">
                <!-- Card 7: Shimla Honeymoon -->
                <div class="deal-card-wrapper" data-aos="fade-up" data-aos-duration="600">
                    <div class="deal-card">
                        <div class="card-image-section">
                            <img src="images/shimla-hills.jpg" alt="Shimla Honeymoon" class="card-main-image" loading="lazy" />
                            <div class="card-image-overlay"></div>
                            <button type="button" class="wishlist-heart-btn" aria-label="Add to wishlist">
                                <i class="bi bi-heart"></i>
                            </button>
                            <div class="discount-badge-top">
                                <i class="bi bi-lightning-fill"></i>
                                35% OFF
                            </div>
                        </div>
                        <div class="card-content-section">
                            <div class="card-location">
                                <i class="bi bi-geo-alt-fill"></i>
                                Shimla, Himachal Pradesh
                            </div>
                            <h3 class="card-title-text">Shimla Romantic Honeymoon</h3>
                            <div class="card-rating-row">
                                <div class="rating-stars-display">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                </div>
                                <span class="rating-text">4.8 (223)</span>
                            </div>
                            <div class="card-features-list">
                                <div class="feature-item-inline">
                                    <i class="bi bi-calendar-week"></i>
                                    <span>5 Days • 4 Nights</span>
                                </div>
                                <div class="feature-item-inline">
                                    <i class="bi bi-heart-fill"></i>
                                    <span>Honeymoon Special</span>
                                </div>
                                <div class="feature-item-inline">
                                    <i class="bi bi-snow"></i>
                                    <span>Hill Station</span>
                                </div>
                            </div>
                            <div class="card-price-section">
                                <div class="price-display">
                                    <span class="current-price-large">₹21,999</span>
                                    <span class="original-price-strike">₹33,999</span>
                                </div>
                            </div>
                            <div class="savings-badge-inline">
                                <i class="bi bi-piggy-bank-fill"></i>
                                Save 35%
                            </div>
                            <div class="card-actions-row">
                                <a href="ViewDetails.aspx?id=7" class="view-details-btn">
                                    <span>View Details</span>
                                </a>
                                <a href="ViewDetails.aspx?id=7" class="book-now-btn-card">
                                    <span>Book Now</span>
                                    <i class="bi bi-arrow-right"></i>
                                </a>
                            </div>
                            <button type="button" class="share-icon-btn" aria-label="Share deal">
                                <i class="bi bi-share"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Card 8: Rishikesh Adventure -->
                <div class="deal-card-wrapper" data-aos="fade-up" data-aos-duration="600" data-aos-delay="100">
                    <div class="deal-card">
                        <div class="card-image-section">
                            <img src="images/rishikesh-rafting.jpg" alt="Rishikesh Adventure" class="card-main-image" loading="lazy" />
                            <div class="card-image-overlay"></div>
                            <button type="button" class="wishlist-heart-btn" aria-label="Add to wishlist">
                                <i class="bi bi-heart"></i>
                            </button>
                            <div class="discount-badge-top">
                                <i class="bi bi-lightning-fill"></i>
                                38% OFF
                            </div>
                        </div>
                        <div class="card-content-section">
                            <div class="card-location">
                                <i class="bi bi-geo-alt-fill"></i>
                                Rishikesh, Uttarakhand
                            </div>
                            <h3 class="card-title-text">Rishikesh Adventure & Yoga</h3>
                            <div class="card-rating-row">
                                <div class="rating-stars-display">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-half"></i>
                                </div>
                                <span class="rating-text">4.7 (178)</span>
                            </div>
                            <div class="card-features-list">
                                <div class="feature-item-inline">
                                    <i class="bi bi-calendar-week"></i>
                                    <span>4 Days • 3 Nights</span>
                                </div>
                                <div class="feature-item-inline">
                                    <i class="bi bi-bicycle"></i>
                                    <span>Adventure Sports</span>
                                </div>
                                <div class="feature-item-inline">
                                    <i class="bi bi-water"></i>
                                    <span>River Rafting</span>
                                </div>
                            </div>
                            <div class="card-price-section">
                                <div class="price-display">
                                    <span class="current-price-large">₹14,999</span>
                                    <span class="original-price-strike">₹23,999</span>
                                </div>
                            </div>
                            <div class="savings-badge-inline">
                                <i class="bi bi-piggy-bank-fill"></i>
                                Save 38%
                            </div>
                            <div class="card-actions-row">
                                <a href="ViewDetails.aspx?id=8" class="view-details-btn">
                                    <span>View Details</span>
                                </a>
                                <a href="ViewDetails.aspx?id=8" class="book-now-btn-card">
                                    <span>Book Now</span>
                                    <i class="bi bi-arrow-right"></i>
                                </a>
                            </div>
                            <button type="button" class="share-icon-btn" aria-label="Share deal">
                                <i class="bi bi-share"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Card 9: Coorg Nature Retreat -->
                <div class="deal-card-wrapper" data-aos="fade-up" data-aos-duration="600" data-aos-delay="200">
                    <div class="deal-card">
                        <div class="card-image-section">
                            <img src="images/coorg-coffee.jpg" alt="Coorg Nature Retreat" class="card-main-image" loading="lazy" />
                            <div class="card-image-overlay"></div>
                            <button type="button" class="wishlist-heart-btn" aria-label="Add to wishlist">
                                <i class="bi bi-heart"></i>
                            </button>
                            <div class="discount-badge-top">
                                <i class="bi bi-lightning-fill"></i>
                                36% OFF
                            </div>
                        </div>
                        <div class="card-content-section">
                            <div class="card-location">
                                <i class="bi bi-geo-alt-fill"></i>
                                Coorg, Karnataka
                            </div>
                            <h3 class="card-title-text">Coorg Coffee Plantation Retreat</h3>
                            <div class="card-rating-row">
                                <div class="rating-stars-display">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                </div>
                                <span class="rating-text">4.8 (201)</span>
                            </div>
                            <div class="card-features-list">
                                <div class="feature-item-inline">
                                    <i class="bi bi-calendar-week"></i>
                                    <span>4 Days • 3 Nights</span>
                                </div>
                                <div class="feature-item-inline">
                                    <i class="bi bi-tree-fill"></i>
                                    <span>Nature Tours</span>
                                </div>
                                <div class="feature-item-inline">
                                    <i class="bi bi-cup-hot-fill"></i>
                                    <span>Coffee Plantation</span>
                                </div>
                            </div>
                            <div class="card-price-section">
                                <div class="price-display">
                                    <span class="current-price-large">₹17,999</span>
                                    <span class="original-price-strike">₹27,999</span>
                                </div>
                            </div>
                            <div class="savings-badge-inline">
                                <i class="bi bi-piggy-bank-fill"></i>
                                Save 36%
                            </div>
                            <div class="card-actions-row">
                                <a href="ViewDetails.aspx?id=9" class="view-details-btn">
                                    <span>View Details</span>
                                </a>
                                <a href="ViewDetails.aspx?id=9" class="book-now-btn-card">
                                    <span>Book Now</span>
                                    <i class="bi bi-arrow-right"></i>
                                </a>
                            </div>
                            <button type="button" class="share-icon-btn" aria-label="Share deal">
                                <i class="bi bi-share"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Card 10: Darjeeling Tea Gardens -->
                <div class="deal-card-wrapper" data-aos="fade-up" data-aos-duration="600">
                    <div class="deal-card">
                        <div class="card-image-section">
                            <img src="images/darjeeling-tea.jpg" alt="Darjeeling Tea Gardens" class="card-main-image" loading="lazy" />
                            <div class="card-image-overlay"></div>
                            <button type="button" class="wishlist-heart-btn" aria-label="Add to wishlist">
                                <i class="bi bi-heart"></i>
                            </button>
                            <div class="discount-badge-top">
                                <i class="bi bi-lightning-fill"></i>
                                37% OFF
                            </div>
                        </div>
                        <div class="card-content-section">
                            <div class="card-location">
                                <i class="bi bi-geo-alt-fill"></i>
                                Darjeeling, West Bengal
                            </div>
                            <h3 class="card-title-text">Darjeeling Himalayan Tea Tour</h3>
                            <div class="card-rating-row">
                                <div class="rating-stars-display">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-half"></i>
                                </div>
                                <span class="rating-text">4.7 (189)</span>
                            </div>
                            <div class="card-features-list">
                                <div class="feature-item-inline">
                                    <i class="bi bi-calendar-week"></i>
                                    <span>5 Days • 4 Nights</span>
                                </div>
                                <div class="feature-item-inline">
                                    <i class="bi bi-train-front"></i>
                                    <span>Toy Train Ride</span>
                                </div>
                                <div class="feature-item-inline">
                                    <i class="bi bi-cup-hot-fill"></i>
                                    <span>Tea Gardens</span>
                                </div>
                            </div>
                            <div class="card-price-section">
                                <div class="price-display">
                                    <span class="current-price-large">₹19,499</span>
                                    <span class="original-price-strike">₹30,999</span>
                                </div>
                            </div>
                            <div class="savings-badge-inline">
                                <i class="bi bi-piggy-bank-fill"></i>
                                Save 37%
                            </div>
                            <div class="card-actions-row">
                                <a href="ViewDetails.aspx?id=10" class="view-details-btn">
                                    <span>View Details</span>
                                </a>
                                <a href="ViewDetails.aspx?id=10" class="book-now-btn-card">
                                    <span>Book Now</span>
                                    <i class="bi bi-arrow-right"></i>
                                </a>
                            </div>
                            <button type="button" class="share-icon-btn" aria-label="Share deal">
                                <i class="bi bi-share"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Card 11: Leh Ladakh Expedition -->
                <div class="deal-card-wrapper" data-aos="fade-up" data-aos-duration="600" data-aos-delay="100">
                    <div class="deal-card">
                        <div class="card-image-section">
                            <img src="images/ladakh-mountains.jpg" alt="Leh Ladakh Expedition" class="card-main-image" loading="lazy" />
                            <div class="card-image-overlay"></div>
                            <button type="button" class="wishlist-heart-btn" aria-label="Add to wishlist">
                                <i class="bi bi-heart"></i>
                            </button>
                            <div class="discount-badge-top">
                                <i class="bi bi-lightning-fill"></i>
                                33% OFF
                            </div>
                        </div>
                        <div class="card-content-section">
                            <div class="card-location">
                                <i class="bi bi-geo-alt-fill"></i>
                                Leh Ladakh, Jammu & Kashmir
                            </div>
                            <h3 class="card-title-text">Leh Ladakh Mountain Expedition</h3>
                            <div class="card-rating-row">
                                <div class="rating-stars-display">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                </div>
                                <span class="rating-text">5.0 (142)</span>
                            </div>
                            <div class="card-features-list">
                                <div class="feature-item-inline">
                                    <i class="bi bi-calendar-week"></i>
                                    <span>8 Days • 7 Nights</span>
                                </div>
                                <div class="feature-item-inline">
                                    <i class="bi bi-bicycle"></i>
                                    <span>Bike Adventure</span>
                                </div>
                                <div class="feature-item-inline">
                                    <i class="bi bi-snow2"></i>
                                    <span>High Altitude</span>
                                </div>
                            </div>
                            <div class="card-price-section">
                                <div class="price-display">
                                    <span class="current-price-large">₹39,999</span>
                                    <span class="original-price-strike">₹59,999</span>
                                </div>
                            </div>
                            <div class="savings-badge-inline">
                                <i class="bi bi-piggy-bank-fill"></i>
                                Save 33%
                            </div>
                            <div class="card-actions-row">
                                <a href="ViewDetails.aspx?id=11" class="view-details-btn">
                                    <span>View Details</span>
                                </a>
                                <a href="ViewDetails.aspx?id=11" class="book-now-btn-card">
                                    <span>Book Now</span>
                                    <i class="bi bi-arrow-right"></i>
                                </a>
                            </div>
                            <button type="button" class="share-icon-btn" aria-label="Share deal">
                                <i class="bi bi-share"></i>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Card 12: Mumbai City Break -->
                <div class="deal-card-wrapper" data-aos="fade-up" data-aos-duration="600" data-aos-delay="200">
                    <div class="deal-card">
                        <div class="card-image-section">
                            <img src="images/mumbai-city.jpg" alt="Mumbai City Break" class="card-main-image" loading="lazy" />
                            <div class="card-image-overlay"></div>
                            <button type="button" class="wishlist-heart-btn" aria-label="Add to wishlist">
                                <i class="bi bi-heart"></i>
                            </button>
                            <div class="discount-badge-top">
                                <i class="bi bi-lightning-fill"></i>
                                35% OFF
                            </div>
                        </div>
                        <div class="card-content-section">
                            <div class="card-location">
                                <i class="bi bi-geo-alt-fill"></i>
                                Mumbai, Maharashtra
                            </div>
                            <h3 class="card-title-text">Mumbai City Break & Bollywood</h3>
                            <div class="card-rating-row">
                                <div class="rating-stars-display">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-half"></i>
                                </div>
                                <span class="rating-text">4.6 (167)</span>
                            </div>
                            <div class="card-features-list">
                                <div class="feature-item-inline">
                                    <i class="bi bi-calendar-week"></i>
                                    <span>3 Days • 2 Nights</span>
                                </div>
                                <div class="feature-item-inline">
                                    <i class="bi bi-buildings"></i>
                                    <span>City Tours</span>
                                </div>
                                <div class="feature-item-inline">
                                    <i class="bi bi-film"></i>
                                    <span>Bollywood Studios</span>
                                </div>
                            </div>
                            <div class="card-price-section">
                                <div class="price-display">
                                    <span class="current-price-large">₹12,999</span>
                                    <span class="original-price-strike">₹19,999</span>
                                </div>
                            </div>
                            <div class="savings-badge-inline">
                                <i class="bi bi-piggy-bank-fill"></i>
                                Save 35%
                            </div>
                            <div class="card-actions-row">
                                <a href="ViewDetails.aspx?id=12" class="view-details-btn">
                                    <span>View Details</span>
                                </a>
                                <a href="ViewDetails.aspx?id=12" class="book-now-btn-card">
                                    <span>Book Now</span>
                                    <i class="bi bi-arrow-right"></i>
                                </a>
                            </div>
                            <button type="button" class="share-icon-btn" aria-label="Share deal">
                                <i class="bi bi-share"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ==========================================
         LOAD MORE BUTTON - FIXED STYLING
         ========================================== -->
    <section class="load-more-section">
        <button type="button" class="load-more-deals-btn" id="loadMoreBtn">
            <span>Load More Deals</span>
            <i class="bi bi-arrow-down-circle"></i>
        </button>
    </section>

    <!-- ==========================================
         NEWSLETTER SECTION - REMOVED WAVES, FIXED LAYOUT
         ========================================== -->
    <section class="newsletter-section-fixed">
        <div class="newsletter-content-grid">
            <!-- Left Side -->
            <div class="newsletter-left-side">
                <div class="bell-icon-container">
                    <i class="bi bi-bell-fill"></i>
                </div>
                <h2 class="newsletter-heading">Never Miss a Deal!</h2>
                <p class="newsletter-subtext">Subscribe to get exclusive offers delivered to your inbox</p>
                
                <div class="trust-indicators-row">
                    <div class="trust-indicator">
                        <i class="bi bi-people-fill"></i>
                        <span><strong class="counter-animate" data-target="10000">0</strong>+ subscribers</span>
                    </div>
                    <div class="trust-indicator">
                        <i class="bi bi-shield-check"></i>
                        <span>No spam guarantee</span>
                    </div>
                </div>
            </div>

            <!-- Right Side -->
            <div class="newsletter-right-side">
                <div class="email-input-container">
                    <input 
                        type="email" 
                        class="newsletter-email-field" 
                        placeholder="Enter your email address"
                        id="newsletterEmailInput"
                        aria-label="Email address"
                    />
                    <button type="button" class="newsletter-subscribe-btn">
                        <span>Subscribe</span>
                        <i class="bi bi-send-fill"></i>
                    </button>
                </div>
                <div class="privacy-text">
                    <i class="bi bi-lock-fill"></i>
                    <span>We respect your privacy</span>
                </div>
                
                <!-- Success Message -->
                <div class="subscribe-success-msg" id="subscribeSuccess">
                    <i class="bi bi-check-circle-fill"></i>
                    <span>You're subscribed! Check your email ✓</span>
                </div>
            </div>
        </div>
    </section>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="js/Deals.js"></script>
</asp:Content>
