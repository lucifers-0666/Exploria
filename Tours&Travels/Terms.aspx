<%@ Page Title="Terms & Conditions" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Terms.aspx.cs" Inherits="Tours_Travels.Terms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .terms-container { max-width: 900px; margin: 120px auto 60px; padding: 0 20px; }
        .page-header { text-align: center; margin-bottom: 48px; }
        .page-header h1 { font-size: 42px; font-weight: 700; color: #164426; margin-bottom: 12px; }
        .page-header p { color: #6b7280; font-size: 16px; }
        .terms-content { background: white; border-radius: 16px; padding: 48px; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08); }
        .terms-section { margin-bottom: 40px; }
        .terms-section h2 { font-size: 28px; font-weight: 700; color: #164426; margin-bottom: 16px; display: flex; align-items: center; gap: 12px; }
        .terms-section h2 i { color: #c9a877; }
        .terms-section h3 { font-size: 20px; font-weight: 600; color: #164426; margin: 24px 0 12px; }
        .terms-section p { color: #374151; line-height: 1.8; margin-bottom: 16px; }
        .terms-section ul { color: #374151; line-height: 1.8; margin: 16px 0 16px 24px; }
        .terms-section li { margin-bottom: 8px; }
        .highlight-box { background: #f5e8d8; border-left: 4px solid #c9a877; padding: 20px; border-radius: 8px; margin: 24px 0; }
        .last-updated { text-align: center; color: #6b7280; font-size: 14px; margin-top: 40px; padding-top: 24px; border-top: 1px solid #e5e7eb; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="terms-container">
        <div class="page-header">
            <h1><i class="las la-file-contract" style="color: #c9a877;"></i> Terms & Conditions</h1>
            <p>Please read these terms carefully before using our services</p>
        </div>

        <div class="terms-content">
            <div class="terms-section">
                <h2><i class="las la-info-circle"></i>1. Introduction</h2>
                <p>Welcome to Exploria Tours & Travels. By accessing and using our website and services, you agree to comply with and be bound by the following terms and conditions. Please review them carefully.</p>
                <p>If you do not agree with any part of these terms, please do not use our services.</p>
            </div>

            <div class="terms-section">
                <h2><i class="las la-user-check"></i>2. Booking and Reservations</h2>
                <h3>2.1 Booking Process</h3>
                <p>All bookings must be made through our official website or authorized agents. A booking is confirmed only after:</p>
                <ul>
                    <li>Receipt of full payment or required deposit</li>
                    <li>Email confirmation sent to the provided email address</li>
                    <li>Availability confirmed by our booking team</li>
                </ul>
                
                <h3>2.2 Payment Terms</h3>
                <p>Full payment is required at the time of booking. We accept credit/debit cards, UPI, net banking, and digital wallets. All prices are in INR (₹) unless otherwise stated.</p>
                
                <div class="highlight-box">
                    <strong>Important:</strong> Prices are subject to change without notice until booking is confirmed and payment is received.
                </div>
            </div>

            <div class="terms-section">
                <h2><i class="las la-times-circle"></i>3. Cancellation and Refund Policy</h2>
                <h3>3.1 Cancellation by Customer</h3>
                <ul>
                    <li><strong>30+ days before departure:</strong> 100% refund (minus processing fees)</li>
                    <li><strong>15-29 days before departure:</strong> 50% refund</li>
                    <li><strong>7-14 days before departure:</strong> 25% refund</li>
                    <li><strong>Less than 7 days:</strong> No refund</li>
                </ul>
                
                <h3>3.2 Cancellation by Company</h3>
                <p>We reserve the right to cancel or modify bookings due to unforeseen circumstances, including but not limited to natural disasters, political instability, or insufficient bookings. In such cases, customers will receive a full refund or alternative travel arrangements.</p>
            </div>

            <div class="terms-section">
                <h2><i class="las la-shield-alt"></i>4. Travel Insurance</h2>
                <p>We strongly recommend purchasing comprehensive travel insurance. Exploria Tours & Travels is not responsible for:</p>
                <ul>
                    <li>Medical emergencies or health issues during travel</li>
                    <li>Loss or theft of personal belongings</li>
                    <li>Trip delays or cancellations due to external factors</li>
                    <li>Any injury or damage during the tour</li>
                </ul>
            </div>

            <div class="terms-section">
                <h2><i class="las la-passport"></i>5. Travel Documents</h2>
                <p>It is the customer's responsibility to ensure all travel documents are valid and in order, including:</p>
                <ul>
                    <li>Valid passport (with at least 6 months validity)</li>
                    <li>Required visas for destination countries</li>
                    <li>Health certificates and vaccination records</li>
                    <li>Any other documentation required by authorities</li>
                </ul>
            </div>

            <div class="terms-section">
                <h2><i class="las la-gavel"></i>6. Limitation of Liability</h2>
                <p>Exploria Tours & Travels acts only as an agent for hotels, transportation providers, and other service suppliers. We are not liable for:</p>
                <ul>
                    <li>Acts or omissions of third-party service providers</li>
                    <li>Delays, cancellations, or changes in transportation</li>
                    <li>Injury, loss, or damage to persons or property</li>
                    <li>Force majeure events beyond our control</li>
                </ul>
            </div>

            <div class="terms-section">
                <h2><i class="las la-user-friends"></i>7. Traveler Conduct</h2>
                <p>Travelers are expected to:</p>
                <ul>
                    <li>Behave respectfully towards fellow travelers, guides, and locals</li>
                    <li>Follow local laws, customs, and regulations</li>
                    <li>Take care of accommodations and transportation</li>
                    <li>Arrive on time for scheduled activities</li>
                </ul>
                <p>We reserve the right to terminate services to any traveler whose behavior is deemed inappropriate or dangerous, without refund.</p>
            </div>

            <div class="terms-section">
                <h2><i class="las la-edit"></i>8. Modifications and Changes</h2>
                <p>We reserve the right to modify these terms and conditions at any time. Changes will be effective immediately upon posting on our website. Continued use of our services after changes constitutes acceptance of the new terms.</p>
            </div>

            <div class="terms-section">
                <h2><i class="las la-balance-scale"></i>9. Governing Law</h2>
                <p>These terms and conditions are governed by and construed in accordance with the laws of India. Any disputes arising from these terms shall be subject to the exclusive jurisdiction of courts in [Your City], India.</p>
            </div>

            <div class="terms-section">
                <h2><i class="las la-phone"></i>10. Contact Information</h2>
                <p>For questions about these terms and conditions, please contact us:</p>
                <ul>
                    <li><strong>Email:</strong> legal@exploria.com</li>
                    <li><strong>Phone:</strong> +91 9876543210</li>
                    <li><strong>Address:</strong> 123 Travel Street, Mumbai, India</li>
                </ul>
            </div>

            <div class="last-updated">
                <p><strong>Last Updated:</strong> November 11, 2025</p>
            </div>
        </div>
    </div>
</asp:Content>
