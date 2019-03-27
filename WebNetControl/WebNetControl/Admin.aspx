<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="WebNetControl.admin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .style6
        {
            margin-left: 125px;
        }
        .style8
        {
            width: 100%;
            height: 159px;
        }
        .style7
        {
            width: 71px;
        }
        .style9
        {
            margin-left: 40px;
        }
        </style>
</head>
<body style="width: 750px">
    <form id="form1" runat="server">
    <div>
    
        Esta seccion es para dar mantenimiento a la Base de Datos.&nbsp; Solo para 
        administradores con clave de acceso !<br />
        <br />
        CLAVE DE ACCESO&nbsp;<asp:TextBox ID="ClaveTx" runat="server" TextMode="Password"></asp:TextBox>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="EntrarBtn" runat="server" CssClass="style6" 
            onclick="EntrarBtn_Click1" Text="Validar" Width="123px" />
        <br />
        <br />
        <table id="OperTable" class="style8" 
            style="padding: 10px; background-color: #C0C0C0;">
            <tr>
                <td class="style7">
                    &nbsp;</td>
                <td>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; 
                    OPERACIONES</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;</td>
                <td style="color: #FF0000">
        <asp:Button ID="ocultartrans" runat="server" 
            Text="Borrar transacciones completadas" Width="231px" Enabled="False" 
                        ForeColor="#CC3300" onclick="ocultartrans_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox 
                        ID="DateTB" runat="server" Width="184px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;</td>
                <td style="color: #FF0000">
        <asp:Button ID="borrartrans" runat="server" Text="Eliminar Transacciones Anteriores " 
                        Enabled="False" ForeColor="#CC3300" Width="229px" 
                        onclick="borrartrans_Click" />
                &nbsp;&nbsp; &nbsp;<asp:Button ID="EntrarBD" runat="server" 
                        Text="Administrar Base de Datos" Enabled="False" 
                        ForeColor="#CC3300" onclick="EntrarBD_Click" Width="182px" 
                        CssClass="style9" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style7">
                    &nbsp;</td>
                <td style="color: #FF0000">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
        <asp:SqlDataSource ID="SqlTrans" runat="server" 
            ConnectionString="<%$ ConnectionStrings:medlinknetConnectionString %>" 
            SelectCommand="SELECT * FROM [TRANSACTIONS] WHERE ([STATUSID] &lt;&gt; @STATUSID)" 
            
            UpdateCommand="UPDATE TRANSACTIONS SET ERASED = 1  WHERE (TRASTYPE = 1 AND STATUSID =3 ) OR (TRASTYPE = 2 AND STATUSID =2) AND  (TRANSACTIONS.DATETIME &lt; @fecha)" 
            
            
            
            
            DeleteCommand="DELETE FROM TRANSACTIONS  WHERE (TRANSACTIONS.DATETIME &lt; @fecha)">
            <DeleteParameters>
                <asp:ControlParameter ControlID="DateTB" DefaultValue="1/1/2000" Name="fecha" 
                    PropertyName="Text" />
            </DeleteParameters>
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="STATUSID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:ControlParameter ControlID="DateTB" Name="fecha" PropertyName="Text" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
