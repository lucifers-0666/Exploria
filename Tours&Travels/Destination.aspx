<%@ Page Title="Destinations" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Destination.aspx.cs" Inherits="Tours_Travels.Destination" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Added AOS CSS and JS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>
    <link rel="stylesheet" href="~/css/Destination.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- ? Enable PageMethods -->
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>

        <main>
            <section class="hero-section h-80 md:h-96 w-full bg-cover bg-center" data-aos="fade-in"
                     style="background-image: url('https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');">
                <div class="hero-content container mx-auto px-4" data-aos="fade-up">
                    <h1 class="text-4xl md:text-6xl font-bold heading-font mb-4">Find Your Next Adventure</h1>
                    <p class="text-lg md:text-xl max-w-3xl mx-auto">Explore a world of wonders with our handpicked collection of breathtaking destinations.</p>
                </div>
            </section>

            <section class="py-16 md:py-24">
                <div class="container mx-auto px-4">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>

                            <!-- ? Search bar with suggestions -->
                            <div class="max-w-2xl mx-auto mb-12 relative" data-aos="fade-up" data-aos-delay="100">
                                <div class="relative flex items-center w-full gap-2">
                                    <asp:TextBox ID="txtSearch" runat="server"
                                        placeholder="e.g., Paris, Adventure, Japan"
                                        CssClass="w-full py-3 pl-5 pr-12 text-lg border-2 border-gray-200 rounded-full focus:outline-none focus:ring-2 focus:ring-dartmouth-green"
                                        onkeyup="showSuggestions(this.value)">
                                    </asp:TextBox>

                                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"
                                        CssClass="px-5 py-2 rounded-full font-semibold text-white transition-transform hover:scale-105"
                                        Style="background-color: var(--dartmouth-green);" />

                                    <!-- ?? Suggestion Box -->
                                    <div id="suggestionBox"
                                         class="absolute top-full mt-2 w-full bg-white border border-gray-200 rounded-lg shadow-lg z-50 hidden">
                                    </div>
                                </div>
                            </div>

                            <!-- ? Filter Buttons -->
                            <div class="flex flex-wrap justify-center gap-3 mb-12" data-aos="fade-up" data-aos-delay="200">
                                <asp:Button ID="btnAll" runat="server" Text="All" OnClick="btnFilter_Click" CommandArgument="all" CssClass="filter-btn px-6 py-2 rounded-full font-semibold" />
                                <asp:Button ID="btnAdventure" runat="server" Text="Adventure" OnClick="btnFilter_Click" CommandArgument="adventure" CssClass="filter-btn px-6 py-2 rounded-full font-semibold" />
                                <asp:Button ID="btnCultural" runat="server" Text="Cultural" OnClick="btnFilter_Click" CommandArgument="cultural" CssClass="filter-btn px-6 py-2 rounded-full font-semibold" />
                                <asp:Button ID="btnBeach" runat="server" Text="Beach" OnClick="btnFilter_Click" CommandArgument="beach" CssClass="filter-btn px-6 py-2 rounded-full font-semibold" />
                                <asp:Button ID="btnCity" runat="server" Text="City Break" OnClick="btnFilter_Click" CommandArgument="city" CssClass="filter-btn px-6 py-2 rounded-full font-semibold" />
                            </div>

                            <!-- ? Destination List -->
                            <asp:Repeater ID="rptDestinations" runat="server">
                                <HeaderTemplate>
                                    <div id="destination-grid" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div class="destination-card bg-white rounded-lg overflow-hidden shadow-md" data-aos="fade-up">
                                        <div class="overflow-hidden h-60">
                                            <img src="<%# Eval("MainImage") %>" alt="<%# Eval("Name") %>" class="w-full h-full object-cover">
                                        </div>
                                        <div class="p-6">
                                            <span class="text-sm font-semibold" style="color: var(--dartmouth-green);"><%# Eval("Region") %></span>
                                            <h3 class="text-2xl font-bold heading-font my-2"><%# Eval("Name") %></h3>
                                            <p class="text-text-light mb-4"><%# Eval("Tagline") %></p>
                                            <div class="mt-auto flex items-center justify-between">
                                                <span class="text-xl font-bold" style="color: var(--midnight-green);">?<%# Convert.ToDecimal(Eval("Price")).ToString("N0") %></span>
                                                <asp:HyperLink ID="hlViewDetails" runat="server" NavigateUrl='<%# "ViewDetails.aspx?id=" + Eval("Id") %>'
                                                    Text="View Details"
                                                    CssClass="px-5 py-2 rounded-full font-semibold text-white transition-transform hover:scale-105"
                                                    Style="background-color: var(--dartmouth-green);"></asp:HyperLink>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </div>
                                </FooterTemplate>
                            </asp:Repeater>

                            <asp:Panel ID="pnlNoResults" runat="server" Visible="false" CssClass="text-center py-12">
                                <h3 class="text-2xl font-bold heading-font">No Destinations Found</h3>
                                <p class="text-text-light mt-2">Try adjusting your search or filter criteria.</p>
                            </asp:Panel>

                            <asp:Panel ID="pnlPagination" runat="server" Visible="false" CssClass="flex justify-center items-center gap-4 mt-16">
                                <asp:Button ID="btnPrev" runat="server" Text="&laquo; Previous" CssClass="pagination-nav-btn" OnClick="btnPrev_Click" />
                                <asp:Button ID="btnNext" runat="server" Text="Next &raquo;" CssClass="pagination-nav-btn" OnClick="btnNext_Click" />
                            </asp:Panel>

                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </section>
        </main></asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            AOS.init({ duration: 800, once: true, offset: 50 });
        });

        let suggestionTimeout;

        function showSuggestions(query) {
            clearTimeout(suggestionTimeout);
            suggestionTimeout = setTimeout(() => {
                if (query.trim().length === 0) {
                    document.getElementById("suggestionBox").classList.add("hidden");
                    return;
                }

                PageMethods.GetSuggestions(query, function (suggestions) {
                    const box = document.getElementById("suggestionBox");
                    box.innerHTML = "";

                    if (suggestions.length === 0) {
                        box.classList.add("hidden");
                        return;
                    }

                    suggestions.forEach(s => {
                        const div = document.createElement("div");
                        div.className = "px-4 py-2 hover:bg-gray-100 cursor-pointer";
                        div.innerText = s;
                        div.onclick = function () {
                            document.getElementById("<%= txtSearch.ClientID %>").value = s;
                            box.classList.add("hidden");
                        };
                        box.appendChild(div);
                    });

                    box.classList.remove("hidden");
                });
            }, 300);
        }

        document.addEventListener("click", function (e) {
            const box = document.getElementById("suggestionBox");
            if (!box.contains(e.target) && e.target.id !== "<%= txtSearch.ClientID %>") {
                box.classList.add("hidden");
            }
        });
    </script>
</asp:Content>
