<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainPanel.aspx.cs" Inherits="WebNetControl.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    
        .style7
        {
            width: 928px;
            height: 240px;
        }
        .style8
        {
            width: 339px;
            height: 257px;
        }
      
        .style11
        {
            width: 203px;
        }
        .style12
        {
            width: 28px;
        }
    .style13
    {
        width: 298px;
        height: 25px;
    }
    .style14
    {
        height: 25px;
    }
    .style15
    {
        width: 28px;
        height: 25px;
    }
    .style16
    {
        width: 202px;
        height: 25px;
    }
    .style17
    {
        width: 202px;
    }
    .style18
    {
        width: 298px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class>
        <table class="style7">
            <tr>
                <td style="font-size: x-large" class="style13">
                    &nbsp;&nbsp;Red MedLinkNet&nbsp;</td>
                <td style="font-size: x-large" class="style16">
                    </td>
                <td style="color: #FF0000; font-family: 'Times New Roman', Times, serif; font-size: medium;" 
                    class="style14">
                    </td>
                <td style="color: #FF0000; font-family: 'Times New Roman', Times, serif; font-size: medium;" 
                    class="style15">
                    </td>
            </tr>
            <tr>
                <td class="style18">
                    &nbsp;</td>
                <td style="color: #0000FF" class="style17">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; USUARIOS EN LINEA</td>
                <td class="style12">
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="color: #FF0000; font-family: 'Times New Roman', Times, serif; font-size: medium;" 
                    class="style18">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ACTIVA</td>
                <td rowspan="3" class="style17">
                    <asp:ListView ID="ListView1" runat="server" DataSourceID="Doctores" 
                        EnableModelValidation="True">
                        <AlternatingItemTemplate>
                            <span style="">NOMBRE:
                            <asp:Label ID="NOMBRELabel" runat="server" Text='<%# Eval("NOMBRE") %>' />
                            <br />
                            <asp:CheckBox ID="ONLINECheckBox" runat="server" 
                                Checked='<%# Eval("ONLINE") %>' Enabled="false" Text="ONLINE" />
                            <br />
                            <br />
                            </span>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <span style="">NOMBRE:
                            <asp:TextBox ID="NOMBRETextBox" runat="server" Text='<%# Bind("NOMBRE") %>' />
                            <br />
                            <asp:CheckBox ID="ONLINECheckBox" runat="server" 
                                Checked='<%# Bind("ONLINE") %>' Text="ONLINE" />
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                Text="Update" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Cancel" />
                            <br />
                            <br />
                            </span>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <span>No data was returned.</span>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <span style="">NOMBRE:
                            <asp:TextBox ID="NOMBRETextBox" runat="server" Text='<%# Bind("NOMBRE") %>' />
                            <br />
                            <asp:CheckBox ID="ONLINECheckBox" runat="server" 
                                Checked='<%# Bind("ONLINE") %>' Text="ONLINE" />
                            <br />
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                                Text="Insert" />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Clear" />
                            <br />
                            <br />
                            </span>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <span style="">NOMBRE:
                            <asp:Label ID="NOMBRELabel" runat="server" Text='<%# Eval("NOMBRE") %>' />
                            <br />
                            <asp:CheckBox ID="ONLINECheckBox" runat="server" 
                                Checked='<%# Eval("ONLINE") %>' Enabled="false" Text="ONLINE" />
                            <br />
                            <br />
                            </span>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div ID="itemPlaceholderContainer" runat="server" style="">
                                <span runat="server" id="itemPlaceholder" />
                            </div>
                            <div style="">
                                <asp:DataPager ID="DataPager1" runat="server">
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                            </div>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <span style="">NOMBRE:
                            <asp:Label ID="NOMBRELabel" runat="server" Text='<%# Eval("NOMBRE") %>' />
                            <br />
                            <asp:CheckBox ID="ONLINECheckBox" runat="server" 
                                Checked='<%# Eval("ONLINE") %>' Enabled="false" Text="ONLINE" />
                            <br />
                            <br />
                            </span>
                        </SelectedItemTemplate>
                    </asp:ListView>
                </td>
                <td class="style12">
                    &nbsp;</td>
            </tr>
            <tr>
                <td rowspan="2" class="style18">
                    <img alt="" class="style8" src="Images/images%20(2).jpeg" /></td>
                <td class="style11">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style11">
                    &nbsp;</td>
                <td class="style12">
                    &nbsp;</td>
            </tr>
        </table>
</p>
    <asp:SqlDataSource ID="Doctores" runat="server" 
        ConnectionString="<%$ ConnectionStrings:medlinknetConnectionString %>" 
        
    SelectCommand="SELECT [NOMBRE], [ONLINE] FROM [USERS] WHERE ([ONLINE] = @ONLINE)">
        <SelectParameters>
            <asp:Parameter DefaultValue="true" Name="ONLINE" Type="Boolean" />
        </SelectParameters>
</asp:SqlDataSource>
    <br />
    </asp:Content>
