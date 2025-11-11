<%@ Page Title="Gallery" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Gallery.aspx.cs" Inherits="Tours_Travels.Gallery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/photoswipe@5.3.7/dist/photoswipe.css">
    <style>
        .gallery-container { max-width: 1400px; margin: 120px auto 60px; padding: 0 20px; }
        .page-header { text-align: center; margin-bottom: 60px; }
        .page-header h1 { font-size: 48px; font-weight: 700; color: #164426; margin-bottom: 16px; }
        .page-header p { font-size: 18px; color: #6b7280; }
        .gallery-filters { display: flex; gap: 16px; justify-content: center; margin-bottom: 40px; flex-wrap: wrap; }
        .filter-btn { padding: 12px 24px; background: white; border: 2px solid #e8f4ed; border-radius: 24px; font-weight: 600; color: #164426; cursor: pointer; transition: all 300ms ease; }
        .filter-btn:hover, .filter-btn.active { background: #1d5e33; color: white; border-color: #1d5e33; }
        .gallery-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(300px, 1fr)); gap: 24px; }
        .gallery-item { position: relative; border-radius: 16px; overflow: hidden; cursor: pointer; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08); transition: all 400ms ease; }
        .gallery-item:hover { transform: translateY(-8px); box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15); }
        .gallery-item img { width: 100%; height: 350px; object-fit: cover; display: block; transition: transform 500ms ease; }
        .gallery-item:hover img { transform: scale(1.1); }
        .gallery-overlay { position: absolute; inset: 0; background: linear-gradient(to top, rgba(0, 0, 0, 0.8) 0%, transparent 100%); opacity: 0; transition: opacity 400ms ease; padding: 24px; display: flex; flex-direction: column; justify-content: flex-end; }
        .gallery-item:hover .gallery-overlay { opacity: 1; }
        .gallery-title { color: white; font-size: 20px; font-weight: 600; margin-bottom: 8px; }
        .gallery-location { color: rgba(255, 255, 255, 0.9); font-size: 14px; display: flex; align-items: center; gap: 6px; }
        .load-more { text-align: center; margin-top: 48px; }
        .btn-load-more { padding: 16px 40px; background: #1d5e33; color: white; border: none; border-radius: 50px; font-size: 16px; font-weight: 600; cursor: pointer; transition: all 300ms ease; }
        .btn-load-more:hover { background: #2a7d4a; transform: translateY(-2px); box-shadow: 0 8px 24px rgba(29, 94, 51, 0.3); }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="gallery-container">
        <div class="page-header">
            <h1><i class="las la-images" style="color: #c9a877;"></i> Travel Gallery</h1>
            <p>Explore breathtaking moments captured from around the world</p>
        </div>

        <div class="gallery-filters">
            <button class="filter-btn active" onclick="filterGallery('all')">All Photos</button>
            <button class="filter-btn" onclick="filterGallery('Beach')">Beaches</button>
            <button class="filter-btn" onclick="filterGallery('Mountain')">Mountains</button>
            <button class="filter-btn" onclick="filterGallery('City')">Cities</button>
            <button class="filter-btn" onclick="filterGallery('Adventure')">Adventures</button>
            <button class="filter-btn" onclick="filterGallery('Cultural')">Cultural</button>
        </div>

        <div class="gallery-grid">
            <asp:Repeater ID="rptGallery" runat="server">
                <ItemTemplate>
                    <div class="gallery-item" data-category='<%# Eval("Category") %>'>
                        <img src='<%# Eval("MainImage") %>' alt='<%# Eval("Name") %>' />
                        <div class="gallery-overlay">
                            <h3 class="gallery-title"><%# Eval("Name") %></h3>
                            <p class="gallery-location">
                                <i class="las la-map-marker"></i>
                                <%# Eval("Region") %>
                            </p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <asp:Panel ID="pnlLoadMore" runat="server" CssClass="load-more" Visible="false">
            <button class="btn-load-more" onclick="loadMorePhotos()">
                <i class="las la-sync"></i> Load More Photos
            </button>
        </asp:Panel>
    </div>

    <script>
        function filterGallery(category) {
            // Update active button
            document.querySelectorAll('.filter-btn').forEach(btn => {
                btn.classList.remove('active');
            });
            event.target.classList.add('active');

            // Filter gallery items
            document.querySelectorAll('.gallery-item').forEach(item => {
                if (category === 'all' || item.dataset.category === category) {
                    item.style.display = 'block';
                } else {
                    item.style.display = 'none';
                }
            });
        }

        function loadMorePhotos() {
            alert('Load more functionality - integrate with pagination in backend');
        }
    </script>
</asp:Content>
