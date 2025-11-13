<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Tours_Travels.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
    <link rel="stylesheet" href="css/Register.css" />
    <!-- Preload critical resources -->
    <link rel="preload" as="image" href="https://images.unsplash.com/photo-1504632349213-a420042d2a1a?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Skip to Content Link (Accessibility) -->
    <a href="#main-content" class="skip-to-content">Skip to main content</a>
    
    <section class="register-split-container" role="main" aria-labelledby="register-heading">
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
                    Start Your<br/>Journey Today
                </h1>
                
                <!-- Subheading -->
                <p class="left-panel-subheading" data-aos="fade-up" data-aos-duration="800" data-aos-delay="400">
                    Join thousands of travelers discovering amazing destinations
                </p>
                
                <!-- Benefits List -->
                <div class="benefits-list">
                    <!-- Benefit 1: Exclusive Deals -->
                    <div class="benefit-item" data-aos="fade-right" data-aos-duration="600" data-aos-delay="600">
                        <div class="benefit-icon-container">
                            <svg class="benefit-icon-svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <circle cx="9" cy="21" r="1"></circle>
                                <circle cx="20" cy="21" r="1"></circle>
                                <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
                            </svg>
                        </div>
                        <div class="benefit-text-container">
                            <h4 class="benefit-title">Exclusive Member Deals</h4>
                            <p class="benefit-subtitle">Save up to 40% on premium packages</p>
                        </div>
                    </div>
                    
                    <!-- Benefit 2: Easy Booking -->
                    <div class="benefit-item" data-aos="fade-right" data-aos-duration="600" data-aos-delay="750">
                        <div class="benefit-icon-container">
                            <svg class="benefit-icon-svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect>
                                <line x1="16" y1="2" x2="16" y2="6"></line>
                                <line x1="8" y1="2" x2="8" y2="6"></line>
                                <line x1="3" y1="10" x2="21" y2="10"></line>
                            </svg>
                        </div>
                        <div class="benefit-text-container">
                            <h4 class="benefit-title">Quick & Easy Booking</h4>
                            <p class="benefit-subtitle">Book your dream trip in minutes</p>
                        </div>
                    </div>
                    
                    <!-- Benefit 3: Travel Rewards -->
                    <div class="benefit-item" data-aos="fade-right" data-aos-duration="600" data-aos-delay="900">
                        <div class="benefit-icon-container">
                            <svg class="benefit-icon-svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon>
                            </svg>
                        </div>
                        <div class="benefit-text-container">
                            <h4 class="benefit-title">Travel Rewards Program</h4>
                            <p class="benefit-subtitle">Earn points on every booking</p>
                        </div>
                    </div>
                    
                    <!-- Benefit 4: Priority Support -->
                    <div class="benefit-item" data-aos="fade-right" data-aos-duration="600" data-aos-delay="1050">
                        <div class="benefit-icon-container">
                            <svg class="benefit-icon-svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path>
                            </svg>
                        </div>
                        <div class="benefit-text-container">
                            <h4 class="benefit-title">Priority Customer Support</h4>
                            <p class="benefit-subtitle">Dedicated assistance for members</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ==========================================
             RIGHT PANEL - REGISTRATION FORM
             ========================================== -->
        <div class="right-panel-wrapper">
            <div id="main-content" class="register-form-card" data-aos="zoom-in" data-aos-duration="800" data-aos-delay="300">
                
                <!-- Top Accent Bar -->
                <div class="card-top-accent"></div>
                
                <!-- Logo Icon -->
                <div class="form-logo-container" data-aos="fade-down" data-aos-duration="600" data-aos-delay="500">
                    <div class="form-logo-icon">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                            <circle cx="12" cy="7" r="4"></circle>
                        </svg>
                    </div>
                </div>
                
                <!-- Heading Section -->
                <div class="form-heading-section" data-aos="fade-up" data-aos-duration="600" data-aos-delay="600">
                    <h1 id="register-heading" class="form-main-heading">
                        Join the Adventure
                    </h1>
                    <p class="form-subheading">
                        Create an account to start your journey
                    </p>
                </div>
                
                <!-- Form Container -->
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
                        <!-- Row 1: First Name & Last Name -->
                        <div class="input-row" data-aos="fade-up" data-aos-duration="600" data-aos-delay="700">
                            <div class="input-group">
                                <asp:Label ID="lblFirstName" runat="server" For="txtFirstName" CssClass="input-label">
                                    First Name<span class="required-indicator" aria-label="required">*</span>
                                </asp:Label>
                                <div class="input-wrapper">
                                    <div class="input-icon">
                                        <svg class="input-icon-svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                            <circle cx="12" cy="7" r="4"></circle>
                                        </svg>
                                    </div>
                                    <asp:TextBox ID="txtFirstName" runat="server" autocomplete="given-name"
                                        CssClass="premium-input" placeholder="Enter first name" aria-required="true" />
                                </div>
                            </div>
                            
                            <div class="input-group">
                                <asp:Label ID="lblLastName" runat="server" For="txtLastName" CssClass="input-label">
                                    Last Name<span class="required-indicator" aria-label="required">*</span>
                                </asp:Label>
                                <div class="input-wrapper">
                                    <div class="input-icon">
                                        <svg class="input-icon-svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                                            <circle cx="12" cy="7" r="4"></circle>
                                        </svg>
                                    </div>
                                    <asp:TextBox ID="txtLastName" runat="server" autocomplete="family-name"
                                        CssClass="premium-input" placeholder="Enter last name" aria-required="true" />
                                </div>
                            </div>
                        </div>

                        <!-- Row 2: Email & Phone -->
                        <div class="input-row" data-aos="fade-up" data-aos-duration="600" data-aos-delay="800">
                            <div class="input-group">
                                <asp:Label ID="lblEmail" runat="server" For="txtEmail" CssClass="input-label">
                                    Email Address<span class="required-indicator" aria-label="required">*</span>
                                </asp:Label>
                                <div class="input-wrapper">
                                    <div class="input-icon">
                                        <svg class="input-icon-svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path>
                                            <polyline points="22,6 12,13 2,6"></polyline>
                                        </svg>
                                    </div>
                                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" autocomplete="email"
                                        CssClass="premium-input" placeholder="Enter your email" aria-required="true" />
                                </div>
                            </div>
                            
                            <div class="input-group">
                                <asp:Label ID="lblPhone" runat="server" For="txtPhone" CssClass="input-label">
                                    Phone Number<span class="required-indicator" aria-label="required">*</span>
                                </asp:Label>
                                <div class="input-wrapper">
                                    <div class="input-icon">
                                        <svg class="input-icon-svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path>
                                        </svg>
                                    </div>
                                    <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone" autocomplete="tel"
                                        CssClass="premium-input" placeholder="Enter phone number" aria-required="true" />
                                </div>
                            </div>
                        </div>

                        <!-- Row 3: Country & State -->
                        <div class="input-row" data-aos="fade-up" data-aos-duration="600" data-aos-delay="900">
                            <div class="input-group">
                                <asp:Label ID="lblCountry" runat="server" For="ddlCountry" CssClass="input-label">
                                    Country<span class="required-indicator" aria-label="required">*</span>
                                </asp:Label>
                                <div class="input-wrapper">
                                    <div class="input-icon">
                                        <svg class="input-icon-svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <circle cx="12" cy="12" r="10"></circle>
                                            <line x1="2" y1="12" x2="22" y2="12"></line>
                                            <path d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z"></path>
                                        </svg>
                                    </div>
                                    <asp:DropDownList ID="ddlCountry" runat="server" autocomplete="country-name"
                                        CssClass="premium-input premium-select" aria-required="true">
                                        <asp:ListItem Value="" Disabled="True" Selected="True">Select your country</asp:ListItem>
                                        <asp:ListItem Value="IN">India</asp:ListItem>
                                        <asp:ListItem Value="US">United States</asp:ListItem>
                                        <asp:ListItem Value="GB">United Kingdom</asp:ListItem>
                                        <asp:ListItem Value="CA">Canada</asp:ListItem>
                                        <asp:ListItem Value="AU">Australia</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            
                            <div class="input-group">
                                <asp:Label ID="lblState" runat="server" For="txtState" CssClass="input-label">
                                    State / Province
                                </asp:Label>
                                <div class="input-wrapper">
                                    <div class="input-icon">
                                        <svg class="input-icon-svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path>
                                            <circle cx="12" cy="10" r="3"></circle>
                                        </svg>
                                    </div>
                                    <asp:TextBox ID="txtState" runat="server" autocomplete="address-level1"
                                        CssClass="premium-input" placeholder="Enter state/province" />
                                </div>
                            </div>
                        </div>

                        <!-- Row 4: City & Profile Picture -->
                        <div class="input-row" data-aos="fade-up" data-aos-duration="600" data-aos-delay="1000">
                            <div class="input-group">
                                <asp:Label ID="lblCity" runat="server" For="txtCity" CssClass="input-label">
                                    City
                                </asp:Label>
                                <div class="input-wrapper">
                                    <div class="input-icon">
                                        <svg class="input-icon-svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
                                            <polyline points="9 22 9 12 15 12 15 22"></polyline>
                                        </svg>
                                    </div>
                                    <asp:TextBox ID="txtCity" runat="server" autocomplete="address-level2"
                                        CssClass="premium-input" placeholder="Enter city" />
                                </div>
                            </div>
                            
                            <div class="input-group">
                                <asp:Label ID="lblFileUpload" runat="server" For="fpImage" CssClass="input-label">
                                    Profile Picture (Optional)
                                </asp:Label>
                                <div class="file-upload-wrapper">
                                    <asp:FileUpload ID="fpImage" runat="server" CssClass="file-upload-input" accept="image/*" />
                                    <label class="file-upload-label" for="<%= fpImage.ClientID %>">
                                        <svg class="upload-icon" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path>
                                            <polyline points="17 8 12 3 7 8"></polyline>
                                            <line x1="12" y1="3" x2="12" y2="15"></line>
                                        </svg>
                                        <span class="upload-text">Choose File</span>
                                        <span class="upload-subtext">or drag and drop</span>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <!-- Row 5: Password & Confirm Password -->
                        <div class="input-row" data-aos="fade-up" data-aos-duration="600" data-aos-delay="1100">
                            <div class="input-group">
                                <asp:Label ID="lblPassword" runat="server" For="txtPassword" CssClass="input-label">
                                    Password<span class="required-indicator" aria-label="required">*</span>
                                </asp:Label>
                                <div class="input-wrapper">
                                    <div class="input-icon">
                                        <svg class="input-icon-svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                                            <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                                        </svg>
                                    </div>
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" autocomplete="new-password"
                                        CssClass="premium-input" placeholder="Create password" aria-required="true" />
                                    <button type="button" class="password-toggle-btn" onclick="togglePasswordVisibility('txtPassword', 'eye-icon-1')" aria-label="Toggle password visibility" id="password-toggle-1">
                                        <svg class="toggle-icon" id="eye-icon-1" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                            <circle cx="12" cy="12" r="3"></circle>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                            
                            <div class="input-group">
                                <asp:Label ID="lblConfirmPassword" runat="server" For="txtConfirmPassword" CssClass="input-label">
                                    Confirm Password<span class="required-indicator" aria-label="required">*</span>
                                </asp:Label>
                                <div class="input-wrapper">
                                    <div class="input-icon">
                                        <svg class="input-icon-svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                                            <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                                        </svg>
                                    </div>
                                    <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" autocomplete="new-password"
                                        CssClass="premium-input" placeholder="Confirm password" aria-required="true" />
                                    <button type="button" class="password-toggle-btn" onclick="togglePasswordVisibility('txtConfirmPassword', 'eye-icon-2')" aria-label="Toggle password visibility" id="password-toggle-2">
                                        <svg class="toggle-icon" id="eye-icon-2" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path>
                                            <circle cx="12" cy="12" r="3"></circle>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Submit Button -->
                    <div class="submit-button-container" data-aos="fade-up" data-aos-duration="600" data-aos-delay="1200">
                        <asp:Button ID="btnCreateAccount" runat="server"
                            Text="Create Account &rarr;"
                            CssClass="premium-submit-btn"
                            OnClick="btnCreateAccount_Click"
                            aria-label="Create your account" />
                    </div>

                    <!-- Sign In Link -->
                    <div class="signin-section" data-aos="fade-up" data-aos-duration="600" data-aos-delay="1300">
                        <p class="signin-text">
                            Already have an account?
                            <asp:HyperLink ID="hlSignIn" runat="server" 
                                NavigateUrl="~/Login.aspx"
                                CssClass="signin-link"
                                aria-label="Sign in to your account">
                                Sign In
                                <span class="link-underline"></span>
                            </asp:HyperLink>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- AOS Animation Library -->
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    
    <script>
        // Initialize AOS
        AOS.init({
            duration: 800,
            easing: 'ease-out-cubic',
            once: true,
            offset: 50
        });
        
        // Parallax effect
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
        
        // Password visibility toggle
        function togglePasswordVisibility(inputId, iconId) {
            const input = document.getElementById('<%= txtPassword.ClientID %>').id.includes(inputId.split('txt')[1]) ? 
                         document.getElementById('<%= txtPassword.ClientID %>') : 
                         document.getElementById('<%= txtConfirmPassword.ClientID %>');
            const icon = document.getElementById(iconId);
            
            if (!input || !icon) return;
            
            const isPassword = input.type === 'password';
            input.type = isPassword ? 'text' : 'password';
            
            if (isPassword) {
                icon.innerHTML = '<path d="M17.94 17.94A10.07 10.07 0 0 1 12 20c-7 0-11-8-11-8a18.45 18.45 0 0 1 5.06-5.94M9.9 4.24A9.12 9.12 0 0 1 12 4c7 0 11 8 11 8a18.5 18.5 0 0 1-2.16 3.19m-6.72-1.07a3 3 0 1 1-4.24-4.24"></path><line x1="1" y1="1" x2="23" y2="23"></line>';
            } else {
                icon.innerHTML = '<path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8-11-8-11-8z"></path><circle cx="12" cy="12" r="3"></circle>';
            }
        }
        
        // Input focus effects
        document.querySelectorAll('.premium-input').forEach(input => {
            input.addEventListener('focus', function() {
                const wrapper = this.closest('.input-wrapper');
                const icon = wrapper.querySelector('.input-icon-svg');
                wrapper.classList.add('input-focused');
                if (icon) {
                    icon.style.stroke = 'var(--emerald)';
                    icon.style.transform = 'scale(1.1)';
                }
            });
            
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
        });
        
        // File upload label update
        const fileInput = document.getElementById('<%= fpImage.ClientID %>');
        if (fileInput) {
            fileInput.addEventListener('change', function() {
                const label = this.nextElementSibling;
                const uploadText = label.querySelector('.upload-text');
                if (this.files && this.files[0]) {
                    uploadText.textContent = this.files[0].name;
                } else {
                    uploadText.textContent = 'Choose File';
                }
            });
        }
        
        // Reduced motion support
        if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
            AOS.init({ duration: 0, once: true });
        }
    </script>
</asp:Content>
