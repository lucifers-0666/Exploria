<%@ Page Title="Special Deals" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Deals.aspx.cs" Inherits="Tours_Travels.Deals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .deals-container { max-width: 1400px; margin: 120px auto 60px; padding: 0 20px; }
        .page-header { text-align: center; margin-bottom: 60px; }
        .page-header h1 { font-size: 48px; font-weight: 700; color: #164426; margin-bottom: 16px; }
        .page-header p { font-size: 18px; color: #6b7280; }
        .deals-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(380px, 1fr)); gap: 32px; }
        .deal-card { background: white; border-radius: 20px; overflow: hidden; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08); transition: all 400ms ease; position: relative; }
        .deal-card:hover { transform: translateY(-12px); box-shadow: 0 16px 48px rgba(0, 0, 0, 0.15); }
        .deal-badge { position: absolute; top: 20px; right: 20px; background: #dc2626; color: white; padding: 8px 16px; border-radius: 20px; font-weight: 700; font-size: 14px; z-index: 10; animation: pulse 2s ease-in-out infinite; }
        @keyframes pulse { 0%, 100% { transform: scale(1); } 50% { transform: scale(1.05); } }
        .deal-image { width: 100%; height: 280px; object-fit: cover; }
        .deal-content { padding: 28px; }
        .deal-title { font-size: 24px; font-weight: 700; color: #164426; margin-bottom: 12px; }
        .deal-description { color: #6b7280; line-height: 1.6; margin-bottom: 20px; font-size: 15px; }
        .deal-features { display: grid; gap: 12px; margin-bottom: 24px; }
        .feature-item { display: flex; align-items: center; gap: 10px; color: #374151; font-size: 14px; }
        .feature-item i { color: #c9a877; font-size: 18px; }
        .deal-pricing { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; padding: 20px; background: #f5e8d8; border-radius: 12px; }
        .original-price { text-decoration: line-through; color: #9ca3af; font-size: 18px; }
        .deal-price { font-size: 32px; font-weight: 700; color: #1d5e33; }
        .deal-price span { font-size: 16px; color: #6b7280; font-weight: 400; }
        .savings { color: #dc2626; font-weight: 700; font-size: 16px; }
        .deal-footer { display: flex; gap: 12px; }
        .btn-book { flex: 1; padding: 14px; background: #1d5e33; color: white; border: none; border-radius: 10px; font-weight: 600; cursor: pointer; transition: all 300ms ease; }
        .btn-book:hover { background: #2a7d4a; transform: translateY(-2px); }
        .btn-wishlist { width: 50px; padding: 14px; background: #f3f4f6; border: none; border-radius: 10px; color: #6b7280; cursor: pointer; transition: all 300ms ease; }
        .btn-wishlist:hover { background: #f8d7da; color: #dc2626; }
        .countdown { background: #fff3cd; color: #856404; padding: 12px; text-align: center; border-radius: 8px; margin-bottom: 20px; font-weight: 600; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="deals-container">
        <div class="page-header">
            <h1><i class="las la-tags" style="color: #c9a877;"></i> Special Offers & Deals</h1>
            <p>Limited time offers on amazing destinations - Book now and save big!</p>
        </div>

        <div class="deals-grid">
            <asp:Repeater ID="rptDeals" runat="server">
                <ItemTemplate">
                    <div class="deal-card">
                        <span class="deal-badge"><%# Eval("Discount") %>% OFF</span>
                        <img src='<%# Eval("MainImage") %>' alt='<%# Eval("Name") %>' class="deal-image" />
                        <div class="deal-content">
                            <h3 class="deal-title"><%# Eval("Name") %></h3>
                            <p class="deal-description"><%# Eval("Tagline") %></p>
                            
                            <div class="countdown">
                                ⏰ Offer ends in: <strong>3 days 12 hours</strong>
                            </div>

                            <div class="deal-features">
                                <div class="feature-item">
                                    <i class="las la-clock"></i>
                                    <span><%# Eval("Duration") %></span>
                                </div>
                                <div class="feature-item">
                                    <i class="las la-map-marker"></i>
                                    <span><%# Eval("Region") %></span>
                                </div>
                                <div class="feature-item">
                                    <i class="las la-users"></i>
                                    <span>Up to <%# Eval("GroupSize") %> travelers</span>
                                </div>
                            </div>

                            <div class="deal-pricing">
                                <div>
                                    <div class="original-price">₹<%# Convert.ToDecimal(Eval("Price")).ToString("N0") %></div>
                                    <div class="deal-price">
                                        ₹<%# (Convert.ToDecimal(Eval("Price")) * 0.75m).ToString("N0") %>
                                        <span>/person</span>
                                    </div>
                                </div>
                                <div class="savings">
                                    Save ₹<%# (Convert.ToDecimal(Eval("Price")) * 0.25m).ToString("N0") %>
                                </div>
                            </div>

                            <div class="deal-footer">
                                <a href='<%# "ViewDetails.aspx?id=" + Eval("Id") %>' class="btn-book" style="display: flex; align-items: center; justify-content: center; text-decoration: none;">
                                    <i class="las la-bolt"></i> Book Now
                                </a>
                                <button class="btn-wishlist" title="Add to Wishlist" type="button">
                                    <i class="lar la-heart" style="font-size: 20px;"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
