<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="Tours_Travels.ResetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="~/css/ResetPassword.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
            <section class="relative min-h-screen flex items-center justify-center py-12 px-4 bg-cover bg-center" style="background-image: url('https://images.unsplash.com/photo-1496307042754-b4aa456c4a2d?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');">
                <div class="absolute inset-0" style="background-color: rgba(11, 110, 79, 0.9);"></div>

                <div class="relative w-full max-w-md" data-aos="fade-up">
                    <div class="form-container border border-gray-200 rounded-2xl shadow-xl p-8 md:p-10">
                        <div class="text-center mb-8">
                            <h1 class="text-3xl md:text-4xl font-bold heading-font text-midnight-green">Set New Password</h1>
                            <p class="text-text-light mt-3">Enter your new password below and confirm it.</p>
                        </div>

                        <div class="space-y-6">
                            <!-- New Password -->
                            <div class="form-input-wrapper">
                                <i class="bi bi-lock-fill form-icon"></i>
                                <asp:TextBox ID="txtNewPassword" runat="server" CssClass="form-input" TextMode="Password" Placeholder="Enter New Password"></asp:TextBox>
                            </div>

                            <!-- Confirm Password -->
                            <div class="form-input-wrapper">
                                <i class="bi bi-lock-fill form-icon"></i>
                                <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-input" TextMode="Password" Placeholder="Confirm New Password"></asp:TextBox>
                            </div>

                            <!-- Submit Button -->
                            <div>
                                <asp:Button ID="btnResetPassword" runat="server" Text="Reset Password"
                                    CssClass="w-full py-3 px-4 rounded-full text-white font-semibold text-lg submit-btn"
                                    OnClick="btnResetPassword_Click" />
                            </div>

                            <!-- Feedback Message -->
                            <asp:Label ID="lblMessage" runat="server" CssClass="block text-center mt-4 font-semibold"></asp:Label>
                        </div>

                        <div class="text-center mt-6">
                            <a href="Login.aspx" class="font-semibold text-dartmouth-green hover:underline">
                                <i class="bi bi-arrow-left-circle mr-1"></i>Back to Login
                            </a>
                        </div>
                    </div>
                </div>
            </section>
        </main></asp:Content>

