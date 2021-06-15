<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Event.aspx.cs" Inherits="EventBooking.Event" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <link rel="stylesheet" href="./css/eventStyle.css">

    <dx:ASPxCardView runat="server" ID="usersEventCardView" ClientInstanceName="usersEventCardView" KeyFieldName="EventId" Width="100%" DataSourceID="dsEvents" 
                    OnCustomUnboundColumnData="eventCardView_CustomUnboundColumnData">
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
                <dx:CardViewCommandLayoutItem ShowEditButton="true" ShowNewButton="true" ShowDeleteButton="true" HorizontalAlign="Right"></dx:CardViewCommandLayoutItem>
                <dx:CardViewColumnLayoutItem ColumnName="Image" ShowCaption="False"></dx:CardViewColumnLayoutItem>
                <dx:CardViewColumnLayoutItem ColumnName="Name" ShowCaption="False" CssClass="name"></dx:CardViewColumnLayoutItem>
                <dx:CardViewColumnLayoutItem ColumnName="LocationId" Caption="Location"></dx:CardViewColumnLayoutItem>
                <dx:CardViewColumnLayoutItem ColumnName="Data" Caption="Date"></dx:CardViewColumnLayoutItem>
                <dx:CardViewColumnLayoutItem ColumnName="Price"></dx:CardViewColumnLayoutItem>
                <dx:CardViewColumnLayoutItem ColumnName="AvailablePlaces"></dx:CardViewColumnLayoutItem>
                
            </Items>
        </CardLayoutProperties>
        <SettingsPager Mode="ShowAllRecords" SettingsTableLayout-ColumnCount="3" />
        <SettingsEditing Mode="PopupEditForm"></SettingsEditing>
        <SettingsPopup>
            <EditForm>
                <SettingsAdaptivity Mode="OnWindowInnerWidth" SwitchAtWindowInnerWidth="768" />
            </EditForm>
        </SettingsPopup>
    </dx:ASPxCardView>



    <dx:ASPxCardView runat="server" ID="clientsEventCardView" ClientInstanceName="clientsEventCardView" KeyFieldName="EventId" Width="100%" DataSourceID="dsEvents" OnCustomUnboundColumnData="eventCardView_CustomUnboundColumnData">
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
        <Templates>
            <Card>
                <dx:ASPxImage runat="server" ID="clientPhoto" ImageUrl='<%# Eval("Image") %>' Width="100%" CssClass="photo" />
                <br />
                <div>
                    <dx:ASPxLabel runat="server" ID="clientName" Text='<%# Eval("Name") %>' CssClass="name"></dx:ASPxLabel>
                </div>
                <br />
                <div class="locationContainer">
                    <dx:ASPxLabel runat="server" Text="Location:"></dx:ASPxLabel>
                    <dx:ASPxLabel runat="server" ID="clientLocation" Text='<%# GetLocationById(Convert.ToInt32(Eval("LocationId"))) %>' CssClass="location"></dx:ASPxLabel>
                </div>
                <br />
                <div class="dateContainer">
                    <dx:ASPxLabel runat="server" Text="Date:"></dx:ASPxLabel>
                    <dx:ASPxLabel runat="server" ID="clientDate" Text='<%# Eval("Data", "{0:dd/MM/yyyy HH:mm}") %>' CssClass="date"></dx:ASPxLabel>
                </div>
                <br />
                <div class="priceContainer">
                    <dx:ASPxLabel runat="server" Text="Price:"></dx:ASPxLabel>
                    <dx:ASPxLabel runat="server" ID="clientPrice" Text='<%# Eval("Price") %>' CssClass="price" ></dx:ASPxLabel>
                </div>
                
                <br />
                <div class="availablePlacesContainer">
                    <dx:ASPxLabel runat="server" Text="Available places:"></dx:ASPxLabel>
                    <dx:ASPxLabel runat="server" ID="ClientAvailablePlaces" Text='<%# Eval("AvailablePlaces") %>' CssClass="availablePlaces" ></dx:ASPxLabel>
                </div>
                
                <br />
                <div class="btnContainer">
                    <dx:ASPxButton runat="server" ID="btnBookEvents" Text="BOOK" AutoPostBack="false" CssClass="btnBookEvents"></dx:ASPxButton>
                </div>
            </Card>
        </Templates>
        <SettingsPager Mode="ShowAllRecords" SettingsTableLayout-ColumnCount="3" />
    </dx:ASPxCardView>

    

    <ef:EntityDataSource runat="server" ID="dsEvents" ContextTypeName="EventBooking.CulturalHouseEntities" EntitySetName="Events" OnQueryCreated="dsEvents_QueryCreated"></ef:EntityDataSource>
    <ef:EntityDataSource runat="server" ID="dsLocations" ContextTypeName="EventBooking.CulturalHouseEntities" EntitySetName ="Locations"></ef:EntityDataSource>
</asp:Content>
