<%@ Page Title="Manage Blog - Admin" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminBlog.aspx.cs" Inherits="Tours_Travels.AdminBlog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Admin Blog Styles */
        .admin-header {
            background: linear-gradient(135deg, #1d5e33 0%, #2d7a4a 100%);
            padding: 100px 0 60px;
            color: #ffffff;
        }

        .admin-header-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .admin-title {
            font-size: 42px;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .admin-subtitle {
            font-size: 18px;
            opacity: 0.9;
        }

        .admin-container {
            max-width: 1400px;
            margin: -40px auto 60px;
            padding: 0 20px;
        }

        .admin-actions {
            background: #ffffff;
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            margin-bottom: 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
        }

        .search-box {
            display: flex;
            gap: 12px;
            flex: 1;
            max-width: 500px;
        }

        .search-input {
            flex: 1;
            padding: 12px 20px;
            border: 2px solid #e5e7eb;
            border-radius: 10px;
            font-size: 15px;
            transition: all 0.3s;
        }

        .search-input:focus {
            outline: none;
            border-color: #1d5e33;
        }

        .btn-primary {
            padding: 12px 28px;
            background: #1d5e33;
            border: none;
            border-radius: 10px;
            color: #ffffff;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            text-decoration: none;
        }

        .btn-primary:hover {
            background: #2d7a4a;
            transform: translateY(-2px);
            box-shadow: 0 6px 20px rgba(29, 94, 51, 0.3);
        }

        .btn-secondary {
            padding: 12px 28px;
            background: #c9a877;
            border: none;
            border-radius: 10px;
            color: #ffffff;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn-secondary:hover {
            background: #b89666;
            transform: translateY(-2px);
        }

        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 24px;
            margin-bottom: 30px;
        }

        .stat-card {
            background: #ffffff;
            border-radius: 16px;
            padding: 30px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            display: flex;
            align-items: center;
            gap: 20px;
            transition: all 0.3s;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
        }

        .stat-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
        }

        .stat-icon.green {
            background: linear-gradient(135deg, #1d5e33, #2d7a4a);
            color: #ffffff;
        }

        .stat-icon.gold {
            background: linear-gradient(135deg, #c9a877, #b89666);
            color: #ffffff;
        }

        .stat-icon.blue {
            background: linear-gradient(135deg, #1e40af, #3b82f6);
            color: #ffffff;
        }

        .stat-icon.purple {
            background: linear-gradient(135deg, #7c3aed, #a78bfa);
            color: #ffffff;
        }

        .stat-info h3 {
            font-size: 32px;
            font-weight: 700;
            color: #1d5e33;
            margin-bottom: 5px;
        }

        .stat-info p {
            font-size: 14px;
            color: #6b7280;
            margin: 0;
        }

        .blog-table-container {
            background: #ffffff;
            border-radius: 16px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            overflow: hidden;
        }

        .table-header {
            padding: 25px 30px;
            border-bottom: 2px solid #f3f4f6;
        }

        .table-header h2 {
            font-size: 24px;
            font-weight: 700;
            color: #1d5e33;
            margin: 0;
        }

        .blog-table {
            width: 100%;
            border-collapse: collapse;
        }

        .blog-table thead {
            background: #f8f9fa;
        }

        .blog-table th {
            padding: 18px 20px;
            text-align: left;
            font-size: 14px;
            font-weight: 600;
            color: #1d5e33;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .blog-table td {
            padding: 20px;
            border-bottom: 1px solid #f3f4f6;
            font-size: 15px;
            color: #374151;
        }

        .blog-table tr:hover {
            background: #f8f9fa;
        }

        .blog-thumbnail {
            width: 80px;
            height: 60px;
            border-radius: 8px;
            object-fit: cover;
        }

        .blog-title-cell {
            max-width: 300px;
        }

        .blog-title-text {
            font-weight: 600;
            color: #1d5e33;
            margin-bottom: 5px;
        }

        .blog-excerpt {
            font-size: 13px;
            color: #6b7280;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        .category-badge {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            padding: 6px 14px;
            background: #f3f4f6;
            border-radius: 50px;
            font-size: 13px;
            font-weight: 600;
            color: #1d5e33;
        }

        .status-badge {
            display: inline-block;
            padding: 6px 14px;
            border-radius: 50px;
            font-size: 13px;
            font-weight: 600;
        }

        .status-published {
            background: #d1fae5;
            color: #065f46;
        }

        .status-draft {
            background: #fef3c7;
            color: #92400e;
        }

        .action-buttons {
            display: flex;
            gap: 8px;
        }

        .btn-action {
            padding: 8px 16px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .btn-edit {
            background: #dbeafe;
            color: #1e40af;
        }

        .btn-edit:hover {
            background: #1e40af;
            color: #ffffff;
        }

        .btn-delete {
            background: #fee2e2;
            color: #991b1b;
        }

        .btn-delete:hover {
            background: #991b1b;
            color: #ffffff;
        }

        .btn-toggle {
            background: #f3e8ff;
            color: #6b21a8;
        }

        .btn-toggle:hover {
            background: #6b21a8;
            color: #ffffff;
        }

        /* Form Modal Styles */
        .modal-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.7);
            z-index: 9999;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .modal-overlay.active {
            display: flex;
        }

        .modal-content {
            background: #ffffff;
            border-radius: 20px;
            width: 100%;
            max-width: 900px;
            max-height: 90vh;
            overflow-y: auto;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            animation: modalSlideIn 0.3s ease;
        }

        @keyframes modalSlideIn {
            from {
                transform: translateY(-50px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .modal-header {
            padding: 30px;
            border-bottom: 2px solid #f3f4f6;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .modal-header h2 {
            font-size: 28px;
            font-weight: 700;
            color: #1d5e33;
            margin: 0;
        }

        .close-modal {
            width: 40px;
            height: 40px;
            border: none;
            background: #f3f4f6;
            border-radius: 50%;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            color: #6b7280;
            transition: all 0.3s;
        }

        .close-modal:hover {
            background: #e5e7eb;
            transform: rotate(90deg);
        }

        .modal-body {
            padding: 30px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            margin-bottom: 20px;
        }

        .form-group-full {
            grid-column: 1 / -1;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: #1d5e33;
            margin-bottom: 8px;
        }

        .form-control {
            width: 100%;
            padding: 12px 16px;
            border: 2px solid #e5e7eb;
            border-radius: 10px;
            font-size: 15px;
            transition: all 0.3s;
            font-family: 'Inter', sans-serif;
        }

        .form-control:focus {
            outline: none;
            border-color: #1d5e33;
        }

        textarea.form-control {
            resize: vertical;
            min-height: 120px;
        }

        .modal-footer {
            padding: 20px 30px;
            border-top: 2px solid #f3f4f6;
            display: flex;
            gap: 12px;
            justify-content: flex-end;
        }

        .btn-cancel {
            padding: 12px 28px;
            background: #e5e7eb;
            border: none;
            border-radius: 10px;
            color: #374151;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-cancel:hover {
            background: #d1d5db;
        }

        @media (max-width: 1024px) {
            .form-grid {
                grid-template-columns: 1fr;
            }

            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 768px) {
            .admin-title {
                font-size: 32px;
            }

            .admin-actions {
                flex-direction: column;
                align-items: stretch;
            }

            .search-box {
                max-width: 100%;
            }

            .stats-grid {
                grid-template-columns: 1fr;
            }

            .blog-table {
                font-size: 13px;
            }

            .blog-table th,
            .blog-table td {
                padding: 12px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Admin Header -->
    <section class="admin-header">
        <div class="admin-header-content">
            <h1 class="admin-title">
                <i class="las la-book-open"></i> Blog Management
            </h1>
            <p class="admin-subtitle">Create, edit, and manage your travel blog articles</p>
        </div>
    </section>

    <!-- Admin Container -->
    <div class="admin-container">
        <!-- Actions Bar -->
        <div class="admin-actions" data-aos="fade-up">
            <div class="search-box">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="search-input" placeholder="Search blog posts..."></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn-primary" OnClick="btnSearch_Click" />
            </div>
            <asp:Button ID="btnAddNew" runat="server" Text="➕ Add New Post" CssClass="btn-secondary" OnClientClick="showModal(); return false;" />
        </div>

        <!-- Statistics -->
        <div class="stats-grid">
            <div class="stat-card" data-aos="fade-up">
                <div class="stat-icon green">
                    <i class="las la-newspaper"></i>
                </div>
                <div class="stat-info">
                    <h3><asp:Literal ID="litTotalPosts" runat="server">0</asp:Literal></h3>
                    <p>Total Blog Posts</p>
                </div>
            </div>
            <div class="stat-card" data-aos="fade-up" data-aos-delay="100">
                <div class="stat-icon gold">
                    <i class="las la-check-circle"></i>
                </div>
                <div class="stat-info">
                    <h3><asp:Literal ID="litPublishedPosts" runat="server">0</asp:Literal></h3>
                    <p>Published Posts</p>
                </div>
            </div>
            <div class="stat-card" data-aos="fade-up" data-aos-delay="200">
                <div class="stat-icon blue">
                    <i class="las la-eye"></i>
                </div>
                <div class="stat-info">
                    <h3><asp:Literal ID="litTotalViews" runat="server">0</asp:Literal></h3>
                    <p>Total Views</p>
                </div>
            </div>
            <div class="stat-card" data-aos="fade-up" data-aos-delay="300">
                <div class="stat-icon purple">
                    <i class="las la-layer-group"></i>
                </div>
                <div class="stat-info">
                    <h3><asp:Literal ID="litCategories" runat="server">7</asp:Literal></h3>
                    <p>Categories</p>
                </div>
            </div>
        </div>

        <!-- Blog Posts Table -->
        <div class="blog-table-container" data-aos="fade-up">
            <div class="table-header">
                <h2>All Blog Posts</h2>
            </div>
            <asp:GridView ID="gvBlogPosts" runat="server" CssClass="blog-table" AutoGenerateColumns="False" 
                          OnRowCommand="gvBlogPosts_RowCommand" DataKeyNames="Id">
                <Columns>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <img src='<%# Eval("ImageUrl") %>' alt="Blog" class="blog-thumbnail">
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Title & Excerpt">
                        <ItemTemplate>
                            <div class="blog-title-cell">
                                <div class="blog-title-text"><%# Eval("Title") %></div>
                                <div class="blog-excerpt"><%# Eval("Excerpt") %></div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Category">
                        <ItemTemplate>
                            <span class="category-badge">
                                <%# GetCategoryIcon(Eval("Category").ToString()) %>
                                <%# Eval("Category") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Author">
                        <ItemTemplate>
                            <%# Eval("Author") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <span class='<%# Convert.ToBoolean(Eval("IsPublished")) ? "status-badge status-published" : "status-badge status-draft" %>'>
                                <%# Convert.ToBoolean(Eval("IsPublished")) ? "Published" : "Draft" %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Views">
                        <ItemTemplate>
                            <i class="las la-eye" style="color: #6b7280;"></i> <%# Eval("ViewCount") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <div class="action-buttons">
                                <asp:Button ID="btnEdit" runat="server" Text="✏️ Edit" CssClass="btn-action btn-edit" 
                                           CommandName="EditPost" CommandArgument='<%# Eval("Id") %>' />
                                <asp:Button ID="btnToggle" runat="server" Text="👁️" CssClass="btn-action btn-toggle" 
                                           CommandName="TogglePublish" CommandArgument='<%# Eval("Id") %>' />
                                <asp:Button ID="btnDelete" runat="server" Text="🗑️" CssClass="btn-action btn-delete" 
                                           CommandName="DeletePost" CommandArgument='<%# Eval("Id") %>' 
                                           OnClientClick="return confirm('Are you sure you want to delete this blog post?');" />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>

    <!-- Add/Edit Modal -->
    <div id="blogModal" class="modal-overlay">
        <div class="modal-content">
            <div class="modal-header">
                <h2>
                    <asp:Literal ID="litModalTitle" runat="server">Add New Blog Post</asp:Literal>
                </h2>
                <button type="button" class="close-modal" onclick="closeModal()">×</button>
            </div>
            <div class="modal-body">
                <asp:HiddenField ID="hdnBlogId" runat="server" Value="0" />
                
                <div class="form-grid">
                    <div class="form-group">
                        <label>Post Title *</label>
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" placeholder="Enter blog title"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Category *</label>
                        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control">
                            <asp:ListItem Value="Adventure">🏔️ Adventure</asp:ListItem>
                            <asp:ListItem Value="Beach">🏖️ Beach & Islands</asp:ListItem>
                            <asp:ListItem Value="Culture">🎭 Culture & Heritage</asp:ListItem>
                            <asp:ListItem Value="Food">🍽️ Food & Cuisine</asp:ListItem>
                            <asp:ListItem Value="Tips">💡 Travel Tips</asp:ListItem>
                            <asp:ListItem Value="Guides">📚 Destination Guides</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <div class="form-grid">
                    <div class="form-group">
                        <label>Author *</label>
                        <asp:TextBox ID="txtAuthor" runat="server" CssClass="form-control" placeholder="Author name"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Image URL *</label>
                        <asp:TextBox ID="txtImageUrl" runat="server" CssClass="form-control" placeholder="https://example.com/image.jpg"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group form-group-full">
                    <label>Excerpt (Summary) *</label>
                    <asp:TextBox ID="txtExcerpt" runat="server" TextMode="MultiLine" CssClass="form-control" 
                                placeholder="Brief summary of the blog post (200-300 characters)"></asp:TextBox>
                </div>

                <div class="form-group form-group-full">
                    <label>Content (Full Article) *</label>
                    <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" CssClass="form-control" 
                                placeholder="Write your blog content here (HTML supported)" Rows="12"></asp:TextBox>
                </div>

                <div class="form-group form-group-full">
                    <label>Tags (comma-separated)</label>
                    <asp:TextBox ID="txtTags" runat="server" CssClass="form-control" 
                                placeholder="travel, adventure, tips (comma-separated)"></asp:TextBox>
                </div>

                <div class="form-grid">
                    <div class="form-group">
                        <label style="display: flex; align-items: center; gap: 10px; cursor: pointer;">
                            <asp:CheckBox ID="chkFeatured" runat="server" />
                            <span>Mark as Featured Post</span>
                        </label>
                    </div>
                    <div class="form-group">
                        <label style="display: flex; align-items: center; gap: 10px; cursor: pointer;">
                            <asp:CheckBox ID="chkPublished" runat="server" />
                            <span>Publish Immediately</span>
                        </label>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn-cancel" onclick="closeModal()">Cancel</button>
                <asp:Button ID="btnSave" runat="server" Text="💾 Save Post" CssClass="btn-primary" OnClick="btnSave_Click" />
            </div>
        </div>
    </div>

    <script>
        function showModal() {
            document.getElementById('blogModal').classList.add('active');
        }

        function closeModal() {
            document.getElementById('blogModal').classList.remove('active');
        }

        // Close modal when clicking outside
        document.getElementById('blogModal').addEventListener('click', function(e) {
            if (e.target === this) {
                closeModal();
            }
        });
    </script>
</asp:Content>
