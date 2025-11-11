<%@ Page Title="Thank You" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ThankYou.aspx.cs" Inherits="Tours_Travels.ThankYou" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="~/css/ThankYou.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <main>
        <section class="thank-you-section py-16 md:py-24" style="background-image: url('https://images.unsplash.com/photo-1501785888041-af3ef285b470?auto=format&fit=crop&w=1920&q=80');">
            <div class="container mx-auto px-4 confirmation-container">
                <div class="confirmation-card" data-aos="fade-up">
                    <div class="success-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                    </div>

                    <h1 class="text-3xl md:text-4xl font-bold heading-font text-midnight-green mb-3">Thank You for Your Booking!</h1>
                    <p class="text-text-light text-lg">Your adventure is confirmed and we can't wait to host you.</p>                   
                    
                    <p class="text-text-light mt-8">A confirmation email with your full itinerary and invoice has been sent to your registered email address.</p>

                    <div class="mt-8">
                        <a href="Home.aspx" class="cta-button cta-primary">Go to Homepage</a>
                        <a href="Destination.aspx" class="cta-button cta-secondary">Explore More Trips</a>
                    </div>
                </div>
            </div>
        </section>
    </main>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="script" runat="server">
</asp:Content>