<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="EventBooking.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     
       <link rel="stylesheet" href="./css/contact.css">








    <main>
        <img src="./images/contact.png" alt="Contact img" width="100%">

        <div class="contact-text">
            <h3>You can find us here!</h3>
        </div>
        <div class="maps">
            <iframe src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d2733.034399747508!2d23.5898452!3d46.7642184!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sro!2sro!4v1617210057706!5m2!1sro!2sro" width="100%" height="500" style="border: 0;" allowfullscreen="" loading="lazy"></iframe>
        </div>
    </main>

</asp:Content>
