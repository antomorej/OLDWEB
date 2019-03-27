<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TRACE.ASPX.vb" Inherits="Default2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        #Select1
        {
            width: 137px;
        }
        </style>
</head>
<body>
    <form id="FORMENVIOS" runat="server" style="font-size: small" 
    submitdisabledcontrols="False" 
    title="Dr. ECG NetControl Panel - Control de Envios" visible="True">
    <asp:SqlDataSource ID="DSTRACE" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NETCONTROLConnectionString %>" 
        
        
        
        
        
        
        SelectCommand="SELECT * FROM [TRACE] ORDER BY [ID] DESC" 
        DeleteCommand="DELETE FROM TRACE WHERE ID=@PID">
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridView1" Name="PID" 
                PropertyName="SelectedValue" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataSourceID="DSTRACE" 
        Width="605px" DataKeyNames="ID" 
        DataMember="DefaultView" CellPadding="4" ForeColor="#333333" 
        GridLines="None" style="text-align: center; margin-right: 0px;" 
        PageSize="25">
        <Columns>
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                ShowSelectButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                ReadOnly="True" SortExpression="ID" />
            <asp:BoundField DataField="FECHA" HeaderText="FECHA" SortExpression="FECHA" />
            <asp:BoundField DataField="DOMINIO" HeaderText="DOMINIO" 
                SortExpression="DOMINIO" />
            <asp:BoundField DataField="USUARIO" HeaderText="USUARIO" 
                SortExpression="USUARIO" />
            <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
            <asp:BoundField DataField="CEQUIPO" HeaderText="EQUIPO" 
                SortExpression="CEQUIPO" />
            <asp:BoundField DataField="FECHINI" HeaderText="FECHINI" 
                SortExpression="FECHINI" />
            <asp:BoundField DataField="FECHANT" HeaderText="FECHANT" 
                SortExpression="FECHANT" />
            <asp:BoundField DataField="NECG" HeaderText="NECG" SortExpression="NECG" />
            <asp:BoundField DataField="NANT" HeaderText="NANT" 
                SortExpression="NANT" />
            <asp:BoundField DataField="NTOTAL" HeaderText="NTOTAL" 
                SortExpression="NTOTAL" />
            <asp:BoundField DataField="UNIDAD" HeaderText="UNIDAD" 
                SortExpression="UNIDAD" />
            <asp:BoundField DataField="USERMAIL" HeaderText="USERMAIL" 
                SortExpression="USERMAIL" />
            <asp:BoundField DataField="PASSW" HeaderText="PASSW" SortExpression="PASSW" />
            <asp:BoundField DataField="SERVERPOP3" HeaderText="SERVERPOP3" 
                SortExpression="SERVERPOP3" />
            <asp:BoundField DataField="SERVERSMTP" HeaderText="SERVERSMTP" 
                SortExpression="SERVERSMTP" />
            <asp:BoundField DataField="PPOP3" HeaderText="PPOP3" SortExpression="PPOP3" />
            <asp:BoundField DataField="PSMTP" HeaderText="PSMTP" SortExpression="PSMTP" />
            <asp:BoundField DataField="COPIASA" HeaderText="COPIASA" 
                SortExpression="COPIASA" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    </form>
</body>
</html>
