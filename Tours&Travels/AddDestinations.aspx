<%@ Page Title="Add Destination" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddDestinations.aspx.cs" Inherits="Tours_Travels.AddDestinations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />

    <!-- Tailwind CDN (REMOVE if already included in Site1.Master) -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" />

    <!-- Page CSS: root-safe path -->
    <link rel="stylesheet" href="<%= ResolveUrl("~/css/AddDestinations.css") %>" />

    <!-- Page JS: optional animations -->
    <script src="<%= ResolveUrl("~/js/AddDestinations.js") %>"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="adddest-page">
        <section class="adddest-hero">
            <!-- Background -->
            <div class="adddest-hero-bg"></div>
            <div class="adddest-hero-overlay"></div>

            <!-- Layout -->
            <div class="adddest-container">
                <!-- Intro (left) -->
                <aside class="adddest-intro tt-reveal">
                    <div class="adddest-intro-badge">
                        <span class="adddest-intro-icon">
                            <i class="bi bi-compass-fill"></i>
                        </span>
                        <span class="adddest-intro-label">Admin · New package</span>
                    </div>
                    <h1 class="adddest-intro-title">Add New Destination</h1>
                    <p class="adddest-intro-text">
                        Create a new travel experience for your customers. Add key details, upload visuals
                        and publish it to the Exploria destination gallery.
                    </p>

                    <ul class="adddest-intro-list">
                        <li><i class="bi bi-check-circle-fill"></i>Structured fields for packages and pricing</li>
                        <li><i class="bi bi-check-circle-fill"></i>Gallery support for multiple images</li>
                        <li><i class="bi bi-check-circle-fill"></i>Optimised for quick admin workflows</li>
                    </ul>
                </aside>

                <!-- Form (right) -->
                <section class="adddest-form-card tt-reveal">
                    <header class="adddest-form-header">
                        <div class="adddest-form-icon">
                            <i class="bi bi-airplane-engines"></i>
                        </div>
                        <div>
                            <h2 class="adddest-form-title">Destination details</h2>
                            <p class="adddest-form-subtitle">
                                Fill in all the fields below and click “Add Destination” to save this package.
                            </p>
                        </div>
                    </header>

                    <!-- Status message -->
                    <asp:Label ID="lblMessage" runat="server" CssClass="adddest-message"></asp:Label>

                    <!-- Form grid -->
                    <div class="adddest-form-grid">
                        <!-- Destination name -->
                        <div class="adddest-field">
                            <label class="adddest-label">
                                Destination name
                                <span class="adddest-required">*</span>
                            </label>
                            <div class="adddest-input-wrapper">
                                <asp:TextBox ID="txtDestName" runat="server"
                                    CssClass="adddest-input"
                                    placeholder="e.g., Paris, France" required></asp:TextBox>
                                <i class="bi bi-pin-map-fill adddest-input-icon"></i>
                            </div>
                        </div>

                        <!-- Tagline -->
                        <div class="adddest-field">
                            <label class="adddest-label">
                                Tagline
                                <span class="adddest-required">*</span>
                            </label>
                            <div class="adddest-input-wrapper">
                                <asp:TextBox ID="txtTagline" runat="server"
                                    CssClass="adddest-input"
                                    placeholder="e.g., City of Love" required></asp:TextBox>
                                <i class="bi bi-card-text adddest-input-icon"></i>
                            </div>
                        </div>

                        <!-- Duration -->
                        <div class="adddest-field">
                            <label class="adddest-label">
                                Duration
                                <span class="adddest-required">*</span>
                            </label>
                            <div class="adddest-input-wrapper">
                                <asp:TextBox ID="txtDuration" runat="server"
                                    CssClass="adddest-input"
                                    placeholder="e.g., 7 Days / 6 Nights" required></asp:TextBox>
                                <i class="bi bi-clock adddest-input-icon"></i>
                            </div>
                        </div>

                        <!-- Group size -->
                        <div class="adddest-field">
                            <label class="adddest-label">
                                Group size
                                <span class="adddest-required">*</span>
                            </label>
                            <div class="adddest-input-wrapper">
                                <asp:TextBox ID="txtGroupSize" runat="server"
                                    CssClass="adddest-input"
                                    placeholder="e.g., Up to 12 people" required></asp:TextBox>
                                <i class="bi bi-people adddest-input-icon"></i>
                            </div>
                        </div>

                        <!-- Region -->
                        <div class="adddest-field">
                            <label class="adddest-label">
                                Region
                                <span class="adddest-required">*</span>
                            </label>
                            <div class="adddest-input-wrapper">
                                <asp:TextBox ID="txtRegion" runat="server"
                                    CssClass="adddest-input"
                                    placeholder="e.g., Europe" required></asp:TextBox>
                                <i class="bi bi-globe-americas adddest-input-icon"></i>
                            </div>
                        </div>

                        <!-- Price -->
                        <div class="adddest-field">
                            <label class="adddest-label">
                                Price (per person)
                                <span class="adddest-required">*</span>
                            </label>
                            <div class="adddest-input-wrapper">
                                <asp:TextBox ID="txtPrice" runat="server"
                                    CssClass="adddest-input"
                                    TextMode="Number"
                                    placeholder="e.g., 1200" required></asp:TextBox>
                                <i class="bi bi-currency-rupee adddest-input-icon"></i>
                            </div>
                        </div>

                        <!-- Description -->
                        <div class="adddest-field adddest-field-full">
                            <label class="adddest-label">
                                Description
                                <span class="adddest-required">*</span>
                            </label>
                            <asp:TextBox ID="txtDescription" runat="server"
                                CssClass="adddest-textarea"
                                TextMode="MultiLine" Rows="4"
                                placeholder="Write a short overview highlighting what makes this destination special..."
                                required></asp:TextBox>
                        </div>

                        <!-- Included -->
                        <div class="adddest-field adddest-field-full">
                            <label class="adddest-label">
                                What’s included
                                <span class="adddest-required">*</span>
                                <span class="adddest-label-hint">(Enter one item per line)</span>
                            </label>
                            <asp:TextBox ID="txtIncluded" runat="server"
                                CssClass="adddest-textarea"
                                TextMode="MultiLine" Rows="4"
                                placeholder="Accommodation details, meals, transfers, activities, tour guide, etc."
                                required></asp:TextBox>
                        </div>

                        <!-- Category -->
                        <div class="adddest-field">
                            <label class="adddest-label">
                                Category
                                <span class="adddest-required">*</span>
                            </label>
                            <div class="adddest-input-wrapper">
                                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="adddest-select">
                                    <asp:ListItem Text="Select category" Value="" />
                                    <asp:ListItem Text="Adventure" Value="adventure" />
                                    <asp:ListItem Text="Cultural" Value="cultural" />
                                    <asp:ListItem Text="Beach" Value="beach" />
                                    <asp:ListItem Text="City Break" Value="city" />
                                </asp:DropDownList>
                                <i class="bi bi-tags-fill adddest-input-icon"></i>
                            </div>
                        </div>

                        <!-- Spacer / hint -->
                        <div class="adddest-field">
                            <label class="adddest-label">
                                Group visuals
                            </label>
                            <p class="adddest-small-note">
                                Upload sharp landscape photos for better engagement. Recommended ratio 16:9 or 4:3.
                            </p>
                        </div>

                        <!-- Main image -->
                        <div class="adddest-field">
                            <label class="adddest-label">Main image</label>
                            <asp:FileUpload ID="fileMainImage" runat="server" CssClass="adddest-file-input" />
                        </div>

                        <!-- Gallery images -->
                        <div class="adddest-field">
                            <label class="adddest-label">Gallery images</label>
                            <asp:FileUpload ID="fileGalleryImages" runat="server" CssClass="adddest-file-input" AllowMultiple="true" />
                        </div>
                    </div>

                    <!-- Submit -->
                    <div class="adddest-actions">
                        <asp:Button ID="btnAddDestination" runat="server"
                            Text="Add Destination"
                            OnClick="btnAddDestination_Click"
                            CssClass="adddest-submit-btn" />
                    </div>
                </section>
            </div>
        </section>
    </main>
</asp:Content>
