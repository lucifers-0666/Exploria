<%@ Page Title="Admin - Manage Destinations" Language="C#" MasterPageFile="~/Site1.Master"
    AutoEventWireup="true" CodeBehind="AdminDestinations.aspx.cs"
    Inherits="Tours_Travels.AdminDestinations" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="~/css/Admin.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" xintegrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0V4LLanw2qksYuRlEzO+tcaEPQogQ0KaoIF2QVp/wP8eR7l/J7Y1b1z+oA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
        <main class="bg-gray-50 min-h-screen">
            <section class="header-section text-white py-20">
                <div class="container max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
                    <h1 class="text-4xl md:text-5xl font-bold">Manage Destinations</h1>
                    <p class="text-lg mt-2">Add, edit, or remove travel packages from your website.</p>
                </div>
            </section>

            <section class="py-16 md:py-24">
                <div class="container max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                    
                    <div id="messageBanner" role="alert"></div>

                    <div class="flex justify-end items-center mb-8">
                        <a href="AddDestinations.aspx" class="add-new-btn">
                            <i class="las la-plus text-xl"></i><span>Add New Destination</span>
                        </a>
                    </div>

                    <asp:Panel ID="pnlDestinations" runat="server" Visible="false">
                        <div class="bg-white rounded-lg shadow-lg overflow-hidden">
                            <div class="table-container">
                                <asp:Repeater ID="rptDestinations" runat="server" OnItemCommand="rptDestinations_ItemCommand">
                                    <HeaderTemplate>
                                        <table class="data-table">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Image</th>
                                                    <th>Destination Name</th>
                                                    <th>Region</th>
                                                    <th>Category</th>
                                                    <th>Price</th>
                                                    <th>Actions</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td class="font-mono text-sm text-gray-500"><%# Eval("_id") %></td>
                                            <td><img src='http://localhost:3000/uploads/<%# Eval("mainImage") %>' alt='<%# Eval("name") %>' class="dest-image-thumb" /></td>
                                            <td class="font-semibold text-gray-800"><%# Eval("name") %></td>
                                            <td class="text-gray-600"><%# Eval("region") %></td>
                                            <td class="text-gray-600"><%# Eval("category") %></td>
                                            <td class="font-semibold text-gray-800">$<%# Eval("price", "{0:N2}") %></td>
                                            <td>
                                                <div class="flex items-center gap-2">
                                                    <a href='EditDestination.aspx?id=<%# Eval("_id") %>' class='action-btn edit-btn'>
                                                        <i class="las la-pen"></i> Edit
                                                    </a>
                                                    <asp:LinkButton ID="btnDelete" runat="server"
                                                        CssClass="action-btn delete-btn"
                                                        CommandName="DeleteDestination"
                                                        CommandArgument='<%# Eval("_id") %>'
                                                        UseSubmitBehavior="false"
                                                        OnClientClick="return openConfirmModal(this);">
                                                        <i class="las la-trash"></i> Delete
                                                    </asp:LinkButton>
                                                </div>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                            </tbody>
                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </asp:Panel>
                    
                    <asp:Panel ID="pnlNoData" runat="server" Visible="false">
                         <div class="bg-white rounded-lg shadow-lg overflow-hidden">
                             <div class="empty-data-container">
                                 <i class="las la-box-open empty-data-icon"></i>
                                 <p class="empty-data-title">No Destinations Found</p>
                                 <p class="empty-data-text text-gray-500">Try adding a new destination to get started.</p>
                             </div>
                         </div>
                    </asp:Panel>

                </div>
            </section>
        </main>

        <div id="deleteConfirmModal" class="modal-overlay" role="dialog" aria-modal="true" aria-labelledby="modalTitle">
            <div class="modal-box text-center">
                <div class="modal-icon"><i class="las la-exclamation-triangle text-3xl"></i></div>
                <h3 id="modalTitle" class="text-2xl font-bold text-gray-800">Confirm Deletion</h3>
                <p class="text-gray-600 mt-2">Are you sure you want to permanently delete this destination? This action cannot be undone.</p>
                <div class="modal-buttons">
                    <button type="button" id="btnModalCancel" class="modal-btn modal-btn-cancel">Cancel</button>
                    <button type="button" id="btnModalConfirm" class="modal-btn modal-btn-confirm">
                        <span class="btn-text">Yes, Delete</span>
                        <span class="btn-loader" style="display: none;"><div class="spinner"></div></span>
                    </button>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
<script>
    let postbackScript = null;
    const modal = document.getElementById('deleteConfirmModal');
    const btnConfirm = document.getElementById('btnModalConfirm');
    const btnCancel = document.getElementById('btnModalCancel');

    function openConfirmModal(linkBtn) {
        postbackScript = linkBtn.href;
        modal.classList.add('active');
        return false;
    }

    function closeConfirmModal() {
        modal.classList.remove('active');
        postbackScript = null;
    }

    btnCancel.addEventListener('click', closeConfirmModal);
    modal.addEventListener('click', e => {
        if (e.target === modal) closeConfirmModal();
    });

    btnConfirm.addEventListener('click', function () {
        if (postbackScript) {
            btnConfirm.disabled = true;
            btnConfirm.querySelector('.btn-text').textContent = 'Deleting...';
            btnConfirm.querySelector('.btn-loader').style.display = 'inline-block';

            const scriptToExecute = postbackScript.substring('javascript:'.length);
            new Function(scriptToExecute)();
        }
    });

    function showMessage(message, type) {
        const banner = document.getElementById('messageBanner');
        if (!banner) return;

        let iconHtml = '';
        if (type === 'success') {
            iconHtml = '<i class="fa-solid fa-check-circle message-icon"></i>';
        } else if (type === 'error') {
            iconHtml = '<i class="fa-solid fa-times-circle message-icon"></i>';
        }

        banner.innerHTML = `${iconHtml}<span>${message}</span>`;
        banner.className = 'message-banner'; // Reset classes
        banner.classList.add(type); // 'success' or 'error'

        // Automatically hide the banner after 4 seconds
        setTimeout(() => {
            banner.className = 'message-banner';
        }, 4000);
    }
</script>
</asp:Content>

