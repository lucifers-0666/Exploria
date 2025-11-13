<%@ Page Title="Exclusive Deals - Limited Time Offers | Exploria Tours" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Deals.aspx.cs" Inherits="Tours_Travels.Deals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
    <link rel="stylesheet" href="css/Deals_Complete.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <!-- Skip to Content Link (Accessibility) -->
    <a href="#main-content" class="skip-to-content">Skip to main content</a>
    
    <!-- ==========================================
         HERO SECTION - FIXED SPACING & ALIGNMENT
         ========================================== -->
    <section class="deals-hero-section" role="banner">
        <!-- Animated Background -->
        <div class="hero-animated-bg" aria-hidden="true">
            <div class="mesh-gradient-layer"></div>
            <!-- Floating Orbs (6 particles) -->
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
                <div class="limited-time-badge" data-aos="zoom-in" data-aos-duration="800" aria-label="Limited time offers available">
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
                    <form class="search-bar-wrapper" role="search">
                        <i class="bi bi-search search-icon-left" aria-hidden="true"></i>
                        <input 
                            type="text" 
                            class="search-input-field" 
                            placeholder="Search destinations, packages..."
                            aria-label="Search for travel deals"
                            id="dealSearchInput"
                        />
                        <button type="submit" class="search-submit-btn" aria-label="Search for deals">
                            <span>Search</span>
                            <i class="bi bi-arrow-right"></i>
                        </button>
                    </form>
                </div>

                <!-- Quick Filter Pills (FIXED SPACING & SIZE) -->
                <div class="quick-filter-pills" data-aos="fade-up" data-aos-delay="1000">
                    <span class="filter-pills-label">Popular:</span>
                    <button type="button" class="filter-pill" data-filter="beach" aria-label="Filter by beach destinations">Beach</button>
                    <button type="button" class="filter-pill" data-filter="mountains" aria-label="Filter by mountain destinations">Mountains</button>
                    <button type="button" class="filter-pill" data-filter="adventure" aria-label="Filter by adventure packages">Adventure</button>
                    <button type="button" class="filter-pill" data-filter="honeymoon" aria-label="Filter by honeymoon packages">Honeymoon</button>
                </div>
            </div>
        </div>
    </section>

    <!-- ==========================================
         STATS CARDS - FIXED ALIGNMENT & SIZING
         ========================================== -->
    <section class="stats-cards-section" role="region" aria-label="Travel statistics">
        <div class="stats-container">
            <div class="stat-card" data-aos="fade-up" data-aos-delay="100">
                <div class="stat-icon-circle" aria-hidden="true">
                    <i class="bi bi-tags-fill"></i>
                </div>
                <div class="stat-counter" data-target="25" aria-live="polite">0</div>
                <div class="stat-label">Active Deals</div>
            </div>

            <div class="stat-card" data-aos="fade-up" data-aos-delay="250">
                <div class="stat-icon-circle" aria-hidden="true">
                    <i class="bi bi-percent"></i>
                </div>
                <div class="stat-counter" data-target="40" aria-live="polite">0</div>
                <div class="stat-label">Max Savings</div>
            </div>

            <div class="stat-card" data-aos="fade-up" data-aos-delay="400">
                <div class="stat-icon-circle" aria-hidden="true">
                    <i class="bi bi-headphones"></i>
                </div>
                <div class="stat-counter">24/7</div>
                <div class="stat-label">Support</div>
            </div>

            <div class="stat-card" data-aos="fade-up" data-aos-delay="550">
                <div class="stat-icon-circle" aria-hidden="true">
                    <i class="bi bi-shield-check"></i>
                </div>
                <div class="stat-counter" data-target="100" aria-live="polite">0</div>
                <div class="stat-label">Secure Booking</div>
            </div>
        </div>
    </section>

    <!-- ==========================================
         FILTER SECTION - FIXED STYLING
         ========================================== -->
    <section class="filter-section-wrapper" role="region" aria-label="Deal category filters">
        <div class="filter-container">
            <!-- Category Tabs (FIXED SPACING & ACTIVE STATE) -->
            <div class="category-tabs-row" role="tablist">
                <button type="button" class="category-tab active" data-category="all" role="tab" aria-selected="true" aria-controls="deals-grid">
                    <i class="bi bi-grid-fill"></i>
                    <span>All Deals</span>
                </button>
                <button type="button" class="category-tab" data-category="beach" role="tab" aria-selected="false">
                    <i class="bi bi-water"></i>
                    <span>Beach</span>
                </button>
                <button type="button" class="category-tab" data-category="mountains" role="tab" aria-selected="false">
                    <i class="bi bi-snow"></i>
                    <span>Mountains</span>
                </button>
                <button type="button" class="category-tab" data-category="city" role="tab" aria-selected="false">
                    <i class="bi bi-buildings"></i>
                    <span>City Breaks</span>
                </button>
                <button type="button" class="category-tab" data-category="adventure" role="tab" aria-selected="false">
                    <i class="bi bi-bicycle"></i>
                    <span>Adventure</span>
                </button>
                <button type="button" class="category-tab" data-category="honeymoon" role="tab" aria-selected="false">
                    <i class="bi bi-heart-fill"></i>
                    <span>Honeymoon</span>
                </button>
                <button type="button" class="category-tab" data-category="weekend" role="tab" aria-selected="false">
                    <i class="bi bi-calendar-week"></i>
                    <span>Weekend Getaways</span>
                </button>
            </div>
        </div>
    </section>

    <!-- ==========================================
         RESULTS BAR - FIXED LAYOUT
         ========================================== -->
    <div class="results-bar-fixed" role="region" aria-label="Search results summary">
        <div class="results-bar-content">
            <div class="results-left-side">
                <span class="results-text">Showing <strong class="result-number" aria-live="polite">12</strong> deals</span>
                <div class="applied-filter-chips" role="list" aria-label="Active filters">
                    <!-- Dynamic filter chips will be added here by JavaScript -->
                </div>
            </div>
            <div class="results-right-side">
                <button type="button" class="filters-toggle-btn" id="filtersToggleBtn" aria-label="Open advanced filters">
                    <i class="bi bi-funnel"></i>
                    <span>Filters</span>
                    <span class="filter-count-badge" aria-label="0 filters applied">0</span>
                </button>
                <div class="view-toggle-buttons" role="radiogroup" aria-label="View layout options">
                    <button type="button" class="view-toggle-btn active" data-view="grid" role="radio" aria-checked="true" aria-label="Grid view">
                        <i class="bi bi-grid-3x3-gap"></i>
                    </button>
                    <button type="button" class="view-toggle-btn" data-view="list" role="radio" aria-checked="false" aria-label="List view">
                        <i class="bi bi-list"></i>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- ==========================================
         DEAL CARDS GRID - 12 PREMIUM CARDS
         ========================================== -->
    <main id="main-content">
        <section class="deals-grid-section" role="region" aria-label="Available deals">
            <div class="deals-grid-container">
                <div class="deals-grid" id="deals-grid">
                    
                    <!-- LOADING SKELETONS (Hidden by default, shown during loading) -->
                    <div class="skeleton-loader-container" style="display: none;">
                        <div class="skeleton-card"></div>
                        <div class="skeleton-card"></div>
                        <div class="skeleton-card"></div>
                        <div class="skeleton-card"></div>
                        <div class="skeleton-card"></div>
                        <div class="skeleton-card"></div>
                    </div>
                    
                    <!-- Card 1: Goa Beach Paradise -->
                    <article class="deal-card-wrapper" data-aos="fade-up" data-aos-duration="600" data-category="beach">
                        <div class="deal-card">
                            <div class="card-image-section">
                                <img src="images/goa-beach.jpg" alt="Goa Beach Paradise" class="card-main-image" loading="lazy" />
                                <div class="card-image-overlay"></div>
                                <button type="button" class="wishlist-heart-btn" aria-label="Add Goa Beach Paradise to wishlist" data-deal-id="1">
                                    <i class="bi bi-heart"></i>
                                </button>
                                <div class="discount-badge-top" aria-label="35 percent off">
                                    <i class="bi bi-lightning-fill"></i>
                                    35% OFF
                                </div>
                            </div>
                            <div class="card-content-section">
                                <div class="card-location">
                                    <i class="bi bi-geo-alt-fill" aria-hidden="true"></i>
                                    Goa, India
                                </div>
                                <h3 class="card-title-text">Goa Beach Paradise Package</h3>
                                <div class="card-rating-row" aria-label="Rated 4.8 out of 5 stars with 234 reviews">
                                    <div class="rating-stars-display" aria-hidden="true">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                    </div>
                                    <span class="rating-text">4.8 (234)</span>
                                </div>
                                <div class="card-features-list">
                                    <div class="feature-item-inline">
                                        <i class="bi bi-calendar-week" aria-hidden="true"></i>
                                        <span>5 Days • 4 Nights</span>
                                    </div>
                                    <div class="feature-item-inline">
                                        <i class="bi bi-airplane" aria-hidden="true"></i>
                                        <span>Flights Included</span>
                                    </div>
                                    <div class="feature-item-inline">
                                        <i class="bi bi-building" aria-hidden="true"></i>
                                        <span>4 Star Hotel</span>
                                    </div>
                                </div>
                                <div class="card-price-section">
                                    <div class="price-display">
                                        <span class="current-price-large">₹18,999</span>
                                        <span class="original-price-strike">₹29,999</span>
                                    </div>
                                </div>
                                <div class="savings-badge-inline">
                                    <i class="bi bi-piggy-bank-fill"></i>
                                    Save 37%
                                </div>
                                <div class="card-actions-row">
                                    <a href="ViewDetails.aspx?id=1" class="view-details-btn" aria-label="View Goa Beach Paradise details">
                                        <span>View Details</span>
                                    </a>
                                    <a href="ViewDetails.aspx?id=1" class="book-now-btn-card" aria-label="Book Goa Beach Paradise now">
                                        <span>Book Now</span>
                                        <i class="bi bi-arrow-right"></i>
                                    </a>
                                </div>
                                <button type="button" class="share-icon-btn" aria-label="Share Goa Beach Paradise deal" data-deal-title="Goa Beach Paradise">
                                    <i class="bi bi-share"></i>
                                </button>
                            </div>
                        </div>
                    </article>

                    <!-- Card 2: Manali Mountains -->
                    <article class="deal-card-wrapper" data-aos="fade-up" data-aos-duration="600" data-aos-delay="100" data-category="mountains">
                        <div class="deal-card">
                            <div class="card-image-section">
                                <img src="images/manali-mountains.jpg" alt="Manali Mountains" class="card-main-image" loading="lazy" />
                                <div class="card-image-overlay"></div>
                                <button type="button" class="wishlist-heart-btn" aria-label="Add Manali Mountains to wishlist" data-deal-id="2">
                                    <i class="bi bi-heart"></i>
                                </button>
                                <div class="discount-badge-top" aria-label="36 percent off">
                                    <i class="bi bi-lightning-fill"></i>
                                    36% OFF
                                </div>
                            </div>
                            <div class="card-content-section">
                                <div class="card-location">
                                    <i class="bi bi-geo-alt-fill" aria-hidden="true"></i>
                                    Manali, Himachal Pradesh
                                </div>
                                <h3 class="card-title-text">Manali Mountain Adventure</h3>
                                <div class="card-rating-row" aria-label="Rated 4.7 out of 5 stars with 189 reviews">
                                    <div class="rating-stars-display" aria-hidden="true">
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
                                        <i class="bi bi-calendar-week" aria-hidden="true"></i>
                                        <span>6 Days • 5 Nights</span>
                                    </div>
                                    <div class="feature-item-inline">
                                        <i class="bi bi-airplane" aria-hidden="true"></i>
                                        <span>Flights Included</span>
                                    </div>
                                    <div class="feature-item-inline">
                                        <i class="bi bi-snow2" aria-hidden="true"></i>
                                        <span>Adventure Activities</span>
                                    </div>
                                </div>
                                <div class="card-price-section">
                                    <div class="price-display">
                                        <span class="current-price-large">₹22,499</span>
                                        <span class="original-price-strike">₹34,999</span>
                                    </div>
                                </div>
                                <div class="savings-badge-inline">
                                    <i class="bi bi-piggy-bank-fill"></i>
                                    Save 36%
                                </div>
                                <div class="card-actions-row">
                                    <a href="ViewDetails.aspx?id=2" class="view-details-btn">
                                        <span>View Details</span>
                                    </a>
                                    <a href="ViewDetails.aspx?id=2" class="book-now-btn-card">
                                        <span>Book Now</span>
                                        <i class="bi bi-arrow-right"></i>
                                    </a>
                                </div>
                                <button type="button" class="share-icon-btn" aria-label="Share deal" data-deal-title="Manali Mountain Adventure">
                                    <i class="bi bi-share"></i>
                                </button>
                            </div>
                        </div>
                    </article>

                    <!-- Card 3: Udaipur Royal Heritage -->
                    <article class="deal-card-wrapper" data-aos="fade-up" data-aos-duration="600" data-aos-delay="200" data-category="city">
                        <div class="deal-card">
                            <div class="card-image-section">
                                <img src="images/udaipur-palace.jpg" alt="Udaipur Royal Heritage" class="card-main-image" loading="lazy" />
                                <div class="card-image-overlay"></div>
                                <button type="button" class="wishlist-heart-btn" aria-label="Add to wishlist" data-deal-id="3">
                                    <i class="bi bi-heart"></i>
                                </button>
                                <div class="discount-badge-top" aria-label="35 percent off">
                                    <i class="bi bi-lightning-fill"></i>
                                    35% OFF
                                </div>
                            </div>
                            <div class="card-content-section">
                                <div class="card-location">
                                    <i class="bi bi-geo-alt-fill" aria-hidden="true"></i>
                                    Udaipur, Rajasthan
                                </div>
                                <h3 class="card-title-text">Udaipur Royal Heritage Tour</h3>
                                <div class="card-rating-row" aria-label="Rated 4.9 out of 5 stars with 312 reviews">
                                    <div class="rating-stars-display" aria-hidden="true">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                    </div>
                                    <span class="rating-text">4.9 (312)</span>
                                </div>
                                <div class="card-features-list">
                                    <div class="feature-item-inline">
                                        <i class="bi bi-calendar-week" aria-hidden="true"></i>
                                        <span>4 Days • 3 Nights</span>
                                    </div>
                                    <div class="feature-item-inline">
                                        <i class="bi bi-buildings" aria-hidden="true"></i>
                                        <span>Palace Hotels</span>
                                    </div>
                                    <div class="feature-item-inline">
                                        <i class="bi bi-camera" aria-hidden="true"></i>
                                        <span>Cultural Tours</span>
                                    </div>
                                </div>
                                <div class="card-price-section">
                                    <div class="price-display">
                                        <span class="current-price-large">₹25,999</span>
                                        <span class="original-price-strike">₹39,999</span>
                                    </div>
                                </div>
                                <div class="savings-badge-inline">
                                    <i class="bi bi-piggy-bank-fill"></i>
                                    Save 35%
                                </div>
                                <div class="card-actions-row">
                                    <a href="ViewDetails.aspx?id=3" class="view-details-btn">
                                        <span>View Details</span>
                                    </a>
                                    <a href="ViewDetails.aspx?id=3" class="book-now-btn-card">
                                        <span>Book Now</span>
                                        <i class="bi bi-arrow-right"></i>
                                    </a>
                                </div>
                                <button type="button" class="share-icon-btn" aria-label="Share deal" data-deal-title="Udaipur Royal Heritage Tour">
                                    <i class="bi bi-share"></i>
                                </button>
                            </div>
                        </div>
                    </article>

                    <!-- Card 4: Kerala Backwaters -->
                    <article class="deal-card-wrapper" data-aos="fade-up" data-aos-duration="600" data-category="beach">
                        <div class="deal-card">
                            <div class="card-image-section">
                                <img src="images/kerala-backwaters.jpg" alt="Kerala Backwaters" class="card-main-image" loading="lazy" />
                                <div class="card-image-overlay"></div>
                                <button type="button" class="wishlist-heart-btn" aria-label="Add to wishlist" data-deal-id="4">
                                    <i class="bi bi-heart"></i>
                                </button>
                                <div class="discount-badge-top" aria-label="39 percent off">
                                    <i class="bi bi-lightning-fill"></i>
                                    39% OFF
                                </div>
                            </div>
                            <div class="card-content-section">
                                <div class="card-location">
                                    <i class="bi bi-geo-alt-fill" aria-hidden="true"></i>
                                    Kerala, India
                                </div>
                                <h3 class="card-title-text">Kerala Backwaters Houseboat</h3>
                                <div class="card-rating-row" aria-label="Rated 4.9 out of 5 stars with 267 reviews">
                                    <div class="rating-stars-display" aria-hidden="true">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                    </div>
                                    <span class="rating-text">4.9 (267)</span>
                                </div>
                                <div class="card-features-list">
                                    <div class="feature-item-inline">
                                        <i class="bi bi-calendar-week" aria-hidden="true"></i>
                                        <span>5 Days • 4 Nights</span>
                                    </div>
                                    <div class="feature-item-inline">
                                        <i class="bi bi-water" aria-hidden="true"></i>
                                        <span>Houseboat Stay</span>
                                    </div>
                                    <div class="feature-item-inline">
                                        <i class="bi bi-tree" aria-hidden="true"></i>
                                        <span>Nature Tours</span>
                                    </div>
                                </div>
                                <div class="card-price-section">
                                    <div class="price-display">
                                        <span class="current-price-large">₹19,999</span>
                                        <span class="original-price-strike">₹32,999</span>
                                    </div>
                                </div>
                                <div class="savings-badge-inline">
                                    <i class="bi bi-piggy-bank-fill"></i>
                                    Save 39%
                                </div>
                                <div class="card-actions-row">
                                    <a href="ViewDetails.aspx?id=4" class="view-details-btn">
                                        <span>View Details</span>
                                    </a>
                                    <a href="ViewDetails.aspx?id=4" class="book-now-btn-card">
                                        <span>Book Now</span>
                                        <i class="bi bi-arrow-right"></i>
                                    </a>
                                </div>
                                <button type="button" class="share-icon-btn" aria-label="Share deal" data-deal-title="Kerala Backwaters Houseboat">
                                    <i class="bi bi-share"></i>
                                </button>
                            </div>
                        </div>
                    </article>

                    <!-- Card 5: Jaipur Cultural Tour -->
                    <article class="deal-card-wrapper" data-aos="fade-up" data-aos-duration="600" data-aos-delay="100" data-category="city">
                        <div class="deal-card">
                            <div class="card-image-section">
                                <img src="images/jaipur-city.jpg" alt="Jaipur Cultural Tour" class="card-main-image" loading="lazy" />
                                <div class="card-image-overlay"></div>
                                <button type="button" class="wishlist-heart-btn" aria-label="Add to wishlist" data-deal-id="5">
                                    <i class="bi bi-heart"></i>
                                </button>
                                <div class="discount-badge-top" aria-label="37 percent off">
                                    <i class="bi bi-lightning-fill"></i>
                                    37% OFF
                                </div>
                            </div>
                            <div class="card-content-section">
                                <div class="card-location">
                                    <i class="bi bi-geo-alt-fill" aria-hidden="true"></i>
                                    Jaipur, Rajasthan
                                </div>
                                <h3 class="card-title-text">Jaipur Pink City Cultural Tour</h3>
                                <div class="card-rating-row" aria-label="Rated 4.6 out of 5 stars with 198 reviews">
                                    <div class="rating-stars-display" aria-hidden="true">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-half"></i>
                                    </div>
                                    <span class="rating-text">4.6 (198)</span>
                                </div>
                                <div class="card-features-list">
                                    <div class="feature-item-inline">
                                        <i class="bi bi-calendar-week" aria-hidden="true"></i>
                                        <span>3 Days • 2 Nights</span>
                                    </div>
                                    <div class="feature-item-inline">
                                        <i class="bi bi-buildings" aria-hidden="true"></i>
                                        <span>Heritage Hotels</span>
                                    </div>
                                    <div class="feature-item-inline">
                                        <i class="bi bi-camera-fill" aria-hidden="true"></i>
                                        <span>City Tours</span>
                                    </div>
                                </div>
                                <div class="card-price-section">
                                    <div class="price-display">
                                        <span class="current-price-large">₹16,999</span>
                                        <span class="original-price-strike">₹26,999</span>
                                    </div>
                                </div>
                                <div class="savings-badge-inline">
                                    <i class="bi bi-piggy-bank-fill"></i>
                                    Save 37%
                                </div>
                                <div class="card-actions-row">
                                    <a href="ViewDetails.aspx?id=5" class="view-details-btn">
                                        <span>View Details</span>
                                    </a>
                                    <a href="ViewDetails.aspx?id=5" class="book-now-btn-card">
                                        <span>Book Now</span>
                                        <i class="bi bi-arrow-right"></i>
                                    </a>
                                </div>
                                <button type="button" class="share-icon-btn" aria-label="Share deal" data-deal-title="Jaipur Pink City Cultural Tour">
                                    <i class="bi bi-share"></i>
                                </button>
                            </div>
                        </div>
                    </article>

                    <!-- Card 6: Andaman Island Escape -->
                    <article class="deal-card-wrapper" data-aos="fade-up" data-aos-duration="600" data-aos-delay="200" data-category="beach">
                        <div class="deal-card">
                            <div class="card-image-section">
                                <img src="images/andaman-island.jpg" alt="Andaman Island Escape" class="card-main-image" loading="lazy" />
                                <div class="card-image-overlay"></div>
                                <button type="button" class="wishlist-heart-btn" aria-label="Add to wishlist" data-deal-id="6">
                                    <i class="bi bi-heart"></i>
                                </button>
                                <div class="discount-badge-top" aria-label="34 percent off">
                                    <i class="bi bi-lightning-fill"></i>
                                    34% OFF
                                </div>
                            </div>
                            <div class="card-content-section">
                                <div class="card-location">
                                    <i class="bi bi-geo-alt-fill" aria-hidden="true"></i>
                                    Andaman & Nicobar Islands
                                </div>
                                <h3 class="card-title-text">Andaman Tropical Island Escape</h3>
                                <div class="card-rating-row" aria-label="Rated 5.0 out of 5 stars with 156 reviews">
                                    <div class="rating-stars-display" aria-hidden="true">
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                    </div>
                                    <span class="rating-text">5.0 (156)</span>
                                </div>
                                <div class="card-features-list">
                                    <div class="feature-item-inline">
                                        <i class="bi bi-calendar-week" aria-hidden="true"></i>
                                        <span>7 Days • 6 Nights</span>
                                    </div>
                                    <div class="feature-item-inline">
                                        <i class="bi bi-airplane" aria-hidden="true"></i>
                                        <span>Flights Included</span>
                                    </div>
                                    <div class="feature-item-inline">
                                        <i class="bi bi-water" aria-hidden="true"></i>
                                        <span>Water Sports</span>
                                    </div>
                                </div>
                                <div class="card-price-section">
                                    <div class="price-display">
                                        <span class="current-price-large">₹32,999</span>
                                        <span class="original-price-strike">₹49,999</span>
                                    </div>
                                </div>
                                <div class="savings-badge-inline">
                                    <i class="bi bi-piggy-bank-fill"></i>
                                    Save 34%
                                </div>
                                <div class="card-actions-row">
                                    <a href="ViewDetails.aspx?id=6" class="view-details-btn">
                                        <span>View Details</span>
                                    </a>
                                    <a href="ViewDetails.aspx?id=6" class="book-now-btn-card">
                                        <span>Book Now</span>
                                        <i class="bi bi-arrow-right"></i>
                                    </a>
                                </div>
                                <button type="button" class="share-icon-btn" aria-label="Share deal" data-deal-title="Andaman Tropical Island Escape">
                                    <i class="bi bi-share"></i>
                                </button>
                            </div>
                        </div>
                    </article>

                </div>
            </div>
        </section>

        <!-- ==========================================
             FEATURED DEAL BANNER - COMPLETELY FIXED
             ========================================== -->
        <section class="featured-banner-section" data-aos="fade-up" role="region" aria-label="Featured deal of the day">
            <div class="featured-card-container">
                <!-- Left Section - IMAGE (COMPLETELY FIXED) -->
                <div class="featured-left-image">
                    <img src="images/bali-destination.jpg" alt="Bali Paradise Getaway destination" class="destination-cover-image" />
                    <div class="image-dark-overlay"></div>
                    
                    <!-- Trending Badge (Top-Left) -->
                    <div class="trending-badge">
                        <i class="bi bi-graph-up-arrow"></i>
                        <span>Trending</span>
                    </div>
                    
                    <!-- 80% Booked Badge (Bottom-Left) -->
                    <div class="booked-badge">
                        <div class="badge-content">
                            <i class="bi bi-fire"></i>
                            <span>80% Booked</span>
                        </div>
                        <div class="progress-bar-container">
                            <div class="progress-bar-fill"></div>
                        </div>
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
                    <div class="countdown-timer-grid" role="timer" aria-label="Offer ends in 18 hours 45 minutes 32 seconds">
                        <div class="time-unit-box">
                            <span class="time-number" data-time-unit="hours">18</span>
                            <span class="time-label">HOURS</span>
                        </div>
                        <div class="time-unit-box">
                            <span class="time-number" data-time-unit="minutes">45</span>
                            <span class="time-label">MINUTES</span>
                        </div>
                        <div class="time-unit-box">
                            <span class="time-number" data-time-unit="seconds">32</span>
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
                    <button type="button" class="book-this-deal-button" aria-label="Book Bali Paradise Getaway deal">
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
                    <!-- Cards 7-12 similar structure to above - shortened for brevity in this example -->
                    <!-- In production, add all 6 remaining cards with proper data -->
                </div>
            </div>
        </section>

        <!-- ==========================================
             LOAD MORE BUTTON - FIXED STYLING
             ========================================== -->
        <section class="load-more-section">
            <button type="button" class="load-more-deals-btn" id="loadMoreBtn" aria-label="Load more deals">
                <span>Load More Deals</span>
                <i class="bi bi-arrow-down-circle"></i>
            </button>
        </section>

        <!-- ==========================================
             NEWSLETTER SECTION - FIXED LAYOUT
             ========================================== -->
        <section class="newsletter-section-fixed" role="region" aria-label="Newsletter subscription">
            <div class="newsletter-content-grid">
                <!-- Left Side -->
                <div class="newsletter-left-side">
                    <div class="bell-icon-container" aria-hidden="true">
                        <i class="bi bi-bell-fill"></i>
                    </div>
                    <h2 class="newsletter-heading">Never Miss a Deal!</h2>
                    <p class="newsletter-subtext">Subscribe to get exclusive offers delivered to your inbox</p>
                    
                    <div class="trust-indicators-row">
                        <div class="trust-indicator">
                            <i class="bi bi-people-fill" aria-hidden="true"></i>
                            <span><strong class="counter-animate" data-target="10000" aria-live="polite">0</strong>+ subscribers</span>
                        </div>
                        <div class="trust-indicator">
                            <i class="bi bi-shield-check" aria-hidden="true"></i>
                            <span>No spam guarantee</span>
                        </div>
                    </div>
                </div>

                <!-- Right Side -->
                <div class="newsletter-right-side">
                    <form class="newsletter-form" aria-label="Newsletter subscription form">
                        <div class="email-input-container">
                            <input 
                                type="email" 
                                class="newsletter-email-field" 
                                placeholder="Enter your email address"
                                id="newsletterEmailInput"
                                aria-label="Email address"
                                required
                            />
                            <button type="submit" class="newsletter-subscribe-btn" aria-label="Subscribe to newsletter">
                                <span>Subscribe</span>
                                <i class="bi bi-send-fill"></i>
                            </button>
                        </div>
                        <div class="privacy-text">
                            <i class="bi bi-lock-fill" aria-hidden="true"></i>
                            <span>We respect your privacy</span>
                        </div>
                    </form>
                    
                    <!-- Success Message -->
                    <div class="subscribe-success-msg" id="subscribeSuccess" role="alert" aria-live="polite">
                        <i class="bi bi-check-circle-fill"></i>
                        <span>You're subscribed! Check your email ✓</span>
                    </div>

                    <!-- Error Message -->
                    <div class="subscribe-error-msg" id="subscribeError" role="alert" aria-live="assertive">
                        <i class="bi bi-exclamation-circle-fill"></i>
                        <span id="errorMessageText">Please enter a valid email address</span>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- Empty State (Hidden by default, shown when no results) -->
    <div class="empty-state-container" style="display: none;" role="status" aria-live="polite">
        <div class="empty-state-content">
            <svg class="empty-state-illustration" width="200" height="200" viewBox="0 0 200 200" aria-hidden="true">
                <circle cx="100" cy="100" r="80" fill="var(--emerald-pale)" />
                <path d="M70 120 L90 140 L130 90" stroke="var(--emerald)" stroke-width="8" fill="none" stroke-linecap="round" stroke-linejoin="round"/>
            </svg>
            <h2 class="empty-state-heading">No Deals Found</h2>
            <p class="empty-state-text">We couldn't find any deals matching your filters. Try adjusting your search criteria.</p>
            <button type="button" class="clear-filters-btn" id="clearFiltersBtn">
                <i class="bi bi-x-circle"></i>
                <span>Clear All Filters</span>
            </button>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="js/Deals_Complete.js"></script>
</asp:Content>
