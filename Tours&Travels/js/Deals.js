/* ==========================================
   EXPLORIA TOURS - DEALS PAGE JAVASCRIPT
   ALL CRITICAL FIXES & INTERACTIONS
   ========================================== */

document.addEventListener('DOMContentLoaded', function() {
    
    // ==========================================
    // INITIALIZE AOS (ANIMATE ON SCROLL)
    // ==========================================
    if (typeof AOS !== 'undefined') {
        AOS.init({
            duration: 600,
            easing: 'cubic-bezier(0.4, 0, 0.2, 1)',
            once: true,
            offset: 100,
            delay: 0
        });
    }

    // ==========================================
    // PAGE LOAD ANIMATION SEQUENCE
    // ==========================================
    setTimeout(() => {
        const heroSection = document.querySelector('.deals-hero-section');
        if (heroSection) {
            heroSection.style.opacity = '1';
        }
    }, 100);

    // Stats cards appear at 800ms
    setTimeout(() => {
        const statsCards = document.querySelectorAll('.stat-card');
        statsCards.forEach((card, index) => {
            setTimeout(() => {
                card.style.opacity = '1';
                card.style.transform = 'translateY(0)';
            }, index * 150);
        });
    }, 800);

    // Filter tabs slide down at 1200ms
    setTimeout(() => {
        const filterSection = document.querySelector('.filter-section-wrapper');
        if (filterSection) {
            filterSection.style.opacity = '1';
            filterSection.style.transform = 'translateY(0)';
        }
    }, 1200);

    // ==========================================
    // COUNTER ANIMATION FOR STATS
    // ==========================================
    function animateCounter(element) {
        const target = parseInt(element.dataset.target);
        if (isNaN(target)) return;
        
        const duration = 2000;
        const step = target / (duration / 16);
        let current = 0;
        
        const timer = setInterval(() => {
            current += step;
            if (current >= target) {
                element.textContent = target + (target === 25 ? '+' : target === 40 ? '+' : target === 100 ? '+' : '');
                clearInterval(timer);
            } else {
                element.textContent = Math.floor(current) + (target === 25 ? '+' : target === 40 ? '+' : target === 100 ? '+' : '');
            }
        }, 16);
    }

    // Observe stats cards for counter animation
    const statCounters = document.querySelectorAll('.stat-counter[data-target]');
    const statsObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting && !entry.target.classList.contains('counted')) {
                entry.target.classList.add('counted');
                animateCounter(entry.target);
            }
        });
    }, { threshold: 0.5 });

    statCounters.forEach(counter => statsObserver.observe(counter));

    // Newsletter subscribers counter
    const newsletterCounter = document.querySelector('.counter-animate[data-target]');
    if (newsletterCounter) {
        const nlObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting && !entry.target.classList.contains('counted')) {
                    entry.target.classList.add('counted');
                    animateCounter(entry.target);
                }
            });
        }, { threshold: 0.5 });
        nlObserver.observe(newsletterCounter);
    }

    // ==========================================
    // CATEGORY TABS FUNCTIONALITY
    // ==========================================
    const categoryTabs = document.querySelectorAll('.category-tab');
    
    categoryTabs.forEach(tab => {
        tab.addEventListener('click', function() {
            // Remove active from all tabs
            categoryTabs.forEach(t => t.classList.remove('active'));
            
            // Add active to clicked tab
            this.classList.add('active');
            
            // Get category
            const category = this.dataset.category;
            console.log('Filter by category:', category);
            
            // Add ripple effect
            createRipple(this, event);
            
            // Show toast
            showToast(`Filtering by ${category === 'all' ? 'All Deals' : this.querySelector('span').textContent}`, 'info');
        });
    });

    // ==========================================
    // FILTERS TOGGLE BUTTON
    // ==========================================
    const filtersToggleBtn = document.getElementById('filtersToggleBtn');
    
    if (filtersToggleBtn) {
        filtersToggleBtn.addEventListener('click', function() {
            // This would open a filter modal/sidebar
            showToast('Advanced filters opening...', 'info');
            console.log('Open filters modal');
        });
    }

    // ==========================================
    // APPLIED FILTER CHIPS REMOVE
    // ==========================================
    const appliedChips = document.querySelectorAll('.applied-chip i');
    
    appliedChips.forEach(chip => {
        chip.addEventListener('click', function(e) {
            e.stopPropagation();
            const parent = this.closest('.applied-chip');
            
            // Animate out
            parent.style.transform = 'scale(0)';
            parent.style.opacity = '0';
            
            setTimeout(() => {
                parent.remove();
                updateResultCount(-1);
            }, 300);
            
            showToast('Filter removed', 'success');
        });
    });

    // ==========================================
    // VIEW TOGGLE (GRID/LIST)
    // ==========================================
    const viewToggleBtns = document.querySelectorAll('.view-toggle-btn');
    const dealsGrid = document.querySelector('.deals-grid');
    
    viewToggleBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            // Remove active from all
            viewToggleBtns.forEach(b => b.classList.remove('active'));
            
            // Add active to clicked
            this.classList.add('active');
            
            const view = this.dataset.view;
            
            if (dealsGrid) {
                if (view === 'list') {
                    dealsGrid.style.gridTemplateColumns = '1fr';
                    showToast('List view activated', 'info');
                } else {
                    dealsGrid.style.gridTemplateColumns = window.innerWidth > 768 ? 'repeat(3, 1fr)' : window.innerWidth > 480 ? 'repeat(2, 1fr)' : '1fr';
                    showToast('Grid view activated', 'info');
                }
            }
        });
    });

    // ==========================================
    // WISHLIST HEART TOGGLE
    // ==========================================
    const wishlistBtns = document.querySelectorAll('.wishlist-heart-btn');
    
    wishlistBtns.forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            
            this.classList.toggle('active');
            const icon = this.querySelector('i');
            
            if (this.classList.contains('active')) {
                icon.classList.remove('bi-heart');
                icon.classList.add('bi-heart-fill');
                showToast('Added to wishlist!', 'success');
                
                // Add heart animation
                createHeartAnimation(this);
            } else {
                icon.classList.remove('bi-heart-fill');
                icon.classList.add('bi-heart');
                showToast('Removed from wishlist', 'info');
            }
        });
    });

    // ==========================================
    // SHARE BUTTON FUNCTIONALITY
    // ==========================================
    const shareBtns = document.querySelectorAll('.share-icon-btn');
    
    shareBtns.forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            
            // Get deal title from card
            const card = this.closest('.deal-card');
            const title = card ? card.querySelector('.card-title-text')?.textContent : 'Amazing Deal';
            
            // Check if Web Share API is available
            if (navigator.share) {
                navigator.share({
                    title: title,
                    text: 'Check out this amazing travel deal!',
                    url: window.location.href
                }).then(() => {
                    showToast('Shared successfully!', 'success');
                }).catch((error) => {
                    console.log('Share cancelled');
                });
            } else {
                // Fallback: Copy link to clipboard
                copyToClipboard(window.location.href);
                showToast('Link copied to clipboard!', 'success');
            }
        });
    });

    // ==========================================
    // QUICK VIEW BUTTON
    // ==========================================
    const quickViewBtns = document.querySelectorAll('.quick-view-btn-card');
    
    quickViewBtns.forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            
            showToast('Quick view opening...', 'info');
            console.log('Open quick view modal');
            // Implement modal logic here
        });
    });

    // ==========================================
    // FEATURED DEAL - BOOK THIS DEAL BUTTON
    // ==========================================
    const bookThisDealBtn = document.querySelector('.book-this-deal-button');
    
    if (bookThisDealBtn) {
        bookThisDealBtn.addEventListener('click', function() {
            // Add loading state
            const originalHTML = this.innerHTML;
            this.innerHTML = '<i class="bi bi-hourglass-split"></i> <span>Processing...</span>';
            this.disabled = true;
            
            // Simulate booking process
            setTimeout(() => {
                this.innerHTML = '<i class="bi bi-check-circle-fill"></i> <span>Added to Cart!</span>';
                
                showToast('Deal added to your cart!', 'success');
                createConfetti();
                
                setTimeout(() => {
                    this.innerHTML = originalHTML;
                    this.disabled = false;
                }, 2000);
            }, 1500);
        });
    }

    // ==========================================
    // COUNTDOWN TIMER (FAKE UPDATE)
    // ==========================================
    function updateCountdownTimer() {
        const timeNumbers = document.querySelectorAll('.time-number');
        
        if (timeNumbers.length === 0) return;
        
        setInterval(() => {
            // Get current time values
            let hours = parseInt(timeNumbers[0].textContent);
            let minutes = parseInt(timeNumbers[1].textContent);
            let seconds = parseInt(timeNumbers[2].textContent);
            
            // Decrement seconds
            seconds--;
            
            if (seconds < 0) {
                seconds = 59;
                minutes--;
            }
            
            if (minutes < 0) {
                minutes = 59;
                hours--;
            }
            
            if (hours < 0) {
                hours = 23;
            }
            
            // Update display
            timeNumbers[0].textContent = String(hours).padStart(2, '0');
            timeNumbers[1].textContent = String(minutes).padStart(2, '0');
            timeNumbers[2].textContent = String(seconds).padStart(2, '0');
            
        }, 1000);
    }

    updateCountdownTimer();

    // ==========================================
    // LOAD MORE DEALS BUTTON
    // ==========================================
    const loadMoreBtn = document.getElementById('loadMoreBtn');
    
    if (loadMoreBtn) {
        loadMoreBtn.addEventListener('click', function() {
            const originalHTML = this.innerHTML;
            this.innerHTML = '<i class="bi bi-hourglass-split"></i> <span>Loading...</span>';
            this.disabled = true;
            
            // Simulate loading
            setTimeout(() => {
                this.innerHTML = originalHTML;
                this.disabled = false;
                showToast('6 more deals loaded!', 'success');
                
                // Refresh AOS
                if (typeof AOS !== 'undefined') {
                    AOS.refresh();
                }
            }, 1500);
        });
    }

    // ==========================================
    // NEWSLETTER SUBSCRIPTION
    // ==========================================
    const newsletterEmailInput = document.getElementById('newsletterEmailInput');
    const newsletterSubscribeBtn = document.querySelector('.newsletter-subscribe-btn');
    const subscribeSuccess = document.getElementById('subscribeSuccess');
    
    if (newsletterSubscribeBtn && newsletterEmailInput) {
        newsletterSubscribeBtn.addEventListener('click', function() {
            const email = newsletterEmailInput.value.trim();
            
            if (email && validateEmail(email)) {
                // Add loading state
                const originalHTML = this.innerHTML;
                this.innerHTML = '<i class="bi bi-hourglass-split"></i> <span>Subscribing...</span>';
                this.disabled = true;
                
                // Simulate subscription
                setTimeout(() => {
                    this.innerHTML = '<i class="bi bi-check-circle-fill"></i> <span>Subscribed!</span>';
                    newsletterEmailInput.value = '';
                    
                    // Show success message
                    if (subscribeSuccess) {
                        subscribeSuccess.classList.add('show');
                    }
                    
                    // Create confetti
                    createConfetti();
                    
                    showToast('Successfully subscribed!', 'success');
                    
                    setTimeout(() => {
                        this.innerHTML = originalHTML;
                        this.disabled = false;
                        if (subscribeSuccess) {
                            subscribeSuccess.classList.remove('show');
                        }
                    }, 3000);
                    
                }, 1500);
            } else {
                // Show error
                newsletterEmailInput.style.animation = 'shake 0.5s ease-in-out';
                newsletterEmailInput.style.borderColor = '#dc2626';
                
                setTimeout(() => {
                    newsletterEmailInput.style.animation = '';
                    newsletterEmailInput.style.borderColor = '';
                }, 500);
                
                showToast('Please enter a valid email address', 'error');
            }
        });
        
        // Allow Enter key to submit
        newsletterEmailInput.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                newsletterSubscribeBtn.click();
            }
        });
    }

    // ==========================================
    // SEARCH BAR FUNCTIONALITY
    // ==========================================
    const searchInput = document.querySelector('.search-input-field');
    const searchBtn = document.querySelector('.search-submit-btn');
    
    if (searchBtn && searchInput) {
        searchBtn.addEventListener('click', function() {
            const query = searchInput.value.trim();
            
            if (query) {
                showToast(`Searching for "${query}"...`, 'info');
                console.log('Search query:', query);
                // Implement search logic here
            } else {
                searchInput.focus();
            }
        });
        
        // Allow Enter key to search
        searchInput.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                searchBtn.click();
            }
        });
    }

    // ==========================================
    // FILTER PILLS FUNCTIONALITY
    // ==========================================
    const filterPills = document.querySelectorAll('.filter-pill');
    
    filterPills.forEach(pill => {
        pill.addEventListener('click', function() {
            this.classList.toggle('active');
            const filterText = this.textContent;
            
            if (this.classList.contains('active')) {
                showToast(`Filter "${filterText}" applied`, 'info');
            } else {
                showToast(`Filter "${filterText}" removed`, 'info');
            }
        });
    });

    // ==========================================
    // LAZY LOADING IMAGES
    // ==========================================
    if ('IntersectionObserver' in window) {
        const imageObserver = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const img = entry.target;
                    if (img.dataset.src) {
                        img.src = img.dataset.src;
                        img.classList.add('loaded');
                        img.removeAttribute('data-src');
                        imageObserver.unobserve(img);
                    }
                }
            });
        }, {
            rootMargin: '50px'
        });

        document.querySelectorAll('img[data-src]').forEach(img => {
            imageObserver.observe(img);
        });
    }

    // ==========================================
    // SMOOTH SCROLL FOR ANCHOR LINKS
    // ==========================================
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            const href = this.getAttribute('href');
            if (href !== '#' && href !== '') {
                e.preventDefault();
                const target = document.querySelector(href);
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            }
        });
    });

    // ==========================================
    // HELPER FUNCTIONS
    // ==========================================
    
    // Email Validation
    function validateEmail(email) {
        return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
    }

    // Create Ripple Effect
    function createRipple(element, event) {
        const ripple = document.createElement('span');
        const rect = element.getBoundingClientRect();
        const size = Math.max(rect.width, rect.height);
        const x = event.clientX - rect.left - size / 2;
        const y = event.clientY - rect.top - size / 2;
        
        ripple.style.cssText = `
            position: absolute;
            width: ${size}px;
            height: ${size}px;
            left: ${x}px;
            top: ${y}px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.5);
            pointer-events: none;
            animation: ripple-expand 0.6s ease-out;
        `;
        
        element.style.position = 'relative';
        element.style.overflow = 'hidden';
        element.appendChild(ripple);
        
        setTimeout(() => ripple.remove(), 600);
    }

    // Toast Notification
    function showToast(message, type = 'info') {
        const iconMap = {
            success: 'check-circle-fill',
            error: 'exclamation-circle-fill',
            info: 'info-circle-fill'
        };
        
        const toast = document.createElement('div');
        toast.className = `toast-notification ${type}`;
        toast.style.cssText = `
            position: fixed;
            top: 100px;
            right: 24px;
            padding: 16px 24px;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
            display: flex;
            align-items: center;
            gap: 12px;
            z-index: 10000;
            transform: translateX(400px);
            transition: transform 0.4s cubic-bezier(0.4, 0, 0.2, 1);
        `;
        
        toast.innerHTML = `
            <i class="bi bi-${iconMap[type]}" style="font-size: 24px; color: ${type === 'success' ? '#10b981' : type === 'error' ? '#dc2626' : '#3b82f6'};"></i>
            <span style="color: #1f2937; font-weight: 500;">${message}</span>
        `;
        
        document.body.appendChild(toast);
        
        setTimeout(() => {
            toast.style.transform = 'translateX(0)';
        }, 10);
        
        setTimeout(() => {
            toast.style.transform = 'translateX(400px)';
            setTimeout(() => toast.remove(), 400);
        }, 3000);
    }

    // Create Confetti Animation
    function createConfetti() {
        const colors = ['#E5CBAF', '#c9a877', '#6bbf59', '#1d5e33', '#ddb771'];
        const confettiCount = 50;
        
        for (let i = 0; i < confettiCount; i++) {
            const confetti = document.createElement('div');
            confetti.style.cssText = `
                position: fixed;
                width: 10px;
                height: 10px;
                background: ${colors[Math.floor(Math.random() * colors.length)]};
                top: -10px;
                left: ${Math.random() * 100}%;
                z-index: 10000;
                animation: confetti-fall ${Math.random() * 2 + 2}s ease-out forwards;
                animation-delay: ${Math.random() * 0.5}s;
                pointer-events: none;
            `;
            
            document.body.appendChild(confetti);
            
            setTimeout(() => confetti.remove(), 4000);
        }
    }

    // Create Heart Animation
    function createHeartAnimation(element) {
        const heart = document.createElement('i');
        heart.className = 'bi bi-heart-fill';
        heart.style.cssText = `
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 40px;
            color: #dc2626;
            pointer-events: none;
            animation: heart-burst 0.6s ease-out forwards;
        `;
        
        element.appendChild(heart);
        setTimeout(() => heart.remove(), 600);
    }

    // Copy to Clipboard
    function copyToClipboard(text) {
        if (navigator.clipboard) {
            navigator.clipboard.writeText(text);
        } else {
            // Fallback
            const textArea = document.createElement('textarea');
            textArea.value = text;
            textArea.style.position = 'fixed';
            textArea.style.left = '-999999px';
            document.body.appendChild(textArea);
            textArea.select();
            document.execCommand('copy');
            document.body.removeChild(textArea);
        }
    }

    // Update Result Count
    function updateResultCount(change = 0) {
        const resultNumber = document.querySelector('.result-number');
        if (resultNumber) {
            let current = parseInt(resultNumber.textContent);
            current += change;
            resultNumber.textContent = Math.max(0, current);
            resultNumber.style.animation = 'count-pulse 0.5s ease-out';
            setTimeout(() => {
                resultNumber.style.animation = '';
            }, 500);
        }
    }

    // ==========================================
    // ADD REQUIRED CSS ANIMATIONS VIA STYLE TAG
    // ==========================================
    const style = document.createElement('style');
    style.textContent = `
        @keyframes ripple-expand {
            from {
                transform: scale(0);
                opacity: 1;
            }
            to {
                transform: scale(4);
                opacity: 0;
            }
        }
        
        @keyframes confetti-fall {
            to {
                top: 100vh;
                transform: rotateZ(720deg);
            }
        }
        
        @keyframes heart-burst {
            0% {
                transform: translate(-50%, -50%) scale(0);
                opacity: 1;
            }
            50% {
                transform: translate(-50%, -50%) scale(1.5);
                opacity: 1;
            }
            100% {
                transform: translate(-50%, -50%) scale(2);
                opacity: 0;
            }
        }
        
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-10px); }
            75% { transform: translateX(10px); }
        }
        
        @keyframes count-pulse {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    `;
    document.head.appendChild(style);

    console.log('✅ Exploria Deals - Premium Experience Loaded Successfully!');
});
