<%@ Page Title="Privacy Policy" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Privacy.aspx.cs" Inherits="Tours_Travels.Privacy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/terms.css" />
    <style>
        .privacy-container { max-width: 900px; margin: 120px auto 60px; padding: 0 20px; }
        .page-header { text-align: center; margin-bottom: 48px; }
        .page-header h1 { font-size: 42px; font-weight: 700; color: #164426; margin-bottom: 12px; }
        .privacy-content { background: white; border-radius: 16px; padding: 48px; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08); }
        .privacy-section { margin-bottom: 40px; }
        .privacy-section h2 { font-size: 28px; font-weight: 700; color: #164426; margin-bottom: 16px; display: flex; align-items: center; gap: 12px; }
        .privacy-section h2 i { color: #c9a877; }
        .privacy-section p { color: #374151; line-height: 1.8; margin-bottom: 16px; }
        .privacy-section ul { color: #374151; line-height: 1.8; margin: 16px 0 16px 24px; }
        .highlight-box { background: #e8f4ed; border-left: 4px solid #1d5e33; padding: 20px; border-radius: 8px; margin: 24px 0; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="privacy-container">
        <div class="page-header">
            <h1><i class="las la-shield-alt" style="color: #c9a877;"></i> Privacy Policy</h1>
            <p>Your privacy is important to us. Learn how we collect and protect your data.</p>
        </div>

        <div class="privacy-content">
            <div class="privacy-section">
                <h2><i class="las la-info-circle"></i>1. Information We Collect</h2>
                <p>We collect the following types of information:</p>
                <ul>
                    <li><strong>Personal Information:</strong> Name, email, phone number, address</li>
                    <li><strong>Payment Information:</strong> Credit/debit card details (securely processed)</li>
                    <li><strong>Travel Details:</strong> Passport info, travel preferences, special requirements</li>
                    <li><strong>Usage Data:</strong> IP address, browser type, pages visited, time spent</li>
                </ul>
            </div>

            <div class="privacy-section">
                <h2><i class="las la-database"></i>2. How We Use Your Information</h2>
                <p>Your information is used for:</p>
                <ul>
                    <li>Processing bookings and payments</li>
                    <li>Communicating booking confirmations and updates</li>
                    <li>Providing customer support</li>
                    <li>Sending promotional offers (with your consent)</li>
                    <li>Improving our services and website experience</li>
                </ul>
            </div>

            <div class="privacy-section">
                <h2><i class="las la-lock"></i>3. Data Security</h2>
                <div class="highlight-box">
                    <strong>Your security is our priority.</strong> We use industry-standard SSL encryption to protect your data during transmission and storage.
                </div>
                <p>We implement appropriate security measures including:</p>
                <ul>
                    <li>256-bit SSL encryption for all transactions</li>
                    <li>Secure servers with firewall protection</li>
                    <li>Regular security audits and updates</li>
                    <li>Restricted employee access to personal data</li>
                </ul>
            </div>

            <div class="privacy-section">
                <h2><i class="las la-share-alt"></i>4. Information Sharing</h2>
                <p>We do not sell or rent your personal information to third parties. We may share data with:</p>
                <ul>
                    <li><strong>Service Providers:</strong> Hotels, airlines, tour operators (only necessary info)</li>
                    <li><strong>Payment Processors:</strong> Secure payment gateways for transaction processing</li>
                    <li><strong>Legal Authorities:</strong> When required by law or to protect our rights</li>
                </ul>
            </div>

            <div class="privacy-section">
                <h2><i class="las la-cookie-bite"></i>5. Cookies and Tracking</h2>
                <p>We use cookies and similar technologies to:</p>
                <ul>
                    <li>Remember your preferences and login status</li>
                    <li>Analyze website traffic and usage patterns</li>
                    <li>Personalize content and advertisements</li>
                    <li>Improve website functionality</li>
                </ul>
                <p>You can control cookie preferences through your browser settings.</p>
            </div>

            <div class="privacy-section">
                <h2><i class="las la-user-shield"></i>6. Your Rights</h2>
                <p>You have the right to:</p>
                <ul>
                    <li><strong>Access:</strong> Request a copy of your personal data</li>
                    <li><strong>Correction:</strong> Update or correct inaccurate information</li>
                    <li><strong>Deletion:</strong> Request deletion of your data (subject to legal requirements)</li>
                    <li><strong>Opt-out:</strong> Unsubscribe from marketing communications anytime</li>
                    <li><strong>Data Portability:</strong> Receive your data in a structured format</li>
                </ul>
            </div>

            <div class="privacy-section">
                <h2><i class="las la-envelope"></i>7. Contact Us</h2>
                <p>For privacy-related questions or requests, contact our Data Protection Officer:</p>
                <ul>
                    <li><strong>Email:</strong> privacy@exploria.com</li>
                    <li><strong>Phone:</strong> +91 9876543210</li>
                    <li><strong>Address:</strong> 123 Travel Street, Mumbai, India</li>
                </ul>
            </div>

            <p style="text-align: center; color: #6b7280; margin-top: 40px; padding-top: 24px; border-top: 1px solid #e5e7eb;">
                <strong>Last Updated:</strong> November 11, 2025
            </p>
        </div>
    </div>
</asp:Content>
