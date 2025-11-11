<%@ Page Title="Destination Reviews - Exploria Tours" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Reviews.aspx.cs" Inherits="Tours_Travels.Reviews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .reviews-hero {
            background: linear-gradient(135deg, #1d5e33 0%, #2d7a4a 100%);
            padding: 120px 0 60px;
            color: white;
            text-align: center;
        }

        .reviews-hero-content {
            max-width: 800px;
            margin: 0 auto;
            padding: 0 24px;
        }

        .hero-title {
            font-size: 48px;
            font-weight: 700;
            margin-bottom: 16px;
        }

        .hero-subtitle {
            font-size: 20px;
            opacity: 0.9;
        }

        .reviews-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 24px;
            max-width: 1200px;
            margin: -60px auto 0;
            padding: 0 24px;
            position: relative;
            z-index: 10;
        }

        .stat-card {
            background: white;
            padding: 32px;
            border-radius: 16px;
            text-align: center;
            box-shadow: 0 10px 40px rgba(0,0,0,0.1);
        }

        .stat-value {
            font-size: 48px;
            font-weight: 700;
            color: #1d5e33;
            margin-bottom: 8px;
        }

        .stat-label {
            font-size: 16px;
            color: #6b7280;
            font-weight: 500;
        }

        .reviews-container {
            max-width: 1400px;
            margin: 80px auto;
            padding: 0 24px;
            display: grid;
            grid-template-columns: 300px 1fr;
            gap: 40px;
        }

        .filters-sidebar {
            background: white;
            border-radius: 16px;
            padding: 32px;
            height: fit-content;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
        }

        .filter-section {
            margin-bottom: 32px;
            padding-bottom: 32px;
            border-bottom: 1px solid #e5e7eb;
        }

        .filter-section:last-child {
            border-bottom: none;
            margin-bottom: 0;
        }

        .filter-title {
            font-size: 18px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 16px;
        }

        .rating-filter {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 12px;
            cursor: pointer;
            padding: 8px;
            border-radius: 8px;
            transition: background 200ms;
        }

        .rating-filter:hover {
            background: #f3f4f6;
        }

        .rating-filter input[type="checkbox"] {
            width: 18px;
            height: 18px;
            cursor: pointer;
            accent-color: #1d5e33;
        }

        .rating-stars {
            color: #fbbf24;
            font-size: 16px;
        }

        .rating-count {
            font-size: 14px;
            color: #6b7280;
            margin-left: auto;
        }

        .filter-btn {
            width: 100%;
            padding: 14px;
            background: linear-gradient(135deg, #1d5e33 0%, #2d7a4a 100%);
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 300ms ease;
            margin-top: 24px;
        }

        .filter-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(29, 94, 51, 0.4);
        }

        .reviews-main {
            min-height: 600px;
        }

        .write-review-card {
            background: linear-gradient(135deg, #e8f4ed 0%, #f8f9fa 100%);
            border-radius: 16px;
            padding: 32px;
            margin-bottom: 32px;
            border: 2px dashed #c9a877;
        }

        .write-review-title {
            font-size: 24px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 12px;
        }

        .write-review-text {
            font-size: 16px;
            color: #6b7280;
            margin-bottom: 24px;
        }

        .write-review-btn {
            padding: 14px 28px;
            background: linear-gradient(135deg, #c9a877 0%, #d4b889 100%);
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            transition: all 300ms ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .write-review-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(201, 168, 119, 0.4);
        }

        .review-form-modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0,0,0,0.7);
            z-index: 1000;
            padding: 24px;
            overflow-y: auto;
        }

        .review-form-modal.active {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .review-form-content {
            background: white;
            border-radius: 24px;
            padding: 48px;
            max-width: 700px;
            width: 100%;
            position: relative;
        }

        .modal-close {
            position: absolute;
            top: 24px;
            right: 24px;
            background: #f3f4f6;
            border: none;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            cursor: pointer;
            font-size: 20px;
            transition: all 200ms;
        }

        .modal-close:hover {
            background: #e5e7eb;
            transform: rotate(90deg);
        }

        .form-title {
            font-size: 28px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 24px;
        }

        .form-group {
            margin-bottom: 24px;
        }

        .form-label {
            display: block;
            font-size: 15px;
            font-weight: 600;
            color: #374151;
            margin-bottom: 8px;
        }

        .form-input, .form-select, .form-textarea {
            width: 100%;
            padding: 14px 16px;
            border: 2px solid #e5e7eb;
            border-radius: 8px;
            font-size: 15px;
            transition: all 200ms;
        }

        .form-input:focus, .form-select:focus, .form-textarea:focus {
            outline: none;
            border-color: #1d5e33;
            box-shadow: 0 0 0 3px rgba(29, 94, 51, 0.1);
        }

        .form-textarea {
            resize: vertical;
            min-height: 120px;
        }

        .star-rating-input {
            display: flex;
            gap: 8px;
            font-size: 32px;
            cursor: pointer;
        }

        .star-rating-input i {
            color: #d1d5db;
            transition: color 200ms;
        }

        .star-rating-input i.active {
            color: #fbbf24;
        }

        .submit-review-btn {
            width: 100%;
            padding: 16px;
            background: linear-gradient(135deg, #1d5e33 0%, #2d7a4a 100%);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 300ms ease;
        }

        .submit-review-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(29, 94, 51, 0.4);
        }

        .reviews-list {
            display: flex;
            flex-direction: column;
            gap: 24px;
        }

        .review-card {
            background: white;
            border-radius: 16px;
            padding: 32px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            transition: all 300ms ease;
        }

        .review-card:hover {
            box-shadow: 0 8px 30px rgba(0,0,0,0.12);
        }

        .review-header {
            display: flex;
            gap: 16px;
            margin-bottom: 20px;
        }

        .review-avatar {
            width: 56px;
            height: 56px;
            border-radius: 50%;
            background: linear-gradient(135deg, #1d5e33 0%, #2d7a4a 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 24px;
            font-weight: 700;
            flex-shrink: 0;
        }

        .review-author-info {
            flex: 1;
        }

        .review-author {
            font-size: 18px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 4px;
        }

        .review-meta {
            display: flex;
            align-items: center;
            gap: 16px;
            flex-wrap: wrap;
        }

        .review-stars {
            color: #fbbf24;
            font-size: 16px;
        }

        .review-date {
            font-size: 14px;
            color: #6b7280;
        }

        .verified-badge {
            display: inline-flex;
            align-items: center;
            gap: 4px;
            padding: 4px 12px;
            background: #d1fae5;
            color: #065f46;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 600;
        }

        .review-destination {
            font-size: 14px;
            color: #6b7280;
            margin-bottom: 16px;
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .review-text {
            font-size: 16px;
            color: #374151;
            line-height: 1.7;
            margin-bottom: 16px;
        }

        .review-images {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
            gap: 12px;
            margin-bottom: 16px;
        }

        .review-image {
            width: 100%;
            height: 120px;
            object-fit: cover;
            border-radius: 8px;
            cursor: pointer;
            transition: transform 200ms;
        }

        .review-image:hover {
            transform: scale(1.05);
        }

        .review-actions {
            display: flex;
            gap: 16px;
            padding-top: 16px;
            border-top: 1px solid #e5e7eb;
        }

        .review-action-btn {
            display: flex;
            align-items: center;
            gap: 6px;
            padding: 8px 16px;
            background: transparent;
            border: none;
            color: #6b7280;
            cursor: pointer;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 500;
            transition: all 200ms;
        }

        .review-action-btn:hover {
            background: #f3f4f6;
            color: #1d5e33;
        }

        .no-reviews {
            text-align: center;
            padding: 80px 24px;
            background: white;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
        }

        .no-reviews-icon {
            font-size: 80px;
            margin-bottom: 24px;
        }

        .no-reviews-title {
            font-size: 28px;
            font-weight: 700;
            color: #111827;
            margin-bottom: 12px;
        }

        .no-reviews-text {
            font-size: 16px;
            color: #6b7280;
        }

        @media (max-width: 1024px) {
            .reviews-container {
                grid-template-columns: 1fr;
            }

            .filters-sidebar {
                display: none;
            }
        }

        @media (max-width: 768px) {
            .hero-title {
                font-size: 32px;
            }

            .review-form-content {
                padding: 32px 24px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hero Section -->
    <div class="reviews-hero">
        <div class="reviews-hero-content">
            <h1 class="hero-title" data-aos="fade-up">Customer Reviews</h1>
            <p class="hero-subtitle" data-aos="fade-up" data-aos-delay="100">
                Real experiences from real travelers
            </p>
        </div>
    </div>

    <!-- Statistics Cards -->
    <div class="reviews-stats">
        <div class="stat-card" data-aos="fade-up">
            <div class="stat-value">4.8</div>
            <div class="stat-label">Average Rating</div>
        </div>
        <div class="stat-card" data-aos="fade-up" data-aos-delay="100">
            <div class="stat-value"><asp:Label ID="lblTotalReviews" runat="server" Text="0"></asp:Label></div>
            <div class="stat-label">Total Reviews</div>
        </div>
        <div class="stat-card" data-aos="fade-up" data-aos-delay="200">
            <div class="stat-value">98%</div>
            <div class="stat-label">Satisfaction Rate</div>
        </div>
    </div>

    <!-- Reviews Container -->
    <div class="reviews-container">
        <!-- Filters Sidebar -->
        <aside class="filters-sidebar" data-aos="fade-right">
            <div class="filter-section">
                <h3 class="filter-title">Filter by Rating</h3>
                <asp:CheckBoxList ID="chkRatingFilter" runat="server" CssClass="rating-filters">
                    <asp:ListItem Value="5" Text="5 Stars"></asp:ListItem>
                    <asp:ListItem Value="4" Text="4 Stars"></asp:ListItem>
                    <asp:ListItem Value="3" Text="3 Stars"></asp:ListItem>
                    <asp:ListItem Value="2" Text="2 Stars"></asp:ListItem>
                    <asp:ListItem Value="1" Text="1 Star"></asp:ListItem>
                </asp:CheckBoxList>
            </div>

            <div class="filter-section">
                <h3 class="filter-title">Destination</h3>
                <asp:DropDownList ID="ddlDestination" runat="server" CssClass="form-select">
                    <asp:ListItem Value="all">All Destinations</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="filter-section">
                <h3 class="filter-title">Verified Travelers Only</h3>
                <asp:CheckBox ID="chkVerifiedOnly" runat="server" Text=" Show only verified reviews" />
            </div>

            <asp:Button ID="btnApplyFilters" runat="server" Text="Apply Filters" CssClass="filter-btn" OnClick="btnApplyFilters_Click" />
        </aside>

        <!-- Reviews Main -->
        <main class="reviews-main">
            <!-- Write Review Card -->
            <div class="write-review-card" data-aos="fade-up">
                <h3 class="write-review-title">Share Your Experience</h3>
                <p class="write-review-text">
                    Traveled with us? We'd love to hear about your experience!
                </p>
                <button class="write-review-btn" onclick="openReviewModal()">
                    <i class="las la-pen"></i>
                    Write a Review
                </button>
            </div>

            <!-- Reviews List -->
            <asp:Repeater ID="rptReviews" runat="server">
                <HeaderTemplate>
                    <div class="reviews-list">
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="review-card" data-aos="fade-up">
                        <div class="review-header">
                            <div class="review-avatar">
                                <%# Eval("CustomerName").ToString().Substring(0, 1).ToUpper() %>
                            </div>
                            <div class="review-author-info">
                                <div class="review-author"><%# Eval("CustomerName") %></div>
                                <div class="review-meta">
                                    <div class="review-stars">
                                        <%# GenerateStars(Convert.ToInt32(Eval("Rating"))) %>
                                    </div>
                                    <span class="review-date"><%# Convert.ToDateTime(Eval("ReviewDate")).ToString("MMM dd, yyyy") %></span>
                                    <span class="verified-badge">
                                        <i class="las la-check-circle"></i>
                                        Verified Traveler
                                    </span>
                                </div>
                            </div>
                        </div>
                        <div class="review-destination">
                            <i class="las la-map-marker"></i>
                            <span><%# Eval("DestinationName") %></span>
                        </div>
                        <p class="review-text"><%# Eval("ReviewText") %></p>
                        <div class="review-actions">
                            <button class="review-action-btn">
                                <i class="las la-thumbs-up"></i>
                                Helpful (<%# Eval("HelpfulCount", "{0}") %>)
                            </button>
                            <button class="review-action-btn">
                                <i class="las la-reply"></i>
                                Reply
                            </button>
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>

            <!-- No Reviews State -->
            <asp:Panel ID="pnlNoReviews" runat="server" CssClass="no-reviews" Visible="false">
                <div class="no-reviews-icon">📝</div>
                <h3 class="no-reviews-title">No reviews yet</h3>
                <p class="no-reviews-text">Be the first to share your experience!</p>
            </asp:Panel>
        </main>
    </div>

    <!-- Review Form Modal -->
    <div id="reviewModal" class="review-form-modal">
        <div class="review-form-content" data-aos="zoom-in">
            <button class="modal-close" onclick="closeReviewModal()">×</button>
            <h2 class="form-title">Write a Review</h2>
            
            <div class="form-group">
                <label class="form-label">Select Destination</label>
                <asp:DropDownList ID="ddlReviewDestination" runat="server" CssClass="form-select">
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label class="form-label">Your Rating</label>
                <div class="star-rating-input" id="starRating">
                    <i class="las la-star" data-rating="1"></i>
                    <i class="las la-star" data-rating="2"></i>
                    <i class="las la-star" data-rating="3"></i>
                    <i class="las la-star" data-rating="4"></i>
                    <i class="las la-star" data-rating="5"></i>
                </div>
                <asp:HiddenField ID="hfRating" runat="server" Value="0" />
            </div>

            <div class="form-group">
                <label class="form-label">Your Review</label>
                <asp:TextBox ID="txtReviewText" runat="server" TextMode="MultiLine" CssClass="form-textarea" placeholder="Share your experience..."></asp:TextBox>
            </div>

            <asp:Button ID="btnSubmitReview" runat="server" Text="Submit Review" CssClass="submit-review-btn" OnClick="btnSubmitReview_Click" />
        </div>
    </div>

    <script>
        function openReviewModal() {
            document.getElementById('reviewModal').classList.add('active');
            document.body.style.overflow = 'hidden';
        }

        function closeReviewModal() {
            document.getElementById('reviewModal').classList.remove('active');
            document.body.style.overflow = 'auto';
        }

        // Star rating interaction
        const stars = document.querySelectorAll('.star-rating-input i');
        const ratingInput = document.getElementById('<%= hfRating.ClientID %>');

        stars.forEach(star => {
            star.addEventListener('click', function() {
                const rating = this.getAttribute('data-rating');
                ratingInput.value = rating;
                
                stars.forEach(s => {
                    if (parseInt(s.getAttribute('data-rating')) <= parseInt(rating)) {
                        s.classList.add('active');
                    } else {
                        s.classList.remove('active');
                    }
                });
            });

            star.addEventListener('mouseenter', function() {
                const rating = this.getAttribute('data-rating');
                stars.forEach(s => {
                    if (parseInt(s.getAttribute('data-rating')) <= parseInt(rating)) {
                        s.style.color = '#fbbf24';
                    } else {
                        s.style.color = '#d1d5db';
                    }
                });
            });
        });

        document.querySelector('.star-rating-input').addEventListener('mouseleave', function() {
            const currentRating = ratingInput.value;
            stars.forEach(s => {
                if (parseInt(s.getAttribute('data-rating')) <= parseInt(currentRating)) {
                    s.style.color = '#fbbf24';
                } else {
                    s.style.color = '#d1d5db';
                }
            });
        });

        // Close modal on outside click
        document.getElementById('reviewModal').addEventListener('click', function(e) {
            if (e.target === this) {
                closeReviewModal();
            }
        });
    </script>
</asp:Content>
