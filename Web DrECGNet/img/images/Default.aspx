<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 232px;
        }
        .style2
        {
            width: 564px;
        }
        .style3
        {
            width: 232px;
            height: 77px;
        }
        .style4
        {
            width: 564px;
            height: 77px;
        }
        .newStyle1
        {
            font-size: medium;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="position: absolute; right: 150px">
    <div>
    
    <asp:Panel ID="Panel1" runat="server" BackImageUrl="~/images/newBannerMcDPic1.jpg" 
        Height="194px" Width="797px">
    </asp:Panel>
    
    </div>
        <table style="width: 91%; height: 130px;">
            <tr>
                <td class="style3">
                    </td>
                <td valign="top" class="style4">
                    <asp:Panel ID="Panel3" runat="server" BackColor="#CCCCCC" BorderColor="#CCCCCC" 
                    Font-Names="Verdana" Font-Size="X-Small" Height="20px">
                        <br />
                        <br />
                        <br />
                        <span class="newStyle1">Welcome to Our Digital World !</span>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    <asp:Image ID="Image1" runat="server" Height="69px" 
                        ImageUrl="~/Images/mcA015O.gif" Width="142px" />
                    <asp:Image ID="Image2" runat="server" Height="64px" 
                        ImageUrl="~/Images/mcA003C.gif" Width="82px" />
                </td>
                <td style="font-family: Verdana; font-size: x-small; font-weight: normal; font-style: normal" 
                    class="style2">
                    <br />
                    MC Digital Solutions, Inc is a&nbsp; company located in Florida, USA. We 
                    specialize in the development of Digital Software, and top innovative solutions 
                    for the Medical field. 
                    <br />
                    <br />
                    Visit our Mediventa Web site to find out more about our 
                    Medical Equipment and accesories.<br />
                    <br />
                    We support the Dr. ECG Electrocardiography Intepretation network
                    <br />
                    <br />
                    We can support you with Web Hosting Plans, and any kind of specialized software 
                    solutions for your company.<br />
                    <br />
                    We invite you to visit our specializated Web Site according which your interest<br />
                    <br />
                    Please, select any of the link below..<br />
                    <br />
                    Thank you<br />
                </td>
            </tr>
        </table>
    <asp:Panel ID="Panel5" runat="server" 
        BackImageUrl="~/Images/newBannerMcBottomPic.jpg" Height="194px" 
        Width="794px">
    </asp:Panel>
    </form>
</body>
</html>
