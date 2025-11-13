<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Tours_Travels.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
    <link rel="stylesheet" href="css/login.css" />
    <!-- Preload critical resources -->
    <link rel="preload" as="image" href="https://images.unsplash.com/photo-1519922639102-1436259e0b9a?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Skip to Content Link (Accessibility) -->
    <a href="#main-content" class="skip-to-content">Skip to main content</a>
    
    <section class="login-split-container" role="main" aria-labelledby="login-heading">
        <!-- ==========================================
             LEFT PANEL - DECORATIVE SIDE
             ========================================== -->
        <div class="left-panel-wrapper" aria-hidden="true">
            <!-- Background Image Layer -->
            <div class="left-panel-bg-image parallax-bg"></div>
            
            <!-- Gradient Overlay -->
            <div class="left-panel-gradient-overlay"></div>
            
            <!-- Floating Decorative Shapes -->
            <div class="floating-shape shape-1"></div>
            <div class="floating-shape shape-2"></div>
            <div class="floating-shape shape-3"></div>
            <div class="floating-shape shape-4"></div>
            
            <!-- Content Container -->
            <div class="left-panel-content">
                <!-- Logo -->
                <div class="left-panel-logo-container" data-aos="fade-down" data-aos-duration="800">
                    <svg class="left-panel-logo" viewBox="0 0 200 60" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <text x="10" y="40" font-family="Inter, sans-serif" font-size="36" font-weight="800" fill="white">EXPLORIA</text>
                    </svg>
                </div>
                
                <!-- Main Heading -->
                <h1 class="left-panel-heading" data-aos="fade-up" data-aos-duration="800" data-aos-delay="200">
                    Your Journey<br/>Begins Here
                </h1>
                
                <!-- Subheading -->
                <p class="left-panel-subheading" data-aos="fade-up" data-aos-duration="800" data-aos-delay="400">
                    Discover unforgettable destinations at unbeatable prices
                </p>
                
                <!-- Features List -->
                <div class="features-list">
                    <!-- Feature 1: Destinations -->
                    <div class="feature-item" data-aos="fade-right" data-aos-duration="600" data-aos-delay="600">
                        <div class="feature-icon-container">
                            <svg class="feature-icon-svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                                <circle cx="12" cy="10" r="3"></circle>
                            </svg>
                        </div>
                        <div class="feature-text-container">
                            <h4 class="feature-title">25+ Active Destinations</h4>
                            <p class="feature-subtitle">Curated travel packages worldwide</p>
                        </div>
                    </div>
                    
                    <!-- Feature 2: Security -->
                    <div class="feature-item" data-aos="fade-right" data-aos-duration="600" data-aos-delay="750">
                        <div class="feature-icon-container">
                            <svg class="feature-icon-svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                                <path d="M9 12l2 2 4-4"></path>
                            </svg>
                        </div>
                        <div class="feature-text-container">
                            <h4 class="feature-title">Secure Booking Guaranteed</h4>
                            <p class="feature-subtitle">100% safe and encrypted transactions</p>
                        </div>
                    </div>
                    
                    <!-- Feature 3: Support -->
                    <div class="feature-item" data-aos="fade-right" data-aos-duration="600" data-aos-delay="900">
                        <div class="feature-icon-container">
                            <svg class="feature-icon-svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M12 1a3 3 0 0 0-3 3v8a3 3 0 0 0 6 0V4a3 3 0 0 0-3-3z"></path>
                                <path d="M19 10v2a7 7 0 0 1-14 0v-2"></path>
                                <line x1="12" y1="19" x2="12" y2="23"></line>
                                <line x1="8" y1="23" x2="16" y2="23"></line>
                            </svg>
                        </div>
                        <div class="feature-text-container">
                            <h4 class="feature-title">24/7 Customer Support</h4>
                            <p class="feature-subtitle">We're here whenever you need us</p>
                        </div>
                    </div>
                    
                    <!-- Feature 4: Best Price -->
                    <div class="feature-item" data-aos="fade-right" data-aos-duration="600" data-aos-delay="1050">
                        <div class="feature-icon-container">
                            <svg class="feature-icon-svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <line x1="12" y1="1" x2="12" y2="23"></line>
                                <path d="M17 5H9.5a3.5 3.5 0 0 0 0 7h5a3.5 3.5 0 0 1 0 7H6"></path>
                            </svg>
                        </div>
                        <div class="feature-text-container">
                            <h4 class="feature-title">Best Price Promise</h4>
                            <p class="feature-subtitle">Unbeatable deals on every package</p>
                        </div>
                    </div>
                </div>
                
                <!-- Customer Testimonial -->
                <div class="testimonial-card" data-aos="fade-up" data-aos-duration="800" data-aos-delay="1200">
                    <div class="testimonial-header">
                        <img src="https://i.pravatar.cc/150?img=5" alt="Sarah Johnson" class="testimonial-avatar">
                        <div class="testimonial-author-info">
                            <p class="testimonial-author-name">Sarah Johnson</p>
                            <div class="testimonial-rating">
                                <svg class="star-icon" viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
                                <svg class="star-icon" viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
                                <svg class="star-icon" viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
                                <svg class="star-icon" viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
                                <svg class="star-icon" viewBox="0 0 24 24" fill="currentColor"><path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"/></svg>
                            </div>
                        </div>
                    </div>
                    <p class="testimonial-quote">
                        "Exploria made our Bali trip unforgettable! Seamless booking and amazing support."
                    </p>
                </div>
            </div>
        </div>

        <!-- ==========================================
             RIGHT PANEL - LOGIN FORM
             ========================================== -->
        <div class="right-panel-wrapper">
            <div id="main-content" class="login-form-card" data-aos="zoom-in" data-aos-duration="800" data-aos-delay="300">
                
                <!-- Top Accent Bar (decorative) -->
                <div class="card-top-accent"></div>
                
                <!-- Logo Icon (Optional) -->
                <div class="form-logo-container" data-aos="fade-down" data-aos-duration="600" data-aos-delay="500">
                    <div class="form-logo-icon">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M12 2L2 7l10 5 10-5-10-5z"></path>
                            <path d="M2 17l10 5 10-5"></path>
                            <path d="M2 12l10 5 10-5"></path>
                        </svg>
                    </div>
                </div>
                
                <!-- Heading Section -->
                <div class="form-heading-section" data-aos="fade-up" data-aos-duration="600" data-aos-delay="600">
                    <h1 id="login-heading" class="form-main-heading">
                        Welcome Back!
                    </h1>
                    <p class="form-subheading">
                        Sign in to continue your adventure
                    </p>
                </div>
                
                <!-- Form -->
                <div class="form-container">
                    <!-- Message Label -->
                    <asp:Label ID="lblMessage" runat="server"
                        CssClass="form-error-message"
                        ForeColor="Red"
                        role="alert"
                        aria-live="assertive"
                        aria-atomic="true">
                    </asp:Label>
                    
                    <div class="form-fields-wrapper">
                        <!-- Email Input Group -->
                        <div class="input-group" data-aos="fade-up" data-aos-duration="600" data-aos-delay="700">
                            <asp:Label ID="lblEmail" runat="server" For="txtEmail" CssClass="input-label">
                                Email address
                                <span class="required-indicator" aria-label="required">*</span>
                            </asp:Label>
                            <div class="input-wrapper">
                                <!-- Email Icon -->
                                <div class="input-icon" id="email-icon-container">
                                    <svg class="input-icon-svg" id="email-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                                        <polyline points="22,6 12,13 2,6"></polyline>
                                    </svg>
                                </div>
                                
                                <!-- Input Field -->
                                <asp:TextBox ID="txtEmail" runat="server" 
                                    TextMode="Email" 
                                    autocomplete="email"
                                    CssClass="premium-input"
                                    placeholder="Enter your email"
                                    aria-required="true"
                                    aria-describedby="email-error" />
                            </div>
                            <div id="email-error" class="error-message-container" role="alert"></div>
                        </div>
                        
                        <!-- Password Input Group -->
                        <div class="input-group" data-aos="fade-up" data-aos-duration="600" data-aos-delay="800">
                            <asp:Label ID="lblPassword" runat="server" For="txtPassword" CssClass="input-label">
                                Password
                                <span class="required-indicator" aria-label="required">*</span>
                            </asp:Label>
                            <div class="input-wrapper">
                                <!-- Lock Icon -->
                                <div class="input-icon" id="password-icon-container">
                                    <svg class="input-icon-svg" id="password-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                                        <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                                    </svg>
                                </div>
                                
                                <!-- Input Field -->
                                <asp:TextBox ID="txtPassword" runat="server" 
                                    TextMode="Password"
                                    autocomplete="current-password"
                                    CssClass="premium-input"
                                    placeholder="Enter your password"
                                    aria-required="true"
                                    aria-describedby="password-error" />
                                
                                <!-- Show/Hide Password Toggle -->
                                <button type="button" class="password-toggle-btn" onclick="togglePasswordVisibility()" aria-label="Toggle password visibility" aria-pressed="false" id="password-toggle">
                                    <svg class="toggle-icon" id="eye-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                        <circle cx="12" cy="12" r="3"></circle>
                                    </svg>
                                </button>
                            </div>
                            <div id="password-error" class="error-message-container" role="alert"></div>
                        </div>

                        <!-- Remember Me & Forgot Password Row -->
                        <div class="remember-forgot-row" data-aos="fade-up" data-aos-duration="600" data-aos-delay="900">
                            <!-- Custom Checkbox -->
                            <label class="custom-checkbox-label">
                                <asp:CheckBox ID="chkRememberMe" runat="server"
                                    CssClass="custom-checkbox-input"
                                    aria-label="Remember me" />
                                <span class="custom-checkbox-box">
                                    <svg class="checkbox-checkmark" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round">
                                        <polyline points="20 6 9 17 4 12"></polyline>
                                    </svg>
                                </span>
                                <span class="checkbox-label-text">Remember me</span>
                            </label>
                            
                            <!-- Forgot Password Link -->
                            <asp:HyperLink ID="hlForgotPassword" runat="server" 
                                NavigateUrl="ForgetPassword.aspx"
                                CssClass="forgot-password-link"
                                aria-label="Forgot your password?">
                                Forgot password?
                                <span class="link-underline"></span>
                            </asp:HyperLink>
                        </div>

                        <!-- Sign In Button -->
                        <div class="submit-button-container" data-aos="fade-up" data-aos-duration="600" data-aos-delay="1000">
                            <asp:Button ID="btnLogin" runat="server"
                                Text="Sign In &rarr;"
                                CssClass="premium-submit-btn"
                                OnClick="btnLogin_Click1"
                                aria-label="Sign in to your account" />
                        </div>
                        
                        <!-- Divider -->
                        <div class="form-divider" data-aos="fade-up" data-aos-duration="600" data-aos-delay="1100">
                            <div class="divider-line"></div>
                            <span class="divider-text">Or continue with</span>
                            <div class="divider-line"></div>
                        </div>
                        
                        <!-- Social Login Buttons -->
                        <div class="social-buttons-container" data-aos="fade-up" data-aos-duration="600" data-aos-delay="1200">
                            <button type="button" class="social-login-btn" aria-label="Sign in with Google">
                                <svg class="social-icon" viewBox="0 0 24 24">
                                    <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>
                                    <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
                                    <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/>
                                    <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/>
                                </svg>
                                <span>Google</span>
                            </button>
                            
                            <button type="button" class="social-login-btn" aria-label="Sign in with Facebook">
                                <svg class="social-icon" viewBox="0 0 24 24" fill="#1877F2">
                                    <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/>
                                </svg>
                                <span>Facebook</span>
                            </button>
                        </div>
                    </div>
                </div>

                
                <!-- Sign Up Section -->
                <div class="signup-section" data-aos="fade-up" data-aos-duration="600" data-aos-delay="1300">
                    <p class="signup-text">
                        Don't have an account?
                        <asp:HyperLink ID="hlSignUp" runat="server" 
                            NavigateUrl="Register.aspx"
                            CssClass="signup-link"
                            aria-label="Sign up for a new account">
                            Sign Up
                            <span class="link-underline"></span>
                        </asp:HyperLink>
                    </p>
                </div>
                
                <!-- Trust Badges -->
                <div class="trust-badges-container" data-aos="fade-up" data-aos-duration="600" data-aos-delay="1400">
                    <div class="trust-badge-item">
                        <svg class="trust-badge-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                            <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                        </svg>
                        <span class="trust-badge-text">Secure Login</span>
                    </div>
                    
                    <div class="trust-badge-item">
                        <svg class="trust-badge-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                            <path d="M9 12l2 2 4-4"></path>
                        </svg>
                        <span class="trust-badge-text">SSL Protected</span>
                    </div>
                    
                    <div class="trust-badge-item">
                        <svg class="trust-badge-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M12 22s8-4 8-10V5l-8-3-8 3v7c0 6 8 10 8 10z"></path>
                        </svg>
                        <span class="trust-badge-text">Privacy Guaranteed</span>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- AOS Animation Library -->
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    
    <script>
        // ==========================================
        // INITIALIZATION
        // ==========================================
        document.addEventListener('DOMContentLoaded', function() {
            // Initialize AOS animations
            AOS.init({
                duration: 800,
                easing: 'ease-out-cubic',
                once: true,
                offset: 50
            });
            
            initializeInputFocusEffects();
            initializeButtonEffects();
            initializeFormValidation();
        });
        
        // ==========================================
        // PARALLAX BACKGROUND EFFECT
        // ==========================================
        let ticking = false;
        window.addEventListener('scroll', function() {
            if (!ticking) {
                window.requestAnimationFrame(function() {
                    const parallax = document.querySelector('.parallax-bg');
                    if (parallax) {
                        const scrollPosition = window.pageYOffset;
                        parallax.style.transform = 'translateY(' + (scrollPosition * 0.4) + 'px) scale(1.1)';
                    }
                    ticking = false;
                });
                ticking = true;
            }
        });
        
        // ==========================================
        // PASSWORD VISIBILITY TOGGLE
        // ==========================================
        function togglePasswordVisibility() {
            const passwordInput = document.getElementById('<%= txtPassword.ClientID %>');
            const toggleBtn = document.getElementById('password-toggle');
            const eyeIcon = document.getElementById('eye-icon');
            
            if (!passwordInput || !eyeIcon) return;
            
            const isPassword = passwordInput.type === 'password';
            passwordInput.type = isPassword ? 'text' : 'password';
            toggleBtn.setAttribute('aria-pressed', isPassword ? 'true' : 'false');
            
            // Change icon
            if (isPassword) {
                // Eye-off icon
                eyeIcon.innerHTML = '<path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path><line x1="1" y1="1" x2="23" y2="23"></line>';
            } else {
                // Eye icon
                eyeIcon.innerHTML = '<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle>';
            }
            
            // Add bounce animation
            eyeIcon.style.animation = 'none';
            setTimeout(() => {
                eyeIcon.style.animation = 'iconBounce 0.4s ease';
            }, 10);
        }
        
        // ==========================================
        // INPUT FOCUS EFFECTS
        // ==========================================
        function initializeInputFocusEffects() {
            const inputs = document.querySelectorAll('.premium-input');
            
            inputs.forEach(input => {
                // Focus event
                input.addEventListener('focus', function() {
                    const wrapper = this.closest('.input-wrapper');
                    const icon = wrapper.querySelector('.input-icon-svg');
                    
                    wrapper.classList.add('input-focused');
                    if (icon) {
                        icon.style.stroke = 'var(--emerald)';
                        icon.style.transform = 'scale(1.1)';
                    }
                });
                
                // Blur event
                input.addEventListener('blur', function() {
                    const wrapper = this.closest('.input-wrapper');
                    const icon = wrapper.querySelector('.input-icon-svg');
                    
                    if (!this.value) {
                        wrapper.classList.remove('input-focused');
                        if (icon) {
                            icon.style.stroke = 'var(--text-light)';
                            icon.style.transform = 'scale(1)';
                        }
                    }
                });
                
                // Check on load if field has value
                if (input.value) {
                    const wrapper = input.closest('.input-wrapper');
                    wrapper.classList.add('input-focused');
                }
            });
        }
        
        // ==========================================
        // BUTTON RIPPLE EFFECT
        // ==========================================
        function initializeButtonEffects() {
            const submitBtn = document.querySelector('.premium-submit-btn');
            
            if (submitBtn) {
                submitBtn.addEventListener('click', function(e) {
                    const ripple = this.querySelector('.btn-ripple-effect');
                    if (ripple) {
                        ripple.style.animation = 'none';
                        setTimeout(() => {
                            ripple.style.animation = 'ripple 0.6s ease-out';
                        }, 10);
                    }
                });
            }
        }
        
        // ==========================================
        // FORM VALIDATION
        // ==========================================
        function initializeFormValidation() {
            const emailInput = document.getElementById('<%= txtEmail.ClientID %>');
            const passwordInput = document.getElementById('<%= txtPassword.ClientID %>');
            
            if (emailInput) {
                emailInput.addEventListener('blur', function() {
                    validateEmail(this);
                });
            }
            
            if (passwordInput) {
                passwordInput.addEventListener('blur', function() {
                    validatePassword(this);
                });
            }
        }
        
        function validateEmail(input) {
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            const value = input.value.trim();
            const errorContainer = document.getElementById('email-error');
            
            if (value && !emailRegex.test(value)) {
                showInputError(input, errorContainer, 'Please enter a valid email address');
                return false;
            } else {
                clearInputError(input, errorContainer);
                return true;
            }
        }
        
        function validatePassword(input) {
            const value = input.value;
            const errorContainer = document.getElementById('password-error');
            
            if (value && value.length < 6) {
                showInputError(input, errorContainer, 'Password must be at least 6 characters');
                return false;
            } else {
                clearInputError(input, errorContainer);
                return true;
            }
        }
        
        function showInputError(input, container, message) {
            input.classList.add('input-error');
            container.innerHTML = `
                <svg class="error-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="12" cy="12" r="10"></circle>
                    <line x1="12" y1="8" x2="12" y2="12"></line>
                    <line x1="12" y1="16" x2="12.01" y2="16"></line>
                </svg>
                <span>${message}</span>
            `;
            container.style.display = 'flex';
            
            // Shake animation
            input.style.animation = 'shake 0.4s ease';
            setTimeout(() => {
                input.style.animation = '';
            }, 400);
        }
        
        function clearInputError(input, container) {
            input.classList.remove('input-error');
            container.style.display = 'none';
            container.innerHTML = '';
        }
        
        // ==========================================
        // LOADING STATE ON SUBMIT
        // ==========================================
        function showLoadingState() {
            const submitBtn = document.querySelector('.premium-submit-btn');
            
            if (submitBtn) {
                submitBtn.disabled = true;
                submitBtn.style.pointerEvents = 'none';
                submitBtn.style.opacity = '0.7';
                submitBtn.value = 'Signing In...';
            }
        }
        
        // ==========================================
        // ACCESSIBILITY - KEYBOARD NAVIGATION
        // ==========================================
        document.addEventListener('keydown', function(e) {
            // Enter key on inputs
            if (e.key === 'Enter' && (e.target.id === '<%= txtEmail.ClientID %>' || e.target.id === '<%= txtPassword.ClientID %>')) {
                const submitBtn = document.querySelector('.premium-submit-btn');
                if (submitBtn && !submitBtn.disabled) {
                    submitBtn.click();
                }
            }
        });
        
        // ==========================================
        // PERFORMANCE - REDUCE MOTION
        // ==========================================
        if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
            AOS.init({
                duration: 0,
                once: true
            });
        }
    </script>
</asp:Content>
