<%@ Page Title="Testimonials" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Testimonials.aspx.cs" Inherits="Tours_Travels.Testimonials" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .testimonials-container { max-width: 1200px; margin: 120px auto 60px; padding: 0 20px; }
        .page-header { text-align: center; margin-bottom: 60px; }
        .page-header h1 { font-size: 48px; font-weight: 700; color: #164426; margin-bottom: 16px; }
        .page-header p { font-size: 18px; color: #6b7280; }
        .stats-row { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 32px; margin-bottom: 60px; text-align: center; }
        .stat-item h3 { font-size: 48px; font-weight: 700; color: #1d5e33; margin-bottom: 8px; }
        .stat-item p { color: #6b7280; font-size: 16px; }
        .testimonials-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(350px, 1fr)); gap: 32px; }
        .testimonial-card { background: white; border-radius: 16px; padding: 32px; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08); transition: all 300ms ease; }
        .testimonial-card:hover { transform: translateY(-8px); box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15); }
        .rating { color: #FFB800; font-size: 20px; margin-bottom: 16px; }
        .testimonial-text { color: #374151; line-height: 1.8; font-size: 16px; margin-bottom: 24px; }
        .testimonial-author { display: flex; align-items: center; gap: 16px; }
        .author-image { width: 60px; height: 60px; border-radius: 50%; object-fit: cover; }
        .author-info h4 { font-size: 18px; font-weight: 600; color: #164426; margin-bottom: 4px; }
        .author-info p { font-size: 14px; color: #6b7280; }
        .btn-submit-review { margin: 48px auto 0; display: block; padding: 16px 40px; background: #1d5e33; color: white; border: none; border-radius: 50px; font-size: 16px; font-weight: 600; cursor: pointer; transition: all 300ms ease; }
        .btn-submit-review:hover { background: #2a7d4a; transform: translateY(-2px); }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="testimonials-container">
        <div class="page-header">
            <h1><i class="las la-quote-left" style="color: #c9a877;"></i> Customer Testimonials</h1>
            <p>Real stories from travelers who experienced unforgettable journeys with us</p>
        </div>

        <div class="stats-row">
            <div class="stat-item">
                <h3>10,000+</h3>
                <p>Happy Travelers</p>
            </div>
            <div class="stat-item">
                <h3>4.9/5</h3>
                <p>Average Rating</p>
            </div>
            <div class="stat-item">
                <h3>98%</h3>
                <p>Satisfaction Rate</p>
            </div>
            <div class="stat-item">
                <h3>50+</h3>
                <p>Destinations</p>
            </div>
        </div>

        <div class="testimonials-grid">
            <div class="testimonial-card">
                <div class="rating">
                    <i class="las la-star"></i>
                    <i class="las la-star"></i>
                    <i class="las la-star"></i>
                    <i class="las la-star"></i>
                    <i class="las la-star"></i>
                </div>
                <p class="testimonial-text">"Absolutely amazing experience! The team took care of everything from start to finish. The destinations were breathtaking and the accommodations were top-notch. Highly recommended!"</p>
                <div class="testimonial-author">
                    <img src="https://i.pravatar.cc/150?img=1" alt="Sarah Johnson" class="author-image" />
                    <div class="author-info">
                        <h4>Sarah Johnson</h4>
                        <p>Bali Adventure Trip</p>
                    </div>
                </div>
            </div>

            <div class="testimonial-card">
                <div class="rating">
                    <i class="las la-star"></i>
                    <i class="las la-star"></i>
                    <i class="las la-star"></i>
                    <i class="las la-star"></i>
                    <i class="las la-star"></i>
                </div>
                <p class="testimonial-text">"Best vacation ever! The booking process was seamless, and the customer service was exceptional. Every detail was perfectly planned. We'll definitely book again!"</p>
                <div class="testimonial-author">
                    <img src="https://i.pravatar.cc/150?img=12" alt="Michael Chen" class="author-image" />
                    <div class="author-info">
                        <h4>Michael Chen</h4>
                        <p>Swiss Alps Tour</p>
                    </div>
                </div>
            </div>

            <div class="testimonial-card">
                <div class="rating">
                    <i class="las la-star"></i>
                    <i class="las la-star"></i>
                    <i class="las la-star"></i>
                    <i class="las la-star"></i>
                    <i class="las la-star"></i>
                </div>
                <p class="testimonial-text">"A dream come true! The guides were knowledgeable, the locations were stunning, and everything ran smoothly. Thank you for making our honeymoon so special!"</p>
                <div class="testimonial-author">
                    <img src="https://i.pravatar.cc/150?img=5" alt="Emily Rodriguez" class="author-image" />
                    <div class="author-info">
                        <h4>Emily Rodriguez</h4>
                        <p>Maldives Honeymoon</p>
                    </div>
                </div>
            </div>

            <div class="testimonial-card">
                <div class="rating">
                    <i class="las la-star"></i>
                    <i class="las la-star"></i>
                    <i class="las la-star"></i>
                    <i class="las la-star"></i>
                    <i class="lar la-star"></i>
                </div>
                <p class="testimonial-text">"Fantastic service and great value for money! The destinations exceeded our expectations. Just a minor hiccup with one hotel, but the team resolved it quickly."</p>
                <div class="testimonial-author">
                    <img src="https://i.pravatar.cc/150?img=33" alt="David Kumar" class="author-image" />
                    <div class="author-info">
                        <h4>David Kumar</h4>
                        <p>Thailand Explorer</p>
                    </div>
                </div>
            </div>

            <div class="testimonial-card">
                <div class="rating">
                    <i class="las la-star"></i>
                    <i class="las la-star"></i>
                    <i class="las la-star"></i>
                    <i class="las la-star"></i>
                    <i class="las la-star"></i>
                </div>
                <p class="testimonial-text">"Professional, reliable, and incredibly helpful! They made our family trip stress-free and enjoyable. The kids had a blast, and so did we!"</p>
                <div class="testimonial-author">
                    <img src="https://i.pravatar.cc/150?img=20" alt="Jessica Williams" class="author-image" />
                    <div class="author-info">
                        <h4>Jessica Williams</h4>
                        <p>Orlando Family Trip</p>
                    </div>
                </div>
            </div>

            <div class="testimonial-card">
                <div class="rating">
                    <i class="las la-star"></i>
                    <i class="las la-star"></i>
                    <i class="las la-star"></i>
                    <i class="las la-star"></i>
                    <i class="las la-star"></i>
                </div>
                <p class="testimonial-text">"Outstanding experience from booking to return! Every aspect was well-organized. The local guides were amazing and showed us hidden gems we wouldn't have found on our own."</p>
                <div class="testimonial-author">
                    <img src="https://i.pravatar.cc/150?img=15" alt="Robert Anderson" class="author-image" />
                    <div class="author-info">
                        <h4>Robert Anderson</h4>
                        <p>Paris Cultural Tour</p>
                    </div>
                </div>
            </div>
        </div>

        <button class="btn-submit-review" onclick="window.location.href='Contact.aspx'">
            <i class="las la-edit"></i> Share Your Experience
        </button>
    </div>
</asp:Content>
