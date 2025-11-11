<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="~/css/AddDest.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <form id="addDestinationForm" runat="server">
        <section class="relative min-h-screen flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
            <div class="absolute inset-0 h-full w-full">
                <div class="absolute inset-0 parallax-bg"
                     style="background-image: url('https://images.unsplash.com/photo-1517999349371-c43520457b23?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80'); background-position: center;">
                </div>
                <div class="absolute inset-0 form-gradient-overlay"></div>
            </div>

            <div class="relative w-full p-8 sm:p-10 space-y-8 rounded-2xl shadow-2xl form-card" data-aos="fade-up">
                <div class="text-center">
                    <h2 class="text-3xl sm:text-4xl font-bold heading-font" style="color: var(--midnight-green)">Add New Destination</h2>
                    <p class="mt-2 text-md text-text-light font-light">Fill in the details to add a new travel package to the collection.</p>
                </div>

           
                <asp:Literal ID="StatusLiteral" runat="server"></asp:Literal>

                <div class="mt-8 space-y-6">
                    <div class="rounded-md shadow-sm space-y-4">
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            <div class="form-input-container">
                               
                                <input type="text" name="DestName" class="form-input" placeholder="Destination Name (e.g., Paris, France)" required />
                                <i class="bi bi-pin-map-fill form-input-icon"></i>
                            </div>
                            <div class="form-input-container">
                                <input type="text" name="Tagline" class="form-input" placeholder="Tagline (e.g., City of Love)" required />
                                <i class="bi bi-card-text form-input-icon"></i>
                            </div>
                        </div>
                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            <div class="form-input-container">
                                <input type="text" name="Duration" class="form-input" placeholder="Duration (e.g., 7 Days / 6 Nights)" required />
                                <i class="bi bi-clock form-input-icon"></i>
                            </div>
                            <div class="form-input-container">
                                <input type="text" name="GroupSize" class="form-input" placeholder="Group Size (e.g., Up to 12 people)" required />
                                <i class="bi bi-people form-input-icon"></i>
                            </div>
                        </div>
                        <div class="form-input-container">
                            <input type="text" name="Region" class="form-input" placeholder="Region (e.g., Europe)" required />
                            <i class="bi bi-globe-americas form-input-icon"></i>
                        </div>

                        <div>
                            <textarea name="Description" class="form-textarea" rows="4" placeholder="Enter a brief description of the destination..." required></textarea>
                        </div>
                        <div>
                            <textarea name="Included" class="form-textarea" rows="4" placeholder="What's Included? (Enter one item per line)" required></textarea>
                        </div>

                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                            <div class="form-input-container">
                                <input type="number" name="Price" class="form-input" placeholder="Price (e.g., 1200)" required />
                                <i class="bi bi-currency-rupee form-input-icon"></i>
                            </div>
                            <div class="form-input-container">
                                <select name="Category" class="form-select" required>
                                    <option value="">Select Category</option>
                                    <option value="adventure">Adventure</option>
                                    <option value="cultural">Cultural</option>
                                    <option value="beach">Beach</option>
                                    <option value="city">City Break</option>
                                </select>
                                <i class="bi bi-tags-fill form-input-icon"></i>
                            </div>
                        </div>

                        <div class="grid grid-cols-1 sm:grid-cols-2 gap-4 items-center">
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">Main Image</label>
                                <!-- Changed to asp:FileUpload -->
                                <asp:FileUpload ID="MainImageUpload" runat="server" CssClass="form-file-input" />
                            </div>
                            <div>
                                <label class="block text-sm font-medium text-gray-700 mb-2">Gallery Images</label>
                                <!-- Changed to asp:FileUpload and enabled AllowMultiple -->
                                <asp:FileUpload ID="GalleryImagesUpload" runat="server" AllowMultiple="true" CssClass="form-file-input" />
                            </div>
                        </div>
                    </div>

                    <div>
                        <!-- Changed to asp:Button with OnClick event -->
                        <asp:Button ID="SubmitBtn" runat="server" Text="Add Destination" OnClick="SubmitBtn_Click" 
                            CssClass="group relative w-full flex justify-center py-3 px-4 border border-transparent text-sm font-semibold rounded-lg text-white submit-btn focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-pigment-green mt-4" />
                    </div>
                </div>
            </div>
        </section>
    </form>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <!-- 
      Removed the entire client-side onsubmit script. 
      The form will now be submitted to the C# code-behind.
    -->
</asp:Content>
