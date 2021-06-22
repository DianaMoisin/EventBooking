<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Event.aspx.cs" Inherits="EventBooking.Event" EnableViewState="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" href="./css/eventStyle.css">
    <script>
<%--        function FocusedCardChanged(s,e){
            var key = s.GetCardKey(s.GetFocusedCardIndex());
            console.log(key);
        }--%>

    </script>
    <dx:ASPxCardView runat="server" ID="usersEventCardView" ClientInstanceName="usersEventCardView" KeyFieldName="EventId" Width="100%" DataSourceID="dsEvents"
        OnCustomUnboundColumnData="eventCardView_CustomUnboundColumnData" OnCustomButtonCallback="usersEventCardView_CustomButtonCallback" OnToolbarItemClick="usersEventCardView_ToolbarItemClick" OnStartCardEditing="usersEventCardView_StartCardEditing">

        <ClientSideEvents ToolbarItemClick="function(s, e) { console.log('aici'); e.processOnServer = true; }" />

        <Columns>
            <dx:CardViewImageColumn FieldName="Image" UnboundType="String">
                <PropertiesImage ImageWidth="100%"></PropertiesImage>
            </dx:CardViewImageColumn>
            <dx:CardViewColumn FieldName="EventId" Visible="false" />
            <dx:CardViewColumn FieldName="Name" />
            <dx:CardViewComboBoxColumn FieldName="LocationId">
                <PropertiesComboBox DataSourceID="dsLocations" TextField="Name" ValueField="LocationId" ValueType="System.Int32"></PropertiesComboBox>
            </dx:CardViewComboBoxColumn>
            <dx:CardViewDateColumn FieldName="Data" Visible="false" />
            <dx:CardViewDateColumn FieldName="Date" UnboundType="String" />
            <dx:CardViewDateColumn FieldName="Time" UnboundType="String" />
            <dx:CardViewColumn FieldName="Price" />
            <dx:CardViewColumn FieldName="AvailablePlaces" />
            <dx:CardViewColumn FieldName="Photo" Visible="false" />
        </Columns>
        <CardLayoutProperties ColumnCount="1">
            <Items>
                <dx:CardViewCommandLayoutItem ShowEditButton="true" ShowDeleteButton="true" HorizontalAlign="Right">
                </dx:CardViewCommandLayoutItem>
