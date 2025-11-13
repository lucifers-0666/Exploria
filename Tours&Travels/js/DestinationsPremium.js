// ============================================
// PREMIUM DESTINATIONS SECTION - JAVASCRIPT
// Filter, Sort, Wishlist, Lazy Loading, Animations
// ============================================

document.addEventListener('DOMContentLoaded', () => {
  // ============================================
  // 1. FILTER FUNCTIONALITY
  // ============================================
  const filterChips = document.querySelectorAll('.filter-chip-premium');
  const cards = document.querySelectorAll('.dest-card-premium');
  let activeFilter = 'all';

  // Filter chip click handler
  filterChips.forEach(chip => {
    chip.addEventListener('click', () => {
      const filter = chip.dataset.filter;
      
      // Update active states
      filterChips.forEach(c => {
        c.classList.remove('active');
        c.setAttribute('aria-checked', 'false');
        c.setAttribute('tabindex', '-1');
      });
      
      chip.classList.add('active');
      chip.setAttribute('aria-checked', 'true');
      chip.setAttribute('tabindex', '0');
      activeFilter = filter;
      
      // Filter cards with animation
      filterCards(filter);
    });

    // Keyboard navigation for filter chips
    chip.addEventListener('keydown', (e) => {
      if (e.key === 'Enter' || e.key === ' ') {
        e.preventDefault();
        chip.click();
      }
      
      const chips = Array.from(filterChips);
      const currentIndex = chips.indexOf(chip);
      
      if (e.key === 'ArrowRight' || e.key === 'ArrowDown') {
        e.preventDefault();
        const nextChip = chips[(currentIndex + 1) % chips.length];
        nextChip.focus();
      } else if (e.key === 'ArrowLeft' || e.key === 'ArrowUp') {
        e.preventDefault();
        const prevChip = chips[(currentIndex - 1 + chips.length) % chips.length];
        prevChip.focus();
      }
    });
  });

  // Filter cards function
  function filterCards(filter) {
    cards.forEach((card, index) => {
      const categories = card.dataset.category;
      const shouldShow = filter === 'all' || categories.includes(filter);
      
      if (shouldShow) {
        card.style.display = 'flex';
        // Stagger animation
        setTimeout(() => {
          card.style.opacity = '1';
          card.style.transform = 'translateY(0)';
        }, index * 50);
      } else {
        card.style.opacity = '0';
        card.style.transform = 'translateY(30px)';
        setTimeout(() => {
          card.style.display = 'none';
        }, 300);
      }
    });
  }

  // ============================================
  // 2. SORT FUNCTIONALITY
  // ============================================
  const sortSelect = document.getElementById('sortDestinations');
  const grid = document.querySelector('.destinations-bento-grid');
  
  if (sortSelect && grid) {
    sortSelect.addEventListener('change', (e) => {
      const sortValue = e.target.value;
      const cardsArray = Array.from(cards);
      
      // Sort cards based on selection
      cardsArray.sort((a, b) => {
        switch (sortValue) {
          case 'top-rated':
            return parseFloat(b.dataset.rating) - parseFloat(a.dataset.rating);
          
          case 'price-low':
            return parseFloat(a.dataset.price) - parseFloat(b.dataset.price);
          
          case 'price-high':
            return parseFloat(b.dataset.price) - parseFloat(a.dataset.price);
          
          case 'alphabetical':
            const nameA = a.querySelector('.dest-name').textContent.trim();
            const nameB = b.querySelector('.dest-name').textContent.trim();
            return nameA.localeCompare(nameB);
          
          default: // recommended
            return 0;
        }
      });
      
      // Re-append cards to grid with animation
      cardsArray.forEach((card, index) => {
        card.style.opacity = '0';
        card.style.transform = 'translateY(30px)';
        
        setTimeout(() => {
          grid.appendChild(card);
          
          setTimeout(() => {
            card.style.opacity = '1';
            card.style.transform = 'translateY(0)';
          }, 50);
        }, index * 30);
      });
    });
  }

  // ============================================
  // 3. WISHLIST FUNCTIONALITY
  // ============================================
  const wishlistButtons = document.querySelectorAll('.dest-wishlist-btn');
  const WISHLIST_KEY = 'destinations_wishlist';
  
  // Load wishlist from localStorage
  let wishlist = JSON.parse(localStorage.getItem(WISHLIST_KEY) || '[]');
  
  // Initialize wishlist button states
  wishlistButtons.forEach(btn => {
    const destination = btn.dataset.destination;
    if (wishlist.includes(destination)) {
      btn.classList.add('active');
      btn.setAttribute('aria-pressed', 'true');
    }
  });
  
  // Wishlist button click handler
  wishlistButtons.forEach(btn => {
    btn.addEventListener('click', (e) => {
      e.preventDefault();
      e.stopPropagation();
      
      const destination = btn.dataset.destination;
      const isActive = btn.classList.contains('active');
      
      if (isActive) {
        // Remove from wishlist
        wishlist = wishlist.filter(item => item !== destination);
        btn.classList.remove('active');
        btn.setAttribute('aria-pressed', 'false');
      } else {
        // Add to wishlist
        wishlist.push(destination);
        btn.classList.add('active');
        btn.setAttribute('aria-pressed', 'true');
        
        // Trigger heart animation
        btn.querySelector('svg').style.animation = 'heartPop 600ms ease';
        setTimeout(() => {
          btn.querySelector('svg').style.animation = '';
        }, 600);
      }
      
      // Save to localStorage
      localStorage.setItem(WISHLIST_KEY, JSON.stringify(wishlist));
    });
  });

  // ============================================
  // 4. LAZY LOADING IMAGES
  // ============================================
  const imageObserver = new IntersectionObserver((entries, observer) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        const img = entry.target;
        img.src = img.dataset.src;
        
        if (img.dataset.srcset) {
          img.srcset = img.dataset.srcset;
        }
        
        img.onload = () => {
          img.classList.add('loaded');
        };
        
        observer.unobserve(img);
      }
    });
  }, {
    rootMargin: '50px',
    threshold: 0.01
  });
  
  // Observe images
  const lazyImages = document.querySelectorAll('.dest-card-image[data-src]');
  lazyImages.forEach(img => imageObserver.observe(img));

  // ============================================
  // 5. SCROLL ANIMATIONS (Intersection Observer)
  // ============================================
  const scrollObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
      }
    });
  }, {
    threshold: 0.1,
    rootMargin: '0px 0px -100px 0px'
  });
  
  // Observe cards for scroll animation
  cards.forEach(card => scrollObserver.observe(card));
  
  // Observe header and filter bar
  const header = document.querySelector('.destinations-header-premium');
  const filterBar = document.querySelector('.filter-sort-bar-premium');
  if (header) scrollObserver.observe(header);
  if (filterBar) scrollObserver.observe(filterBar);

  // ============================================
  // 6. MAGNETIC CURSOR EFFECT (Desktop Only)
  // ============================================
  if (window.innerWidth > 1024) {
    cards.forEach(card => {
      card.addEventListener('mousemove', (e) => {
        const rect = card.getBoundingClientRect();
        const x = e.clientX - rect.left;
        const y = e.clientY - rect.top;
        
        const centerX = rect.width / 2;
        const centerY = rect.height / 2;
        
        const deltaX = (x - centerX) / centerX;
        const deltaY = (y - centerY) / centerY;
        
        // Apply subtle tilt
        const rotateX = deltaY * -5;
        const rotateY = deltaX * 5;
        
        card.style.transform = `
          perspective(1000px)
          rotateX(${rotateX}deg)
          rotateY(${rotateY}deg)
          translateY(-16px)
          scale(1.02)
        `;
      });
      
      card.addEventListener('mouseleave', () => {
        card.style.transform = '';
      });
    });
  }

  // ============================================
  // 7. RESPONSIVE FILTER CHIPS SCROLL
  // ============================================
  const filterChipsContainer = document.querySelector('.filter-chips-container');
  if (filterChipsContainer && window.innerWidth <= 768) {
    // Add scroll indicator
    const scrollIndicator = document.createElement('div');
    scrollIndicator.className = 'filter-scroll-indicator';
    scrollIndicator.innerHTML = '&rarr;';
    scrollIndicator.style.cssText = `
      position: absolute;
      right: 0;
      top: 50%;
      transform: translateY(-50%);
      background: linear-gradient(to left, white, transparent);
      padding: 0 12px;
      pointer-events: none;
      opacity: 0.7;
    `;
    
    filterChipsContainer.parentElement.style.position = 'relative';
    filterChipsContainer.parentElement.appendChild(scrollIndicator);
    
    // Hide indicator when scrolled to end
    filterChipsContainer.addEventListener('scroll', () => {
      const isAtEnd = filterChipsContainer.scrollLeft + filterChipsContainer.clientWidth >= filterChipsContainer.scrollWidth - 10;
      scrollIndicator.style.opacity = isAtEnd ? '0' : '0.7';
    });
  }

  // ============================================
  // 8. VIEW ALL BUTTON RIPPLE EFFECT
  // ============================================
  const viewAllBtn = document.querySelector('.dest-view-all-btn');
  if (viewAllBtn) {
    viewAllBtn.addEventListener('click', function(e) {
      const rect = this.getBoundingClientRect();
      const x = e.clientX - rect.left;
      const y = e.clientY - rect.top;
      
      const ripple = document.createElement('span');
      ripple.style.cssText = `
        position: absolute;
        left: ${x}px;
        top: ${y}px;
        width: 20px;
        height: 20px;
        border-radius: 50%;
        background: rgba(255, 255, 255, 0.5);
        transform: translate(-50%, -50%) scale(0);
        animation: ripple 600ms ease-out;
        pointer-events: none;
      `;
      
      this.appendChild(ripple);
      
      setTimeout(() => ripple.remove(), 600);
    });
  }

  // ============================================
  // 9. PREFERS REDUCED MOTION
  // ============================================
  const prefersReducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  
  if (prefersReducedMotion) {
    // Disable all animations
    document.querySelectorAll('.dest-card-premium').forEach(card => {
      card.style.animation = 'none';
      card.style.opacity = '1';
      card.style.transform = 'none';
    });
    
    // Disable hover effects
    document.body.classList.add('reduced-motion');
  }

  // ============================================
  // 10. ANALYTICS (Optional)
  // ============================================
  // Track destination card clicks
  cards.forEach(card => {
    card.querySelector('.dest-explore-btn')?.addEventListener('click', (e) => {
      const destinationName = card.querySelector('.dest-name').textContent.trim();
      const price = card.dataset.price;
      const rating = card.dataset.rating;
      
      // Send to analytics (Google Analytics, Matomo, etc.)
      if (typeof gtag !== 'undefined') {
        gtag('event', 'destination_click', {
          'destination_name': destinationName,
          'price': price,
          'rating': rating,
          'filter_active': activeFilter
        });
      }
      
      console.log(`Destination clicked: ${destinationName}`);
    });
  });
});

// ============================================
// CSS ANIMATIONS (Add to DestinationsPremium.css if not present)
// ============================================
const style = document.createElement('style');
style.textContent = `
  @keyframes ripple {
    to {
      transform: translate(-50%, -50%) scale(20);
      opacity: 0;
    }
  }
  
  .filter-scroll-indicator {
    transition: opacity 300ms ease;
  }
  
  .reduced-motion .dest-card-premium:hover {
    transform: none !important;
  }
`;
document.head.appendChild(style);
