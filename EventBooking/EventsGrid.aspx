<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventsGrid.aspx.cs" Inherits="EventBooking.EventsGrid" %>

<%@ Register Assembly="DevExpress.Web.v21.1, Version=21.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <dx:ASPxGridView ID="grid" ClientInstanceName="grid" runat="server" DataSourceID="dsEvents" KeyFieldName="EventId"  Width="100%" AutoGenerateColumns="false" OnCustomUnboundColumnData="grid_CustomUnboundColumnData">

        <Columns>
            <dx:GridViewDataColumn FieldName="EventId" Visible="false"></dx:GridViewDataColumn>
            <dx:GridViewDataTextColumn FieldName="Number" UnboundType="String">
                <Settings AllowAutoFilter="False"></Settings>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName ="Name"/>
            <dx:GridViewDataComboBoxColumn FieldName="LocationId" Caption="Location">
                <PropertiesComboBox DataSourceID="dsLocations" TextField="Name" ValueField="LocationId" ValueType="System.Int32"></PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataDateColumn FieldName="Data" Visible="false"/>
            <dx:GridViewDataDateColumn FieldName="Date" UnboundType="String" CellStyle-HorizontalAlign="Center" />
            <dx:GridViewDataTimeEditColumn FieldName="Time" UnboundType="String" />
            <dx:GridViewDataTextColumn FieldName ="Price" />
            <dx:GridViewDataCheckColumn FieldName ="Approved" />
            <dx:GridViewDataTextColumn FieldName="AvailablePlaces" />
        </Columns>

           <Toolbars>
            <dx:GridViewToolbar>
                
                <Items>
                    <dx:GridViewToolbarItem Command="New" />
                    <dx:GridViewToolbarItem Command="Edit" />
                    <dx:GridViewToolbarItem Command="Delete" />
                    <dx:GridViewToolbarItem Command="Refresh" BeginGroup="true"  />
                    <dx:GridViewToolbarItem Text="Export to" Image-IconID="actions_download_16x16office2013" BeginGroup="true" >
                        <Items>
                            <dx:GridViewToolbarItem Command="ExportToPdf" />
                            <dx:GridViewToolbarItem Command="ExportToDocx" />
                            <dx:GridViewToolbarItem Command="ExportToRtf" />
                            <dx:GridViewToolbarItem Command="ExportToCsv" />
                            <dx:GridViewToolbarItem Command="ExportToXls" Text="Export to XLS(DataAware)" />
                            <dx:GridViewToolbarItem Name="CustomExportToXLS" Text="Export to XLS(WYSIWYG)" Image-IconID="export_exporttoxls_16x16office2013" />
                            <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Export to XLSX(DataAware)" />
                            <dx:GridViewToolbarItem Name="CustomExportToXLSX" Text="Export to XLSX(WYSIWYG)" Image-IconID="export_exporttoxlsx_16x16office2013" />
                        </Items>
                    </dx:GridViewToolbarItem>
                    <dx:GridViewToolbarItem Alignment="Right">
                        <Template>
                            <dx:ASPxButtonEdit ID="tbToolbarSearch" runat="server" NullText="Search..." Height="100%">
                                <Buttons>
                                    <dx:SpinButtonExtended Image-IconID="find_find_16x16gray" />
                                </Buttons>
                            </dx:ASPxButtonEdit>
                        </Template>
                    </dx:GridViewToolbarItem>
                </Items>
            </dx:GridViewToolbar>
        </Toolbars>

        <Settings ShowFilterRow="true" ShowFilterRowMenu ="true" ShowGroupPanel="true" />
        <SettingsPager>
            <PageSizeItemSettings Visible="true" Items="10, 20, 50"></PageSizeItemSettings>
        </SettingsPager>
        <SettingsBehavior AllowFocusedRow="true" />
        <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />

    </dx:ASPxGridView>


   
<dx:EntityServerModeDataSource runat="server" ID="dsEvents" ContextTypeName="EventBooking.CulturalHouseEntities" TableName="Events" OnSelecting="dsEvents_Selecting" />
 <dx:EntityServerModeDataSource runat="server" ID="dsLocations" ContextTypeName="EventBooking.CulturalHouseEntities" TableName="Locations" OnSelecting="dsLocations_Selecting" />

</asp:Content>
