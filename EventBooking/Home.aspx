<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="EventBooking._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

     <link rel="stylesheet" href="./css/homeStyle.css">

    <div class="slideshow">
        <img src="./images/6.jpeg" alt="">
    </div>

    <dx:ASPxCardView runat="server" ClientInstanceName="eventCardView" KeyFieldName="EventId" Width="100%" DataSourceID="dsEvents" OnCustomUnboundColumnData="eventCardView_CustomUnboundColumnData">
        <Columns>
           
            <dx:CardViewImageColumn FieldName="Image" UnboundType="String">
                <PropertiesImage ImageWidth="100%" />
            </dx:CardViewImageColumn>
            <dx:CardViewColumn FieldName="Name" />
            <dx:CardViewComboBoxColumn FieldName="LocationId">
                <PropertiesComboBox DataSourceID="dsLocations" TextField="Name" ValueField="LocationId" ValueType="System.Int32"></PropertiesComboBox>
            </dx:CardViewComboBoxColumn>
            <dx:CardViewDateColumn FieldName="Data" />
            <dx:CardViewColumn FieldName="Price" />
            <dx:CardViewColumn FieldName="AvailablePlaces" />
            <dx:CardViewColumn FieldName="Photo" Visible="false" />
        </Columns>
        <CardLayoutProperties ColumnCount="1">
            <Items>
                <dx:CardViewColumnLayoutItem ColumnName="Image" ShowCaption="False"></dx:CardViewColumnLayoutItem>
                <dx:CardViewColumnLayoutItem ColumnName="Name" ShowCaption="False"></dx:CardViewColumnLayoutItem>
                <dx:CardViewColumnLayoutItem ColumnName="LocationId" Caption="Location"></dx:CardViewColumnLayoutItem>
                <dx:CardViewColumnLayoutItem ColumnName="Data" Caption="Date"></dx:CardViewColumnLayoutItem>
                <dx:CardViewColumnLayoutItem ColumnName="Price"></dx:CardViewColumnLayoutItem>
               <dx:CardViewColumnLayoutItem ColumnName="AvailablePlaces"></dx:CardViewColumnLayoutItem>

                
            </Items>
        </CardLayoutProperties>
        <SettingsPager Mode="ShowAllRecords" SettingsTableLayout-ColumnCount="3" />
    </dx:ASPxCardView>

    <div class="events">
        <dx:ASPxButton runat="server" ID="btnGoEvents" AutoPostBack="false" OnClick="btnGoEvents_Click" Text="All events" CssClass="btnEvent"></dx:ASPxButton>
    </div>

    


    <ef:EntityDataSource runat="server" ID="dsEvents" ContextTypeName="EventBooking.CulturalHouseEntities" EntitySetName="Events" OnQueryCreated="dsEvents_QueryCreated"></ef:EntityDataSource>
    <ef:EntityDataSource runat="server" ID="dsLocations" ContextTypeName="EventBooking.CulturalHouseEntities" EntitySetName ="Locations"></ef:EntityDataSource>







    <%--<div class="row">
        <div class="col-md-4">
            <h2>Getting started</h2>
            <p>
                ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301948">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Get more libraries</h2>
            <p>
                NuGet is a free Visual Studio extension that makes it easy to add, remove, and update libraries and tools in Visual Studio projects.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301949">Learn more &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Web Hosting</h2>
            <p>
                You can easily find a web hosting company that offers the right mix of features and price for your applications.
            </p>
            <p>
                <a class="btn btn-default" href="https://go.microsoft.com/fwlink/?LinkId=301950">Learn more &raquo;</a>
            </p>
        </div>
    </div>--%>
</asp:Content>
