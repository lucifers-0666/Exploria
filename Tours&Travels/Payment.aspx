<%@ Page Title="Payment" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="Tours_Travels.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .payment-container {
            max-width: 1200px;
            margin: 120px auto 60px;
            padding: 0 20px;
        }

        .payment-grid {
            display: grid;
            grid-template-columns: 1fr 400px;
            gap: 40px;
            margin-top: 40px;
        }

        @media (max-width: 968px) {
            .payment-grid {
                grid-template-columns: 1fr;
            }
        }

        .payment-section {
            background: white;
            border-radius: 16px;
            padding: 32px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        }

        .section-title {
            font-size: 24px;
            font-weight: 600;
            color: #164426;
            margin-bottom: 24px;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .section-title i {
            font-size: 28px;
            color: #c9a877;
        }

        .payment-methods {
            display: grid;
            gap: 16px;
            margin-bottom: 32px;
        }

        .payment-method {
            border: 2px solid #e8f4ed;
            border-radius: 12px;
            padding: 20px;
            cursor: pointer;
            transition: all 300ms ease;
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .payment-method:hover {
            border-color: #c9a877;
            background: #f5e8d8;
        }

        .payment-method.active {
            border-color: #1d5e33;
            background: #e8f4ed;
        }

        .payment-method input[type="radio"] {
            width: 20px;
            height: 20px;
            accent-color: #1d5e33;
        }

        .payment-method-info {
            flex: 1;
        }

        .payment-method-title {
            font-weight: 600;
            color: #164426;
            margin-bottom: 4px;
        }

        .payment-method-desc {
            font-size: 14px;
            color: #6b7280;
        }

        .payment-method-icon {
            font-size: 32px;
            color: #c9a877;
        }

        .form-group {
            margin-bottom: 24px;
        }

        .form-label {
            display: block;
            font-weight: 500;
            color: #164426;
            margin-bottom: 8px;
            font-size: 14px;
        }

        .form-input {
            width: 100%;
            padding: 12px 16px;
            border: 2px solid #e8f4ed;
            border-radius: 8px;
            font-size: 15px;
            transition: all 300ms ease;
        }

        .form-input:focus {
            outline: none;
            border-color: #1d5e33;
            box-shadow: 0 0 0 3px rgba(29, 94, 51, 0.1);
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 16px;
        }

        .order-summary {
            background: white;
            border-radius: 16px;
            padding: 32px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            height: fit-content;
            position: sticky;
            top: 100px;
        }

        .summary-item {
            display: flex;
            justify-content: space-between;
            padding: 16px 0;
            border-bottom: 1px solid #e8f4ed;
        }

        .summary-item:last-child {
            border-bottom: none;
        }

        .summary-label {
            color: #6b7280;
            font-size: 15px;
        }

        .summary-value {
            color: #164426;
            font-weight: 600;
            font-size: 15px;
        }

        .summary-total {
            background: #e8f4ed;
            border-radius: 8px;
            padding: 20px;
            margin-top: 16px;
        }

        .summary-total .summary-label {
            font-size: 18px;
            color: #164426;
            font-weight: 600;
        }

        .summary-total .summary-value {
            font-size: 28px;
            color: #1d5e33;
        }

        .destination-info {
            display: flex;
            gap: 16px;
            padding: 20px;
            background: #f5e8d8;
            border-radius: 12px;
            margin-bottom: 24px;
        }

        .destination-image {
            width: 100px;
            height: 100px;
            border-radius: 8px;
            object-fit: cover;
        }

        .destination-details h3 {
            font-size: 18px;
            font-weight: 600;
            color: #164426;
            margin-bottom: 8px;
        }

        .destination-details p {
            font-size: 14px;
            color: #6b7280;
            margin-bottom: 4px;
        }

        .btn-pay {
            width: 100%;
            padding: 16px;
            background: #1d5e33;
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: all 300ms ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            margin-top: 24px;
        }

        .btn-pay:hover {
            background: #2a7d4a;
            transform: translateY(-2px);
            box-shadow: 0 8px 24px rgba(29, 94, 51, 0.3);
        }

        .btn-pay i {
            font-size: 24px;
        }

        .security-badge {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            color: #6b7280;
            font-size: 13px;
            margin-top: 16px;
        }

        .security-badge i {
            color: #c9a877;
        }

        .card-icons {
            display: flex;
            gap: 12px;
            margin-top: 16px;
        }

        .card-icon {
            width: 50px;
            height: 32px;
            border: 1px solid #e8f4ed;
            border-radius: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
        }

        .alert {
            padding: 16px;
            border-radius: 8px;
            margin-bottom: 24px;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .alert-success {
            background: #d1f4e0;
            color: #0f5132;
            border: 1px solid #0f5132;
        }

        .alert-error {
            background: #f8d7da;
            color: #842029;
            border: 1px solid #842029;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="payment-container">
        <h1 style="font-size: 36px; font-weight: 700; color: #164426; text-align: center;">
            <i class="las la-credit-card" style="color: #c9a877;"></i>
            Complete Your Payment
        </h1>
        <p style="text-align: center; color: #6b7280; margin-top: 12px; font-size: 16px;">
            Secure payment processing • 256-bit SSL encryption
        </p>

        <!-- Alert Messages -->
        <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="alert alert-success" style="margin-top: 24px;">
            <i class="las la-check-circle" style="font-size: 24px;"></i>
            <asp:Label ID="lblSuccess" runat="server"></asp:Label>
        </asp:Panel>
        <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="alert alert-error" style="margin-top: 24px;">
            <i class="las la-exclamation-circle" style="font-size: 24px;"></i>
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </asp:Panel>

        <div class="payment-grid">
            <!-- Left Section - Payment Form -->
            <div>
                <!-- Payment Methods -->
                <div class="payment-section">
                    <h2 class="section-title">
                        <i class="las la-wallet"></i>
                        Select Payment Method
                    </h2>
                    <div class="payment-methods">
                        <asp:RadioButtonList ID="rblPaymentMethod" runat="server" RepeatLayout="Flow" CssClass="payment-methods">
                            <asp:ListItem Value="card" Selected="True">
                                <div class="payment-method active" onclick="selectPaymentMethod(this)">
                                    <input type="radio" name="paymentMethod" value="card" checked />
                                    <i class="las la-credit-card payment-method-icon"></i>
                                    <div class="payment-method-info">
                                        <div class="payment-method-title">Credit/Debit Card</div>
                                        <div class="payment-method-desc">Visa, Mastercard, Amex accepted</div>
                                    </div>
                                </div>
                            </asp:ListItem>
                            <asp:ListItem Value="upi">
                                <div class="payment-method" onclick="selectPaymentMethod(this)">
                                    <input type="radio" name="paymentMethod" value="upi" />
                                    <i class="las la-mobile payment-method-icon"></i>
                                    <div class="payment-method-info">
                                        <div class="payment-method-title">UPI Payment</div>
                                        <div class="payment-method-desc">Google Pay, PhonePe, Paytm</div>
                                    </div>
                                </div>
                            </asp:ListItem>
                            <asp:ListItem Value="netbanking">
                                <div class="payment-method" onclick="selectPaymentMethod(this)">
                                    <input type="radio" name="paymentMethod" value="netbanking" />
                                    <i class="las la-university payment-method-icon"></i>
                                    <div class="payment-method-info">
                                        <div class="payment-method-title">Net Banking</div>
                                        <div class="payment-method-desc">All major banks supported</div>
                                    </div>
                                </div>
                            </asp:ListItem>
                            <asp:ListItem Value="wallet">
                                <div class="payment-method" onclick="selectPaymentMethod(this)">
                                    <input type="radio" name="paymentMethod" value="wallet" />
                                    <i class="las la-wallet payment-method-icon"></i>
                                    <div class="payment-method-info">
                                        <div class="payment-method-title">Digital Wallet</div>
                                        <div class="payment-method-desc">PayPal, Stripe, Razorpay</div>
                                    </div>
                                </div>
                            </asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </div>

                <!-- Card Details Form -->
                <div class="payment-section" id="cardDetailsSection" style="margin-top: 32px;">
                    <h2 class="section-title">
                        <i class="las la-lock"></i>
                        Enter Card Details
                    </h2>

                    <div class="form-group">
                        <label class="form-label">Cardholder Name</label>
                        <asp:TextBox ID="txtCardholderName" runat="server" CssClass="form-input" placeholder="John Doe"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Card Number</label>
                        <asp:TextBox ID="txtCardNumber" runat="server" CssClass="form-input" placeholder="1234 5678 9012 3456" MaxLength="19"></asp:TextBox>
                        <div class="card-icons">
                            <div class="card-icon"><i class="lab la-cc-visa" style="color: #1A1F71;"></i></div>
                            <div class="card-icon"><i class="lab la-cc-mastercard" style="color: #EB001B;"></i></div>
                            <div class="card-icon"><i class="lab la-cc-amex" style="color: #006FCF;"></i></div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label">Expiry Date</label>
                            <asp:TextBox ID="txtExpiryDate" runat="server" CssClass="form-input" placeholder="MM/YY" MaxLength="5"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="form-label">CVV</label>
                            <asp:TextBox ID="txtCVV" runat="server" CssClass="form-input" placeholder="123" MaxLength="4" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="form-label">Billing Address</label>
                        <asp:TextBox ID="txtBillingAddress" runat="server" CssClass="form-input" placeholder="123 Main Street" TextMode="MultiLine" Rows="2"></asp:TextBox>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label">City</label>
                            <asp:TextBox ID="txtCity" runat="server" CssClass="form-input" placeholder="New York"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label class="form-label">ZIP Code</label>
                            <asp:TextBox ID="txtZipCode" runat="server" CssClass="form-input" placeholder="10001"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Section - Order Summary -->
            <div>
                <div class="order-summary">
                    <h2 class="section-title">
                        <i class="las la-receipt"></i>
                        Order Summary
                    </h2>

                    <!-- Destination Info -->
                    <div class="destination-info">
                        <asp:Image ID="imgDestination" runat="server" CssClass="destination-image" />
                        <div class="destination-details">
                            <h3><asp:Label ID="lblDestinationName" runat="server"></asp:Label></h3>
                            <p><i class="las la-calendar"></i> <asp:Label ID="lblTravelDate" runat="server"></asp:Label></p>
                            <p><i class="las la-users"></i> <asp:Label ID="lblTravelers" runat="server"></asp:Label></p>
                            <p><i class="las la-clock"></i> <asp:Label ID="lblDuration" runat="server"></asp:Label></p>
                        </div>
                    </div>

                    <!-- Price Breakdown -->
                    <div class="summary-item">
                        <span class="summary-label">Base Price</span>
                        <span class="summary-value">₹<asp:Label ID="lblBasePrice" runat="server"></asp:Label></span>
                    </div>
                    <div class="summary-item">
                        <span class="summary-label">Adults (<asp:Label ID="lblAdultsCount" runat="server"></asp:Label>)</span>
                        <span class="summary-value">₹<asp:Label ID="lblAdultsPrice" runat="server"></asp:Label></span>
                    </div>
                    <div class="summary-item">
                        <span class="summary-label">Children (<asp:Label ID="lblChildrenCount" runat="server"></asp:Label>)</span>
                        <span class="summary-value">₹<asp:Label ID="lblChildrenPrice" runat="server"></asp:Label></span>
                    </div>
                    <div class="summary-item">
                        <span class="summary-label">GST (18%)</span>
                        <span class="summary-value">₹<asp:Label ID="lblGST" runat="server"></asp:Label></span>
                    </div>

                    <div class="summary-total">
                        <div class="summary-item">
                            <span class="summary-label">Total Amount</span>
                            <span class="summary-value">₹<asp:Label ID="lblTotalAmount" runat="server"></asp:Label></span>
                        </div>
                    </div>

                    <!-- Pay Button -->
                    <asp:Button ID="btnPay" runat="server" CssClass="btn-pay" Text="Pay Now" OnClick="btnPay_Click" />

                    <div class="security-badge">
                        <i class="las la-shield-alt" style="font-size: 20px;"></i>
                        <span>Your payment information is secure</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function selectPaymentMethod(element) {
            // Remove active class from all methods
            document.querySelectorAll('.payment-method').forEach(el => {
                el.classList.remove('active');
            });
            // Add active class to selected method
            element.classList.add('active');
        }

        // Auto-format card number
        document.addEventListener('DOMContentLoaded', function () {
            const cardInput = document.getElementById('<%= txtCardNumber.ClientID %>');
            if (cardInput) {
                cardInput.addEventListener('input', function (e) {
                    let value = e.target.value.replace(/\s/g, '');
                    let formattedValue = value.match(/.{1,4}/g)?.join(' ') || value;
                    e.target.value = formattedValue;
                });
            }

            // Auto-format expiry date
            const expiryInput = document.getElementById('<%= txtExpiryDate.ClientID %>');
            if (expiryInput) {
                expiryInput.addEventListener('input', function (e) {
                    let value = e.target.value.replace(/\D/g, '');
                    if (value.length >= 2) {
                        value = value.slice(0, 2) + '/' + value.slice(2, 4);
                    }
                    e.target.value = value;
                });
            }
        });
    </script>
</asp:Content>
