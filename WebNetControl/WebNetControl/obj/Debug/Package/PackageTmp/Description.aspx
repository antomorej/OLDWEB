<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Description.aspx.cs" Inherits="WebNetControl.Description" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            margin-left: 34px;
        }
    </style>
</head>
<body style="width: 600px; margin-left: 10px; height: 400px;">
    <form id="form1" runat="server" class="style1">
    <div style="position: relative; left: 20px">
    
        <asp:Button ID="btnBack" runat="server" Text=" &lt; " OnClick="btnBack_Click" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button ID="btnNext" runat="server" Text=" &gt; " OnClick="btnNext_Click" />	
    
        <br />
        <asp:MultiView ID="MultiView" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/Slide01.jpg" 
                    Height="360px" ImageAlign="Middle" CssClass="style1" />
            </asp:View>

            <asp:View ID="View2" runat="server">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/Slide02.jpg" 
                    Height="360px" ImageAlign="Middle"  CssClass="style1"/>
            </asp:View>

            <asp:View ID="View3" runat="server">
                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/Slide03.jpg" 
                    Height="360px"  ImageAlign="Middle"  CssClass="style1" />
            </asp:View>

            <asp:View ID="View4" runat="server">
                <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/Slide04.jpg" 
                    Height="360px" ImageAlign="Middle"  CssClass="style1" />
            </asp:View>

            <asp:View ID="View5" runat="server">
                <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/Slide05.jpg" 
                    Height="360px" />
            </asp:View>

            <asp:View ID="View6" runat="server">
                <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/Slide06.jpg" 
                    Height="360px" ImageAlign="Middle"  CssClass="style1" />
            </asp:View>

            <asp:View ID="View7" runat="server">
                <asp:Image ID="Image7" runat="server" ImageUrl="~/Images/Slide07.jpg" 
                    Height="360px" ImageAlign="Middle"  CssClass="style1"/>
            </asp:View>

            <asp:View ID="View8" runat="server">
                <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/Slide08.jpg" 
                    Height="360px" ImageAlign="Middle"  CssClass="style1"/>
            </asp:View>

            <asp:View ID="View9" runat="server">
                <asp:Image ID="Image9" runat="server" ImageUrl="~/Images/Slide09.jpg" 
                    Height="360px" ImageAlign="Middle"  CssClass="style1" />
            </asp:View>

              <asp:View ID="View10" runat="server">
                <asp:Image ID="Image10" runat="server" ImageUrl="~/Images/Slide10.jpg" 
                    Height="360px" ImageAlign="Middle"  CssClass="style1" />
            </asp:View>

            <asp:View ID="View11" runat="server">
                <asp:Image ID="Image11" runat="server" ImageUrl="~/Images/Slide11.jpg" 
                    Height="360px" ImageAlign="Middle"  CssClass="style1" />
            </asp:View>

        </asp:MultiView>

    </div>
    </form>
</body>
</html>
