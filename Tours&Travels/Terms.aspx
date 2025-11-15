<%@ Page Title="Terms &amp; Conditions" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Terms.aspx.cs" Inherits="Tours_Travels.Terms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Tailwind base (remove this line if Tailwind is already included in your master page) -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" />

    <!-- Page specific CSS -->
    <link rel="stylesheet" href="css/terms.css" />

    <!-- Page specific JS (for scroll reveal & active sidebar) -->
    <script src="js/terms.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="terms-page">
        <!-- Hero / title section -->
        <section class="terms-hero">
            <div class="terms-hero-inner">
                <div class="terms-badge">
                    <span class="terms-badge-icon">
                        <i class="las la-scroll"></i>
                    </span>
                    <span class="terms-badge-text">Exploria Terms Center</span>
                </div>

                <h1 class="terms-title">
                    Terms &amp; Conditions
                </h1>
                <p class="terms-subtitle">
                    Please read these terms carefully before using Exploria Tours &amp; Travels. By accessing our website or booking services, you agree to the conditions described below.
                </p>

                <div class="terms-meta">
                    <span class="terms-meta-item">
                        <i class="las la-balance-scale"></i>
                        Clear and fair travel policies
                    </span>
                    <span class="terms-meta-dot"></span>
                    <span class="terms-meta-item">
                        <i class="las la-sync-alt"></i>
                        Last updated on 11 November 2025
                    </span>
                </div>
            </div>

            <!-- Floating hero chips -->
            <div class="terms-floating-chip terms-floating-chip--left">
                <div class="terms-floating-icon">
                    <i class="las la-check-circle"></i>
                </div>
                <div class="terms-floating-text">
                    Transparent booking<br />conditions
                </div>
            </div>
            <div class="terms-floating-chip terms-floating-chip--right">
                <div class="terms-floating-icon">
                    <i class="las la-shield-alt"></i>
                </div>
                <div class="terms-floating-text">
                    Secure &amp; compliant<br />travel services
                </div>
            </div>
        </section>

        <!-- Layout with sidebar -->
        <section class="terms-layout">
            <!-- Sidebar navigation -->
            <aside class="terms-sidebar">
                <div class="terms-sidebar-inner">
                    <h2 class="terms-sidebar-title">On this page</h2>
                    <ol class="terms-sidebar-list">
                        <li><a href="#t-1" class="terms-sidebar-link">1. Introduction</a></li>
                        <li><a href="#t-2" class="terms-sidebar-link">2. Booking &amp; Reservations</a></li>
                        <li><a href="#t-3" class="terms-sidebar-link">3. Cancellation &amp; Refunds</a></li>
                        <li><a href="#t-4" class="terms-sidebar-link">4. Travel Insurance</a></li>
                        <li><a href="#t-5" class="terms-sidebar-link">5. Travel Documents</a></li>
                        <li><a href="#t-6" class="terms-sidebar-link">6. Limitation of Liability</a></li>
                        <li><a href="#t-7" class="terms-sidebar-link">7. Traveler Conduct</a></li>
                        <li><a href="#t-8" class="terms-sidebar-link">8. Modifications &amp; Changes</a></li>
                        <li><a href="#t-9" class="terms-sidebar-link">9. Governing Law</a></li>
                        <li><a href="#t-10" class="terms-sidebar-link">10. Contact Information</a></li>
                    </ol>
                </div>
            </aside>

            <!-- Main content -->
            <div class="terms-content-wrapper">
                <div class="terms-content-card">

                    <!-- 1. Introduction -->
                    <section id="t-1" class="terms-section">
                        <header class="terms-section-header">
                            <div class="terms-section-icon">
                                <i class="las la-info-circle"></i>
                            </div>
                            <div>
                                <p class="terms-section-kicker">Start here</p>
                                <h2 class="terms-section-title">1. Introduction</h2>
                            </div>
                        </header>
                        <p class="terms-body-text">
                            Welcome to Exploria Tours &amp; Travels. By accessing and using our website and services, you agree to comply with and be bound by these terms and conditions. If you do not agree with any part of these terms, you should not use our services.
                        </p>
                        <p class="terms-body-text">
                            “Exploria”, “we”, “our” and “us” refer to the company operating the travel services, while “you” and “your” refer to any user, customer or traveler using our website or booking through us.
                        </p>
                    </section>

                    <div class="terms-divider"></div>

                    <!-- 2. Booking & Reservations -->
                    <section id="t-2" class="terms-section">
                        <header class="terms-section-header">
                            <div class="terms-section-icon">
                                <i class="las la-calendar-check"></i>
                            </div>
                            <div>
                                <p class="terms-section-kicker">Your bookings</p>
                                <h2 class="terms-section-title">2. Booking and Reservations</h2>
                            </div>
                        </header>
                        <h3 class="terms-subheading">2.1 Booking process</h3>
                        <p class="terms-body-text">
                            All bookings must be made through our official website, mobile site or authorised agents. A booking is considered confirmed only after:
                        </p>
                        <ul class="terms-list">
                            <li>Receipt of full payment or required deposit as stated in your itinerary or offer.</li>
                            <li>Successful payment authorisation by our payment gateway or bank.</li>
                            <li>Confirmation email or voucher sent to the registered email address.</li>
                            <li>Availability reconfirmed by our operations and partner suppliers.</li>
                        </ul>

                        <h3 class="terms-subheading">2.2 Payment terms</h3>
                        <p class="terms-body-text">
                            Full payment is generally required at the time of booking unless otherwise mentioned in writing. We accept major credit/debit cards, UPI and other payment methods listed on our checkout page. All prices are quoted in INR (₹) unless stated otherwise.
                        </p>
                        <div class="terms-highlight terms-highlight--warning">
                            <div class="terms-highlight-label">
                                <i class="las la-exclamation-triangle"></i>
                                <span>Important</span>
                            </div>
                            <p class="terms-highlight-text">
                                Prices, taxes and service charges are subject to change without prior notice. Confirmed bookings are honoured at the price shown at the time of payment.
                            </p>
                        </div>
                    </section>

                    <div class="terms-divider"></div>

                    <!-- 3. Cancellation & Refunds -->
                    <section id="t-3" class="terms-section">
                        <header class="terms-section-header">
                            <div class="terms-section-icon">
                                <i class="las la-undo-alt"></i>
                            </div>
                            <div>
                                <p class="terms-section-kicker">Change of plans</p>
                                <h2 class="terms-section-title">3. Cancellation and Refund Policy</h2>
                            </div>
                        </header>

                        <h3 class="terms-subheading">3.1 Cancellation by customer</h3>
                        <p class="terms-body-text">
                            If you need to cancel a confirmed booking, the following charges generally apply unless a different policy is specified on your voucher:
                        </p>
                        <ul class="terms-list">
                            <li><span class="terms-strong">30+ days before departure:</span> 100% refund (minus applicable processing or bank fees).</li>
                            <li><span class="terms-strong">15–29 days before departure:</span> 50% refund of the total package cost.</li>
                            <li><span class="terms-strong">7–14 days before departure:</span> 25% refund of the total package cost.</li>
                            <li><span class="terms-strong">Less than 7 days before departure:</span> No refund applicable.</li>
                        </ul>
                        <p class="terms-body-text">
                            Refund timelines may vary depending on the payment method and partner policies. Any non‑refundable charges levied by airlines, hotels or other suppliers will be deducted from the refund amount.
                        </p>

                        <h3 class="terms-subheading">3.2 Cancellation or changes by company</h3>
                        <p class="terms-body-text">
                            In rare cases, Exploria may need to modify or cancel a booking due to operational issues, safety concerns or circumstances beyond our control (including natural disasters, political unrest, or insufficient participation).
                        </p>
                        <ul class="terms-list">
                            <li>Where possible, we will offer an alternative date, similar package or revised itinerary.</li>
                            <li>If no suitable alternative is available, you may be offered a full or partial refund, depending on supplier policies.</li>
                            <li>Exploria is not responsible for any additional expenses you incur such as visa fees, insurance or personal purchases.</li>
                        </ul>
                    </section>

                    <div class="terms-divider"></div>

                    <!-- 4. Travel Insurance -->
                    <section id="t-4" class="terms-section">
                        <header class="terms-section-header">
                            <div class="terms-section-icon">
                                <i class="las la-umbrella"></i>
                            </div>
                            <div>
                                <p class="terms-section-kicker">Stay protected</p>
                                <h2 class="terms-section-title">4. Travel Insurance</h2>
                            </div>
                        </header>
                        <p class="terms-body-text">
                            We strongly recommend that every traveler purchases comprehensive travel insurance that covers medical emergencies, trip cancellation, delays, loss of baggage and other unforeseen events.
                        </p>
                        <p class="terms-body-text">
                            Unless clearly included in your package, travel insurance is your own responsibility to arrange. Exploria is not liable for any costs that could have been covered by an appropriate insurance policy.
                        </p>
                    </section>

                    <div class="terms-divider"></div>

                    <!-- 5. Travel Documents -->
                    <section id="t-5" class="terms-section">
                        <header class="terms-section-header">
                            <div class="terms-section-icon">
                                <i class="las la-passport"></i>
                            </div>
                            <div>
                                <p class="terms-section-kicker">Before you depart</p>
                                <h2 class="terms-section-title">5. Travel Documents</h2>
                            </div>
                        </header>
                        <p class="terms-body-text">
                            It is your responsibility to ensure that all travel documents are valid and in order for the destinations on your itinerary. This may include:
                        </p>
                        <ul class="terms-list">
                            <li>Valid passport with at least six months’ remaining validity from the date of return.</li>
                            <li>Required entry visas for all countries included in your trip.</li>
                            <li>Health certificates and vaccination records, if applicable.</li>
                            <li>Any additional documentation required by airlines, immigration or local authorities.</li>
                        </ul>
                        <p class="terms-body-text">
                            Exploria may assist by providing general guidance but cannot be held responsible if you are denied boarding or entry due to incomplete or incorrect documentation.
                        </p>
                    </section>

                    <div class="terms-divider"></div>

                    <!-- 6. Limitation of Liability -->
                    <section id="t-6" class="terms-section">
                        <header class="terms-section-header">
                            <div class="terms-section-icon">
                                <i class="las la-balance-scale-right"></i>
                            </div>
                            <div>
                                <p class="terms-section-kicker">Our role</p>
                                <h2 class="terms-section-title">6. Limitation of Liability</h2>
                            </div>
                        </header>
                        <p class="terms-body-text">
                            Exploria acts primarily as an agent for independent hotels, airlines, transport providers and activity operators. While we take care in selecting partners, their services are ultimately subject to their own terms and conditions.
                        </p>
                        <ul class="terms-list">
                            <li>We are not liable for acts, errors or omissions of third‑party service providers.</li>
                            <li>We are not responsible for delays, cancellations or changes in transportation schedules.</li>
                            <li>We are not liable for loss, damage or injury arising from external factors beyond our reasonable control.</li>
                            <li>Our total liability, if established, is limited to the amount you paid directly to Exploria for the affected service.</li>
                        </ul>
                    </section>

                    <div class="terms-divider"></div>

                    <!-- 7. Traveler Conduct -->
                    <section id="t-7" class="terms-section">
                        <header class="terms-section-header">
                            <div class="terms-section-icon">
                                <i class="las la-user-friends"></i>
                            </div>
                            <div>
                                <p class="terms-section-kicker">Responsible travel</p>
                                <h2 class="terms-section-title">7. Traveler Conduct</h2>
                            </div>
                        </header>
                        <p class="terms-body-text">
                            All travelers are expected to behave respectfully towards fellow travelers, guides, local communities and property at all times during the tour.
                        </p>
                        <ul class="terms-list">
                            <li>Follow local laws, customs, regulations and instructions provided by our team or partners.</li>
                            <li>Refrain from any behaviour that is unsafe, disruptive, discriminatory or illegal.</li>
                            <li>Take reasonable care of accommodations, vehicles and other facilities provided as part of your trip.</li>
                            <li>Arrive on time for scheduled departures and activities to avoid delays for the group.</li>
                        </ul>
                        <p class="terms-body-text">
                            Exploria reserves the right to refuse service or terminate participation in a tour, without refund, if a traveler’s behaviour is considered dangerous or seriously inappropriate.
                        </p>
                    </section>

                    <div class="terms-divider"></div>

                    <!-- 8. Modifications & Changes -->
                    <section id="t-8" class="terms-section">
                        <header class="terms-section-header">
                            <div class="terms-section-icon">
                                <i class="las la-edit"></i>
                            </div>
                            <div>
                                <p class="terms-section-kicker">Updates</p>
                                <h2 class="terms-section-title">8. Modifications and Changes</h2>
                            </div>
                        </header>
                        <p class="terms-body-text">
                            Exploria may update these Terms &amp; Conditions from time to time to reflect changes in our services, supplier policies or legal requirements. Updates become effective once they are posted on our website unless stated otherwise.
                        </p>
                        <p class="terms-body-text">
                            Your continued use of our website or services after such changes are published will be considered acceptance of the revised terms. We encourage you to review this page periodically.
                        </p>
                    </section>

                    <div class="terms-divider"></div>

                    <!-- 9. Governing Law -->
                    <section id="t-9" class="terms-section">
                        <header class="terms-section-header">
                            <div class="terms-section-icon">
                                <i class="las la-gavel"></i>
                            </div>
                            <div>
                                <p class="terms-section-kicker">Jurisdiction</p>
                                <h2 class="terms-section-title">9. Governing Law</h2>
                            </div>
                        </header>
                        <p class="terms-body-text">
                            These terms and any disputes arising out of or in connection with your use of Exploria’s services shall be governed by and construed in accordance with the laws of India.
                        </p>
                        <p class="terms-body-text">
                            Subject to applicable law, any disputes shall fall under the exclusive jurisdiction of the courts located in your city or another specified jurisdiction mentioned in your booking or invoice.
                        </p>
                    </section>

                    <div class="terms-divider"></div>

                    <!-- 10. Contact Information -->
                    <section id="t-10" class="terms-section">
                        <header class="terms-section-header">
                            <div class="terms-section-icon">
                                <i class="las la-envelope-open-text"></i>
                            </div>
                            <div>
                                <p class="terms-section-kicker">Talk to us</p>
                                <h2 class="terms-section-title">10. Contact Information</h2>
                            </div>
                        </header>
                        <p class="terms-body-text">
                            If you have any questions about these Terms &amp; Conditions, please contact our legal or support team using the details below.
                        </p>

                        <div class="terms-contact-grid">
                            <div class="terms-contact-card">
                                <h3 class="terms-chip-title">Email</h3>
                                <p class="terms-chip-text">legal@exploria.com</p>
                            </div>
                            <div class="terms-contact-card">
                                <h3 class="terms-chip-title">Phone</h3>
                                <p class="terms-chip-text">+91 9876543210</p>
                            </div>
                            <div class="terms-contact-card">
                                <h3 class="terms-chip-title">Address</h3>
                                <p class="terms-chip-text">
                                    123 Travel Street, Mumbai, India
                                </p>
                            </div>
                        </div>
                    </section>

                    <!-- Last updated -->
                    <p class="terms-updated">
                        <span class="terms-updated-dot"></span>
                        Last updated on <strong>November 11, 2025</strong>
                    </p>
                </div>
            </div>
        </section>
    </main>
     <script src="js/terms.js"></script>
</asp:Content>
