<%@ Page Title="Forgot Password" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ForgetPassword.aspx.cs" Inherits="Tours_Travels.ForgetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    <link rel="stylesheet" href="<%= ResolveUrl("~/css/Auth.css") %>" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main class="auth-page">
        <section class="auth-hero"
                 style="background-image: url('https://images.unsplash.com/photo-1488646953014-85cb44e25828?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');">
            <div class="auth-overlay"></div>

            <div class="auth-card-wrap">
                <div class="auth-card" data-aos="fade-up">
                    <header class="auth-card-header">
                        <h1 class="auth-title">Reset Your Password</h1>
                        <p class="auth-subtitle">
                            Enter your email to receive an OTP, then enter the OTP to reset your password.
                        </p>

                        <!-- Message Label -->
                        <asp:Label ID="lblMessage" runat="server"
                            CssClass="auth-message"
                            ForeColor="Red">
                        </asp:Label>
                    </header>

                    <div class="auth-fields">
                        <!-- Email Input -->
                        <div class="auth-input-group">
                            <span class="auth-input-icon">
                                <i class="bi bi-envelope-fill"></i>
                            </span>
                            <asp:TextBox ID="txtEmail" runat="server"
                                CssClass="auth-input"
                                Placeholder="Enter your email address"
                                TextMode="Email">
                            </asp:TextBox>
                        </div>

                        <!-- OTP Input (initially hidden, visibility controlled from code-behind) -->
                        <div class="auth-input-group" runat="server" id="otpWrapper" visible="false">
                            <span class="auth-input-icon">
                                <i class="bi bi-shield-lock-fill"></i>
                            </span>
                            <asp:TextBox ID="txtOTP" runat="server"
                                CssClass="auth-input"
                                Placeholder="Enter OTP">
                            </asp:TextBox>
                        </div>

                        <!-- Submit Button -->
                        <div class="auth-actions">
                            <asp:Button ID="btnVerifyReset" runat="server" Text="Verify Email"
                                CssClass="auth-primary-btn"
                                OnClick="btnVerifyReset_Click" />
                        </div>
                    </div>

                    <div class="auth-footer-link">
                        <a href="Login.aspx" class="auth-link">
                            <i class="bi bi-arrow-left-circle"></i>
                            <span>Back to Login</span>
                        </a>
                    </div>
                </div>
            </div>
        </section>
    </main>
</asp:Content>
