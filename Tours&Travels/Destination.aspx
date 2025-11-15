<%@ Page Title="Destinations" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Destination.aspx.cs" Inherits="Tours_Travels.Destination" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- AOS animation -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js"></script>

    <!-- Page CSS (root‑safe path if needed) -->
    <link rel="stylesheet" href="<%= ResolveUrl("~/css/Destination.css") %>" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true" />

    <main class="dest-page">
        <!-- Hero -->
        <section class="dest-hero" data-aos="fade-in">
            <div class="dest-hero-bg"
                 style="background-image:url('https://images.unsplash.com/photo-1476514525535-07fb3b4ae5f1?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');">
            </div>
            <div class="dest-hero-overlay"></div>

            <div class="dest-hero-inner" data-aos="fade-up">
                <h1 class="dest-hero-title">Find Your Next Adventure</h1>
                <p class="dest-hero-subtitle">
                    Explore a world of wonders with our handpicked collection of breathtaking destinations.
                </p>
            </div>
        </section>

        <!-- Content -->
        <section class="dest-body">
            <div class="dest-container">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <!-- Search + suggestions -->
                        <div class="dest-search-wrap" data-aos="fade-up" data-aos-delay="80">
                            <div class="dest-search-inner">
                                <asp:TextBox ID="txtSearch" runat="server"
                                    CssClass="dest-search-input"
                                    placeholder="e.g., Paris, Adventure, Japan"
                                    onkeyup="showSuggestions(this.value)">
                                </asp:TextBox>

                                <asp:Button ID="btnSearch" runat="server" Text="Search"
                                    OnClick="btnSearch_Click"
                                    CssClass="dest-search-btn" />

                                <div id="suggestionBox" class="dest-suggest-box hidden"></div>
                            </div>
                        </div>

                        <!-- Filters -->
                        <div class="dest-filter-row" data-aos="fade-up" data-aos-delay="140">
                            <asp:Button ID="btnAll" runat="server" Text="All"
                                OnClick="btnFilter_Click" CommandArgument="all"
                                CssClass="dest-filter-btn" />
                            <asp:Button ID="btnAdventure" runat="server" Text="Adventure"
                                OnClick="btnFilter_Click" CommandArgument="adventure"
                                CssClass="dest-filter-btn" />
                            <asp:Button ID="btnCultural" runat="server" Text="Cultural"
                                OnClick="btnFilter_Click" CommandArgument="cultural"
                                CssClass="dest-filter-btn" />
                            <asp:Button ID="btnBeach" runat="server" Text="Beach"
                                OnClick="btnFilter_Click" CommandArgument="beach"
                                CssClass="dest-filter-btn" />
                            <asp:Button ID="btnCity" runat="server" Text="City Break"
                                OnClick="btnFilter_Click" CommandArgument="city"
                                CssClass="dest-filter-btn" />
                        </div>

                        <!-- Destination cards -->
                        <asp:Repeater ID="rptDestinations" runat="server">
                            <HeaderTemplate>
                                <div id="destination-grid" class="dest-grid">
                            </HeaderTemplate>
                            <ItemTemplate>
                                <article class="dest-card" data-aos="fade-up" data-aos-delay="200">
                                    <div class="dest-card-image">
                                        <img src="<%# Eval("MainImage") %>"
                                             alt="<%# Eval("Name") %>" />
                                    </div>
                                    <div class="dest-card-body">
                                        <span class="dest-card-region"><%# Eval("Region") %></span>
                                        <h3 class="dest-card-title"><%# Eval("Name") %></h3>
                                        <p class="dest-card-tagline"><%# Eval("Tagline") %></p>
                                        <div class="dest-card-footer">
                                            <span class="dest-card-price">
                                                ₹<%# Convert.ToDecimal(Eval("Price")).ToString("N0") %>
                                            </span>
                                            <asp:HyperLink ID="hlViewDetails" runat="server"
                                                NavigateUrl='<%# "ViewDetails.aspx?id=" + Eval("Id") %>'
                                                Text="View Details"
                                                CssClass="dest-card-btn">
                                            </asp:HyperLink>
                                        </div>
                                    </div>
                                </article>
                            </ItemTemplate>
                            <FooterTemplate>
                                </div>
                            </FooterTemplate>
                        </asp:Repeater>

                        <!-- No results -->
                        <asp:Panel ID="pnlNoResults" runat="server" Visible="false" CssClass="dest-empty">
                            <h3 class="dest-empty-title">No Destinations Found</h3>
                            <p class="dest-empty-text">Try adjusting your search or filter criteria.</p>
                        </asp:Panel>

                        <!-- Pagination -->
                        <asp:Panel ID="pnlPagination" runat="server" Visible="false" CssClass="dest-pager">
                            <asp:Button ID="btnPrev" runat="server" Text="&laquo; Previous"
                                CssClass="dest-pager-btn" OnClick="btnPrev_Click" />
                            <asp:Button ID="btnNext" runat="server" Text="Next &raquo;"
                                CssClass="dest-pager-btn" OnClick="btnNext_Click" />
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </section>
    </main>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            AOS.init({ duration: 800, once: true, offset: 50 });
        });

        let suggestionTimeout;

        function showSuggestions(query) {
            clearTimeout(suggestionTimeout);
            suggestionTimeout = setTimeout(function () {
                if (query.trim().length === 0) {
                    document.getElementById("suggestionBox").classList.add("hidden");
                    return;
                }

                PageMethods.GetSuggestions(query, function (suggestions) {
                    const box = document.getElementById("suggestionBox");
                    box.innerHTML = "";

                    if (!suggestions || suggestions.length === 0) {
                        box.classList.add("hidden");
                        return;
                    }

                    suggestions.forEach(function (s) {
                        const div = document.createElement("div");
                        div.className = "dest-suggest-item";
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
