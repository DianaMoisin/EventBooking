<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Event.aspx.cs" Inherits="EventBooking.Event" EnableViewState="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" href="./css/eventStyle.css">
    <script>
<%--        function FocusedCardChanged(s,e){
            var key = s.GetCardKey(s.GetFocusedCardIndex());
            console.log(key);
        }--%>

        function onDateValidation(s, e) {
            var eventDate = s.date;
            console.log("validareeeeee");

            if (eventDate == null || eventDate == false)
                return;
        }

    </script>
    <dx:ASPxCardView runat="server" ID="usersEventCardView" ClientInstanceName="usersEventCardView" KeyFieldName="EventId" Width="100%" DataSourceID="dsEvents"
        OnCustomUnboundColumnData="eventCardView_CustomUnboundColumnData" OnStartCardEditing="usersEventCardView_StartCardEditing" OnCardDeleting="usersEventCardView_CardDeleting">

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
                        <dx:LayoutItem ShowCaption="false" FieldName="Photo">
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
                                    <dx:ASPxTimeEdit runat="server" ID="eventTime" Value='<%# Eval("Data") %>' DisplayFormatString="HH:mm" EditFormatString="HH:mm" AllowMouseWheel="false" Width="100%"></dx:ASPxTimeEdit>
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

                <br />
                <div class="btnContainer">
                    <dx:ASPxButton runat="server" ID="btnSave" Text="Save" AutoPostBack="false" CssClass="btnSave" OnClick="btnSave_Click">
                    </dx:ASPxButton>
                    <dx:ASPxButton runat="server" ID="btnCancel" Text="Cancel" AutoPostBack="false" CssClass="btnBookEvents" OnClick="btnCancel_Click">
                    </dx:ASPxButton>
                </div>
            </EditForm>
        </Templates>
    </dx:ASPxCardView>

    <dx:ASPxPopupControl runat="server"
        ID="newEventPopup"
        PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter"
        Width="600px"
        HeaderText="New event"
        ContentStyle-Paddings-Padding="30px">
        <ContentCollection>
            <dx:PopupControlContentControl>
                <dx:ASPxFormLayout runat="server" ID="newEventForm" Width="100%">
                    <Items>
                        <dx:LayoutItem ShowCaption="false">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxBinaryImage runat="server" ID="newEventPhoto" Width="100%">
                                        <EditingSettings Enabled="true"></EditingSettings>
                                    </dx:ASPxBinaryImage>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem ShowCaption="False" FieldName="Name" RequiredMarkDisplayMode="Hidden">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxTextBox runat="server" ID="newEventName" CssClass="name" Width="100%" NullText="Add the event name">
                                        <ValidationSettings
                                            ValidationGroup="newForm"
                                            ErrorDisplayMode="ImageWithText"
                                            ErrorTextPosition="Bottom">
                                            <RequiredField ErrorText="Event name required"
                                                IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Location" FieldName="Location">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxComboBox runat="server"
                                        ID="newEventLocation"
                                        DataSourceID="dsLocations"
                                        TextField="Name"
                                        ValueField="LocationId"
                                        ValueType="System.Int32"
                                        Width="100%">
                                        <ValidationSettings
                                            ValidationGroup="newForm"
                                            ErrorDisplayMode="ImageWithText"
                                            ErrorTextPosition="Bottom">
                                            <RequiredField ErrorText="Event location required"
                                                IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Date" FieldName="Date">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxDateEdit runat="server"
                                        ID="newEventDate"
                                        EditFormatString="dd.MM.yyyy"
                                        DisplayFormatString="dd.MM.yyyy"
                                        Width="100%">
                                        <ValidationSettings
                                            ValidationGroup="newForm"
                                            ErrorDisplayMode="ImageWithText"
                                            ErrorTextPosition="Bottom">
                                            <RequiredField ErrorText="Event date required"
                                                IsRequired="True" />
                                        </ValidationSettings>
                                        <%--            <ClientSideEvents Validation="onDateValidation" />--%>
                                    </dx:ASPxDateEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Time" FieldName="Time">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxTimeEdit runat="server"
                                        ID="newEventTime"
                                        DisplayFormatString="HH:mm"
                                        EditFormatString="HH:mm"
                                        AllowMouseWheel="false"
                                        Width="100%">
                                        <ValidationSettings
                                            ValidationGroup="newForm"
                                            ErrorDisplayMode="ImageWithText"
                                            ErrorTextPosition="Bottom">
                                            <RequiredField ErrorText="Event time required"
                                                IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTimeEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Price" FieldName="Price">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxSpinEdit runat="server" ID="newEventPrice" NumberType="Float" AllowMouseWheel="false" MinValue="0" MaxValue="9999999" DecimalPlaces="2" Width="100%"></dx:ASPxSpinEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Available prices" FieldName="AvailablePlaces">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer>
                                    <dx:ASPxSpinEdit runat="server" ID="newEventAvailablePlaces" NumberType="Integer" AllowMouseWheel="false" MinValue="0" MaxValue="9999999" Width="100%"></dx:ASPxSpinEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:ASPxFormLayout>
                <br />
                <div class="btnContainer">
                    <dx:ASPxButton runat="server" ID="btnSaveNew" Text="Save" AutoPostBack="false" CssClass="btnSave" OnClick="btnSaveNew_Click">
                        <ClientSideEvents Click="function(s, e) { if(!ASPxClientEdit.ValidateGroup('newForm')) { console.log('validareee'); return; } }" />
                    </dx:ASPxButton>
                    <dx:ASPxButton runat="server" ID="btnCancelNew" Text="Cancel" AutoPostBack="false" CssClass="btnBookEvents" OnClick="btnCancelNew_Click">
                    </dx:ASPxButton>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>



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


    <dx:ASPxPopupControl runat="server"
        ID="popupMessage"
        PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter"
        Width="600px"
        HeaderText="Warning"
        ContentStyle-Paddings-Padding="30px">
        <ContentCollection>
            <dx:PopupControlContentControl>
                <dx:ASPxLabel runat="server" ID="lblMessage"></dx:ASPxLabel>
                <br />
                <dx:ASPxButton runat="server" ID="btnOK" Text="OK" AutoPostBack="false" CssClass="btnBookEvents" OnClick="btnOK_Click">
                </dx:ASPxButton>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>


    <ef:EntityDataSource runat="server" ID="dsEvents" ContextTypeName="EventBooking.CulturalHouseEntities" EntitySetName="Events" OnQueryCreated="dsEvents_QueryCreated" EnableUpdate="true" EnableInsert="true" EnableDelete="true"></ef:EntityDataSource>
    <ef:EntityDataSource runat="server" ID="dsLocations" ContextTypeName="EventBooking.CulturalHouseEntities" EntitySetName="Locations"></ef:EntityDataSource>
</asp:Content>
