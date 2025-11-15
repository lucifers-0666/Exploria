<%@ Page Title="Privacy Policy" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Privacy.aspx.cs" Inherits="Tours_Travels.Privacy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Tailwind base (keep only one global include on the whole site;
         remove this line if Tailwind is already in your master page) -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" />

    <!-- Page specific CSS -->
    <link rel="stylesheet" href="css/privacy.css" />

    <!-- Page specific JS -->
    <script src="js/privacy.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="privacy-page">
        <!-- Top gradient background section -->
        <section class="privacy-hero">
            <div class="privacy-hero-inner">
                <div class="privacy-badge">
                    <span class="privacy-badge-icon">
                        <i class="las la-shield-alt"></i>
                    </span>
                    <span class="privacy-badge-text">Exploria Privacy Center</span>
                </div>

                <h1 class="privacy-title">
                    Privacy Policy
                </h1>
                <p class="privacy-subtitle">
                    Your journey matters, and so does your data. Learn how we collect, safeguard and use your information when you travel with us.
                </p>

                <div class="privacy-meta">
                    <span class="privacy-meta-item">
                        <i class="las la-lock"></i>
                        Secure handling of personal data
                    </span>
                    <span class="privacy-meta-dot"></span>
                    <span class="privacy-meta-item">
                        <i class="las la-sync-alt"></i>
                        Updated on 11 November 2025
                    </span>
                </div>
            </div>

            <!-- Floating cards -->
            <div class="privacy-floating-card privacy-floating-card--left">
                <div class="privacy-floating-icon">
                    <i class="las la-user-shield"></i>
                </div>
                <div class="privacy-floating-text">
                    End‑to‑end encrypted
                </div>
            </div>
            <div class="privacy-floating-card privacy-floating-card--right">
                <div class="privacy-floating-icon">
                    <i class="las la-cookie-bite"></i>
                </div>
                <div class="privacy-floating-text">
                    Transparent tracking controls
                </div>
            </div>
        </section>

        <!-- Main layout -->
        <section class="privacy-layout">
            <!-- Sidebar -->
            <aside class="privacy-sidebar">
                <div class="privacy-sidebar-inner">
                    <h2 class="privacy-sidebar-title">On this page</h2>
                    <ol class="privacy-sidebar-list">
                        <li><a href="#pp-1" class="privacy-sidebar-link">1. Information We Collect</a></li>
                        <li><a href="#pp-2" class="privacy-sidebar-link">2. How We Use Your Information</a></li>
                        <li><a href="#pp-3" class="privacy-sidebar-link">3. Data Security</a></li>
                        <li><a href="#pp-4" class="privacy-sidebar-link">4. Information Sharing</a></li>
                        <li><a href="#pp-5" class="privacy-sidebar-link">5. Cookies &amp; Tracking</a></li>
                        <li><a href="#pp-6" class="privacy-sidebar-link">6. Your Rights</a></li>
                        <li><a href="#pp-7" class="privacy-sidebar-link">7. Contact Us</a></li>
                        <li><a href="#pp-8" class="privacy-sidebar-link">8. Additional Information</a></li>
                    </ol>
                </div>
            </aside>

            <!-- Content -->
            <div class="privacy-content-wrapper">
                <div class="privacy-content-card">

                    <!-- Section 1 -->
                    <section id="pp-1" class="privacy-section">
                        <header class="privacy-section-header">
                            <div class="privacy-section-icon">
                                <i class="las la-info-circle"></i>
                            </div>
                            <div>
                                <p class="privacy-section-kicker">Your information</p>
                                <h2 class="privacy-section-title">1. Information We Collect</h2>
                            </div>
                        </header>
                        <p class="privacy-body-text">
                            We collect information that helps us provide secure, personalized and efficient travel experiences when you use our website, mobile site or contact our support team.
                        </p>
                        <div class="privacy-grid">
                            <div class="privacy-chip-card">
                                <h3 class="privacy-chip-title">Personal information</h3>
                                <p class="privacy-chip-text">
                                    Name, email address, phone number and billing address used for your bookings and communication.
                                </p>
                            </div>
                            <div class="privacy-chip-card">
                                <h3 class="privacy-chip-title">Payment details</h3>
                                <p class="privacy-chip-text">
                                    Credit or debit card details processed only through secure, PCI‑compliant payment gateways; we do not store full card numbers.
                                </p>
                            </div>
                            <div class="privacy-chip-card">
                                <h3 class="privacy-chip-title">Travel preferences</h3>
                                <p class="privacy-chip-text">
                                    Passport details, itinerary choices, frequent‑traveller preferences and special requirements shared by you for your trips.
                                </p>
                            </div>
                            <div class="privacy-chip-card">
                                <h3 class="privacy-chip-title">Usage and device data</h3>
                                <p class="privacy-chip-text">
                                    IP address, approximate location, device and browser type, pages visited and time spent on our website.
                                </p>
                            </div>
                        </div>
                    </section>

                    <div class="privacy-divider"></div>

                    <!-- Section 2 -->
                    <section id="pp-2" class="privacy-section">
                        <header class="privacy-section-header">
                            <div class="privacy-section-icon">
                                <i class="las la-database"></i>
                            </div>
                            <div>
                                <p class="privacy-section-kicker">Why we collect it</p>
                                <h2 class="privacy-section-title">2. How We Use Your Information</h2>
                            </div>
                        </header>
                        <p class="privacy-body-text">
                            Your information is processed only for clearly defined purposes that support your bookings and overall experience.
                        </p>
                        <ul class="privacy-list">
                            <li>Processing reservations, payments, cancellations and itinerary changes securely and efficiently.</li>
                            <li>Sending booking confirmations, vouchers, reminders and important travel updates.</li>
                            <li>Providing responsive customer support whenever you contact us for help or clarification.</li>
                            <li>Sharing curated offers and recommendations when you choose to receive marketing communication.</li>
                            <li>Improving our platform performance, features, security and user experience over time.</li>
                        </ul>
                        <p class="privacy-body-text">
                            We rely on your consent, the need to perform our contract with you and our legitimate interest in running and improving our travel services as the main legal bases for processing your personal data.
                        </p>
                    </section>

                    <div class="privacy-divider"></div>

                    <!-- Section 3 -->
                    <section id="pp-3" class="privacy-section">
                        <header class="privacy-section-header">
                            <div class="privacy-section-icon">
                                <i class="las la-lock"></i>
                            </div>
                            <div>
                                <p class="privacy-section-kicker">Keeping you safe</p>
                                <h2 class="privacy-section-title">3. Data Security</h2>
                            </div>
                        </header>

                        <div class="privacy-highlight">
                            <div class="privacy-highlight-pill">
                                <span class="privacy-highlight-dot"></span>
                                <span>End‑to‑end SSL encryption</span>
                            </div>
                            <p class="privacy-highlight-text">
                                Your security is our priority. All sensitive data is protected using industry‑standard encryption during transmission and stored using appropriate technical and organisational safeguards.
                            </p>
                        </div>

                        <p class="privacy-body-text">
                            We use layered safeguards designed to prevent unauthorised access, misuse or disclosure of your information.
                        </p>
                        <ul class="privacy-list">
                            <li>256‑bit SSL encryption for every transaction and login session on our website.</li>
                            <li>Hardened servers protected by firewalls, access controls and continuous monitoring.</li>
                            <li>Regular security reviews, audits and timely software updates across our systems.</li>
                            <li>Role‑based, limited employee access to personal data only when required for their work.</li>
                        </ul>
                    </section>

                    <div class="privacy-divider"></div>

                    <!-- Section 4 -->
                    <section id="pp-4" class="privacy-section">
                        <header class="privacy-section-header">
                            <div class="privacy-section-icon">
                                <i class="las la-share-alt"></i>
                            </div>
                            <div>
                                <p class="privacy-section-kicker">When we share</p>
                                <h2 class="privacy-section-title">4. Information Sharing</h2>
                            </div>
                        </header>
                        <p class="privacy-body-text">
                            We never sell or rent your personal information. Limited sharing happens only with trusted partners to fulfil your bookings, process payments or comply with the law.
                        </p>
                        <div class="privacy-grid">
                            <div class="privacy-chip-card">
                                <h3 class="privacy-chip-title">Service providers</h3>
                                <p class="privacy-chip-text">
                                    Hotels, airlines and tour operators receive only the details required to confirm and manage your reservations.
                                </p>
                            </div>
                            <div class="privacy-chip-card">
                                <h3 class="privacy-chip-title">Payment processors</h3>
                                <p class="privacy-chip-text">
                                    Certified payment gateways securely process your card details for payments, refunds and fraud checks.
                                </p>
                            </div>
                            <div class="privacy-chip-card">
                                <h3 class="privacy-chip-title">Legal authorities</h3>
                                <p class="privacy-chip-text">
                                    Information may be disclosed when required to comply with applicable laws, court orders or to protect our rights and the safety of our customers.
                                </p>
                            </div>
                        </div>
                        <p class="privacy-body-text">
                            When our partners or servers are located outside your country, we ensure that appropriate contractual and security safeguards are in place before data is transferred.
                        </p>
                    </section>

                    <div class="privacy-divider"></div>

                    <!-- Section 5 -->
                    <section id="pp-5" class="privacy-section">
                        <header class="privacy-section-header">
                            <div class="privacy-section-icon">
                                <i class="las la-cookie-bite"></i>
                            </div>
                            <div>
                                <p class="privacy-section-kicker">Cookies &amp; preferences</p>
                                <h2 class="privacy-section-title">5. Cookies and Tracking</h2>
                            </div>
                        </header>
                        <p class="privacy-body-text">
                            Cookies and similar technologies help us remember your preferences and understand how our website is used so we can make it more reliable and relevant for you.
                        </p>
                        <ul class="privacy-list">
                            <li>Keeping you signed in and storing language, currency or recent search preferences.</li>
                            <li>Measuring traffic, performance and usage patterns across pages and devices.</li>
                            <li>Personalising content and promotions that may match your travel interests.</li>
                            <li>Enhancing page speed, security checks and overall website functionality.</li>
                        </ul>
                        <p class="privacy-body-text">
                            You can manage or disable cookies at any time from your browser settings, although some features of the website may work best with cookies enabled.
                        </p>
                    </section>

                    <div class="privacy-divider"></div>

                    <!-- Section 6 -->
                    <section id="pp-6" class="privacy-section">
                        <header class="privacy-section-header">
                            <div class="privacy-section-icon">
                                <i class="las la-user-shield"></i>
                            </div>
                            <div>
                                <p class="privacy-section-kicker">Your control</p>
                                <h2 class="privacy-section-title">6. Your Rights</h2>
                            </div>
                        </header>
                        <p class="privacy-body-text">
                            You are in control of your personal data and can exercise the following rights subject to applicable laws.
                        </p>
                        <ul class="privacy-list">
                            <li><span class="privacy-right-label">Access:</span> Request a copy of the personal data we hold about you.</li>
                            <li><span class="privacy-right-label">Correction:</span> Ask us to update or fix inaccurate or incomplete details.</li>
                            <li><span class="privacy-right-label">Deletion:</span> Request deletion of data where it is no longer needed or permitted.</li>
                            <li><span class="privacy-right-label">Opt‑out:</span> Manage email preferences or unsubscribe from marketing at any time.</li>
                            <li><span class="privacy-right-label">Portability:</span> Receive your data in a structured, commonly used format where technically feasible.</li>
                        </ul>
                        <p class="privacy-body-text">
                            To exercise any of these rights, you can contact us using the details in the “Contact Us” section, and we will respond in a reasonable time frame.
                        </p>
                    </section>

                    <div class="privacy-divider"></div>

                    <!-- Section 7 -->
                    <section id="pp-7" class="privacy-section">
                        <header class="privacy-section-header">
                            <div class="privacy-section-icon">
                                <i class="las la-envelope"></i>
                            </div>
                            <div>
                                <p class="privacy-section-kicker">Talk to us</p>
                                <h2 class="privacy-section-title">7. Contact Us</h2>
                            </div>
                        </header>
                        <p class="privacy-body-text">
                            For any privacy‑related questions, requests or feedback, you can reach our Data Protection Officer using the details below.
                        </p>

                        <div class="privacy-contact-grid">
                            <div class="privacy-contact-card">
                                <h3 class="privacy-chip-title">Email</h3>
                                <p class="privacy-chip-text">
                                    privacy@exploria.com
                                </p>
                            </div>
                            <div class="privacy-contact-card">
                                <h3 class="privacy-chip-title">Phone</h3>
                                <p class="privacy-chip-text">
                                    +91 9876543210
                                </p>
                            </div>
                            <div class="privacy-contact-card">
                                <h3 class="privacy-chip-title">Address</h3>
                                <p class="privacy-chip-text">
                                    123 Travel Street, Mumbai, India
                                </p>
                            </div>
                        </div>
                    </section>

                    <div class="privacy-divider"></div>

                    <!-- Section 8: retention, children, changes -->
                    <section id="pp-8" class="privacy-section">
                        <header class="privacy-section-header">
                            <div class="privacy-section-icon">
                                <i class="las la-file-alt"></i>
                            </div>
                            <div>
                                <p class="privacy-section-kicker">Additional details</p>
                                <h2 class="privacy-section-title">8. Additional Information</h2>
                            </div>
                        </header>
                        <h3 class="privacy-subheading">Data retention</h3>
                        <p class="privacy-body-text">
                            We retain your personal data only for as long as necessary to fulfil the purposes described in this policy, or as required by law, such as tax, accounting and regulatory obligations.
                        </p>

                        <h3 class="privacy-subheading">Children’s data</h3>
                        <p class="privacy-body-text">
                            Our services are not directed to children under 16 years of age, and we do not knowingly collect their personal information. If you believe a child has provided us with data, please contact us so that we can delete it.
                        </p>

                        <h3 class="privacy-subheading">Policy updates</h3>
                        <p class="privacy-body-text">
                            We may update this Privacy Policy from time to time to reflect changes in our services or legal requirements. When we make material changes, we will update the “Last updated” date and, where appropriate, notify you through our website or by email.
                        </p>
                    </section>

                    <!-- Last updated -->
                    <p class="privacy-updated">
                        <span class="privacy-updated-dot"></span>
                        Last updated on <strong>November 11, 2025</strong>
                    </p>
                </div>
            </div>
        </section>
    </main>
       <script src="js/privacy.js"></script>
</asp:Content>
