<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="EventBooking.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link rel="stylesheet" href="./css/registerStyle.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxFormLayout runat="server" ID="formLayoutUtilizatori" ClientInstanceName="formLayoutUtilizatori" CssClass="register" >
                <Items>
                    <dx:LayoutGroup Caption="Add new user">
                        <Items>
                            <dx:LayoutItem Caption="First Name" HelpText="Please, enter your first name">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxTextBox runat="server" ID="textBoxFirstNameU" Width="100%">
                                            <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic" ErrorDisplayMode="Text" />
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Last Name" HelpText="Please, enter your last name">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxTextBox runat="server" ID="textBoxLastNameU" Width="100%">
                                            <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic" ErrorDisplayMode="Text" />
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Email" HelpText="Please, enter your e-mail">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxTextBox runat="server" ID="textBoxEmailU" Width="100%">
                                            <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic" ErrorDisplayMode="Text" />
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Password" HelpText="Please, enter your password">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                       <dx:ASPxTextBox runat="server" ID="textBoxPassU" Width="100%">
                                            <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic" ErrorDisplayMode="Text" />
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                             <dx:LayoutItem  ShowCaption="False" HorizontalAlign="Right">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                       <dx:ASPxButton runat="server" Text="Save" OnClick="buttonSaveU_Click" ID="buttonSaveU"></dx:ASPxButton>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                </Items>
            </dx:ASPxFormLayout>
            <dx:ASPxFormLayout runat="server" ID="formLayoutClienti" ClientInstanceName="formLayoutClienti">
                <Items>
                    <dx:LayoutGroup Caption="Add new client">
                        <Items>
                            <dx:LayoutItem Caption="First Name" HelpText="Please, enter your first name">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxTextBox runat="server" ID="textBoxFirstNameC" Width="100%">
                                            <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic" ErrorDisplayMode="Text" />
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Last Name" HelpText="Please, enter your last name">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxTextBox runat="server" ID="textBoxLastNameC" Width="100%">
                                            <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic" ErrorDisplayMode="Text" />
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Username" HelpText="Please, enter your username">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                        <dx:ASPxTextBox runat="server" ID="textBoxUsernameC" Width="100%">
                                            <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic" ErrorDisplayMode="Text" />
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Password" HelpText="Please, enter your password">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                       <dx:ASPxTextBox runat="server" ID="textBoxPassC" Width="100%">
                                            <ValidationSettings RequiredField-IsRequired="true" Display="Dynamic" ErrorDisplayMode="Text" />
                                        </dx:ASPxTextBox>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                             <dx:LayoutItem  ShowCaption="False" HorizontalAlign="Right">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer>
                                       <dx:ASPxButton runat="server" Text="Save" OnClick="buttonSaveC_Click" ID="buttonSaveC"></dx:ASPxButton>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:LayoutGroup>
                </Items>
            </dx:ASPxFormLayout>
        </div>
    </form>
</body>
</html>