<%--                <dx:CardViewCommandLayoutItem ButtonRenderMode="Button">
                    <CustomButtons>
                        <dx:CardViewCustomCommandButton ID="editButton" Text="" Image-IconID="actions_edit_16x16devav"></dx:CardViewCustomCommandButton>
                    </CustomButtons>
                </dx:CardViewCommandLayoutItem>--%>
                <dx:CardViewColumnLayoutItem ColumnName="Image" ShowCaption="False"></dx:CardViewColumnLayoutItem>
                <dx:CardViewColumnLayoutItem ColumnName="Name" ShowCaption="False" CssClass="name"></dx:CardViewColumnLayoutItem>
                <dx:CardViewColumnLayoutItem ColumnName="LocationId" Caption="Location"></dx:CardViewColumnLayoutItem>
                <dx:CardViewColumnLayoutItem ColumnName="Date" Caption="Date"></dx:CardViewColumnLayoutItem>
                <dx:CardViewColumnLayoutItem ColumnName="Time" Caption="Time"></dx:CardViewColumnLayoutItem>
                <dx:CardViewColumnLayoutItem ColumnName="Price"></dx:CardViewColumnLayoutItem>
                <dx:CardViewColumnLayoutItem ColumnName="AvailablePlaces"></dx:CardViewColumnLayoutItem>
                <dx:EditModeCommandLayoutItem HorizontalAlign="Right"></dx:EditModeCommandLayoutItem>
            </Items>
        </CardLayoutProperties>
        <Toolbars>
            <dx:CardViewToolbar Position="Top" ItemAlign="Justify">
                <Items>
                    <dx:CardViewToolbarItem Name="NewButton" ToolTip="Add event">
                        <Template>
                            <dx:ASPxButton runat="server" ID="newButton" Text="New event" AutoPostBack="false" OnClick="newButton_Click"></dx:ASPxButton>
                        </Template>
                    </dx:CardViewToolbarItem>
                </Items>
            </dx:CardViewToolbar>
        </Toolbars>
        <SettingsPager Mode="ShowAllRecords" SettingsTableLayout-ColumnCount="3" />
        <SettingsEditing Mode="PopupEditForm"></SettingsEditing>
        <SettingsText PopupEditFormCaption="Edit event" />

        <SettingsPopup>
            <EditForm HorizontalAlign="WindowCenter" VerticalAlign="WindowCenter">
                <SettingsAdaptivity Mode="OnWindowInnerWidth" SwitchAtWindowInnerWidth="768" />
            </EditForm>
        </SettingsPopup>
        <StylesPopup>
            <EditForm>
                <Content Paddings-Padding="50"></Content>
            </EditForm>
        </StylesPopup>
        <Templates>
            <EditForm>
                <dx:ASPxFormLayout runat="server" ID="editFormUser" Width="100%">
                    <Items>
                        <dx:LayoutItem ShowCaption="false">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxBinaryImage runat="server" ID="eventPhoto" Value='<%# GetImageByEventId(Convert.ToInt32(Eval("EventId"))) %>' Width="100%">
                                        <EditingSettings Enabled="true"></EditingSettings>
                                    </dx:ASPxBinaryImage>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem ShowCaption="False" FieldName="Name">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxTextBox runat="server" ID="eventName" Text='<%# Eval("Name") %>' CssClass="name" Width="100%"></dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Location" FieldName="Location">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxComboBox runat="server" ID="eventLocation" DataSourceID="dsLocations" TextField="Name" ValueField="LocationId" ValueType="System.Int32" Value='<%# Eval("LocationId") %>' Width="100%"></dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Date" FieldName="Date">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxDateEdit runat="server" ID="eventDate" Value='<%# Eval("Data") %>' EditFormatString="dd.MM.yyyy" DisplayFormatString="dd.MM.yyyy" Width="100%"></dx:ASPxDateEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Time" FieldName="Time">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxTimeEdit runat="server" Id="eventTime" Value='<%# Eval("Data") %>' DisplayFormatString="HH:mm" EditFormatString="HH:mm" AllowMouseWheel="false" Width="100%"></dx:ASPxTimeEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Price" FieldName="Price">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxSpinEdit runat="server" ID="eventPrice" Value='<%# Eval("Price") %>' NumberType="Float" AllowMouseWheel="false" MinValue="0" MaxValue="9999999" DecimalPlaces="2" Width="100%"></dx:ASPxSpinEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                         <dx:LayoutItem Caption="Available prices" FieldName="AvailablePlaces">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxSpinEdit runat="server" ID="eventAvailablePlaces" Value='<%# Eval("AvailablePlaces") %>' NumberType="Integer" AllowMouseWheel="false" MinValue="0" MaxValue="9999999" Width="100%"></dx:ASPxSpinEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:ASPxFormLayout>




             <%--   <br />
                <div>
                </div>
                <br />
                <div class="locationContainer">
                    <dx:ASPxLabel runat="server" Text="Location:"></dx:ASPxLabel>

                </div>
                <br />
                <div class="dateContainer">
                    <dx:ASPxLabel runat="server" Text="Date:"></dx:ASPxLabel>

                </div>
                <br />
                <div class="timeContainer">
                    <dx:ASPxLabel runat="server" Text="Time:"></dx:ASPxLabel>

                </div>
                <br />
                <div class="priceContainer">
                    <dx:ASPxLabel runat="server" Text="Price:"></dx:ASPxLabel>
                    
                </div>

                <br />
                <div class="availablePlacesContainer">
                    <dx:ASPxLabel runat="server" Text="Available places:"></dx:ASPxLabel>
                    
                </div>--%>

                <br />
                <div class="btnContainer">
                    <dx:ASPxButton runat="server" ID="btnSave" Text="Save" AutoPostBack="false" CssClass="btnSave" OnClick="btnSave_Click" viewsta>
                    </dx:ASPxButton>
                    <dx:ASPxButton runat="server" ID="btnCancel" Text="Cancel" AutoPostBack="false" CssClass="btnBookEvents" OnClick="btnCancel_Click">
                    </dx:ASPxButton>
                </div>
            </EditForm>
        </Templates>
    </dx:ASPxCardView>

    <dx:ASPxPopupControl runat="server" ID="newEventPopup"></dx:ASPxPopupControl>



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
                    <dx:ASPxLabel runat="server" ID="clientDate" Text='<%# GetDate((DateTime)Eval("Data")) %>'></dx:ASPxLabel>
                </div>
                <br />
                <div class="timeContainer">
                    <dx:ASPxLabel runat="server" Text="Time:"></dx:ASPxLabel>
                    <dx:ASPxLabel runat="server" ID="clientTime" Text='<%# GetTime((DateTime)Eval("Data")) %>'></dx:ASPxLabel>
                </div>
                <br />
                <div class="priceContainer">
                    <dx:ASPxLabel runat="server" Text="Price:"></dx:ASPxLabel>
                    <dx:ASPxLabel runat="server" ID="clientPrice" Text='<%# Eval("Price") %>' CssClass="price"></dx:ASPxLabel>
                </div>

                <br />
                <div class="availablePlacesContainer">
                    <dx:ASPxLabel runat="server" Text="Available places:"></dx:ASPxLabel>
                    <dx:ASPxLabel runat="server" ID="ClientAvailablePlaces" Text='<%# Eval("AvailablePlaces") %>' CssClass="availablePlaces"></dx:ASPxLabel>
                </div>

                <br />
                <div class="btnContainer">
                    <dx:ASPxButton runat="server" ID="btnBookEvents" Text="BOOK" AutoPostBack="false" CssClass="btnBookEvents" OnClick="btnBookEvents_Click">
                    </dx:ASPxButton>
                </div>
            </Card>
        </Templates>
        <SettingsPager Mode="ShowAllRecords" SettingsTableLayout-ColumnCount="3" />
    </dx:ASPxCardView>



    <ef:EntityDataSource runat="server" ID="dsEvents" ContextTypeName="EventBooking.CulturalHouseEntities" EntitySetName="Events" OnQueryCreated="dsEvents_QueryCreated" EnableUpdate="true" EnableInsert="true" EnableDelete="true"></ef:EntityDataSource>
    <ef:EntityDataSource runat="server" ID="dsLocations" ContextTypeName="EventBooking.CulturalHouseEntities" EntitySetName="Locations"></ef:EntityDataSource>
</asp:Content>
