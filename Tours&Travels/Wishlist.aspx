<%@ Page Title="My Wishlist" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="Tours_Travels.Wishlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .wishlist-container { max-width: 1200px; margin: 120px auto 60px; padding: 0 20px; }
        .page-header { text-align: center; margin-bottom: 48px; }
        .page-header h1 { font-size: 42px; font-weight: 700; color: #164426; margin-bottom: 12px; }
        .page-header p { font-size: 18px; color: #6b7280; }
        .wishlist-grid { display: grid; gap: 24px; }
        .wishlist-item { background: white; border-radius: 16px; padding: 24px; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08); display: flex; gap: 24px; transition: all 300ms ease; }
        .wishlist-item:hover { box-shadow: 0 8px 32px rgba(0, 0, 0, 0.12); }
        .wishlist-image { width: 200px; height: 200px; border-radius: 12px; object-fit: cover; flex-shrink: 0; }
        .wishlist-details { flex: 1; }
        .wishlist-title { font-size: 28px; font-weight: 700; color: #164426; margin-bottom: 12px; }
        .wishlist-description { color: #6b7280; line-height: 1.6; margin-bottom: 16px; }
        .wishlist-info { display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 16px; margin-bottom: 20px; }
        .info-item { display: flex; align-items: center; gap: 8px; color: #374151; font-size: 14px; }
        .info-item i { color: #c9a877; font-size: 18px; }
        .wishlist-price { font-size: 32px; font-weight: 700; color: #1d5e33; margin-bottom: 20px; }
        .wishlist-price span { font-size: 16px; font-weight: 400; color: #6b7280; }
        .wishlist-actions { display: flex; gap: 12px; }
        .btn-book { padding: 12px 28px; background: #1d5e33; color: white; border: none; border-radius: 10px; font-weight: 600; cursor: pointer; transition: all 300ms ease; text-decoration: none; display: inline-flex; align-items: center; gap: 8px; }
        .btn-book:hover { background: #2a7d4a; }
        .btn-remove { padding: 12px 24px; background: #f3f4f6; color: #6b7280; border: none; border-radius: 10px; font-weight: 600; cursor: pointer; transition: all 300ms ease; }
        .btn-remove:hover { background: #f8d7da; color: #dc2626; }
        .empty-wishlist { text-align: center; padding: 80px 20px; }
        .empty-wishlist i { font-size: 80px; color: #c9a877; margin-bottom: 24px; }
        .empty-wishlist h3 { font-size: 28px; font-weight: 700; color: #164426; margin-bottom: 12px; }
        .empty-wishlist p { color: #6b7280; font-size: 16px; margin-bottom: 32px; }
        .btn-explore { padding: 14px 32px; background: #1d5e33; color: white; border: none; border-radius: 50px; font-weight: 600; cursor: pointer; transition: all 300ms ease; text-decoration: none; display: inline-block; }
        .btn-explore:hover { background: #2a7d4a; transform: translateY(-2px); }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wishlist-container">
        <div class="page-header">
            <h1><i class="las la-heart" style="color: #c9a877;"></i> My Wishlist</h1>
            <p>Your saved destinations for future adventures</p>
        </div>

        <asp:Panel ID="pnlWishlist" runat="server" Visible="false">
            <div class="wishlist-grid">
                <asp:Repeater ID="rptWishlist" runat="server">
                    <ItemTemplate>
                        <div class="wishlist-item">
                            <img src='<%# Eval("MainImage") %>' alt='<%# Eval("Name") %>' class="wishlist-image" />
                            <div class="wishlist-details">
                                <h2 class="wishlist-title"><%# Eval("Name") %></h2>
                                <p class="wishlist-description"><%# Eval("Tagline") %></p>
                                
                                <div class="wishlist-info">
                                    <div class="info-item">
                                        <i class="las la-clock"></i>
                                        <span><%# Eval("Duration") %></span>
                                    </div>
                                    <div class="info-item">
                                        <i class="las la-map-marker"></i>
                                        <span><%# Eval("Region") %></span>
                                    </div>
                                    <div class="info-item">
                                        <i class="las la-users"></i>
                                        <span>Up to <%# Eval("GroupSize") %> travelers</span>
                                    </div>
                                </div>

                                <div class="wishlist-price">
                                    ₹<%# Convert.ToDecimal(Eval("Price")).ToString("N0") %>
                                    <span>/person</span>
                                </div>

                                <div class="wishlist-actions">
                                    <a href='<%# "ViewDetails.aspx?id=" + Eval("Id") %>' class="btn-book">
                                        <i class="las la-eye"></i> View Details
                                    </a>
                                    <asp:Button ID="btnRemove" runat="server" CssClass="btn-remove" Text="Remove" 
                                        CommandName="Remove" CommandArgument='<%# Eval("Id") %>' 
                                        OnClick="btnRemove_Click" />
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlEmpty" runat="server" Visible="true">
            <div class="empty-wishlist">
                <i class="lar la-heart"></i>
                <h3>Your wishlist is empty</h3>
                <p>Start adding destinations you'd like to visit!</p>
                <a href="Destination.aspx" class="btn-explore">
                    <i class="las la-compass"></i> Explore Destinations
                </a>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
