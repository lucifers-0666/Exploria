<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdminUserManagement.aspx.cs" Inherits="Tours_Travels.AdminUserManagement" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="~/css/AdminUserManagement.css" />
</asp:Content>

        .user-info-cell {
            display: flex;
            align-items: center;
            gap: 0.75rem;
        }

        .user-details {
            flex: 1;
            min-width: 0;
        }

        .user-avatar {
            width: 40px;
            height: 40px;
            object-fit: cover;
            border-radius: 9999px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
            flex-shrink: 0;
        }

        .user-name {
            font-weight: 600;
            color: #1f2937;
        }

        .user-email {
            font-size: 0.875rem;
            color: #6b7280;
            word-break: break-all;
        }

        .action-btn {
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
            font-weight: 600;
            transition: all 0.2s ease;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            border: 1px solid transparent;
        }

            .action-btn:hover {
                transform: scale(1.05);
            }

        .edit-btn {
            background-color: #e0e7ff;
            color: #4f46e5;
        }

            .edit-btn:hover {
                background-color: #4f46e5;
                color: white;
            }

        .delete-btn {
            background-color: #fee2e2;
            color: #dc2626;
        }

            .delete-btn:hover {
                background-color: #dc2626;
                color: white;
            }

        /* Other styles for search, buttons, pagination are unchanged */
        @media (max-width: 768px) {
            .data-table {
                min-width: 100%;
            }

                .data-table thead {
                    display: none;
                }

                .data-table, .data-table tbody, .data-table tr, .data-table td {
                    display: block;
                    width: 100%;
                }

                    .data-table tr {
                        margin-bottom: 1rem;
                        border: 1px solid #e5e7eb;
                        border-radius: 0.5rem;
                        box-shadow: 0 4px 6px -1px rgb(0 0 0 / 0.1), 0 2px 4px -2px rgb(0 0 0 / 0.1);
                    }

                    .data-table td {
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        padding: 0.75rem 1rem;
                        border-bottom: 1px solid #f3f4f6;
                        text-align: right;
                    }

                        .data-table td:last-child {
                            border-bottom: none;
                        }

                        .data-table td[data-label]::before {
                            content: attr(data-label);
                            font-weight: 600;
                            text-align: left;
                            margin-right: 1rem;
                            color: #4b5563;
                        }

                    .data-table .user-info-cell {
                        justify-content: flex-end;
                    }

                    .data-table .actions-cell {
                        justify-content: center;
                        padding: 1rem;
                        gap: 0.5rem;
                    }

                        .data-table .actions-cell::before {
                            display: none;
                        }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="bg-gray-50">
            <section class="header-section text-white py-20" data-aos="fade-in">
                <div class="container mx-auto px-4 text-center">
                    <h1 class="text-4xl md:text-5xl font-bold heading-font">User Dashboard</h1>
                    <p class="text-lg mt-2">View user data and site-wide statistics.</p>

                    <div class="mt-8 grid grid-cols-1 sm:grid-cols-2 gap-6 max-w-2xl mx-auto">
                        <div class="stat-card">
                            <i class="las la-dollar-sign stat-card-icon"></i>
                            <div>
                                <div class="stat-card-value">
                                    <asp:Label ID="lblTotalRevenue" runat="server" Text=""></asp:Label>
                                </div>
                                <div class="stat-card-title">Total RevenuGe</div>
                            </div>
                        </div>
                        <div class="stat-card">
                            <i class="las la-suitcase-rolling stat-card-icon"></i>
                            <div>
                                <div class="stat-card-value">
                                    <asp:Label ID="lblTotalBookings" runat="server" Text=""></asp:Label>
                                </div>
                                <div class="stat-card-title">Total Bookings</div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section class="py-16 md:py-24">
                <div class="container mx-auto px-4">
                    <div class="bg-white rounded-lg shadow-lg overflow-hidden" data-aos="fade-up" data-aos-delay="100">
                        <div class="table-container">
                            <table class="data-table">
                                <thead>
                                    <tr>
                                        <th>User</th>
                                        <th>Phone</th>
                                        <th>Country</th>
                                        <th>State</th>
                                        <th>City</th>
                                   
                                        <th class="text-center">Actions</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <asp:Repeater ID="rptUsers" runat="server">
                                        <ItemTemplate>
                                            <tr>
                                                <td data-label="User">
                                                    <div class="user-info-cell">
                                                        <img src="Images/<%#Eval("Image") %>" alt="<%# Eval("FirstName") %>" class="user-avatar">
                                                        <div class="user-details">
                                                            <div class="user-name"><%# Eval("FirstName") %>  <%# Eval("LastName") %></div>
                                                            <div class="user-email"><%# Eval("Email")%></div>
                                                        </div>
                                                    </div>
                                                </td>
                                                <td data-label="Phone"><%# Eval("Phone", "{0:(###) ###-####}") %></td>
                                                <td data-label="Country"><%#Eval("Country") %></td>
                                                <td data-label="State" class="font-semibold text-gray-800"><%#Eval("State") %></td>
                                                <td data-label="City" class="font-semibold text-gray-800"><%#Eval("City") %></td>
                                             
                                                <td data-label="Actions" class="actions-cell">
                                                    <asp:HyperLink ID="LEdit" runat="server" NavigateUrl='<%# "~/AdminUserDetails.aspx?id=" + Eval("Id") %>' CssClass="action-btn edit-btn">
               <i class="las la-pencil-alt"></i> View 
                                                    </asp:HyperLink>
                                                    <asp:LinkButton ID="lbtnDel" runat="server" CommandArgument='<%# Eval("Id") %>'
                                                        OnClientClick="return confirm('Are you sure you want to delete this user?');"
                                                        CssClass="action-btn delete-btn">
               <i class="las la-trash"></i> Delete
                                                    </asp:LinkButton>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>


                                </tbody>
                            </table>
                        </div>
                        <div class="pagination-container">
                        </div>
                    </div>
                </div>
            </section>
        </main></asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        AOS.init({
            duration: 800,
            once: true,
            offset: 50
        });
    </script>
</asp:Content>
