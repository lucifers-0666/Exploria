<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AddDestinations.aspx.cs" Inherits="Tours_Travels.AddDestinations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="~/css/AddDestinations.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <section class="relative min-h-screen flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
            <!-- Background Image and Overlay -->
            <div class="absolute inset-0 h-full w-full">
                <div
                    class="absolute inset-0 parallax-bg"
                    style="background-image: url('https://images.unsplash.com/photo-1517999349371-c43520457b23?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80'); background-position: center;">
                </div>
                <div class="absolute inset-0 form-gradient-overlay"></div>
            </div>

            <!-- Add Destination Form Card -->
            <div class="relative w-full p-8 sm:p-10 space-y-8 rounded-2xl shadow-2xl form-card" data-aos="fade-up">
                <div class="text-center">
                    <h2 class="text-3xl sm:text-4xl font-bold heading-font" style="color: var(--midnight-green)">Add New Destination
                    </h2>
                    <p class="mt-2 text-md text-text-light font-light">
                        Fill in the details to add a new travel package to the collection.
                    </p>
                </div>

                <asp:Label ID="lblMessage" runat="server" CssClass="text-center block font-semibold"></asp:Label>

                <div class="mt-8 space-y-6">
                    <div class="rounded-md shadow-sm space-y-4">
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            <div class="form-input-container">
                                <asp:TextBox ID="txtDestName" runat="server" CssClass="form-input" placeholder="Destination Name (e.g., Paris, France)" required></asp:TextBox>
                                <i class="bi bi-pin-map-fill form-input-icon"></i>
                            </div>
                            <div class="form-input-container">
                                <asp:TextBox ID="txtTagline" runat="server" CssClass="form-input" placeholder="Tagline (e.g., City of Love)" required></asp:TextBox>
                                <i class="bi bi-card-text form-input-icon"></i>
                            </div>
                        </div>
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            <div class="form-input-container">
                                <asp:TextBox ID="txtDuration" runat="server" CssClass="form-input" placeholder="Duration (e.g., 7 Days / 6 Nights)" required></asp:TextBox>
                                <i class="bi bi-clock form-input-icon"></i>
                            </div>
                            <div class="form-input-container">
                                <asp:TextBox ID="txtGroupSize" runat="server" CssClass="form-input" placeholder="Group Size (e.g., Up to 12 people)" required></asp:TextBox>
                                <i class="bi bi-people form-input-icon"></i>
                            </div>
                        </div>
                        <div class="form-input-container">
                            <asp:TextBox ID="txtRegion" runat="server" CssClass="form-input" placeholder="Region (e.g., Europe)" required></asp:TextBox>
                            <i class="bi bi-globe-americas form-input-icon"></i>
                        </div>

                        <div>
                            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-textarea" TextMode="MultiLine" Rows="4" placeholder="Enter a brief description of the destination..." required></asp:TextBox>
                        </div>
                        <div>
                            <asp:TextBox ID="txtIncluded" runat="server" CssClass="form-textarea" TextMode="MultiLine" Rows="4" placeholder="What's Included? (Enter one item per line)" required></asp:TextBox>
                        </div>

                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            <div class="form-input-container">
                                <asp:TextBox ID="txtPrice" runat="server" CssClass="form-input" placeholder="Price (e.g., 1200)" TextMode="Number" required></asp:TextBox>
                                <i class="bi bi-currency-rupee form-input-icon"></i>
                            </div>
                            <div class="form-input-container">
                                <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="Select Category" Value="" />
                                    <asp:ListItem Text="Adventure" Value="adventure" />
                                    <asp:ListItem Text="Cultural" Value="cultural" />
                                    <asp:ListItem Text="Beach" Value="beach" />
                                    <asp:ListItem Text="City Break" Value="city" />
                                </asp:DropDownList>
                                <i class="bi bi-tags-fill form-input-icon"></i>
                            </div>
                        </div>

                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 items-center">
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">Main Image</label>
                                <asp:FileUpload ID="fileMainImage" runat="server" CssClass="form-file-input" />
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">Gallery Images</label>
                                <asp:FileUpload ID="fileGalleryImages" runat="server" CssClass="form-file-input" AllowMultiple="true" />
                            </div>
                        </div>
                    </div>

                    <div>
                        <asp:Button ID="btnAddDestination" runat="server" Text="Add Destination" OnClick="btnAddDestination_Click" CssClass="group relative w-full flex justify-center py-3 px-4 border border-transparent text-sm font-semibold rounded-lg text-white submit-btn focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-pigment-green mt-4" />
                    </div>
                </div>
            </div>
        </section>
    </form>
</asp:Content>
