<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserAccount.aspx.cs" Inherits="WebNetControl.WebForm5" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

    .style47
    {
        width: 99%;
    }
    .style39
    {
        width: 464px;
    }
        .style37
    {
        width: 735px;
    }
    .style41
    {
        width: 230px;
    }
    .style46
    {
        width: 167px;
    }
    
a:link, a:visited
{
    color: #034af3;
}

    </style>
</head>
<body style="width: 750px; height: 206px;">
    <form id="form1" runat="server">
    <div>
    
    <asp:Panel ID="Panel1" runat="server" BackColor="#999999" ForeColor="White" 
            Width="746px">
        <table style="margin: 5px; " class="style47">
            <tr>
                <td class="style39">
                    &nbsp;&nbsp;Usuario
                    <asp:TextBox ID="UserBx" runat="server" Width="107px"></asp:TextBox>
                    &nbsp; &nbsp; Passw&nbsp;<asp:TextBox ID="PasswBx" runat="server" Width="106px" 
                        TextMode="Password"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button 
                        ID="OkBtn1" runat="server" Height="22px" 
                        onclick="OkBtn_Click" Text="Entrar" Width="62px" />
                </td>
                <td>
                    &nbsp;&nbsp;&nbsp;Admin&nbsp; &nbsp;<asp:TextBox ID="SuperID" runat="server" Width="72px" 
                        TextMode="Password"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</td>
            </tr>
        </table>
        <table style="margin: 5px; background-color: #336699;" class="style37" >
            <tr>
                <td class="style41">
                    &nbsp;<asp:DropDownList ID="DomainList" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDominio" DataTextField="DESCRIPTION" 
                        DataValueField="IDDOMINIO" Height="25px" Width="292px">
                    </asp:DropDownList>
                    <br />
                    <br />
                    &nbsp;</td>
                <td class="style46">
                    <asp:ListBox ID="GroupList" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlGroup" DataTextField="DESCRIPTION" 
                        DataValueField="IDWORKGROUP" Font-Size="Small" Height="56px" 
                        onselectedindexchanged="GroupList_SelectedIndexChanged" Width="319px">
                    </asp:ListBox>
                    <br />
                    </td>
            </tr>
        </table>
    </asp:Panel>
    
    </div>
    <asp:SqlDataSource ID="SqlUser" runat="server" 
        ConnectionString="<%$ ConnectionStrings:medlinknetConnectionString %>" 
        
        
        
        SelectCommand="SELECT USERID, NOMBRE, ONLINE, EQUIPO, NSERIE, LICENCIA, ENABLED, FECHAPOLIZA, LASTTIME FROM USERS WHERE (IDWORKGROUP = @IDWORKGROUP)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GroupList" Name="IDWORKGROUP" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlGroup" runat="server" 
        ConnectionString="<%$ ConnectionStrings:medlinknetConnectionString %>" 
        
        
        SelectCommand="SELECT [IDWORKGROUP], [DESCRIPTION] FROM [WORKGROUP] WHERE ([IDDOMINIO] = @IDDOMINIO)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DomainList" Name="IDDOMINIO" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDominio" runat="server" 
        ConnectionString="<%$ ConnectionStrings:medlinknetConnectionString %>" 
        SelectCommand="SELECT ADMIN.IDADMIN, ADMIN.USERNAME, ADMIN.PASSW, ADMIN.NOMBRE, ADMIN.IDDOMINIO, DOMINIOS.DESCRIPTION, ADMIN.ENABLED FROM ADMIN INNER JOIN DOMINIOS ON ADMIN.IDDOMINIO = DOMINIOS.IDDOMINIO WHERE (ADMIN.USERNAME = @N ) AND (ADMIN.PASSW = @P) AND (ADMIN.ENABLED = 1)" 
        EnableCaching="True" EnableViewState="False">
        <SelectParameters>
            <asp:ControlParameter ControlID="UserBx" Name="N" PropertyName="Text" />
            <asp:ControlParameter ControlID="PasswBx" Name="P" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDetailView" runat="server" 
        ConnectionString="<%$ ConnectionStrings:medlinknetConnectionString %>" 
        SelectCommand="SELECT * FROM [USERS] WHERE ([USERID] = @USERID)" 
        DeleteCommand="DELETE FROM [USERS] WHERE ([USERID] = @USERID)" 
        InsertCommand="INSERT INTO USERS(USERNAME, PASSWORD, NOMBRE, IDUSERTYPE, IDWORKGROUP, ENVIAA, EQUIPO, NSERIE, LICENCIA, ENABLED) VALUES (@USERNAME, @PASSWORD, @NOMBRE, @IDUSERTYPE, @IDWORKGROUP, @ENVIAA, @EQUIPO, @NSERIE, @LICENCIA, @ENABLED)" 
        
        UpdateCommand="UPDATE USERS SET USERNAME = @USERNAME, PASSWORD = @PASSWORD, NOMBRE = @NOMBRE, ENVIAA = @ENVIAA, EQUIPO = @EQUIPO, NSERIE = @NSERIE, LICENCIA = @LICENCIA, ENABLED = @ENABLED, FECHAPOLIZA = @FECHAPOLIZA, FECHAINSTALL = @FECHAINSTALL, CONTACTO =@CONTACTO, NOTAS =@NOTAS, MAIL =@MAIL, TELEFONO =@TELEFONO, DIRECCION =@DIRECCION WHERE (USERID = @IDUSER)">
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridViewUsers" Name="USERID" 
                PropertyName="SelectedValue" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter DefaultValue="USER" Name="USERNAME" />
            <asp:Parameter DefaultValue="PASSW" Name="PASSWORD" />
            <asp:Parameter DefaultValue="NOMBRE" Name="NOMBRE" />
            <asp:Parameter DefaultValue="3" Name="IDUSERTYPE" />
            <asp:ControlParameter ControlID="GroupList" DefaultValue="1" Name="IDWORKGROUP" 
                PropertyName="SelectedValue" />
            <asp:Parameter DefaultValue="" Name="ENVIAA" />
            <asp:Parameter Name="EQUIPO" />
            <asp:Parameter Name="NSERIE" />
            <asp:Parameter Name="LICENCIA" />
            <asp:Parameter DefaultValue="1" Name="ENABLED" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewUsers" Name="USERID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="USERNAME" />
            <asp:Parameter Name="PASSWORD" />
            <asp:Parameter Name="NOMBRE" />
            <asp:Parameter Name="ENVIAA" />
            <asp:Parameter Name="EQUIPO" />
            <asp:Parameter Name="NSERIE" />
            <asp:Parameter Name="LICENCIA" />
            <asp:Parameter Name="ENABLED" />
            <asp:Parameter Name="FECHAPOLIZA" />
            <asp:Parameter Name="FECHAINSTALL" />
            <asp:ControlParameter ControlID="GridViewUsers" Name="IDUSER" 
                PropertyName="SelectedValue" />
            <asp:Parameter Name="CONTACTO" />
            <asp:Parameter Name="TELEFONO" />
            <asp:Parameter Name="MAIL" />
            <asp:Parameter Name="DIRECCION" />
            <asp:Parameter Name="NOTAS" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlServicios" runat="server" 
        ConnectionString="<%$ ConnectionStrings:medlinknetConnectionString %>" 
        
        
        SelectCommand="SELECT IDSERVCIO, IDUSER, FECHASERVICIO, DESCRIPCION FROM SERVICIOS WHERE (IDUSER = @IDUSER)" 
        DeleteCommand="DELETE FROM [SERVICIOS] WHERE ([IDSERVCIO] = @IDSERVICIO)" 
        InsertCommand="INSERT INTO SERVICIOS (IDUSER,DESCRIPCION) VALUES (@IDUSER,@DESCRIPCION)" 
        UpdateCommand="UPDATE SERVICIOS SET FECHASERVICIO=@FECHASERVICIO, DESCRIPCION=@DESCRIPCION WHERE IDSERVCIO=@IDSERVICIO">
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridServicios" Name="IDSERVICIO" 
                PropertyName="SelectedValue" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="GridViewUsers" DefaultValue="" Name="IDUSER" 
                PropertyName="SelectedValue" />
            <asp:Parameter DefaultValue="&quot;DESCRIBIR SERVICIO&quot;" 
                Name="DESCRIPCION" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewUsers" Name="IDUSER" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="FECHASERVICIO" />
            <asp:Parameter Name="DESCRIPCION" />
            <asp:ControlParameter ControlID="GridServicios" Name="IDSERVICIO" 
                PropertyName="SelectedValue" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlCountServicios" runat="server" 
        ConnectionString="<%$ ConnectionStrings:medlinknetConnectionString %>" 
        
        
        SelectCommand="SELECT COUNT(1) AS N FROM SERVICIOS WHERE (IDUSER = @IDUSER)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridViewUsers" Name="IDUSER" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridViewUsers" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="USERID" DataSourceID="SqlUser" Width="729px" 
        AllowPaging="True" AllowSorting="True" CellPadding="3" ForeColor="Black" GridLines="Vertical" 
        HorizontalAlign="Center" 
        onselectedindexchanged="GridViewUsers_SelectedIndexChanged" 
        EnableModelValidation="True" BackColor="White" BorderColor="#999999" 
        BorderStyle="Solid" BorderWidth="1px" Font-Size="9pt" 
        AutoGenerateSelectButton="True">
        <AlternatingRowStyle BackColor="#CCCCCC" />
        <Columns>
            <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" 
                SortExpression="NOMBRE" />
            <asp:BoundField DataField="USERID" HeaderText="USERID" InsertVisible="False" 
                ReadOnly="True" SortExpression="USERID" />
            <asp:BoundField DataField="FECHAPOLIZA" HeaderText="FECHAPOLIZA" 
                SortExpression="FECHAPOLIZA" />
            <asp:BoundField DataField="EQUIPO" HeaderText="EQUIPO" 
                SortExpression="EQUIPO" />
            <asp:BoundField DataField="NSERIE" HeaderText="NSERIE" 
                SortExpression="NSERIE" />
            <asp:BoundField DataField="LICENCIA" HeaderText="LICENCIA" 
                SortExpression="LICENCIA" />
            <asp:CheckBoxField DataField="ENABLED" HeaderText="ENABLED" 
                SortExpression="ENABLED" />
            <asp:BoundField DataField="LASTTIME" HeaderText="LASTTIME" 
                SortExpression="LASTTIME" />
        </Columns>
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        
    </asp:GridView>
    <br />
    <asp:DetailsView ID="UserDetailsView" runat="server" AllowPaging="True" 
        AutoGenerateRows="False" CellPadding="4" 
        DataKeyNames="USERID" DataSourceID="SqlDetailView" ForeColor="#333333" 
        GridLines="None" Height="16px" HorizontalAlign="Center" Width="388px" 
        AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" 
        AutoGenerateInsertButton="True" EnableModelValidation="True" 
        onitemdeleted="UserDetailsView_ItemDeleted" 
        oniteminserted="UserDetailsView_ItemInserted" 
        onitemupdated="UserDetailsView_ItemUpdated" Font-Size="9pt">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
        <EditRowStyle BackColor="#999999" />
        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" 
                SortExpression="USERNAME" />
            <asp:BoundField DataField="USERID" HeaderText="USERID" InsertVisible="False" 
                ReadOnly="True" SortExpression="USERID" />
            <asp:BoundField DataField="PASSWORD" HeaderText="PASSWORD" 
                SortExpression="PASSWORD" />
            <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" 
                SortExpression="NOMBRE" />
            <asp:CheckBoxField DataField="ENABLED" HeaderText="ENABLED" 
                SortExpression="ENABLED" />
            <asp:BoundField DataField="ENVIAA" HeaderText="ENVIAA" 
                SortExpression="ENVIAA" />
            <asp:BoundField DataField="EQUIPO" HeaderText="EQUIPO" 
                SortExpression="EQUIPO" />
            <asp:BoundField DataField="NSERIE" HeaderText="NSERIE" 
                SortExpression="NSERIE" />
            <asp:BoundField DataField="LICENCIA" HeaderText="LICENCIA" 
                SortExpression="LICENCIA" />
            <asp:BoundField DataField="FECHAPOLIZA" HeaderText="FECHAPOLIZA" 
                SortExpression="FECHAPOLIZA" />
            <asp:BoundField DataField="FECHAINSTALL" HeaderText="FECHAINSTALL" 
                SortExpression="FECHAINSTALL" />
            <asp:BoundField DataField="CONTACTO" HeaderText="CONTACTO" 
                SortExpression="CONTACTO" />
            <asp:BoundField DataField="TELEFONO" HeaderText="TELEFONO" 
                SortExpression="TELEFONO" />
            <asp:BoundField DataField="MAIL" HeaderText="MAIL" SortExpression="MAIL" />
            <asp:BoundField DataField="DIRECCION" HeaderText="DIRECCION" 
                SortExpression="DIRECCION" />
            <asp:BoundField DataField="NOTAS" HeaderText="NOTAS" SortExpression="NOTAS" />
        </Fields>
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
    </asp:DetailsView>
    <br />
    <asp:GridView ID="GridServicios" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlServicios" Width="729px" 
        AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" 
        HorizontalAlign="Center" 
        EnableModelValidation="True" Font-Size="9pt" Visible="False" 
        DataKeyNames="IDSERVCIO">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="FECHASERVICIO" HeaderText="FECHASERVICIO" 
                SortExpression="FECHASERVICIO">
            <ItemStyle Width="25px" />
            </asp:BoundField>
            <asp:BoundField DataField="DESCRIPCION" HeaderText="DESCRIPCION" 
                SortExpression="DESCRIPCION">
            <ControlStyle Width="500px" />
            <ItemStyle Width="500px" />
            </asp:BoundField>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                ShowSelectButton="True" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        
    </asp:GridView>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button 
        ID="Servicios" runat="server" onclick="Servicios_Click" Text="Ver / Agregar Servicios" 
            Width="164px" Height="25px" Visible="False" />
    &nbsp;&nbsp;&nbsp; &nbsp;
        <asp:Button ID="Cerrar" runat="server" onclick="Cerrar_Click" Text="Cerrar " 
            Width="136px" Height="25px" Visible="False" />
    </form>
</body>
</html>
