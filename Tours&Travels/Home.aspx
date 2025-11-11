<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Tours_Travels.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="css/Home.css?v=3.0" />
<style>
/* Additional inline critical CSS for immediate rendering */
@keyframes iconPulseCount {
    0%, 100% { transform: scale(1); }
    10%, 30%, 50%, 70%, 90% { transform: scale(1.15); }
    20%, 40%, 60%, 80% { transform: scale(1); }
}
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <section
      id="home"
      class="hero-section relative overflow-hidden"
    >
      <!-- Multi-layer Background System -->
      <div class="hero-background-layer absolute inset-0 parallax-bg"
        style="background-image: url('https://images.unsplash.com/photo-1488646953014-85cb44e25828?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');">
      </div>
      
      <!-- Gradient Overlay with Pulse Animation -->
      <div class="absolute inset-0 hero-gradient-overlay"></div>
      <div class="absolute inset-0 hero-radial-gradient"></div>

      <!-- Animated Floating Shapes (Optimized - Reduced from 10 to 4) -->
      <div class="hero-floating-shapes">
        <div class="floating-shape shape-1"></div>
        <div class="floating-shape shape-2"></div>
        <div class="floating-shape shape-3"></div>
        <div class="floating-shape shape-4"></div>
      </div>

      <!-- Hero Content -->
      <div class="hero-content relative z-10 text-center text-white px-4 sm:px-6 container mx-auto">
        
        <!-- Trust Badge -->
        <div class="trust-badge">
          <i class="las la-star"></i>
          <span>Trusted by 10,000+ Travelers</span>
        </div>

        <!-- Main Headline with Animation - REDESIGNED -->
        <h1 class="hero-headline">
          <span class="headline-line-1">Explore breathtaking destinations,</span>
          <span class="headline-line-2">create unforgettable memories</span>
          <span class="headline-line-3">and embark on the journey of a lifetime</span>
        </h1>

        <!-- Subheading -->
        <p class="hero-subtitle">
          with our expertly crafted tours that immerse you in local culture, 
          connect you with nature, and create experiences you'll treasure forever
        </p>

        <!-- CTA Buttons -->
        <div class="hero-cta-container">
          <a href="Destination.aspx" class="hero-btn-primary">
            <span>Explore Destinations</span>
            <i class="las la-arrow-right"></i>
          </a>
          <button class="hero-btn-secondary" onclick="openVideoModal()">
            <i class="las la-play-circle"></i>
            <span>Watch Our Story</span>
          </button>
        </div>
      </div>

      <!-- Statistics Bar - REDESIGNED (Outside hero-content for absolute positioning) -->
      <div class="hero-stats-bar">
        <div class="hero-stat">
          <i class="las la-map-marker"></i>
          <div class="stat-number" data-target="50">0</div>
          <div class="stat-label">Destinations</div>
        </div>
        <div class="hero-stat">
          <i class="las la-users"></i>
          <div class="stat-number" data-target="10000">0</div>
          <div class="stat-label">Happy Travelers</div>
        </div>
        <div class="hero-stat">
          <i class="las la-star"></i>
          <div class="stat-number" data-target="4.9">0</div>
          <div class="stat-label">Average Rating</div>
        </div>
      </div>

      <!-- Floating Search Bar -->
      <div class="hero-search-bar">
        <div class="search-segment">
          <i class="las la-map-marker"></i>
          <div class="search-input-wrapper">
            <label>Where to?</label>
            <input type="text" placeholder="Search destinations" id="searchDestination" />
          </div>
        </div>
        <div class="search-divider"></div>
        <div class="search-segment">
          <i class="las la-calendar"></i>
          <div class="search-input-wrapper">
            <label>When?</label>
            <input type="text" placeholder="Select dates" id="searchDates" />
          </div>
        </div>
        <div class="search-divider"></div>
        <div class="search-segment">
          <i class="las la-users"></i>
          <div class="search-input-wrapper">
            <label>Who?</label>
            <input type="text" placeholder="1 Traveler" id="searchTravelers" readonly />
          </div>
        </div>
        <button class="search-button">
          <i class="las la-search"></i>
          <span>Search</span>
        </button>
      </div>

      <!-- Scroll Indicator -->
      <div class="scroll-indicator" id="scrollIndicator">
        <div class="scroll-text">Scroll to Explore</div>
        <i class="las la-chevron-down"></i>
      </div>

      <!-- Section Separator -->
      <div class="section-separator">
        <svg
          data-name="Layer 1"
          xmlns="http://www.w3.org/2000/svg"
          viewBox="0 0 1200 120"
          preserveAspectRatio="none"
        >
          <path
            d="M1200 120L0 16.48 0 0 1200 0 1200 120z"
            class="shape-fill"
          ></path>
        </svg>
      </div>
    </section>

    <!-- Video Modal -->
    <div class="video-modal" id="videoModal" onclick="closeVideoModal(event)">
      <div class="video-modal-content" onclick="event.stopPropagation()">
        <button class="video-modal-close" onclick="closeVideoModal()">&times;</button>
        <div class="video-wrapper">
          <iframe id="videoPlayer" src="" frameborder="0" allowfullscreen></iframe>
        </div>
      </div>
    </div>

    <script>
      // Counter Animation with easing
      function animateCounter(element) {
        const target = parseFloat(element.getAttribute('data-target'));
        const duration = 2000;
        const isDecimal = target % 1 !== 0;
        const startTime = performance.now();
        
        function easeOutExpo(t) {
          return t === 1 ? 1 : 1 - Math.pow(2, -10 * t);
        }

        function updateCounter(currentTime) {
          const elapsed = currentTime - startTime;
          const progress = Math.min(elapsed / duration, 1);
          const easedProgress = easeOutExpo(progress);
          const current = easedProgress * target;
          
          if (progress < 1) {
            element.textContent = isDecimal ? current.toFixed(1) : Math.floor(current) + '+';
            requestAnimationFrame(updateCounter);
          } else {
            element.textContent = isDecimal ? target.toFixed(1) + '★' : target + '+';
          }
        }
        
        requestAnimationFrame(updateCounter);
      }

      // Initialize counters when hero is in view with pulse effect on icons
      const observerOptions = {
        threshold: 0.3
      };

      const heroObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            const stats = document.querySelectorAll('.hero-stat');
            stats.forEach((stat, index) => {
              setTimeout(() => {
                const number = stat.querySelector('.stat-number');
                const icon = stat.querySelector('i');
                animateCounter(number);
                // Pulse icon during counting
                icon.style.animation = 'iconPulseCount 2s ease-in-out';
              }, index * 200);
            });
            heroObserver.disconnect();
          }
        });
      }, observerOptions);

      const statsBar = document.querySelector('.hero-stats-bar');
      if (statsBar) {
        heroObserver.observe(statsBar);
      }

      // Parallax Effect - Background scroll
      window.addEventListener('scroll', () => {
        const scrolled = window.pageYOffset;
        const parallaxBg = document.querySelector('.parallax-bg');
        if (parallaxBg) {
          parallaxBg.style.transform = `translateY(${scrolled * 0.5}px)`;
        }

        // Hide scroll indicator after scrolling 100px
        const scrollIndicator = document.getElementById('scrollIndicator');
        if (scrollIndicator && scrolled > 100) {
          scrollIndicator.style.opacity = '0';
          scrollIndicator.style.pointerEvents = 'none';
        } else if (scrollIndicator && scrolled <= 100) {
          scrollIndicator.style.opacity = '0.8';
          scrollIndicator.style.pointerEvents = 'auto';
        }
      });



      // Video Modal Functions
      function openVideoModal() {
        const modal = document.getElementById('videoModal');
        const video = document.getElementById('videoPlayer');
        video.src = 'https://www.youtube.com/embed/dQw4w9WgXcQ?autoplay=1';
        modal.classList.add('active');
        document.body.style.overflow = 'hidden';
      }

      function closeVideoModal(event) {
        if (event && event.target !== event.currentTarget && !event.target.classList.contains('video-modal-close')) {
          return;
        }
        const modal = document.getElementById('videoModal');
        const video = document.getElementById('videoPlayer');
        video.src = '';
        modal.classList.remove('active');
        document.body.style.overflow = 'auto';
      }

      // Close modal with ESC key
      document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape') {
          closeVideoModal();
        }
      });

      // Smooth scroll for scroll indicator
      document.querySelector('.scroll-indicator')?.addEventListener('click', () => {
        document.querySelector('#destinations').scrollIntoView({ behavior: 'smooth' });
      });

      // Destinations Filter Chips
      document.querySelectorAll('.filter-chip').forEach(chip => {
        chip.addEventListener('click', function() {
          // Remove active class from all chips
          document.querySelectorAll('.filter-chip').forEach(c => c.classList.remove('active'));
          // Add active class to clicked chip
          this.classList.add('active');
          
          // Here you can add filtering logic
          const filter = this.textContent.trim();
          console.log('Filter selected:', filter);
        });
      });

      // Wishlist Toggle with Pulse Animation
      document.querySelectorAll('.wishlist-icon').forEach(icon => {
        icon.addEventListener('click', function(e) {
          e.stopPropagation();
          e.preventDefault();
          this.classList.toggle('active');
          
          // Add pulse animation
          this.classList.add('pulse');
          setTimeout(() => {
            this.classList.remove('pulse');
          }, 600);
          
          const heartIcon = this.querySelector('i');
          if (this.classList.contains('active')) {
            heartIcon.classList.remove('lar');
            heartIcon.classList.add('las');
          } else {
            heartIcon.classList.remove('las');
            heartIcon.classList.add('lar');
          }
        });
      });

      // Trust Stats Counter Animation
      function animateTrustStat(element) {
        const targetText = element.getAttribute('data-stat');
        const target = parseInt(targetText);
        
        if (isNaN(target)) {
          return; // Skip if not a number (like "5 min")
        }
        
        const duration = 2000;
        const startTime = performance.now();
        
        function easeOutExpo(t) {
          return t === 1 ? 1 : 1 - Math.pow(2, -10 * t);
        }

        function updateStat(currentTime) {
          const elapsed = currentTime - startTime;
          const progress = Math.min(elapsed / duration, 1);
          const easedProgress = easeOutExpo(progress);
          const current = Math.floor(easedProgress * target);
          
          if (progress < 1) {
            element.textContent = current + '+';
            requestAnimationFrame(updateStat);
          } else {
            element.textContent = target + '+';
          }
        }
        
        requestAnimationFrame(updateStat);
      }

      // Initialize trust stats counter when in view
      const trustObserverOptions = {
        threshold: 0.5
      };

      const trustObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            const stats = document.querySelectorAll('.trust-stat');
            stats.forEach((stat, index) => {
              setTimeout(() => {
                animateTrustStat(stat);
              }, index * 150);
            });
            trustObserver.disconnect();
          }
        });
      }, trustObserverOptions);

      const trustSection = document.querySelector('.trust-section');
      if (trustSection) {
        trustObserver.observe(trustSection);
      }

    </script>

    <main>
      <!-- Destinations Grid Section -->
      <section id="destinations" class="destinations-grid-section">
        <div class="destinations-container">
          <!-- Section Header -->
          <div class="destinations-header" data-aos="fade-up">
            <h2 class="destinations-title">
              Explore Our Curated Destinations
              <span class="title-underline"></span>
            </h2>
            <p class="destinations-subtitle">
              Discover 50+ handpicked destinations across the globe
            </p>
          </div>

          <!-- Filter & Sort Bar -->
          <div class="filter-sort-bar" data-aos="fade-up" data-aos-delay="100">
            <div class="filter-chips">
              <button class="filter-chip active">All</button>
              <button class="filter-chip">Popular</button>
              <button class="filter-chip">Adventure</button>
              <button class="filter-chip">Cultural</button>
              <button class="filter-chip">Beach</button>
            </div>
            <div class="sort-dropdown">
              <button class="sort-button">
                Sort by: Recommended
                <i class="las la-chevron-down"></i>
              </button>
            </div>
          </div>

          <!-- Destinations Cards Grid -->
          <div class="destinations-grid">
            
            <!-- Featured Card (Spans 2 columns) -->
            <div class="destination-card featured" data-aos="zoom-in" data-aos-delay="200">
              <div class="card-image-container">
                <img 
                  src="https://images.unsplash.com/photo-1549144511-f099e773c147?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80" 
                  alt="Machu Picchu, Peru"
                  class="card-image"
                />
                <div class="card-gradient-overlay"></div>
                
                <!-- Info Badges -->
                <div class="info-badges">
                  <span class="info-badge">7 Days</span>
                  <span class="info-badge">Moderate</span>
                  <span class="info-badge">Best: Apr-Oct</span>
                </div>
                
                <!-- Wishlist Icon -->
                <button class="wishlist-icon">
                  <i class="lar la-heart"></i>
                </button>
                
                <!-- Card Content -->
                <div class="card-content">
                  <div class="card-header">
                    <div>
                      <h3 class="destination-name">Machu Picchu</h3>
                      <p class="destination-location">
                        <i class="las la-map-marker"></i> Peru
                      </p>
                    </div>
                    <div class="price-tag">From $1,299</div>
                  </div>
                </div>
                
                <!-- Explore Button (appears on hover) -->
                <a href="Destination.aspx" class="explore-button">
                  View Details <i class="las la-arrow-right"></i>
                </a>
              </div>
            </div>

            <!-- Regular Cards -->
            <div class="destination-card" data-aos="zoom-in" data-aos-delay="250">
              <div class="card-image-container">
                <img 
                  src="https://images.unsplash.com/photo-1524413840807-0c3cb6fa808d?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" 
                  alt="Kyoto, Japan"
                  class="card-image"
                />
                <div class="card-gradient-overlay"></div>
                
                <div class="info-badges">
                  <span class="info-badge">5 Days</span>
                  <span class="info-badge">Easy</span>
                  <span class="info-badge">Best: Spring</span>
                </div>
                
                <button class="wishlist-icon">
                  <i class="lar la-heart"></i>
                </button>
                
                <div class="card-content">
                  <div class="card-header">
                    <div>
                      <h3 class="destination-name">Kyoto</h3>
                      <p class="destination-location">
                        <i class="las la-map-marker"></i> Japan
                      </p>
                    </div>
                    <div class="price-tag">From $899</div>
                  </div>
                </div>
                
                <a href="Destination.aspx" class="explore-button">
                  View Details <i class="las la-arrow-right"></i>
                </a>
              </div>
            </div>

            <div class="destination-card" data-aos="zoom-in" data-aos-delay="300">
              <div class="card-image-container">
                <img 
                  src="https://images.unsplash.com/photo-1499856871958-5b9627545d1a?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" 
                  alt="Paris, France"
                  class="card-image"
                />
                <div class="card-gradient-overlay"></div>
                
                <div class="info-badges">
                  <span class="info-badge">4 Days</span>
                  <span class="info-badge">Easy</span>
                  <span class="info-badge">Best: All Year</span>
                </div>
                
                <button class="wishlist-icon">
                  <i class="lar la-heart"></i>
                </button>
                
                <div class="card-content">
                  <div class="card-header">
                    <div>
                      <h3 class="destination-name">Paris</h3>
                      <p class="destination-location">
                        <i class="las la-map-marker"></i> France
                      </p>
                    </div>
                    <div class="price-tag">From $1,099</div>
                  </div>
                </div>
                
                <a href="Destination.aspx" class="explore-button">
                  View Details <i class="las la-arrow-right"></i>
                </a>
              </div>
            </div>

            <div class="destination-card" data-aos="zoom-in" data-aos-delay="350">
              <div class="card-image-container">
                <img 
                  src="https://images.unsplash.com/photo-1506905925346-21bda4d32df4?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" 
                  alt="Bora Bora"
                  class="card-image"
                />
                <div class="card-gradient-overlay"></div>
                
                <div class="info-badges">
                  <span class="info-badge">6 Days</span>
                  <span class="info-badge">Luxury</span>
                  <span class="info-badge">Best: May-Oct</span>
                </div>
                
                <button class="wishlist-icon">
                  <i class="lar la-heart"></i>
                </button>
                
                <div class="card-content">
                  <div class="card-header">
                    <div>
                      <h3 class="destination-name">Bora Bora</h3>
                      <p class="destination-location">
                        <i class="las la-map-marker"></i> French Polynesia
                      </p>
                    </div>
                    <div class="price-tag">From $2,499</div>
                  </div>
                </div>
                
                <a href="Destination.aspx" class="explore-button">
                  View Details <i class="las la-arrow-right"></i>
                </a>
              </div>
            </div>

            <div class="destination-card" data-aos="zoom-in" data-aos-delay="400">
              <div class="card-image-container">
                <img 
                  src="https://images.unsplash.com/photo-1513415564515-763d91423bdd?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" 
                  alt="Santorini, Greece"
                  class="card-image"
                />
                <div class="card-gradient-overlay"></div>
                
                <div class="info-badges">
                  <span class="info-badge">5 Days</span>
                  <span class="info-badge">Easy</span>
                  <span class="info-badge">Best: Summer</span>
                </div>
                
                <button class="wishlist-icon">
                  <i class="lar la-heart"></i>
                </button>
                
                <div class="card-content">
                  <div class="card-header">
                    <div>
                      <h3 class="destination-name">Santorini</h3>
                      <p class="destination-location">
                        <i class="las la-map-marker"></i> Greece
                      </p>
                    </div>
                    <div class="price-tag">From $1,399</div>
                  </div>
                </div>
                
                <a href="Destination.aspx" class="explore-button">
                  View Details <i class="las la-arrow-right"></i>
                </a>
              </div>
            </div>

            <div class="destination-card" data-aos="zoom-in" data-aos-delay="450">
              <div class="card-image-container">
                <img 
                  src="https://images.unsplash.com/photo-1523482580672-f109ba8cb9be?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" 
                  alt="Dubai, UAE"
                  class="card-image"
                />
                <div class="card-gradient-overlay"></div>
                
                <div class="info-badges">
                  <span class="info-badge">4 Days</span>
                  <span class="info-badge">Luxury</span>
                  <span class="info-badge">Best: Nov-Mar</span>
                </div>
                
                <button class="wishlist-icon">
                  <i class="lar la-heart"></i>
                </button>
                
                <div class="card-content">
                  <div class="card-header">
                    <div>
                      <h3 class="destination-name">Dubai</h3>
                      <p class="destination-location">
                        <i class="las la-map-marker"></i> UAE
                      </p>
                    </div>
                    <div class="price-tag">From $1,599</div>
                  </div>
                </div>
                
                <a href="Destination.aspx" class="explore-button">
                  View Details <i class="las la-arrow-right"></i>
                </a>
              </div>
            </div>

          </div>

          <!-- Load More Button -->
          <div class="load-more-container" data-aos="fade-up">
            <a href="Destination.aspx" class="load-more-button">
              View All Destinations <i class="las la-arrow-right"></i>
            </a>
          </div>

        </div>
      </section>

      <!-- Journey Planning / Features Section -->
      <section id="journey-planning" class="journey-features-section">
        <div class="journey-container">
          
          <!-- Image Side -->
          <div class="journey-image-side" data-aos="fade-right" data-aos-duration="600">
            <!-- Decorative Blob -->
            <div class="decorative-blob">
              <svg viewBox="0 0 200 200" xmlns="http://www.w3.org/2000/svg">
                <path fill="#E5CBAF" d="M44.7,-76.4C58.8,-69.2,71.8,-59.1,79.6,-45.8C87.4,-32.6,90,-16.3,88.5,-0.9C87,14.6,81.4,29.2,73.1,42.8C64.8,56.4,53.8,69,40.1,76.8C26.4,84.6,10,87.6,-5.8,87.1C-21.6,86.6,-43.2,82.6,-59.4,73.2C-75.6,63.8,-86.4,49,-91.1,32.4C-95.8,15.8,-94.4,-2.6,-88.7,-19.2C-83,-35.8,-73,-50.6,-59.8,-58.2C-46.6,-65.8,-30.2,-66.2,-15.3,-66.8C-0.4,-67.4,13,-68.2,44.7,-76.4Z" transform="translate(100 100)" />
              </svg>
            </div>

            <!-- Main Image -->
            <img 
              src="https://images.unsplash.com/photo-1488646953014-85cb44e25828?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" 
              alt="Travel Planning"
              class="journey-main-image"
            />

            <!-- Floating Satisfaction Rate Card -->
            <div class="floating-testimonial">
              <div class="testimonial-content">
                <div class="satisfaction-icon">
                  <i class="las la-thumbs-up"></i>
                </div>
                <div class="satisfaction-stat">95%</div>
                <p class="satisfaction-text">Satisfaction Rate</p>
                <div class="testimonial-stars">
                  <i class="las la-star"></i>
                  <i class="las la-star"></i>
                  <i class="las la-star"></i>
                  <i class="las la-star"></i>
                  <i class="las la-star"></i>
                </div>
              </div>
            </div>
          </div>

          <!-- Content Side -->
          <div class="journey-content-side" data-aos="fade-left" data-aos-duration="600" data-aos-delay="200">
            
            <!-- Section Tag -->
            <div class="section-tag">WHY CHOOSE US</div>

            <!-- Headline -->
            <h2 class="journey-headline">Crafting Your Perfect Journey</h2>

            <!-- Description -->
            <p class="journey-description">
              We believe travel is more than just visiting new places—it's about creating 
              unforgettable memories, discovering authentic cultures, and experiencing the 
              world in ways that truly transform you.
            </p>

            <!-- Feature Cards Grid -->
            <div class="feature-cards-grid">
              
              <!-- Feature Card 1 -->
              <div class="feature-card" data-aos="fade-up" data-aos-delay="300">
                <div class="feature-step-indicator">Step 1 of 4</div>
                <div class="feature-icon-container">
                  <i class="las la-user-friends"></i>
                </div>
                <h3 class="feature-title">Expert Local Guides</h3>
                <p class="feature-description">
                  Connect with passionate local experts who share hidden gems and authentic stories.
                </p>
              </div>

              <!-- Feature Card 2 -->
              <div class="feature-card" data-aos="fade-up" data-aos-delay="400">
                <div class="feature-step-indicator">Step 2 of 4</div>
                <div class="feature-icon-container">
                  <i class="las la-heart"></i>
                </div>
                <h3 class="feature-title">Authentic Experiences</h3>
                <p class="feature-description">
                  Immerse yourself in local culture through unique activities and genuine connections.
                </p>
              </div>

              <!-- Feature Card 3 -->
              <div class="feature-card" data-aos="fade-up" data-aos-delay="500">
                <div class="feature-step-indicator">Step 3 of 4</div>
                <div class="feature-icon-container">
                  <i class="las la-clipboard-check"></i>
                </div>
                <h3 class="feature-title">Seamless Planning</h3>
                <p class="feature-description">
                  Every detail perfectly organized so you can focus on making memories.
                </p>
              </div>

              <!-- Feature Card 4 -->
              <div class="feature-card" data-aos="fade-up" data-aos-delay="600">
                <div class="feature-step-indicator">Step 4 of 4</div>
                <div class="feature-icon-container">
                  <i class="las la-headset"></i>
                </div>
                <h3 class="feature-title">24/7 Support</h3>
                <p class="feature-description">
                  Our dedicated team is always available to assist you, wherever you are.
                </p>
              </div>

            </div>

            <!-- CTA Button -->
            <a href="Destination.aspx" class="journey-cta-button">
              Start Planning Your Journey <i class="las la-arrow-right"></i>
            </a>

          </div>

        </div>
      </section>

      <!-- How It Works Section - NEW -->
      <section id="how-it-works" class="how-it-works-section">
        <div class="how-it-works-container">
          
          <!-- Section Header -->
          <div class="section-header" data-aos="fade-up">
            <h2 class="section-title">How It Works</h2>
            <p class="section-subtitle">Your journey to adventure in 4 simple steps</p>
          </div>

          <!-- Steps Timeline -->
          <div class="steps-timeline">
            <!-- Animated connecting line -->
            <div class="timeline-line"></div>

            <!-- Step 1 -->
            <div class="step-item" data-aos="fade-up" data-aos-delay="100">
              <div class="step-icon-wrapper">
                <i class="las la-search-location"></i>
              </div>
              <div class="step-number">01</div>
              <h3 class="step-title">Choose Destination</h3>
              <p class="step-description">Browse our curated collection of amazing destinations worldwide</p>
            </div>

            <!-- Step 2 -->
            <div class="step-item" data-aos="fade-up" data-aos-delay="200">
              <div class="step-icon-wrapper">
                <i class="las la-sliders-h"></i>
              </div>
              <div class="step-number">02</div>
              <h3 class="step-title">Customize Your Trip</h3>
              <p class="step-description">Tailor your experience with activities, accommodation, and duration</p>
            </div>

            <!-- Step 3 -->
            <div class="step-item" data-aos="fade-up" data-aos-delay="300">
              <div class="step-icon-wrapper">
                <i class="las la-calendar-check"></i>
              </div>
              <div class="step-number">03</div>
              <h3 class="step-title">Book & Confirm</h3>
              <p class="step-description">Secure your dates with flexible payment options and instant confirmation</p>
            </div>

            <!-- Step 4 -->
            <div class="step-item" data-aos="fade-up" data-aos-delay="400">
              <div class="step-icon-wrapper">
                <i class="las la-plane-departure"></i>
              </div>
              <div class="step-number">04</div>
              <h3 class="step-title">Travel & Enjoy</h3>
              <p class="step-description">Pack your bags and embark on your unforgettable adventure</p>
            </div>
          </div>

        </div>
      </section>

      <!-- Why Choose Us / Trust Section -->
      <section id="why-choose-us" class="trust-section">
        <div class="trust-container">
          
          <!-- Section Header -->
          <div class="trust-header" data-aos="fade-up">
            <h2 class="trust-title">Why Choose Wanderlust Tours</h2>
            <p class="trust-subtitle">Your trusted partner for unforgettable adventures</p>
          </div>

          <!-- Trust Points Grid -->
          <div class="trust-points-grid">
            
            <!-- Trust Point 1 -->
            <div class="trust-point" data-aos="zoom-in" data-aos-delay="100">
              <div class="trust-stat" data-count="10000" data-suffix="+">0</div>
              <div class="trust-icon-container">
                <i class="las la-shield-alt"></i>
              </div>
              <h3 class="trust-point-title">Trusted & Safe</h3>
              <p class="trust-point-description">
                Safe journeys completed with highest safety standards and certified operators
              </p>
            </div>

            <!-- Trust Point 2 -->
            <div class="trust-point" data-aos="zoom-in" data-aos-delay="200">
              <div class="trust-stat" data-count="5" data-suffix=" min">0</div>
              <div class="trust-icon-container">
                <i class="las la-headset"></i>
              </div>
              <h3 class="trust-point-title">24/7 Support</h3>
              <p class="trust-point-description">
                Average response time for customer support worldwide, anytime you need us
              </p>
            </div>

            <!-- Trust Point 3 -->
            <div class="trust-point" data-aos="zoom-in" data-aos-delay="300">
              <div class="trust-stat" data-count="50" data-suffix="+">0</div>
              <div class="trust-icon-container">
                <i class="las la-trophy"></i>
              </div>
              <h3 class="trust-point-title">Award Winning</h3>
              <p class="trust-point-description">
                Industry awards and certifications from top travel bodies worldwide
              </p>
            </div>

          </div>

          <!-- Certifications Bar -->
          <div class="certifications-bar" data-aos="fade-up" data-aos-delay="400">
            <span class="certifications-text">Certified by:</span>
            <div class="certifications-logos">
              <img src="https://via.placeholder.com/120x40/1d5e33/ffffff?text=IATA" alt="IATA Certified" class="cert-logo" />
              <img src="https://via.placeholder.com/120x40/1d5e33/ffffff?text=ASTA" alt="ASTA Member" class="cert-logo" />
              <img src="https://via.placeholder.com/120x40/1d5e33/ffffff?text=WTTC" alt="WTTC Partner" class="cert-logo" />
              <img src="https://via.placeholder.com/120x40/1d5e33/ffffff?text=ISO" alt="ISO 9001" class="cert-logo" />
            </div>
          </div>

        </div>
      </section>

      <!-- Testimonials Section -->
      <section id="testimonials" class="testimonials-section">
        <!-- Decorative Quote Marks -->
        <div class="quote-decoration quote-top-left">"</div>
        <div class="quote-decoration quote-bottom-right">"</div>

        <div class="testimonials-container">
          
          <!-- Section Header -->
          <div class="testimonials-header" data-aos="fade-up">
            <h2 class="testimonials-title">What Our Travelers Say</h2>
            
            <!-- Overall Rating Display -->
            <div class="overall-rating">
              <div class="rating-number">4.9</div>
              <div class="rating-stars">
                <i class="las la-star"></i>
                <i class="las la-star"></i>
                <i class="las la-star"></i>
                <i class="las la-star"></i>
                <i class="las la-star"></i>
              </div>
              <p class="rating-text">Based on 2,500+ reviews</p>
            </div>
          </div>

          <!-- Testimonial Carousel -->
          <div class="testimonial-carousel-wrapper">
            
            <!-- Navigation Arrow Left -->
            <button class="carousel-arrow carousel-arrow-left" id="testimonialPrev">
              <i class="las la-chevron-left"></i>
            </button>

            <!-- Testimonial Cards Container -->
            <div class="testimonial-carousel" id="testimonialCarousel">
              
              <!-- Testimonial Card 1 -->
              <div class="testimonial-card">
                <i class="las la-quote-left quote-icon"></i>
                <p class="review-text">
                  The Swiss Alps tour was absolutely incredible! Every detail was perfectly 
                  planned, and the guides were knowledgeable and friendly. The accommodations 
                  exceeded our expectations. This was truly a trip of a lifetime!
                </p>
                <div class="reviewer-section">
                  <img 
                    src="https://images.unsplash.com/photo-1494790108755-2616b612b786?ixlib=rb-4.0.3&auto=format&fit=crop&w=150&q=80" 
                    alt="Sarah Johnson"
                    class="reviewer-avatar"
                  />
                  <div class="reviewer-info">
                    <div class="reviewer-name">
                      Sarah Johnson
                      <i class="las la-check-circle verified-badge" title="Verified Traveler"></i>
                    </div>
                    <div class="reviewer-rating">
                      <i class="las la-star"></i>
                      <i class="las la-star"></i>
                      <i class="las la-star"></i>
                      <i class="las la-star"></i>
                      <i class="las la-star"></i>
                    </div>
                    <div class="trip-details">Swiss Alps Adventure | Sept 2024</div>
                  </div>
                </div>
              </div>

              <!-- Testimonial Card 2 -->
              <div class="testimonial-card">
                <i class="las la-quote-left quote-icon"></i>
                <p class="review-text">
                  Japan exceeded all my expectations! The cultural immersion was authentic, 
                  and I learned so much about local traditions. Our guide was amazing and 
                  took us to hidden gems that most tourists never see.
                </p>
                <div class="reviewer-section">
                  <img 
                    src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&auto=format&fit=crop&w=150&q=80" 
                    alt="Michael Chen"
                    class="reviewer-avatar"
                  />
                  <div class="reviewer-info">
                    <div class="reviewer-name">
                      Michael Chen
                      <i class="las la-check-circle verified-badge" title="Verified Traveler"></i>
                    </div>
                    <div class="reviewer-rating">
                      <i class="las la-star"></i>
                      <i class="las la-star"></i>
                      <i class="las la-star"></i>
                      <i class="las la-star"></i>
                      <i class="las la-star"></i>
                    </div>
                    <div class="trip-details">Kyoto Cultural Tour | Aug 2024</div>
                  </div>
                </div>
              </div>

              <!-- Testimonial Card 3 -->
              <div class="testimonial-card">
                <i class="las la-quote-left quote-icon"></i>
                <p class="review-text">
                  Our Maldives honeymoon was pure paradise! The overwater villa was stunning, 
                  and the service was impeccable. Every moment was magical. We can't wait to 
                  book our next adventure with Wanderlust Tours!
                </p>
                <div class="reviewer-section">
                  <img 
                    src="https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&auto=format&fit=crop&w=150&q=80" 
                    alt="Emma Wilson"
                    class="reviewer-avatar"
                  />
                  <div class="reviewer-info">
                    <div class="reviewer-name">
                      Emma & David
                      <i class="las la-check-circle verified-badge" title="Verified Traveler"></i>
                    </div>
                    <div class="reviewer-rating">
                      <i class="las la-star"></i>
                      <i class="las la-star"></i>
                      <i class="las la-star"></i>
                      <i class="las la-star"></i>
                      <i class="las la-star"></i>
                    </div>
                    <div class="trip-details">Maldives Honeymoon | Oct 2024</div>
                  </div>
                </div>
              </div>

              <!-- Testimonial Card 4 -->
              <div class="testimonial-card">
                <i class="las la-quote-left quote-icon"></i>
                <p class="review-text">
                  The Peru adventure was life-changing! Machu Picchu at sunrise was breathtaking. 
                  Our guide's knowledge of Incan history made the experience so much richer. 
                  Everything was seamlessly organized.
                </p>
                <div class="reviewer-section">
                  <img 
                    src="https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&auto=format&fit=crop&w=150&q=80" 
                    alt="James Martinez"
                    class="reviewer-avatar"
                  />
                  <div class="reviewer-info">
                    <div class="reviewer-name">
                      James Martinez
                      <i class="las la-check-circle verified-badge" title="Verified Traveler"></i>
                    </div>
                    <div class="reviewer-rating">
                      <i class="las la-star"></i>
                      <i class="las la-star"></i>
                      <i class="las la-star"></i>
                      <i class="las la-star"></i>
                      <i class="las la-star"></i>
                    </div>
                    <div class="trip-details">Machu Picchu Trek | July 2024</div>
                  </div>
                </div>
              </div>

              <!-- Testimonial Card 5 -->
              <div class="testimonial-card">
                <i class="las la-quote-left quote-icon"></i>
                <p class="review-text">
                  Greece was absolutely stunning! From the sunsets in Santorini to the ancient 
                  ruins in Athens, every day brought new wonders. The food tours were a highlight. 
                  Highly recommend this company!
                </p>
                <div class="reviewer-section">
                  <img 
                    src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&auto=format&fit=crop&w=150&q=80" 
                    alt="Sophia Anderson"
                    class="reviewer-avatar"
                  />
                  <div class="reviewer-info">
                    <div class="reviewer-name">
                      Sophia Anderson
                      <i class="las la-check-circle verified-badge" title="Verified Traveler"></i>
                    </div>
                    <div class="reviewer-rating">
                      <i class="las la-star"></i>
                      <i class="las la-star"></i>
                      <i class="las la-star"></i>
                      <i class="las la-star"></i>
                      <i class="las la-star"></i>
                    </div>
                    <div class="trip-details">Greek Islands Tour | June 2024</div>
                  </div>
                </div>
              </div>

              <!-- Testimonial Card 6 -->
              <div class="testimonial-card">
                <i class="las la-quote-left quote-icon"></i>
                <p class="review-text">
                  Dubai was incredible! The blend of modern luxury and traditional culture was 
                  fascinating. Desert safari at sunset was unforgettable. Our guide made sure 
                  we experienced the best of everything.
                </p>
                <div class="reviewer-section">
                  <img 
                    src="https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&auto=format&fit=crop&w=150&q=80" 
                    alt="Ryan Cooper"
                    class="reviewer-avatar"
                  />
                  <div class="reviewer-info">
                    <div class="reviewer-name">
                      Ryan Cooper
                      <i class="las la-check-circle verified-badge" title="Verified Traveler"></i>
                    </div>
                    <div class="reviewer-rating">
                      <i class="las la-star"></i>
                      <i class="las la-star"></i>
                      <i class="las la-star"></i>
                      <i class="las la-star"></i>
                      <i class="las la-star"></i>
                    </div>
                    <div class="trip-details">Dubai Luxury Escape | Nov 2024</div>
                  </div>
                </div>
              </div>

            </div>

            <!-- Navigation Arrow Right -->
            <button class="carousel-arrow carousel-arrow-right" id="testimonialNext">
              <i class="las la-chevron-right"></i>
            </button>

          </div>

          <!-- Dots Indicator -->
          <div class="carousel-dots" id="carouselDots"></div>

          <!-- Link to Reviews -->
          <div class="reviews-link-container" data-aos="fade-up">
            <a href="#" class="reviews-link">
              Read all reviews on TripAdvisor
              <i class="las la-external-link-alt"></i>
            </a>
          </div>

        </div>
      </section>

      <section id="tour-experience" class="section-padding bg-white">
        <div class="container px-4 sm:px-6">
          <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
            <div class="order-2 lg:order-1" data-aos="fade-right">
              <h2
                class="text-4xl sm:text-5xl font-bold mb-6 heading-font gradient-text"
              >
                Crafting Your Perfect Journey
              </h2>
              <p
                class="text-xl mb-6 font-light"
                style="color: var(--text-light)"
              >
                Travel is more than seeing new places; it’s about experiencing
                them. Our tours are designed to immerse you in the local
                culture, connect you with nature, and create memories that last
                a lifetime.
              </p>
              <ul class="space-y-4 mb-8 text-lg font-light">
                <li class="flex items-center">
                  <i
                    class="las la-check-circle text-2xl mr-3"
                    style="color: var(--dartmouth-green)"
                  ></i>
                  <span
                    ><strong class="font-semibold">Expert Local Guides:</strong>
                    Discover hidden gems known only to locals.</span
                  >
                </li>
                <li class="flex items-center">
                  <i
                    class="las la-check-circle text-2xl mr-3"
                    style="color: var(--dartmouth-green)"
                  ></i>
                  <span
                    ><strong class="font-semibold"
                      >Authentic Experiences:</strong
                    >
                    From cooking classes to cultural workshops.</span
                  >
                </li>
                <li class="flex items-center">
                  <i
                    class="las la-check-circle text-2xl mr-3"
                    style="color: var(--dartmouth-green)"
                  ></i>
                  <span
                    ><strong class="font-semibold"
                      >Seamless & Stress-Free:</strong
                    >
                    We handle all the details, so you can just enjoy.</span
                  >
                </li>
              </ul>
              <button
                class="px-8 py-4 text-lg font-semibold rounded-full transition-all transform hover:scale-105"
                style="background-color: var(--pigment-green); color: white"
              >
                <i class="las la-info-circle mr-2"></i>
                Learn About Our Process
              </button>
            </div>
            <div class="order-1 lg:order-2" data-aos="fade-left">
              <div class="rounded-lg overflow-hidden shadow-2xl card-hover">
                <img
                  src="https://images.unsplash.com/photo-1501785888041-af3ef285b470?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80"
                  alt="A serene travel destination"
                  class="w-full h-full object-cover"
                />
              </div>
            </div>
          </div>
        </div>
      </section>

      <section
        id="famous-destinations"
        class="section-padding famous-destinations"
      >
        <div class="container px-4 sm:px-6">
          <div class="text-center mb-16" data-aos="fade-up">
            <div class="destination-badge mx-auto mb-6">
              <i class="las la-star"></i>
              World Famous Destinations
            </div>
            <h2
              class="text-4xl sm:text-5xl md:text-6xl font-bold mb-6 heading-font"
              style="color: var(--midnight-green)"
            >
              Iconic Places You Must Visit
            </h2>
            <p
              class="text-xl max-w-3xl mx-auto font-light"
              style="color: var(--text-light)"
            >
              Experience the world's most legendary destinations with our
              exclusive access and expert local guides.
            </p>
          </div>

          <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 mb-12">
            <div
              class="relative rounded-lg overflow-hidden card-hover group"
              data-aos="zoom-in-up"
            >
              <div class="relative h-96">
                <img
                  src="./148.jpg"
                  alt="Santorini Greece"
                  class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
                />
                <div
                  class="absolute inset-0 bg-gradient-to-t from-black via-transparent to-transparent opacity-70"
                ></div>
                <div class="absolute bottom-6 left-6 right-6 text-white">
                  <div class="flex items-center mb-3">
                    <div class="destination-badge">
                      <i class="las la-crown"></i>
                      UNESCO Heritage
                    </div>
                  </div>
                  <h3 class="text-3xl font-bold mb-2 heading-font">
                    Santorini, Greece
                  </h3>
                  <p class="text-lg opacity-90 mb-4">
                    Witness the world's most spectacular sunsets from clifftop
                    villages.
                  </p>
                  <div class="flex items-center justify-between">
                    <div class="flex items-center space-x-4">
                      <div class="flex items-center">
                        <i
                          class="las la-star mr-1"
                          style="color: var(--ecru)"
                        ></i>
                        <span class="font-semibold">4.9</span>
                      </div>
                      <div class="flex items-center">
                        <i
                          class="las la-users mr-1"
                          style="color: var(--ecru)"
                        ></i>
                        <span>2.1k+ travelers</span>
                      </div>
                    </div>
                    <button
                      class="px-6 py-5 rounded-full font-semibold transition-all hover:scale-105"
                      style="
                        background-color: var(--dartmouth-green);
                        color: white;
                      "
                    >
                      Explore 
                    </button>
                  </div>
                </div>
              </div>
            </div>

            <div
              class="relative rounded-lg overflow-hidden card-hover group"
              data-aos="zoom-in-up"
              data-aos-delay="100"
            >
              <div class="relative h-96">
                <img
                  src="https://images.unsplash.com/photo-1506905925346-21bda4d32df4?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80"
                  alt="Bora Bora"
                  class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
                />
                <div
                  class="absolute inset-0 bg-gradient-to-t from-black via-transparent to-transparent opacity-70"
                ></div>
                <div class="absolute bottom-6 left-6 right-6 text-white">
                  <div class="flex items-center mb-3">
                    <div class="destination-badge">
                      <i class="las la-gem"></i>
                      Luxury Paradise
                    </div>
                  </div>
                  <h3 class="text-3xl font-bold mb-2 heading-font">
                    Bora Bora, French Polynesia
                  </h3>
                  <p class="text-lg opacity-90 mb-4">
                    Ultimate luxury in overwater bungalows surrounded by
                    turquoise lagoons.
                  </p>
                  <div class="flex items-center justify-between">
                    <div class="flex items-center space-x-4">
                      <div class="flex items-center">
                        <i
                          class="las la-star mr-1"
                          style="color: var(--ecru)"
                        ></i>
                        <span class="font-semibold">4.8</span>
                      </div>
                      <div class="flex items-center">
                        <i
                          class="las la-users mr-1"
                          style="color: var(--ecru)"
                        ></i>
                        <span>1.8k+ travelers</span>
                      </div>
                    </div>
                    <button
                      class="px-6 py-3 rounded-full font-semibold transition-all hover:scale-105"
                      style="
                        background-color: var(--dartmouth-green);
                        color: white;
                      "
                    >
                      Explore Now
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <section id="about" class="py-16 sm:py-20 bg-ivory-bg">
        <div class="container mx-auto px-4 sm:px-6">
          <div class="text-center mb-12 sm:mb-16" data-aos="fade-up">
            <h2
              class="text-3xl sm:text-4xl md:text-5xl font-bold mb-4 gradient-text heading-font"
            >
              Why Choose Wanderlust Tours?
            </h2>
            <p
              class="text-lg sm:text-xl text-text-light max-w-2xl mx-auto px-4 font-light"
            >
              We're committed to making your travel dreams come true with
              exceptional service and unforgettable experiences.
            </p>
          </div>

          <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
            <div
              class="text-center why-us-card"
              data-aos="fade-up"
              data-aos-delay="100"
            >
              <div
                class="w-16 h-16 sm:w-20 sm:h-20 rounded-full mx-auto mb-6 flex items-center justify-center icon-bg"
                style="background-color: var(--midnight-green)"
              >
                <i
                  class="bi bi-shield-check text-2xl sm:text-3xl text-white"
                ></i>
              </div>
              <h3
                class="text-xl sm:text-2xl font-bold mb-4 heading-font"
                style="color: var(--midnight-green)"
              >
                Trusted & Safe
              </h3>
              <p class="text-text-light text-sm sm:text-base font-light">
                Your safety is our priority. We partner with certified operators
                and maintain the highest safety standards.
              </p>
            </div>

            <div
              class="text-center why-us-card"
              data-aos="fade-up"
              data-aos-delay="200"
            >
              <div
                class="w-16 h-16 sm:w-20 sm:h-20 rounded-full mx-auto mb-6 flex items-center justify-center icon-bg"
                style="background-color: var(--dartmouth-green)"
              >
                <i class="bi bi-headset text-2xl sm:text-3xl text-white"></i>
              </div>
              <h3
                class="text-xl sm:text-2xl font-bold mb-4 heading-font"
                style="color: var(--midnight-green)"
              >
                24/7 Support
              </h3>
              <p class="text-text-light text-sm sm:text-base font-light">
                Our dedicated team is available around the clock to assist you
                before, during, and after your trip.
              </p>
            </div>

            <div
              class="text-center why-us-card"
              data-aos="fade-up"
              data-aos-delay="300"
            >
              <div
                class="w-16 h-16 sm:w-20 sm:h-20 rounded-full mx-auto mb-6 flex items-center justify-center icon-bg"
                style="background-color: var(--pigment-green)"
              >
                <i class="bi bi-award text-2xl sm:text-3xl text-white"></i>
              </div>
              <h3
                class="text-xl sm:text-2xl font-bold mb-4 heading-font"
                style="color: var(--midnight-green)"
              >
                Award Winning
              </h3>
              <p class="text-text-light text-sm sm:text-base font-light">
                Recognized as the leading travel company with multiple industry
                awards for excellence and customer satisfaction.
              </p>
            </div>
          </div>
        </div>
      </section>

      <section
        class="py-16 sm:py-20"
        style="background-color: rgba(221, 183, 113, 0.2)"
      >
        <div class="container mx-auto px-4 sm:px-6">
          <div class="text-center mb-12 sm:mb-16" data-aos="fade-up">
            <h2
              class="text-3xl sm:text-4xl md:text-5xl font-bold mb-4 gradient-text heading-font"
            >
              What Our Travelers Say
            </h2>
            <p
              class="text-lg sm:text-xl text-text-light max-w-2xl mx-auto px-4 font-light"
            >
              Real stories from real travelers who've experienced the magic of
              our tours.
            </p>
          </div>

          <div
            class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 sm:gap-8"
          >
            <div
              class="bg-white rounded-lg p-6 sm:p-8 shadow-lg relative"
              data-aos="fade-up"
              data-aos-delay="100"
            >
              <i
                class="bi bi-quote text-7xl absolute top-4 left-4"
                style="color: rgba(11, 110, 79, 0.1)"
              ></i>
              <div class="relative z-10">
                <div class="flex items-center mb-6">
                  <img
                    src="https://images.unsplash.com/photo-1494790108755-2616b612b786?ixlib=rb-4.0.3&auto=format&fit=crop&w=150&q=80"
                    alt="Sarah Johnson"
                    class="w-12 h-12 rounded-full mr-4 object-cover"
                  />
                  <div>
                    <h4
                      class="font-bold text-sm sm:text-base"
                      style="color: var(--midnight-green)"
                    >
                      Sarah Johnson
                    </h4>
                    <p class="text-text-light text-xs sm:text-sm">
                      Adventure Enthusiast
                    </p>
                  </div>
                </div>
                <div class="flex mb-4" style="color: var(--ecru)">
                  <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i
                  ><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i
                  ><i class="bi bi-star-fill"></i>
                </div>
                <p class="text-text-light text-sm sm:text-base font-light">
                  The Swiss Alps tour was absolutely incredible! Every detail
                  was perfectly planned, and the guides were knowledgeable and
                  friendly.
                </p>
              </div>
            </div>

            <div
              class="bg-white rounded-lg p-6 sm:p-8 shadow-lg relative"
              data-aos="fade-up"
              data-aos-delay="200"
            >
              <i
                class="bi bi-quote text-7xl absolute top-4 left-4"
                style="color: rgba(11, 110, 79, 0.1)"
              ></i>
              <div class="relative z-10">
                <div class="flex items-center mb-6">
                  <img
                    src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&auto=format&fit=crop&w=150&q=80"
                    alt="Michael Chen"
                    class="w-12 h-12 rounded-full mr-4 object-cover"
                  />
                  <div>
                    <h4
                      class="font-bold text-sm sm:text-base"
                      style="color: var(--midnight-green)"
                    >
                      Michael Chen
                    </h4>
                    <p class="text-text-light text-xs sm:text-sm">
                      Cultural Explorer
                    </p>
                  </div>
                </div>
                <div class="flex mb-4" style="color: var(--ecru)">
                  <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i
                  ><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i
                  ><i class="bi bi-star-fill"></i>
                </div>
                <p class="text-text-light text-sm sm:text-base font-light">
                  Japan exceeded all my expectations! The cultural immersion was
                  authentic, and I learned so much about the local traditions.
                </p>
              </div>
            </div>

            <div
              class="bg-white rounded-lg p-6 sm:p-8 shadow-lg relative"
              data-aos="fade-up"
              data-aos-delay="300"
            >
              <i
                class="bi bi-quote text-7xl absolute top-4 left-4"
                style="color: rgba(11, 110, 79, 0.1)"
              ></i>
              <div class="relative z-10">
                <div class="flex items-center mb-6">
                  <img
                    src="https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&auto=format&fit=crop&w=150&q=80"
                    alt="Emma Wilson"
                    class="w-12 h-12 rounded-full mr-4 object-cover"
                  />
                  <div>
                    <h4
                      class="font-bold text-sm sm:text-base"
                      style="color: var(--midnight-green)"
                    >
                      Emma & David
                    </h4>
                    <p class="text-text-light text-xs sm:text-sm">
                      Honeymooners
                    </p>
                  </div>
                </div>
                <div class="flex mb-4" style="color: var(--ecru)">
                  <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i
                  ><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i
                  ><i class="bi bi-star-fill"></i>
                </div>
                <p class="text-text-light text-sm sm:text-base font-light">
                  Our Maldives honeymoon was pure paradise! The overwater villa
                  was stunning, and the service was impeccable. Thank you!
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>

      <!-- Partners & Affiliations Bar - NEW -->
      <section class="partners-section">
        <div class="partners-container">
          <h3 class="partners-title" data-aos="fade-up">Trusted by Leading Travel Organizations</h3>
          
          <div class="partners-logos" data-aos="fade-up" data-aos-delay="100">
            <div class="partner-logo">
              <img src="https://via.placeholder.com/180x60/1d5e33/ffffff?text=IATA" alt="IATA Certified" />
            </div>
            <div class="partner-logo">
              <img src="https://via.placeholder.com/180x60/1d5e33/ffffff?text=ASTA" alt="ASTA Member" />
            </div>
            <div class="partner-logo">
              <img src="https://via.placeholder.com/180x60/1d5e33/ffffff?text=WTTC" alt="World Travel & Tourism Council" />
            </div>
            <div class="partner-logo">
              <img src="https://via.placeholder.com/180x60/1d5e33/ffffff?text=TripAdvisor" alt="TripAdvisor Partner" />
            </div>
            <div class="partner-logo">
              <img src="https://via.placeholder.com/180x60/1d5e33/ffffff?text=ISO+9001" alt="ISO Certified" />
            </div>
            <div class="partner-logo">
              <img src="https://via.placeholder.com/180x60/1d5e33/ffffff?text=Virtuoso" alt="Virtuoso Travel" />
            </div>
          </div>
        </div>
      </section>

      <!-- Newsletter Section - NEW DESIGN -->
      <section id="newsletter" class="newsletter-section">
        <!-- Background Pattern (SVG Topographic) -->
        <div class="newsletter-pattern"></div>
        
        <!-- Animated Flying Compass Needles -->
        <div class="flying-compass compass-fly-1">
          <i class="las la-location-arrow"></i>
        </div>
        <div class="flying-compass compass-fly-2">
          <i class="las la-location-arrow"></i>
        </div>
        <div class="flying-compass compass-fly-3">
          <i class="las la-location-arrow"></i>
        </div>
        <div class="flying-compass compass-fly-4">
          <i class="las la-location-arrow"></i>
        </div>
        
        <!-- Optional Compass Rose Decorations -->
        <div class="compass-decoration compass-top-left">
          <i class="las la-compass"></i>
        </div>
        <div class="compass-decoration compass-bottom-right">
          <i class="las la-compass"></i>
        </div>

        <div class="newsletter-container">
          
          <!-- Headline -->
          <div class="newsletter-header" data-aos="fade-up">
            <h2 class="newsletter-title">Join 10,000+ Adventure Seekers</h2>
            <p class="newsletter-subtitle">
              Get exclusive travel deals and inspiration delivered to your inbox
            </p>
          </div>

          <!-- Benefits List -->
          <div class="newsletter-benefits" data-aos="fade-up" data-aos-delay="100">
            <div class="benefit-item">
              <i class="las la-check-circle"></i>
              <span>Early access to exclusive deals</span>
            </div>
            <div class="benefit-item">
              <i class="las la-check-circle"></i>
              <span>Expert travel tips & guides</span>
            </div>
            <div class="benefit-item">
              <i class="las la-check-circle"></i>
              <span>Seasonal destination recommendations</span>
            </div>
          </div>

          <!-- Newsletter Form -->
          <form class="newsletter-form" id="newsletterForm" data-aos="fade-up" data-aos-delay="200">
            
            <!-- Avatar Bubbles (Social Proof) -->
            <div class="subscriber-avatars">
              <div class="avatar-group">
                <img src="https://i.pravatar.cc/150?img=1" alt="Sarah" class="avatar-bubble" />
                <img src="https://i.pravatar.cc/150?img=2" alt="John" class="avatar-bubble" />
                <img src="https://i.pravatar.cc/150?img=3" alt="Subscriber" class="avatar-bubble" />
                <img src="https://i.pravatar.cc/150?img=4" alt="Subscriber" class="avatar-bubble" />
                <div class="avatar-bubble avatar-more">+5K</div>
              </div>
              <p class="subscriber-text">Join Sarah, John and 9,847 others</p>
            </div>

            <div class="newsletter-input-wrapper">
              <input 
                type="email" 
                id="newsletterEmail"
                class="newsletter-input" 
                placeholder="Enter your email address"
                required
              />
              <button type="submit" class="newsletter-submit-btn">
                Subscribe
                <i class="las la-paper-plane"></i>
              </button>
            </div>

            <!-- Success Message (Hidden by default) - UPDATED with confetti & gift -->
            <div class="newsletter-success-message" id="successMessage">
              <div class="success-icon">
                <i class="las la-envelope"></i>
                <div class="sparkle sparkle-1">✨</div>
                <div class="sparkle sparkle-2">✨</div>
                <div class="sparkle sparkle-3">✨</div>
              </div>
              <div class="success-text">
                <h4>Welcome to the Adventure!</h4>
                <p>Check your email for your free travel guide 🎁</p>
              </div>
            </div>
            
            <!-- Confetti Container -->
            <div class="confetti-container" id="confettiContainer"></div>

            <!-- Privacy Text -->
            <div class="newsletter-privacy">
              <i class="las la-lock"></i>
              <span>We respect your privacy. Unsubscribe anytime.</span>
            </div>
          </form>

          <!-- Social Follow -->
          <div class="newsletter-social" data-aos="fade-up" data-aos-delay="300">
            <span class="social-follow-text">Or follow us:</span>
            <div class="social-icons-list">
              <a href="#" class="social-icon" aria-label="Facebook" title="Facebook">
                <i class="lab la-facebook-f"></i>
              </a>
              <a href="#" class="social-icon" aria-label="Instagram" title="Instagram">
                <i class="lab la-instagram"></i>
              </a>
              <a href="#" class="social-icon" aria-label="Twitter" title="Twitter">
                <i class="lab la-twitter"></i>
              </a>
              <a href="#" class="social-icon" aria-label="YouTube" title="YouTube">
                <i class="lab la-youtube"></i>
              </a>
              <a href="#" class="social-icon" aria-label="Pinterest" title="Pinterest">
                <i class="lab la-pinterest"></i>
              </a>
            </div>
          </div>

          <!-- Mobile App Download CTA -->
          <div class="app-download-cta" data-aos="fade-up" data-aos-delay="400">
            <p class="app-download-text">Or download our mobile app</p>
            <div class="app-store-buttons">
              <a href="#" class="app-store-btn" aria-label="Download on App Store">
                <i class="lab la-apple"></i>
                <div class="btn-text">
                  <span class="small-text">Download on the</span>
                  <span class="large-text">App Store</span>
                </div>
              </a>
              <a href="#" class="app-store-btn" aria-label="Get it on Google Play">
                <i class="lab la-google-play"></i>
                <div class="btn-text">
                  <span class="small-text">Get it on</span>
                  <span class="large-text">Google Play</span>
                </div>
              </a>
            </div>
          </div>

        </div>
      </section>
    </main>

    <!-- Newsletter Form JavaScript -->
    <script>
      // Newsletter Form Submission with Confetti
      (function() {
        const newsletterForm = document.getElementById('newsletterForm');
        const emailInput = document.getElementById('newsletterEmail');
        const successMessage = document.getElementById('successMessage');
        const confettiContainer = document.getElementById('confettiContainer');

        if (!newsletterForm) return;

        // Confetti animation function
        function createConfetti() {
          const colors = ['#E5CBAF', '#1d5e33', '#c9a877', '#2a7d4a', '#f5e8d8'];
          const confettiCount = 50;

          for (let i = 0; i < confettiCount; i++) {
            const confetti = document.createElement('div');
            confetti.className = 'confetti-piece';
            confetti.style.left = Math.random() * 100 + '%';
            confetti.style.backgroundColor = colors[Math.floor(Math.random() * colors.length)];
            confetti.style.animationDelay = Math.random() * 0.5 + 's';
            confetti.style.animationDuration = (Math.random() * 2 + 2) + 's';
            confettiContainer.appendChild(confetti);

            // Remove confetti after animation
            setTimeout(() => {
              confetti.remove();
            }, 4000);
          }
        }

        newsletterForm.addEventListener('submit', function(e) {
          e.preventDefault();

          const email = emailInput.value.trim();

          // Basic email validation
          if (!email || !isValidEmail(email)) {
            alert('Please enter a valid email address.');
            return;
          }

          // Trigger confetti animation
          createConfetti();

          // Show success message
          successMessage.classList.add('show');
          
          // Clear the input
          emailInput.value = '';

          // Hide success message after 8 seconds
          setTimeout(() => {
            successMessage.classList.remove('show');
          }, 8000);

          // Here you would typically send the email to your backend/API
          console.log('Newsletter subscription:', email);
          
          // Example: Send to backend
          // fetch('/api/newsletter/subscribe', {
          //   method: 'POST',
          //   headers: {
          //     'Content-Type': 'application/json',
          //   },
          //   body: JSON.stringify({ email: email })
          // })
          // .then(response => response.json())
          // .then(data => {
          //   successMessage.classList.add('show');
          //   emailInput.value = '';
          // })
          // .catch(error => {
          //   alert('Subscription failed. Please try again.');
          // });
        });

        // Email validation function
        function isValidEmail(email) {
          const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
          return emailRegex.test(email);
        }
      })();
    </script>

    <!-- Testimonials Carousel JavaScript -->
    <script>
      // Testimonials Carousel Functionality
      (function() {
        const carousel = document.getElementById('testimonialCarousel');
        const prevBtn = document.getElementById('testimonialPrev');
        const nextBtn = document.getElementById('testimonialNext');
        const dotsContainer = document.getElementById('carouselDots');
        const cards = carousel ? carousel.querySelectorAll('.testimonial-card') : [];
        
        if (!carousel || cards.length === 0) return;

        let currentIndex = 0;
        let cardsPerView = 3;
        let autoRotateInterval;
        let isPaused = false;

        // Determine cards per view based on screen size
        function updateCardsPerView() {
          if (window.innerWidth <= 768) {
            cardsPerView = 1;
          } else if (window.innerWidth <= 1024) {
            cardsPerView = 2;
          } else {
            cardsPerView = 3;
          }
          updateCarousel();
          createDots();
        }

        // Create dot indicators
        function createDots() {
          dotsContainer.innerHTML = '';
          const totalDots = Math.ceil(cards.length - cardsPerView + 1);
          
          for (let i = 0; i < totalDots; i++) {
            const dot = document.createElement('div');
            dot.className = 'carousel-dot';
            if (i === currentIndex) {
              dot.classList.add('active');
            }
            dot.addEventListener('click', () => goToSlide(i));
            dotsContainer.appendChild(dot);
          }
        }

        // Update carousel position
        function updateCarousel() {
          const maxIndex = cards.length - cardsPerView;
          
          // Ensure currentIndex is within valid range
          if (currentIndex < 0) currentIndex = 0;
          if (currentIndex > maxIndex) currentIndex = maxIndex;

          // Update dots
          const dots = dotsContainer.querySelectorAll('.carousel-dot');
          dots.forEach((dot, index) => {
            dot.classList.toggle('active', index === currentIndex);
          });

          // Show/hide navigation arrows
          if (prevBtn && nextBtn) {
            prevBtn.style.opacity = currentIndex === 0 ? '0.5' : '1';
            prevBtn.style.cursor = currentIndex === 0 ? 'not-allowed' : 'pointer';
            nextBtn.style.opacity = currentIndex >= maxIndex ? '0.5' : '1';
            nextBtn.style.cursor = currentIndex >= maxIndex ? 'not-allowed' : 'pointer';
          }
        }

        // Go to specific slide
        function goToSlide(index) {
          const maxIndex = cards.length - cardsPerView;
          currentIndex = Math.max(0, Math.min(index, maxIndex));
          updateCarousel();
        }

        // Next slide
        function nextSlide() {
          const maxIndex = cards.length - cardsPerView;
          if (currentIndex < maxIndex) {
            currentIndex++;
            updateCarousel();
          }
        }

        // Previous slide
        function prevSlide() {
          if (currentIndex > 0) {
            currentIndex--;
            updateCarousel();
          }
        }

        // Auto-rotate functionality
        function startAutoRotate() {
          if (autoRotateInterval) clearInterval(autoRotateInterval);
          
          autoRotateInterval = setInterval(() => {
            if (!isPaused) {
              const maxIndex = cards.length - cardsPerView;
              if (currentIndex >= maxIndex) {
                currentIndex = 0;
              } else {
                currentIndex++;
              }
              updateCarousel();
            }
          }, 5000); // 5 seconds
        }

        // Pause auto-rotate on hover
        function pauseAutoRotate() {
          isPaused = true;
        }

        function resumeAutoRotate() {
          isPaused = false;
        }

        // Event listeners
        if (prevBtn) {
          prevBtn.addEventListener('click', () => {
            prevSlide();
            startAutoRotate(); // Reset auto-rotate timer
          });
        }

        if (nextBtn) {
          nextBtn.addEventListener('click', () => {
            nextSlide();
            startAutoRotate(); // Reset auto-rotate timer
          });
        }

        // Pause on carousel hover
        carousel.addEventListener('mouseenter', pauseAutoRotate);
        carousel.addEventListener('mouseleave', resumeAutoRotate);

        // Handle window resize
        window.addEventListener('resize', updateCardsPerView);

        // Initialize
        updateCardsPerView();
        createDots();
        startAutoRotate();

        // Touch/swipe support for mobile
        let touchStartX = 0;
        let touchEndX = 0;

        carousel.addEventListener('touchstart', (e) => {
          touchStartX = e.changedTouches[0].screenX;
          pauseAutoRotate();
        });

        carousel.addEventListener('touchend', (e) => {
          touchEndX = e.changedTouches[0].screenX;
          handleSwipe();
          resumeAutoRotate();
          startAutoRotate();
        });

        function handleSwipe() {
          const swipeThreshold = 50;
          const diff = touchStartX - touchEndX;

          if (Math.abs(diff) > swipeThreshold) {
            if (diff > 0) {
              // Swipe left - next
              nextSlide();
            } else {
              // Swipe right - previous
              prevSlide();
            }
          }
        }
      })();

      // Trust Stats Counter Animation
      (function() {
        const stats = document.querySelectorAll('.trust-stat');
        const animationDuration = 2000; // 2 seconds
        let animated = false;

        const animateCounter = (element) => {
          const target = parseInt(element.getAttribute('data-count'));
          const suffix = element.getAttribute('data-suffix') || '';
          const increment = target / (animationDuration / 16); // 60 FPS
          let current = 0;

          const updateCounter = () => {
            current += increment;
            if (current < target) {
              if (target >= 1000) {
                element.textContent = Math.floor(current).toLocaleString();
              } else {
                element.textContent = Math.floor(current);
              }
              requestAnimationFrame(updateCounter);
            } else {
              if (target >= 1000) {
                element.textContent = target.toLocaleString() + suffix;
              } else {
                element.textContent = target + suffix;
              }
            }
          };

          updateCounter();
        };

        // Intersection Observer to trigger animation when in view
        const observer = new IntersectionObserver((entries) => {
          entries.forEach(entry => {
            if (entry.isIntersecting && !animated) {
              animated = true;
              stats.forEach(stat => {
                setTimeout(() => animateCounter(stat), 200);
              });
            }
          });
        }, { threshold: 0.5 });

        if (stats.length > 0) {
          observer.observe(stats[0].closest('.trust-section'));
        }
      })();

      // Micro-Interactions
      (function() {
        // 1. Button Ripple Effect
        document.querySelectorAll('button, .explore-button, .journey-cta-button, .newsletter-submit-btn').forEach(button => {
          if (!button.classList.contains('ripple-effect')) {
            button.classList.add('ripple-effect');
          }
          
          button.addEventListener('click', function(e) {
            const ripple = this;
            const rect = ripple.getBoundingClientRect();
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;
            
            // Remove previous ripple
            ripple.classList.remove('ripple-active');
            
            // Set ripple position
            if (ripple.querySelector('::after')) {
              ripple.style.setProperty('--ripple-x', x + 'px');
              ripple.style.setProperty('--ripple-y', y + 'px');
            }
            
            // Trigger ripple
            setTimeout(() => {
              ripple.classList.add('ripple-active');
              setTimeout(() => ripple.classList.remove('ripple-active'), 600);
            }, 10);
          });
        });

        // 2. Lazy Loading with Shimmer Effect
        const cardImages = document.querySelectorAll('.destination-card img');
        const imageObserver = new IntersectionObserver((entries) => {
          entries.forEach(entry => {
            if (entry.isIntersecting) {
              const card = entry.target.closest('.destination-card');
              const img = entry.target;
              
              // Add loading class
              if (card) card.classList.add('loading');
              
              // Load image
              if (img.dataset.src) {
                img.src = img.dataset.src;
              }
              
              img.addEventListener('load', function() {
                if (card) card.classList.remove('loading');
                img.style.filter = 'blur(0px)';
              });
              
              imageObserver.unobserve(entry.target);
            }
          });
        }, { rootMargin: '50px' });
        
        cardImages.forEach(img => {
          img.style.filter = 'blur(10px)';
          img.style.transition = 'filter 400ms ease';
          imageObserver.observe(img);
        });

        // 3. Form Validation with Animations
        const emailInputs = document.querySelectorAll('input[type="email"]');
        emailInputs.forEach(input => {
          input.classList.add('animated-input');
          
          input.addEventListener('blur', function() {
            const value = this.value.trim();
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            
            // Remove previous states
            this.classList.remove('input-success', 'input-error');
            
            if (value && emailRegex.test(value)) {
              this.classList.add('input-success');
              setTimeout(() => this.classList.remove('input-success'), 2000);
            } else if (value) {
              this.classList.add('input-error');
              setTimeout(() => this.classList.remove('input-error'), 400);
            }
          });
        });

        // 4. Timeline Line Animation on Scroll
        const timeline = document.querySelector('.timeline-line');
        if (timeline) {
          const timelineObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
              if (entry.isIntersecting) {
                timeline.style.setProperty('--line-progress', '100%');
              }
            });
          }, { threshold: 0.3 });
          
          timelineObserver.observe(timeline);
        }

        // 5. Add "New" Badges to Recent Destinations (example)
        const recentCards = document.querySelectorAll('.destination-card');
        if (recentCards.length > 0) {
          // Add "New" badge to first 2 cards
          for (let i = 0; i < Math.min(2, recentCards.length); i++) {
            const badge = document.createElement('div');
            badge.className = 'new-badge';
            badge.textContent = 'New';
            badge.style.cssText = `
              position: absolute;
              top: 12px;
              right: 12px;
              background: #e74c3c;
              color: white;
              padding: 4px 12px;
              border-radius: 12px;
              font-size: 11px;
              font-weight: 700;
              text-transform: uppercase;
              z-index: 3;
              animation: newBadgePulse 2s ease infinite;
            `;
            recentCards[i].querySelector('.card-image-container').appendChild(badge);
          }
        }

        // 6. Parallax Effect for Images (subtle)
        const parallaxImages = document.querySelectorAll('.journey-main-image, .card-image');
        window.addEventListener('scroll', () => {
          const scrolled = window.pageYOffset;
          parallaxImages.forEach(img => {
            const rect = img.getBoundingClientRect();
            if (rect.top < window.innerHeight && rect.bottom > 0) {
              const speed = 0.3;
              const yPos = -(rect.top * speed);
              img.style.transform = `translateY(${yPos}px) scale(${img.closest('.destination-card:hover') ? '1.15' : '1'})`;
            }
          });
        });

      })();

      // Add CSS for new badge pulse animation
      const style = document.createElement('style');
      style.textContent = `
        @keyframes newBadgePulse {
          0%, 100% {
            transform: scale(1);
            box-shadow: 0 0 0 0 rgba(231, 76, 60, 0.7);
          }
          50% {
            transform: scale(1.05);
            box-shadow: 0 0 0 8px rgba(231, 76, 60, 0);
          }
        }
      `;
      document.head.appendChild(style);
    </script>
</asp:Content>

