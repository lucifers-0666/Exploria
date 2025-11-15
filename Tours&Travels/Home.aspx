<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Tours_Travels.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="css/UltraModernHero.css?v=1.0" />
<link rel="stylesheet" href="css/Home.css?v=4.0" />
<link rel="stylesheet" href="css/DestinationsSection.css?v=1.0" />
<style>
/* Critical CSS for Ultra-Modern Hero */
.ultra-modern-hero {
    position: relative;
    min-height: 100vh;
    background: linear-gradient(135deg, #164426 0%, #1d5e33 50%, #164426 100%);
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <!-- ============================================
        ULTRA-MODERN HERO SECTION 2025-2026
        ============================================ -->
   <section id="home" class="ultra-modern-hero">
      
      <!-- Multi-Layer Animated Background System -->
      <div class="hero-bg-gradient-mesh"></div>
      
      <!-- Floating Light Particles -->
      <div class="hero-particle-layer" id="particleLayer"></div>
      
      <!-- Geometric Wireframe Pattern -->
      <div class="hero-geometric-pattern"></div>
      
      <!-- Morphing Blob Backgrounds -->
      <div class="hero-morphing-blobs">
        <div class="morph-blob blob-1"></div>
        <div class="morph-blob blob-2"></div>
        <div class="morph-blob blob-3"></div>
      </div>

      <!-- Main Hero Container: Split Layout -->
      <div class="hero-split-container">
        
        <!-- LEFT SIDE: Content (60%) -->
        <div class="hero-left-content">
          
          <!-- Trust Badge with Glassmorphism -->
          <div class="trust-badge-modern">
            <i class="las la-star pulsing-star"></i>
            <span>Trusted by 10,000+ Travelers Worldwide</span>
          </div>

          <!-- Main Headline (3 Lines) -->
          <h1 class="ultra-headline">
            <span class="headline-line line-1">Discover</span>
            <span class="headline-line line-2 gradient-text-animated">Breathtaking Destinations</span>
            <span class="headline-line line-3">Create Unforgettable Memories</span>
          </h1>

          <!-- Animated Decorative Underline -->
          <div class="headline-decorative-underline">
            <svg class="underline-svg" viewBox="0 0 200 20" xmlns="http://www.w3.org/2000/svg">
              <path class="underline-path" d="M 10 10 Q 100 5 190 10" stroke="#E5CBAF" stroke-width="3" fill="none"/>
              <circle class="sparkle sparkle-1" cx="10" cy="10" r="2" fill="#E5CBAF"/>
              <circle class="sparkle sparkle-2" cx="100" cy="5" r="2" fill="#E5CBAF"/>
              <circle class="sparkle sparkle-3" cx="190" cy="10" r="2" fill="#E5CBAF"/>
            </svg>
          </div>

          <!-- Description Text -->
          <p class="hero-description-modern">
            Embark on extraordinary journeys to the world's most captivating destinations. 
            Let us turn your travel dreams into reality.
          </p>

          <!-- CTA Buttons (Trending Design) -->
          <div class="hero-cta-modern">
            <a href="Destination.aspx" class="cta-primary-morphing">
              <span class="cta-text">Explore Destinations</span>
              <i class="las la-arrow-right cta-arrow"></i>
              <div class="ripple-effect-overlay"></div>
            </a>
            <button class="cta-secondary-glass" onclick="openModernVideoModal()">
              <i class="las la-play-circle cta-play-icon"></i>
              <span class="cta-text">Watch Our Story</span>
            </button>
          </div>

          <!-- Floating Stats Cards (Glassmorphism) -->
          <div class="stats-cards-glassmorphism">
            <div class="stat-card glass-card" data-aos="fade-up" data-aos-delay="100">
              <div class="stat-icon-wrapper">
                <i class="las la-map-marked-alt"></i>
              </div>
              <div class="stat-number" data-count="50">0</div>
              <div class="stat-plus">+</div>
              <div class="stat-label">Destinations</div>
            </div>

            <div class="stat-card glass-card" data-aos="fade-up" data-aos-delay="250">
              <div class="stat-icon-wrapper">
                <i class="las la-users"></i>
              </div>
              <div class="stat-number" data-count="10000">0</div>
              <div class="stat-plus">+</div>
              <div class="stat-label">Happy Travelers</div>
            </div>

            <div class="stat-card glass-card" data-aos="fade-up" data-aos-delay="400">
              <div class="stat-icon-wrapper">
                <i class="las la-star"></i>
              </div>
              <div class="stat-number" data-count="4.9">0.0</div>
              <div class="stat-plus">★</div>
              <div class="stat-label">Average Rating</div>
            </div>
          </div>

        </div>

        <!-- RIGHT SIDE: 3D Interactive Element (40%) -->
        <div class="hero-right-interactive">
          
          <!-- Floating Destination Cards Carousel -->
          <div class="floating-destinations-carousel">
            <div class="floating-dest-card card-1">
              <img src="https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=400&h=300&fit=crop" alt="Paris">
              <div class="dest-card-overlay"></div>
              <div class="dest-card-content">
                <span class="dest-name">Paris</span>
                <span class="trending-badge">TRENDING</span>
              </div>
            </div>

            <div class="floating-dest-card card-2">
              <img src="https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=400&h=300&fit=crop" alt="Switzerland">
              <div class="dest-card-overlay"></div>
              <div class="dest-card-content">
                <span class="dest-name">Switzerland</span>
              </div>
            </div>

            <div class="floating-dest-card card-3">
              <img src="https://images.unsplash.com/photo-1493976040374-85c8e12f0c0e?w=400&h=300&fit=crop" alt="Santorini">
              <div class="dest-card-overlay"></div>
              <div class="dest-card-content">
                <span class="dest-name">Santorini</span>
              </div>
            </div>

            <div class="floating-dest-card card-4">
              <img src="https://images.unsplash.com/photo-1524492412937-b28074a5d7da?w=400&h=300&fit=crop" alt="Iceland">
              <div class="dest-card-overlay"></div>
              <div class="dest-card-content">
                <span class="dest-name">Iceland</span>
                <span class="trending-badge">HOT</span>
              </div>
            </div>
          </div>

          <!-- 3D Globe Element (Decorative) -->
          <div class="globe-decoration">
            <i class="las la-globe"></i>
          </div>

        </div>

      </div>

      <!-- Modern Scroll Indicator -->
      <div class="scroll-indicator-modern" id="modernScrollIndicator">
        <div class="scroll-mouse">
          <div class="scroll-wheel"></div>
        </div>
        <span class="scroll-text">Scroll to Explore</span>
        <i class="las la-chevron-down scroll-chevron"></i>
      </div>

    </section>

    <!-- Modern Video Modal -->
    <div class="video-modal-modern" id="videoModalModern" onclick="closeModernVideoModal(event)">
      <div class="video-modal-content-modern" onclick="event.stopPropagation()">
        <button class="video-modal-close-modern" onclick="closeModernVideoModal()">
          <i class="las la-times"></i>
        </button>
        <div class="video-wrapper-modern">
          <iframe id="modernVideoPlayer" src="" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
        </div>
      </div>
    </div>

    <!-- Hero Section JavaScript -->
    <script>
      // ============================================
      // ULTRA-MODERN HERO SECTION JAVASCRIPT
      // ============================================

      (function() {
        'use strict';

        // 1. PARTICLE SYSTEM
        function initParticles() {
          const particleLayer = document.getElementById('particleLayer');
          if (!particleLayer) return;

          const particleCount = window.innerWidth < 768 ? 20 : 45;
          
          for (let i = 0; i < particleCount; i++) {
            const particle = document.createElement('div');
            particle.className = 'light-particle';
            
            const size = Math.random() * 6 + 2;
            particle.style.width = size + 'px';
            particle.style.height = size + 'px';
            particle.style.left = Math.random() * 100 + '%';
            particle.style.animationDuration = (Math.random() * 10 + 8) + 's';
            particle.style.animationDelay = Math.random() * 5 + 's';
            particle.style.opacity = Math.random() * 0.6 + 0.3;
            
            particleLayer.appendChild(particle);
          }
        }

        // 2. STATS COUNTER ANIMATION
        function animateStatsCounter() {
          const statNumbers = document.querySelectorAll('.stat-number');
          
          const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
              if (entry.isIntersecting && !entry.target.classList.contains('counted')) {
                entry.target.classList.add('counted');
                const target = parseFloat(entry.target.getAttribute('data-count'));
                const isDecimal = target % 1 !== 0;
                const duration = 2000;
                const startTime = performance.now();
                
                function updateCounter(currentTime) {
                  const elapsed = currentTime - startTime;
                  const progress = Math.min(elapsed / duration, 1);
                  const eased = 1 - Math.pow(1 - progress, 3);
                  const current = eased * target;
                  
                  if (progress < 1) {
                    entry.target.textContent = isDecimal ? current.toFixed(1) : Math.floor(current);
                    requestAnimationFrame(updateCounter);
                  } else {
                    entry.target.textContent = isDecimal ? target.toFixed(1) : target;
                  }
                }
                
                requestAnimationFrame(updateCounter);
                
                // Icon bounce animation
                const icon = entry.target.closest('.stat-card').querySelector('.stat-icon-wrapper i');
                if (icon) {
                  icon.style.animation = 'iconBouncePulse 0.6s ease';
                }
              }
            });
          }, { threshold: 0.5 });
          
          statNumbers.forEach(stat => observer.observe(stat));
        }

        // 3. SCROLL INDICATOR BEHAVIOR
        function initScrollIndicator() {
          const indicator = document.getElementById('modernScrollIndicator');
          if (!indicator) return;
          
          indicator.addEventListener('click', () => {
            document.querySelector('#destinations')?.scrollIntoView({ behavior: 'smooth' });
          });
          
          window.addEventListener('scroll', () => {
            const scrolled = window.pageYOffset;
            if (scrolled > 100) {
              indicator.style.opacity = '0';
              indicator.style.pointerEvents = 'none';
            } else {
              indicator.style.opacity = '1';
              indicator.style.pointerEvents = 'auto';
            }
          });
        }

        // 4. VIDEO MODAL FUNCTIONS
        window.openModernVideoModal = function() {
          const modal = document.getElementById('videoModalModern');
          const video = document.getElementById('modernVideoPlayer');
          video.src = 'https://www.youtube.com/embed/dQw4w9WgXcQ?autoplay=1';
          modal.classList.add('active');
          document.body.style.overflow = 'hidden';
        };

        window.closeModernVideoModal = function(event) {
          if (event && event.target !== event.currentTarget && !event.target.closest('.video-modal-close-modern')) {
            return;
          }
          const modal = document.getElementById('videoModalModern');
          const video = document.getElementById('modernVideoPlayer');
          video.src = '';
          modal.classList.remove('active');
          document.body.style.overflow = 'auto';
        };

        document.addEventListener('keydown', (e) => {
          if (e.key === 'Escape') {
            closeModernVideoModal();
          }
        });

        // 5. FLOATING CARDS PARALLAX
        function initFloatingCardsParallax() {
          const cards = document.querySelectorAll('.floating-dest-card');
          const hero = document.querySelector('.ultra-modern-hero');
          
          if (window.innerWidth < 1024) return; // Disable on mobile/tablet
          
          hero.addEventListener('mousemove', (e) => {
            const { clientX, clientY } = e;
            const { innerWidth, innerHeight } = window;
            
            const moveX = (clientX / innerWidth - 0.5) * 30;
            const moveY = (clientY / innerHeight - 0.5) * 30;
            
            cards.forEach((card, index) => {
              const speed = (index + 1) * 0.3;
              card.style.transform = `translate(${-moveX * speed}px, ${-moveY * speed}px) rotate(${card.dataset.rotate || '0deg'})`;
            });
          });
        }

        // 7. MAGNETIC CURSOR EFFECT (Desktop only)
        function initMagneticButtons() {
          if (window.innerWidth < 1024) return;
          
          const buttons = document.querySelectorAll('.cta-primary-morphing, .cta-secondary-glass');
          
          buttons.forEach(button => {
            button.addEventListener('mousemove', (e) => {
              const rect = button.getBoundingClientRect();
              const x = e.clientX - rect.left - rect.width / 2;
              const y = e.clientY - rect.top - rect.height / 2;
              
              const maxMove = 8;
              const moveX = (x / rect.width) * maxMove;
              const moveY = (y / rect.height) * maxMove;
              
              button.style.transform = `translate(${moveX}px, ${moveY}px)`;
            });
            
            button.addEventListener('mouseleave', () => {
              button.style.transform = 'translate(0, 0)';
            });
          });
        }

        // INITIALIZE ALL
        document.addEventListener('DOMContentLoaded', () => {
          initParticles();
          animateStatsCounter();
          initScrollIndicator();
          initFloatingCardsParallax();
          initMagneticButtons();
        });

      })();

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
      <!-- ============================================
           PREMIUM DESTINATIONS SECTION - 2025 REDESIGN
           Modern, Glassmorphism, Bento Grid Layout
           ============================================ -->
      <section id="destinations" class="destinations-section">
        <div class="destinations-container">
            <div class="destinations-header">
                <h2 class="destinations-title">Top Destinations</h2>
                <p class="destinations-subtitle">Explore our most popular and breathtaking destinations.</p>
                <div class="destinations-controls">
                    <div class="filter-chips">
                        <button class="filter-chip active">All</button>
                        <button class="filter-chip">Popular</button>
                        <button class="filter-chip">Featured</button>
                        <button class="filter-chip">New</button>
                    </div>
                    <a href="Destination.aspx" class="view-all-link">View All <i class="las la-arrow-right"></i></a>
                </div>
            </div>
            <div class="destinations-grid">
                <!-- Card 1 -->
                <div class="destination-card">
                    <div class="card-image-wrapper">
                        <img src="Images/destination-paris.jpg" alt="Paris" />
                        <div class="wishlist-icon"><i class="lar la-heart"></i></div>
                        <div class="image-overlay"></div>
                    </div>
                    <div class="card-content">
                        <h3 class="destination-name">Paris, France</h3>
                        <p class="destination-description">The city of love, lights, and art.</p>
                        <div class="card-footer">
                            <div class="rating">
                                <i class="las la-star"></i> 4.9
                            </div>
                            <a href="Destination.aspx?id=paris" class="details-button">View Details</a>
                        </div>
                    </div>
                </div>
                <!-- Card 2 -->
                <div class="destination-card">
                    <div class="card-image-wrapper">
                        <img src="Images/destination-santorini.jpg" alt="Santorini" />
                        <div class="wishlist-icon"><i class="lar la-heart"></i></div>
                        <div class="image-overlay"></div>
                    </div>
                    <div class="card-content">
                        <h3 class="destination-name">Santorini, Greece</h3>
                        <p class="destination-description">Iconic sunsets and whitewashed villages.</p>
                        <div class="card-footer">
                            <div class="rating">
                                <i class="las la-star"></i> 4.9
                            </div>
                            <a href="Destination.aspx?id=santorini" class="details-button">View Details</a>
                        </div>
                    </div>
                </div>
                <!-- Card 3 -->
                <div class="destination-card">
                    <div class="card-image-wrapper">
                        <img src="Images/destination-machu-picchu.jpg" alt="Machu Picchu" />
                        <div class="wishlist-icon active"><i class="las la-heart"></i></div>
                        <div class="image-overlay"></div>
                    </div>
                    <div class="card-content">
                        <h3 class="destination-name">Machu Picchu, Peru</h3>
                        <p class="destination-description">Ancient Incan city high in the Andes.</p>
                        <div class="card-footer">
                            <div class="rating">
                                <i class="las la-star"></i> 4.8
                            </div>
                            <a href="Destination.aspx?id=machu-picchu" class="details-button">View Details</a>
                        </div>
                    </div>
                </div>
                <!-- Card 4 -->
                <div class="destination-card">
                    <div class="card-image-wrapper">
                        <img src="Images/destination-kyoto.jpg" alt="Kyoto" />
                        <div class="wishlist-icon"><i class="lar la-heart"></i></div>
                        <div class="image-overlay"></div>
                    </div>
                    <div class="card-content">
                        <h3 class="destination-name">Kyoto, Japan</h3>
                        <p class="destination-description">Temples, gardens, and traditional culture.</p>
                        <div class="card-footer">
                            <div class="rating">
                                <i class="las la-star"></i> 4.8
                            </div>
                            <a href="Destination.aspx?id=kyoto" class="details-button">View Details</a>
                        </div>
                    </div>
                </div>
                <!-- Card 5 -->
                <div class="destination-card">
                    <div class="card-image-wrapper">
                        <img src="Images/destination-bora-bora.jpg" alt="Bora Bora" />
                        <div class="wishlist-icon"><i class="lar la-heart"></i></div>
                        <div class="image-overlay"></div>
                    </div>
                    <div class="card-content">
                        <h3 class="destination-name">Bora Bora</h3>
                        <p class="destination-description">Luxury overwater bungalows and turquoise waters.</p>
                        <div class="card-footer">
                            <div class="rating">
                                <i class="las la-star"></i> 5.0
                            </div>
                            <a href="Destination.aspx?id=bora-bora" class="details-button">View Details</a>
                        </div>
                    </div>
                </div>
                <!-- Card 6 -->
                <div class="destination-card">
                    <div class="card-image-wrapper">
                        <img src="Images/destination-dubai.jpg" alt="Dubai" />
                        <div class="wishlist-icon"><i class="lar la-heart"></i></div>
                        <div class="image-overlay"></div>
                    </div>
                    <div class="card-content">
                        <h3 class="destination-name">Dubai, UAE</h3>
                        <p class="destination-description">Futuristic city with a vibrant culture.</p>
                        <div class="card-footer">
                            <div class="rating">
                                <i class="las la-star"></i> 4.7
                            </div>
                            <a href="Destination.aspx?id=dubai" class="details-button">View Details</a>
                        </div>
                    </div>
                </div>
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

      // ============================================
      // PREMIUM DESTINATIONS: Scroll Animations, Lazy Loading, Accessibility
      // Performance-optimized for budget devices
      // ============================================

      // Detect reduced motion preference
      const prefersReducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

      // 1. Scroll Progress Bar
      function initScrollProgress() {
        const progressBar = document.querySelector('.progress-bar-fill');
        const section = document.querySelector('.destinations-grid-section');
        
        if (!progressBar || !section) return;

        window.addEventListener('scroll', () => {
          const sectionTop = section.offsetTop;
          const sectionHeight = section.offsetHeight;
          const scrollY = window.scrollY;
          const windowHeight = window.innerHeight;
          
          const scrollStart = sectionTop - windowHeight;
          const scrollEnd = sectionTop + sectionHeight;
          const totalScroll = scrollEnd - scrollStart;
          const currentProgress = scrollY - scrollStart;
          
          const percentage = Math.min(Math.max((currentProgress / totalScroll) * 100, 0), 100);
          progressBar.style.width = percentage + '%';
        }, { passive: true });
      }

      // 2. Scroll-Driven Card Animations (Intersection Observer)
      function initCardAnimations() {
        if (prefersReducedMotion) return;

        const cards = document.querySelectorAll('.destination-card:not(.skeleton)');
        
        const observer = new IntersectionObserver((entries) => {
          entries.forEach((entry, index) => {
            if (entry.isIntersecting) {
              setTimeout(() => {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
              }, index * 80); // Stagger effect
              observer.unobserve(entry.target);
            }
          });
        }, {
          threshold: 0.1,
          rootMargin: '0px 0px -50px 0px'
        });

        cards.forEach(card => observer.observe(card));
      }

      // 3. Lazy Load Images with Skeleton State
      function initLazyLoading() {
        const imageContainers = document.querySelectorAll('.card-image-container');
        
        const imageObserver = new IntersectionObserver((entries) => {
          entries.forEach(entry => {
            if (entry.isIntersecting) {
              const img = entry.target.querySelector('.card-image');
              const card = entry.target.closest('.destination-card');
              
              if (img && img.dataset.src) {
                // Show skeleton during load
                card.classList.add('skeleton');
                
                img.src = img.dataset.src;
                if (img.dataset.srcset) {
                  img.srcset = img.dataset.srcset;
                }
                
                img.onload = () => {
                  card.classList.remove('skeleton');
                  img.classList.add('loaded');
                };
                
                img.onerror = () => {
                  card.classList.remove('skeleton');
                  img.alt = 'Image unavailable';
                };
                
                imageObserver.unobserve(entry.target);
              }
            }
          });
        }, {
          rootMargin: '200px' // Start loading 200px before entering viewport
        });

        imageContainers.forEach(container => imageObserver.observe(container));
      }

      // 4. Filter Keyboard Navigation & Accessibility
      function initFilterAccessibility() {
        const filterChips = document.querySelectorAll('.filter-chip');
        
        filterChips.forEach((chip, index) => {
          chip.setAttribute('role', 'button');
          chip.setAttribute('tabindex', '0');
          chip.setAttribute('aria-label', 'Filter by ' + chip.textContent.trim());
          
          // Keyboard support: Enter/Space to activate
          chip.addEventListener('keydown', (e) => {
            if (e.key === 'Enter' || e.key === ' ') {
              e.preventDefault();
              chip.click();
            }
            // Arrow keys navigation
            if (e.key === 'ArrowRight' && filterChips[index + 1]) {
              filterChips[index + 1].focus();
            }
            if (e.key === 'ArrowLeft' && filterChips[index - 1]) {
              filterChips[index - 1].focus();
            }
          });
        });

        // Sort dropdown accessibility
        const sortSelect = document.querySelector('.sort-select');
        if (sortSelect) {
          sortSelect.setAttribute('aria-label', 'Sort destinations');
        }
      }

      // 5. Wishlist Toggle with Animation
      function initWishlistHandlers() {
        const wishlistIcons = document.querySelectorAll('.wishlist-icon');
        
        wishlistIcons.forEach(icon => {
          icon.setAttribute('role', 'button');
          icon.setAttribute('tabindex', '0');
          icon.setAttribute('aria-label', 'Add to wishlist');
          
          icon.addEventListener('click', (e) => {
            e.stopPropagation();
            e.preventDefault();
            
            icon.classList.toggle('active');
            const isActive = icon.classList.contains('active');
            icon.setAttribute('aria-label', isActive ? 'Remove from wishlist' : 'Add to wishlist');
            
            if (!prefersReducedMotion) {
              // Pulse animation
              icon.style.animation = 'none';
              setTimeout(() => {
                icon.style.animation = 'pulse 0.3s ease';
              }, 10);
            }
          });

          // Keyboard support
          icon.addEventListener('keydown', (e) => {
            if (e.key === 'Enter' || e.key === ' ') {
              e.preventDefault();
              icon.click();
            }
          });
        });
      }

      // 6. Quick Compare Tray
      let compareList = [];
      
      function initQuickCompare() {
        const cards = document.querySelectorAll('.destination-card');
        const tray = document.querySelector('.quick-compare-tray');
        const compareBtn = document.querySelector('.compare-all-btn');
        
        if (!tray) return;

        cards.forEach(card => {
          const checkbox = card.querySelector('.compare-checkbox');
          if (checkbox) {
            checkbox.addEventListener('change', (e) => {
              const destinationId = card.dataset.id;
              const destinationName = card.querySelector('.destination-name')?.textContent;
              const imageUrl = card.querySelector('.card-image')?.src;
              
              if (e.target.checked) {
                compareList.push({ id: destinationId, name: destinationName, image: imageUrl });
              } else {
                compareList = compareList.filter(item => item.id !== destinationId);
              }
              
              updateCompareTray();
            });
          }
        });

        function updateCompareTray() {
          if (compareList.length > 0) {
            tray.classList.add('active');
            const itemsContainer = tray.querySelector('.compare-items');
            itemsContainer.innerHTML = compareList.map(item => `
              <div class="compare-item">
                <img src="${item.image}" alt="${item.name}" />
                <p style="font-size: 11px; margin-top: 4px;">${item.name}</p>
              </div>
            `).join('');
          } else {
            tray.classList.remove('active');
          }
        }
      }

      // 7. Error Handling & Zero State
      function showZeroState(message = 'No destinations found') {
        const grid = document.querySelector('.destinations-grid');
        if (!grid) return;
        
        grid.innerHTML = `
          <div class="destinations-zero-state" style="grid-column: 1/-1;">
            <div class="zero-state-icon">🏝️</div>
            <h3 class="zero-state-title">${message}</h3>
            <p class="zero-state-message">Try adjusting your filters or check back later.</p>
            <button class="retry-button" onclick="location.reload()">Refresh</button>
          </div>
        `;
      }

      // 8. Initialize All Features
      document.addEventListener('DOMContentLoaded', () => {
        console.log('🚀 Premium Destinations Section - Initializing...');
        
        // Check if section exists
        const section = document.querySelector('.destinations-grid-section');
        if (!section) {
          console.warn('⚠️ Destinations section not found');
          return;
        }

        // Initialize features
        initScrollProgress();
        initCardAnimations();
        initLazyLoading();
        initFilterAccessibility();
        initWishlistHandlers();
        initQuickCompare();

        // Performance monitoring
        if ('performance' in window && 'getEntriesByType' in performance) {
          setTimeout(() => {
            const perfData = performance.getEntriesByType('navigation')[0];
            if (perfData) {
              console.log(`⚡ Page Load: ${Math.round(perfData.loadEventEnd - perfData.fetchStart)}ms`);
            }
          }, 1000);
        }

        console.log('✅ Premium Destinations initialized successfully');
      });

      // 9. Pulse animation for wishlist (if not defined)
      const pulseKeyframes = `
        @keyframes pulse {
          0%, 100% { transform: scale(1); }
          50% { transform: scale(1.15); }
        }
      `;
      
      if (!document.querySelector('#pulse-keyframes')) {
        const pulseStyle = document.createElement('style');
        pulseStyle.id = 'pulse-keyframes';
        pulseStyle.textContent = pulseKeyframes;
        document.head.appendChild(pulseStyle);
      }

      // 10. 3D Hover Parallax Tilt Effect
      function init3DTiltEffect() {
        if (prefersReducedMotion) return;

        const cards = document.querySelectorAll('.destination-card');
        
        cards.forEach(card => {
          card.addEventListener('mousemove', (e) => {
            const rect = card.getBoundingClientRect();
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;
            
            const centerX = rect.width / 2;
            const centerY = rect.height / 2;
            
            const rotateX = ((y - centerY) / centerY) * 5; // Max 5 degrees
            const rotateY = ((centerX - x) / centerX) * 5;
            
            card.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) translateZ(10px)`;
          });
          
          card.addEventListener('mouseleave', () => {
            card.style.transform = 'perspective(1000px) rotateX(0) rotateY(0) translateZ(0)';
          });
        });
      }

      // 11. Button Ripple Effect on Click
      function initButtonRipples() {
        const buttons = document.querySelectorAll('.card-cta-button, .filter-chip');
        
        buttons.forEach(button => {
          button.addEventListener('click', function(e) {
            const ripple = document.createElement('span');
            ripple.classList.add('ripple');
            
            const rect = this.getBoundingClientRect();
            const size = Math.max(rect.width, rect.height);
            const x = e.clientX - rect.left - size / 2;
            const y = e.clientY - rect.top - size / 2;
            
            ripple.style.width = ripple.style.height = size + 'px';
            ripple.style.left = x + 'px';
            ripple.style.top = y + 'px';
            
            this.appendChild(ripple);
            
            setTimeout(() => {
              ripple.remove();
            }, 600);
          });
        });
      }

      // 12. Parallax Scrolling for Background Elements
      function initParallaxScroll() {
        if (prefersReducedMotion) return;

        const section = document.querySelector('.destinations-grid-section');
        if (!section) return;

        let ticking = false;

        function updateParallax() {
          const scrolled = window.pageYOffset;
          const sectionTop = section.offsetTop;
          const sectionHeight = section.offsetHeight;
          
          // Only apply parallax when section is in view
          if (scrolled + window.innerHeight > sectionTop && scrolled < sectionTop + sectionHeight) {
            const offset = (scrolled - sectionTop) * 0.5;
            
            // Move background elements (if ::before/::after could be targeted, use data attributes)
            const decorativeElements = section.querySelectorAll('.floating-shape, .destinations-section::before');
            decorativeElements.forEach(el => {
              el.style.transform = `translateY(${offset}px)`;
            });
          }
          
          ticking = false;
        }

        window.addEventListener('scroll', () => {
          if (!ticking) {
            window.requestAnimationFrame(updateParallax);
            ticking = true;
          }
        }, { passive: true });
      }

      // 13. Enhanced Filter Chip Interactions
      function initFilterChipEffects() {
        const filterChips = document.querySelectorAll('.filter-chip');
        
        filterChips.forEach(chip => {
          // Add click handler for active state
          chip.addEventListener('click', function() {
            // Remove active from all chips
            filterChips.forEach(c => c.classList.remove('active', 'selected'));
            
            // Add active to clicked chip
            this.classList.add('active');
            
            // Filter logic (if filter data attributes exist)
            const filterValue = this.dataset.filter;
            filterDestinations(filterValue);
          });
        });
      }

      // 14. Filter Destinations Function
      function filterDestinations(filter) {
        const cards = document.querySelectorAll('.destination-card');
        let visibleCount = 0;
        
        cards.forEach(card => {
          if (filter === 'all') {
            card.style.display = 'flex';
            visibleCount++;
          } else {
            const badges = card.querySelectorAll('.badge-chip');
            let hasMatch = false;
            
            badges.forEach(badge => {
              if (badge.textContent.toLowerCase().includes(filter.toLowerCase()) ||
                  badge.classList.contains(filter.toLowerCase())) {
                hasMatch = true;
              }
            });
            
            if (hasMatch) {
              card.style.display = 'flex';
              visibleCount++;
            } else {
              card.style.display = 'none';
            }
          }
        });
        
        // Show zero state if no results
        if (visibleCount === 0) {
          showZeroState(`No ${filter} destinations found`);
        }
      }

      // 15. Initialize Advanced Features
      document.addEventListener('DOMContentLoaded', () => {
        // Wait a bit for initial animations to complete
        setTimeout(() => {
          init3DTiltEffect();
          initButtonRipples();
          initParallaxScroll();
          initFilterChipEffects();
          console.log('✨ Advanced interactions initialized');
        }, 500);
      });
    </script>
</asp:Content>

