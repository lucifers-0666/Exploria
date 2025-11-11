<%@ Page Title="FAQ" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FAQ.aspx.cs" Inherits="Tours_Travels.FAQ" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .faq-container { max-width: 1000px; margin: 120px auto 60px; padding: 0 20px; }
        .page-header { text-align: center; margin-bottom: 60px; }
        .page-header h1 { font-size: 48px; font-weight: 700; color: #164426; margin-bottom: 16px; }
        .page-header p { font-size: 18px; color: #6b7280; }
        .faq-categories { display: flex; gap: 16px; justify-content: center; margin-bottom: 40px; flex-wrap: wrap; }
        .category-btn { padding: 12px 24px; background: white; border: 2px solid #e8f4ed; border-radius: 24px; font-weight: 600; color: #164426; cursor: pointer; transition: all 300ms ease; }
        .category-btn:hover, .category-btn.active { background: #1d5e33; color: white; border-color: #1d5e33; }
        .faq-section { margin-bottom: 32px; }
        .section-title { font-size: 28px; font-weight: 700; color: #164426; margin-bottom: 24px; display: flex; align-items: center; gap: 12px; }
        .section-title i { font-size: 32px; color: #c9a877; }
        .faq-item { background: white; border-radius: 12px; margin-bottom: 16px; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08); overflow: hidden; transition: all 300ms ease; }
        .faq-item:hover { box-shadow: 0 8px 32px rgba(0, 0, 0, 0.12); }
        .faq-question { padding: 24px; display: flex; justify-content: space-between; align-items: center; cursor: pointer; font-weight: 600; color: #164426; font-size: 18px; }
        .faq-question i { font-size: 24px; color: #c9a877; transition: transform 300ms ease; }
        .faq-item.active .faq-question i { transform: rotate(180deg); }
        .faq-answer { padding: 0 24px; max-height: 0; overflow: hidden; transition: all 400ms ease; }
        .faq-item.active .faq-answer { padding: 0 24px 24px; max-height: 500px; }
        .faq-answer p { color: #6b7280; line-height: 1.8; margin: 0; }
        .search-box { margin-bottom: 40px; }
        .search-input { width: 100%; padding: 16px 24px 16px 60px; border: 2px solid #e8f4ed; border-radius: 50px; font-size: 16px; transition: all 300ms ease; }
        .search-input:focus { outline: none; border-color: #1d5e33; box-shadow: 0 0 0 3px rgba(29, 94, 51, 0.1); }
        .search-wrapper { position: relative; }
        .search-icon { position: absolute; left: 24px; top: 50%; transform: translateY(-50%); font-size: 24px; color: #c9a877; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="faq-container">
        <div class="page-header">
            <h1><i class="las la-question-circle" style="color: #c9a877;"></i> Frequently Asked Questions</h1>
            <p>Find answers to common questions about bookings, payments, and travel</p>
        </div>

        <div class="search-box">
            <div class="search-wrapper">
                <i class="las la-search search-icon"></i>
                <input type="text" class="search-input" placeholder="Search for answers..." id="faqSearch" />
            </div>
        </div>

        <div class="faq-categories">
            <button class="category-btn active" onclick="filterCategory('all')">All Questions</button>
            <button class="category-btn" onclick="filterCategory('booking')">Booking</button>
            <button class="category-btn" onclick="filterCategory('payment')">Payment</button>
            <button class="category-btn" onclick="filterCategory('travel')">Travel</button>
            <button class="category-btn" onclick="filterCategory('cancellation')">Cancellation</button>
        </div>

        <!-- Booking FAQs -->
        <div class="faq-section" data-category="booking">
            <h2 class="section-title"><i class="las la-calendar-check"></i>Booking Questions</h2>
            <div class="faq-item">
                <div class="faq-question" onclick="toggleFaq(this)">
                    <span>How do I make a booking?</span>
                    <i class="las la-angle-down"></i>
                </div>
                <div class="faq-answer">
                    <p>To make a booking, browse our destinations, select your preferred destination, choose your travel dates, specify the number of travelers, and proceed to payment. You'll need to create an account or log in before completing the booking.</p>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question" onclick="toggleFaq(this)">
                    <span>Can I book for multiple people?</span>
                    <i class="las la-angle-down"></i>
                </div>
                <div class="faq-answer">
                    <p>Yes! You can book for multiple adults and children. Simply specify the number of travelers during the booking process. Different pricing applies for adults and children.</p>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question" onclick="toggleFaq(this)">
                    <span>How far in advance should I book?</span>
                    <i class="las la-angle-down"></i>
                </div>
                <div class="faq-answer">
                    <p>We recommend booking at least 2-4 weeks in advance for domestic destinations and 6-8 weeks for international trips. This ensures better availability and prices.</p>
                </div>
            </div>
        </div>

        <!-- Payment FAQs -->
        <div class="faq-section" data-category="payment">
            <h2 class="section-title"><i class="las la-credit-card"></i>Payment Questions</h2>
            <div class="faq-item">
                <div class="faq-question" onclick="toggleFaq(this)">
                    <span>What payment methods do you accept?</span>
                    <i class="las la-angle-down"></i>
                </div>
                <div class="faq-answer">
                    <p>We accept all major credit/debit cards (Visa, Mastercard, Amex), UPI payments, net banking, and digital wallets like PayPal and Razorpay.</p>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question" onclick="toggleFaq(this)">
                    <span>Is my payment information secure?</span>
                    <i class="las la-angle-down"></i>
                </div>
                <div class="faq-answer">
                    <p>Absolutely! We use 256-bit SSL encryption and comply with PCI-DSS standards. All payment processing is handled by secure payment gateways.</p>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question" onclick="toggleFaq(this)">
                    <span>When will I be charged?</span>
                    <i class="las la-angle-down"></i>
                </div>
                <div class="faq-answer">
                    <p>Payment is processed immediately when you confirm your booking. You'll receive a confirmation email with your booking details and receipt.</p>
                </div>
            </div>
        </div>

        <!-- Travel FAQs -->
        <div class="faq-section" data-category="travel">
            <h2 class="section-title"><i class="las la-plane-departure"></i>Travel Questions</h2>
            <div class="faq-item">
                <div class="faq-question" onclick="toggleFaq(this)">
                    <span>What's included in the tour package?</span>
                    <i class="las la-angle-down"></i>
                </div>
                <div class="faq-answer">
                    <p>Each destination page lists all included services such as accommodation, meals, transportation, guided tours, and activities. Please review the details before booking.</p>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question" onclick="toggleFaq(this)">
                    <span>Do I need travel insurance?</span>
                    <i class="las la-angle-down"></i>
                </div>
                <div class="faq-answer">
                    <p>While not mandatory, we highly recommend travel insurance to cover unexpected events, medical emergencies, trip cancellations, and lost baggage.</p>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question" onclick="toggleFaq(this)">
                    <span>Can I customize my itinerary?</span>
                    <i class="las la-angle-down"></i>
                </div>
                <div class="faq-answer">
                    <p>Yes! Contact our support team after booking, and we'll work with you to customize your itinerary based on your preferences and budget.</p>
                </div>
            </div>
        </div>

        <!-- Cancellation FAQs -->
        <div class="faq-section" data-category="cancellation">
            <h2 class="section-title"><i class="las la-times-circle"></i>Cancellation & Refunds</h2>
            <div class="faq-item">
                <div class="faq-question" onclick="toggleFaq(this)">
                    <span>What is your cancellation policy?</span>
                    <i class="las la-angle-down"></i>
                </div>
                <div class="faq-answer">
                    <p>Cancellations made 30+ days before departure: 100% refund. 15-29 days: 50% refund. 7-14 days: 25% refund. Less than 7 days: No refund. Please check our full cancellation policy for details.</p>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question" onclick="toggleFaq(this)">
                    <span>How do I cancel my booking?</span>
                    <i class="las la-angle-down"></i>
                </div>
                <div class="faq-answer">
                    <p>Log in to your account, go to "My Bookings", select the booking you want to cancel, and click the "Cancel Booking" button. You'll receive a confirmation email.</p>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question" onclick="toggleFaq(this)">
                    <span>How long does it take to receive a refund?</span>
                    <i class="las la-angle-down"></i>
                </div>
                <div class="faq-answer">
                    <p>Refunds are processed within 7-10 business days after cancellation approval. The amount will be credited to your original payment method.</p>
                </div>
            </div>
        </div>
    </div>

    <script>
        function toggleFaq(element) {
            const faqItem = element.closest('.faq-item');
            const isActive = faqItem.classList.contains('active');
            
            // Close all FAQs
            document.querySelectorAll('.faq-item').forEach(item => {
                item.classList.remove('active');
            });
            
            // Open clicked FAQ if it wasn't active
            if (!isActive) {
                faqItem.classList.add('active');
            }
        }

        function filterCategory(category) {
            // Update active button
            document.querySelectorAll('.category-btn').forEach(btn => {
                btn.classList.remove('active');
            });
            event.target.classList.add('active');

            // Filter sections
            document.querySelectorAll('.faq-section').forEach(section => {
                if (category === 'all' || section.dataset.category === category) {
                    section.style.display = 'block';
                } else {
                    section.style.display = 'none';
                }
            });
        }

        // Search functionality
        document.getElementById('faqSearch').addEventListener('input', function(e) {
            const searchTerm = e.target.value.toLowerCase();
            document.querySelectorAll('.faq-item').forEach(item => {
                const question = item.querySelector('.faq-question span').textContent.toLowerCase();
                const answer = item.querySelector('.faq-answer p').textContent.toLowerCase();
                if (question.includes(searchTerm) || answer.includes(searchTerm)) {
                    item.style.display = 'block';
                } else {
                    item.style.display = 'none';
                }
            });
        });
    </script>
</asp:Content>
