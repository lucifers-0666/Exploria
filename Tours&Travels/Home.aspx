<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Tours_Travels.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="~/css/Home.css" />
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

      <!-- Animated Floating Shapes -->
      <div class="hero-floating-shapes">
        <div class="floating-shape shape-1"></div>
        <div class="floating-shape shape-2"></div>
        <div class="floating-shape shape-3"></div>
        <div class="floating-shape shape-4"></div>
        <div class="floating-shape shape-5"></div>
        <div class="floating-shape shape-6"></div>
        <div class="floating-shape shape-7"></div>
        <div class="floating-shape shape-8"></div>
        <div class="floating-shape shape-9"></div>
        <div class="floating-shape shape-10"></div>
      </div>

      <!-- Particle System -->
      <div class="hero-particles" id="heroParticles"></div>

      <!-- Decorative Corner Elements -->
      <div class="hero-corner-decoration top-left"></div>
      <div class="hero-corner-decoration bottom-right"></div>

      <!-- Light Rays Effect -->
      <div class="hero-light-rays"></div>

      <!-- Hero Content -->
      <div class="hero-content relative z-10 text-center text-white px-4 sm:px-6 container mx-auto">
        
        <!-- Trust Badge -->
        <div class="trust-badge">
          <i class="las la-star"></i>
          <span>Trusted by 10,000+ Travelers</span>
        </div>

        <!-- Main Headline with Animation -->
        <h1 class="hero-headline">
          <span class="headline-line-1">Discover Your Next</span>
          <span class="headline-line-2">
            Adventure
            <span class="headline-underline"></span>
          </span>
        </h1>

        <!-- Subheading -->
        <p class="hero-subtitle">
          Explore breathtaking destinations, create unforgettable memories, and
          embark on the journey of a lifetime with our expertly crafted tours
        </p>

        <!-- Statistics Bar -->
        <div class="hero-stats-bar">
          <div class="hero-stat">
            <div class="stat-number" data-target="50">0</div>
            <div class="stat-label">Destinations</div>
          </div>
          <div class="stat-divider"></div>
          <div class="hero-stat">
            <div class="stat-number" data-target="10000">0</div>
            <div class="stat-label">Happy Travelers</div>
          </div>
          <div class="stat-divider"></div>
          <div class="hero-stat">
            <div class="stat-number" data-target="4.9">0</div>
            <div class="stat-label">Average Rating</div>
          </div>
        </div>

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
      // Counter Animation
      function animateCounter(element) {
        const target = parseFloat(element.getAttribute('data-target'));
        const duration = 2000;
        const increment = target / (duration / 16);
        let current = 0;
        const isDecimal = target % 1 !== 0;

        const timer = setInterval(() => {
          current += increment;
          if (current >= target) {
            element.textContent = isDecimal ? target.toFixed(1) + '★' : target + '+';
            clearInterval(timer);
          } else {
            element.textContent = isDecimal ? current.toFixed(1) : Math.floor(current) + '+';
          }
        }, 16);
      }

      // Initialize counters when hero is in view
      const observerOptions = {
        threshold: 0.5
      };

      const heroObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
          if (entry.isIntersecting) {
            document.querySelectorAll('.stat-number').forEach((stat, index) => {
              setTimeout(() => animateCounter(stat), index * 200);
            });
            heroObserver.disconnect();
          }
        });
      }, observerOptions);

      heroObserver.observe(document.querySelector('.hero-stats-bar'));

      // Parallax Effect
      window.addEventListener('scroll', () => {
        const scrolled = window.pageYOffset;
        const parallaxBg = document.querySelector('.parallax-bg');
        if (parallaxBg) {
          parallaxBg.style.transform = `translateY(${scrolled * 0.5}px)`;
        }

        // Hide scroll indicator on scroll
        const scrollIndicator = document.getElementById('scrollIndicator');
        if (scrollIndicator) {
          scrollIndicator.style.opacity = Math.max(0, 1 - scrolled / 100);
        }
      });

      // Particle System
      function createParticles() {
        const container = document.getElementById('heroParticles');
        if (!container || window.innerWidth < 768) return;

        const particleCount = 50;
        for (let i = 0; i < particleCount; i++) {
          const particle = document.createElement('div');
          particle.className = 'particle';
          particle.style.left = Math.random() * 100 + '%';
          particle.style.animationDuration = (15 + Math.random() * 10) + 's';
          particle.style.animationDelay = Math.random() * 5 + 's';
          particle.style.width = particle.style.height = (2 + Math.random() * 4) + 'px';
          container.appendChild(particle);
        }
      }

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

      // Initialize
      window.addEventListener('load', () => {
        createParticles();
      });
    </script>

    <main>
      <!-- New Popular Destinations Section -->
      <section
        id="destinations"
        class="section-padding"
        style="background-color: var(--ivory-bg)"
      >
        <div class="container px-4 sm:px-6">
          <div class="text-center mb-16" data-aos="fade-up">
            <h2
              class="text-4xl sm:text-5xl md:text-6xl font-bold mb-6 heading-font"
              style="color: var(--midnight-green)"
            >
              Explore Our Curated Destinations
            </h2>
            <p class="text-xl text-text-light max-w-3xl mx-auto font-light">
              Handpicked journeys to the world's most captivating corners,
              waiting for you to discover.
            </p>
          </div>

          <div
            class="grid grid-cols-1 lg:grid-cols-3 gap-8 h-auto lg:h-[600px]"
          >
            <div
              class="lg:col-span-2 rounded-lg overflow-hidden card-hover group relative"
              data-aos="zoom-in-right"
              data-aos-easing="ease-in-out-sine"
            >
              <img
                src="https://images.unsplash.com/photo-1549144511-f099e773c147?ixlib=rb-4.0.3&auto=format&fit=crop&w=1200&q=80"
                alt="Machu Picchu"
                class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
              />
              <div
                class="absolute inset-0 bg-gradient-to-t from-black/80 via-transparent to-transparent"
              ></div>
              <div class="absolute bottom-0 left-0 p-8 text-white">
                <h3 class="text-4xl font-bold mb-2 heading-font">
                  Machu Picchu, Peru
                </h3>
                <p class="text-lg opacity-90 mb-4 max-w-lg">
                  Discover the lost city of the Incas, a breathtaking wonder of
                  the ancient world nestled high in the Andes.
                </p>
                <button
                  class="px-6 py-3 rounded-full font-semibold transition-all hover:scale-105 text-white"
                  style="background-color: var(--dartmouth-green)"
                >
                  <i class="las la-arrow-right mr-2"></i>Explore Peru
                </button>
              </div>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-1 gap-8">
              <div
                class="rounded-lg overflow-hidden card-hover group relative"
                data-aos="zoom-in-left"
                data-aos-easing="ease-in-out-sine"
                data-aos-delay="100"
              >
                <img
                  src="https://images.unsplash.com/photo-1524413840807-0c3cb6fa808d?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80"
                  alt="Kyoto, Japan"
                  class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
                />
                <div
                  class="absolute inset-0 bg-gradient-to-t from-black/70 via-transparent to-transparent"
                ></div>
                <div class="absolute bottom-0 left-0 p-6 text-white">
                  <h3 class="text-2xl font-bold heading-font">Kyoto, Japan</h3>
                  <p class="opacity-90">Ancient temples & serene gardens.</p>
                </div>
              </div>
              <div
                class="rounded-lg overflow-hidden card-hover group relative"
                data-aos="zoom-in-left"
                data-aos-easing="ease-in-out-sine"
                data-aos-delay="200"
              >
                <img
                  src="./amplifi.jpg"
                  alt="Amalfi Coast, Italy"
                  class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700"
                />
                <div
                  class="absolute inset-0 bg-gradient-to-t from-black/70 via-transparent to-transparent"
                ></div>
                <div class="absolute bottom-0 left-0 p-6 text-white">
                  <h3 class="text-2xl font-bold heading-font">
                    Amalfi Coast, Italy
                  </h3>
                  <p class="opacity-90">
                    Cliffside villages & turquoise waters.
                  </p>
                </div>
              </div>
            </div>
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

      <!-- Newsletter Section - UPDATED -->
      <section class="section-padding bg-ivory-bg">
        <div class="container mx-auto px-4 sm:px-6">
          <div
            class="bg-white rounded-lg shadow-xl overflow-hidden"
            data-aos="fade-up"
          >
            <div class="p-8 lg:p-12 text-center">
              <div class="max-w-2xl mx-auto">
                <h2
                  class="text-3xl sm:text-4xl font-bold mb-4 text-midnight-green heading-font"
                >
                  Join Our Newsletter
                </h2>
                <p class="text-lg text-text-light mb-8 font-light">
                  Subscribe to get our latest travel deals, tips, and
                  destination inspiration delivered right to your inbox.
                </p>
                <div class="flex flex-col sm:flex-row gap-4 max-w-lg mx-auto">
                  <input
                    type="email"
                    placeholder="Enter your email"
                    class="flex-1 px-4 sm:px-6 py-3 rounded-full text-gray-800 border-2 border-gray-200 focus:outline-none focus:ring-2 focus:ring-dartmouth-green text-sm sm:text-base"
                  />
                  <button
                    class="px-6 sm:px-8 py-3 rounded-full font-semibold transition-all hover:transform hover:scale-105 text-sm sm:text-base"
                    style="
                      background-color: var(--dartmouth-green);
                      color: white;
                    "
                  >
                    Subscribe
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>
</asp:Content>

