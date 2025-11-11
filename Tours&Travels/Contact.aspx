<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Tours_Travels.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="~/css/Contact.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
            <section class="hero-section relative h-80 md:h-96 w-full bg-cover bg-center flex items-center justify-center text-white" data-aos="fade-in" style="background-image: url('https://images.unsplash.com/photo-1534536281715-e28d76689b4d?ixlib=rb-4.0.3&auto=format&fit=crop&w=1920&q=80');">
                <div class="hero-content text-center container mx-auto px-4" data-aos="fade-up">
                    <h1 class="text-4xl md:text-6xl font-bold heading-font mb-4">Get In Touch</h1>
                    <p class="text-lg md:text-xl max-w-3xl mx-auto">Have questions? We'd love to hear from you. Reach out and we'll get back to you shortly.</p>
                </div>
            </section>

            <section class="py-16 md:py-24 bg-gray-50">
                <div class="container mx-auto px-4">
                    <div class="grid grid-cols-1 lg:grid-cols-2 gap-12">
                        <div class="contact-card p-8 order-2 lg:order-1" data-aos="fade-right">
                            <h2 class="text-3xl font-bold heading-font mb-6 text-midnight-green">Send us a Message</h2>
                            <div class="space-y-6">
                                <!-- Message Label -->
                                <asp:Label ID="lblMessage" runat="server"
                                    CssClass="block text-center text-sm font-semibold mb-2"
                                    ForeColor="Red">
                                </asp:Label>
                                <div class="grid grid-cols-1 sm:grid-cols-2 gap-6">

                                    <div class="form-input-container">
                                        <asp:TextBox ID="txtName" runat="server" CssClass="form-input" placeholder="Your Name" required></asp:TextBox>
                                        <i class="bi bi-person form-input-icon"></i>
                                    </div>
                                    <div class="form-input-container">
                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" placeholder="Your Email" TextMode="Email" required></asp:TextBox>
                                        <i class="bi bi-envelope form-input-icon"></i>
                                    </div>
                                </div>
                                <div class="form-input-container">
                                    <asp:TextBox ID="txtSubject" runat="server" CssClass="form-input" placeholder="Subject" required></asp:TextBox>
                                    <i class="bi bi-chat-left-text form-input-icon"></i>
                                </div>
                                <div>
                                    <asp:TextBox ID="txtMessage" runat="server" CssClass="form-textarea" TextMode="MultiLine" Rows="6" placeholder="Your Message..." required></asp:TextBox>
                                </div>
                                <div>
                                    <asp:Button ID="btnSendMessage" runat="server" Text="Send Message" OnClick="btnSendMessage_Click" CssClass="w-full py-3 px-4 text-lg font-semibold rounded-lg text-white submit-btn" />
                                </div>
                            </div>
                        </div>

                        <div class="order-1 lg:order-2" data-aos="fade-left">
                            <h2 class="text-3xl font-bold heading-font mb-6 text-midnight-green">Contact Information</h2>
                            <p class="text-text-light text-lg mb-8 leading-relaxed">
                                Our team is ready to assist you with any inquiries or custom travel plans. We're passionate about crafting unforgettable journeys. Feel free to contact us through any of the methods below.
                            </p>
                            <div class="space-y-6">
                                <div class="flex items-start gap-4">
                                    <div class="contact-info-icon">
                                        <i class="bi bi-geo-alt"></i>
                                    </div>
                                    <div>
                                        <h3 class="text-xl font-bold text-midnight-green">Address</h3>
                                        <p class="text-text-light text-lg">150 Feet Ring Road, Rajkot, Gujarat, India - 360005</p>
                                    </div>
                                </div>
                                <div class="flex items-start gap-4">
                                    <div class="contact-info-icon">
                                        <i class="bi bi-clock"></i>
                                    </div>
                                    <div>
                                        <h3 class="text-xl font-bold text-midnight-green">Operating Hours</h3>
                                        <p class="text-text-light text-lg">Mon - Sat: 9:00 AM - 7:00 PM</p>
                                    </div>
                                </div>
                                <div class="flex items-start gap-4">
                                    <div class="contact-info-icon">
                                        <i class="bi bi-telephone"></i>
                                    </div>
                                    <div>
                                        <h3 class="text-xl font-bold text-midnight-green">Phone</h3>
                                        <p class="text-text-light text-lg">+91 98765 43210</p>
                                    </div>
                                </div>
                                <div class="flex items-start gap-4">
                                    <div class="contact-info-icon">
                                        <i class="bi bi-envelope"></i>
                                    </div>
                                    <div>
                                        <h3 class="text-xl font-bold text-midnight-green">Email</h3>
                                        <p class="text-text-light text-lg">contact@wanderlusttours.com</p>
                                    </div>
                                </div>
                                <div class="flex items-start gap-4">
                                    <div class="contact-info-icon">
                                        <i class="bi bi-globe2"></i>
                                    </div>
                                    <div>
                                        <h3 class="text-xl font-bold text-midnight-green">Follow Us</h3>
                                        <div class="flex items-center gap-4 mt-2">
                                            <a href="#" class="social-icon"><i class="bi bi-facebook"></i></a>
                                            <a href="#" class="social-icon"><i class="bi bi-instagram"></i></a>
                                            <a href="#" class="social-icon"><i class="bi bi-twitter"></i></a>
                                            <a href="#" class="social-icon"><i class="bi bi-linkedin"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </section>

            <section data-aos="fade-in">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d118147.8239014168!2d70.7202306443445!3d22.2734668249826!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3959c98ac71cdf07%3A0x2a233ac3a81a71aba!2sRajkot%2C%20Gujarat%2C%20India!5e0!3m2!1sen!2sus!4v1663191153213!5m2!1sen!2sus"
                    width="100%"
                    height="450"
                    style="border: 0;"
                    allowfullscreen=""
                    loading="lazy"
                    referrerpolicy="no-referrer-when-downgrade"></iframe>
            </section>
        </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            AOS.init({
                duration: 800,
                once: true,
                offset: 50,
            });
        });
    </script>
</asp:Content>
