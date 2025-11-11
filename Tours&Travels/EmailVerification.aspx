<%@ Page Title="Email Verification - Exploria Tours" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EmailVerification.aspx.cs" Inherits="Tours_Travels.EmailVerification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .verification-container {
            min-height: 80vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 60px 24px;
            background: linear-gradient(135deg, #e8f4ed 0%, #f8f9fa 100%);
        }

        .verification-card {
            max-width: 600px;
            width: 100%;
            background: white;
            border-radius: 24px;
            padding: 60px 48px;
            box-shadow: 0 20px 60px rgba(0,0,0,0.1);
            text-align: center;
        }

        .verification-icon {
            width: 120px;
            height: 120px;
            margin: 0 auto 32px;
            background: linear-gradient(135deg, #1d5e33 0%, #2d7a4a 100%);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 60px;
            color: white;
            animation: pulse 2s infinite;
        }

        .verification-icon.success {
            background: linear-gradient(135deg, #10b981 0%, #059669 100%);
        }

        .verification-icon.error {
            background: linear-gradient(135deg, #ef4444 0%, #dc2626 100%);
        }

        .verification-icon.pending {
            background: linear-gradient(135deg, #f59e0b 0%, #d97706 100%);
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        .verification-title {
            font-size: 36px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 16px;
        }

        .verification-message {
            font-size: 18px;
            color: #6b7280;
            margin-bottom: 32px;
            line-height: 1.6;
        }

        .verification-email {
            font-weight: 600;
            color: #1d5e33;
        }

        .verification-spinner {
            width: 48px;
            height: 48px;
            border: 4px solid #e5e7eb;
            border-top-color: #1d5e33;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin: 32px auto;
        }

        @keyframes spin {
            to { transform: rotate(360deg); }
        }

        .verification-actions {
            display: flex;
            flex-direction: column;
            gap: 16px;
            margin-top: 32px;
        }

        .verification-btn {
            padding: 16px 32px;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 300ms ease;
            border: none;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .btn-primary {
            background: linear-gradient(135deg, #1d5e33 0%, #2d7a4a 100%);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(29, 94, 51, 0.4);
        }

        .btn-secondary {
            background: white;
            color: #1d5e33;
            border: 2px solid #1d5e33;
        }

        .btn-secondary:hover {
            background: #1d5e33;
            color: white;
        }

        .btn-link {
            background: transparent;
            color: #6b7280;
            text-decoration: underline;
            border: none;
            cursor: pointer;
            padding: 8px;
        }

        .btn-link:hover {
            color: #1d5e33;
        }

        .verification-info {
            background: #f3f4f6;
            border-radius: 12px;
            padding: 24px;
            margin-top: 32px;
            text-align: left;
        }

        .info-title {
            font-size: 16px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 12px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .info-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .info-list li {
            font-size: 14px;
            color: #6b7280;
            margin-bottom: 8px;
            padding-left: 24px;
            position: relative;
        }

        .info-list li::before {
            content: '✓';
            position: absolute;
            left: 0;
            color: #10b981;
            font-weight: 700;
        }

        .countdown {
            font-size: 14px;
            color: #6b7280;
            margin-top: 16px;
        }

        .countdown-timer {
            font-weight: 700;
            color: #1d5e33;
        }

        .alert {
            padding: 16px 20px;
            border-radius: 12px;
            margin-bottom: 24px;
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 14px;
        }

        .alert-success {
            background: #d1fae5;
            color: #065f46;
            border: 1px solid #6ee7b7;
        }

        .alert-error {
            background: #fee2e2;
            color: #991b1b;
            border: 1px solid #fca5a5;
        }

        .alert-info {
            background: #dbeafe;
            color: #1e40af;
            border: 1px solid #93c5fd;
        }

        .progress-steps {
            display: flex;
            justify-content: space-between;
            margin-bottom: 40px;
            position: relative;
        }

        .progress-steps::before {
            content: '';
            position: absolute;
            top: 20px;
            left: 0;
            right: 0;
            height: 2px;
            background: #e5e7eb;
            z-index: 0;
        }

        .step {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 8px;
            position: relative;
            z-index: 1;
        }

        .step-circle {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: white;
            border: 2px solid #e5e7eb;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            color: #9ca3af;
        }

        .step.active .step-circle {
            background: #1d5e33;
            border-color: #1d5e33;
            color: white;
        }

        .step.completed .step-circle {
            background: #10b981;
            border-color: #10b981;
            color: white;
        }

        .step-label {
            font-size: 12px;
            color: #6b7280;
            font-weight: 500;
        }

        @media (max-width: 768px) {
            .verification-card {
                padding: 40px 24px;
            }

            .verification-title {
                font-size: 28px;
            }

            .verification-icon {
                width: 100px;
                height: 100px;
                font-size: 50px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="verification-container">
        <div class="verification-card" data-aos="zoom-in">
            <!-- Progress Steps -->
            <div class="progress-steps">
                <div class="step completed">
                    <div class="step-circle">✓</div>
                    <span class="step-label">Register</span>
                </div>
                <div class="step active">
                    <div class="step-circle">2</div>
                    <span class="step-label">Verify Email</span>
                </div>
                <div class="step">
                    <div class="step-circle">3</div>
                    <span class="step-label">Start Booking</span>
                </div>
            </div>

            <!-- Success State -->
            <asp:Panel ID="pnlSuccess" runat="server" Visible="false">
                <div class="verification-icon success">
                    ✓
                </div>
                <h1 class="verification-title">Email Verified Successfully!</h1>
                <p class="verification-message">
                    Your email has been verified. You can now access all features of Exploria Tours.
                </p>
                <div class="verification-actions">
                    <asp:Button ID="btnGoToDashboard" runat="server" Text="Go to Dashboard" CssClass="verification-btn btn-primary" OnClick="btnGoToDashboard_Click" />
                    <asp:Button ID="btnBrowseDestinations" runat="server" Text="Browse Destinations" CssClass="verification-btn btn-secondary" OnClick="btnBrowseDestinations_Click" />
                </div>
            </asp:Panel>

            <!-- Error State -->
            <asp:Panel ID="pnlError" runat="server" Visible="false">
                <div class="verification-icon error">
                    ✕
                </div>
                <h1 class="verification-title">Verification Failed</h1>
                <p class="verification-message">
                    <asp:Label ID="lblErrorMessage" runat="server" Text="The verification link is invalid or has expired."></asp:Label>
                </p>
                <div class="verification-actions">
                    <asp:Button ID="btnResendEmail" runat="server" Text="Resend Verification Email" CssClass="verification-btn btn-primary" OnClick="btnResendEmail_Click" />
                    <asp:Button ID="btnContactSupport" runat="server" Text="Contact Support" CssClass="verification-btn btn-secondary" OnClick="btnContactSupport_Click" />
                </div>
            </asp:Panel>

            <!-- Pending/Processing State -->
            <asp:Panel ID="pnlPending" runat="server" Visible="false">
                <div class="verification-icon pending">
                    📧
                </div>
                <h1 class="verification-title">Verify Your Email</h1>
                <p class="verification-message">
                    We've sent a verification link to<br />
                    <span class="verification-email"><asp:Label ID="lblUserEmail" runat="server"></asp:Label></span>
                </p>
                
                <div class="alert alert-info">
                    <i class="las la-info-circle" style="font-size: 20px;"></i>
                    <span>Please check your inbox and click the verification link to activate your account.</span>
                </div>

                <div class="verification-info">
                    <div class="info-title">
                        <i class="las la-lightbulb"></i>
                        Didn't receive the email?
                    </div>
                    <ul class="info-list">
                        <li>Check your spam or junk folder</li>
                        <li>Make sure you entered the correct email address</li>
                        <li>Wait a few minutes and check again</li>
                        <li>Click the button below to resend</li>
                    </ul>
                </div>

                <div class="verification-actions">
                    <asp:Button ID="btnResendPending" runat="server" Text="Resend Verification Email" CssClass="verification-btn btn-primary" OnClick="btnResendEmail_Click" />
                    <asp:Label ID="lblResendCountdown" runat="server" CssClass="countdown" Visible="false">
                        You can resend in <span class="countdown-timer" id="countdown">60</span> seconds
                    </asp:Label>
                </div>
            </asp:Panel>

            <!-- Processing State -->
            <asp:Panel ID="pnlProcessing" runat="server" Visible="true">
                <div class="verification-icon">
                    <div class="verification-spinner"></div>
                </div>
                <h1 class="verification-title">Verifying Your Email...</h1>
                <p class="verification-message">
                    Please wait while we verify your email address.
                </p>
            </asp:Panel>
        </div>
    </div>

    <script>
        // Countdown timer for resend button
        function startCountdown() {
            let seconds = 60;
            const countdownElement = document.getElementById('countdown');
            
            if (countdownElement) {
                const interval = setInterval(() => {
                    seconds--;
                    countdownElement.textContent = seconds;
                    
                    if (seconds <= 0) {
                        clearInterval(interval);
                        document.querySelector('.countdown').style.display = 'none';
                    }
                }, 1000);
            }
        }

        // Auto-start countdown if label is visible
        window.addEventListener('load', () => {
            if (document.querySelector('.countdown')) {
                startCountdown();
            }
        });
    </script>
</asp:Content>
