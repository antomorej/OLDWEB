<%@ Page Language="VB" AutoEventWireup="false" CodeFile="USUARIOS.ASPX.vb" Inherits="Default2" %>

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
    <asp:SqlDataSource ID="DSDominios" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NETCONTROLConnectionString %>" 
        SelectCommand="SELECT * FROM [DOMINIOS] WHERE ([DOMINIO] = @DOMINIO)">
        <SelectParameters>
            <asp:QueryStringParameter Name="DOMINIO" QueryStringField="FDOMINIO" 
                Type="String" DefaultValue="SSDRSIMI" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DSDETAIL" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NETCONTROLConnectionString %>" 
        InsertCommand="INSERT INTO USERS (USERNAME,UNIDAD,UBICACION,ENVIAA,NIVEL,LOG,DOMINIO,EQUIPO,CODACT) VALUES (@USERNAME,@UNIDAD,@UBICACION,@ENVIAA,2,'S',@VDOMINIO,@EQUIPO,@CODACT)" 
        ProviderName="<%$ ConnectionStrings:NETCONTROLConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM USERS where cuser=@vuser" 
        
        UpdateCommand="UPDATE USERS SET USERNAME = @username, UNIDAD = @unidad, UBICACION = @ubicacion, ENVIAA = @enviaa, [LOG] = @log , NIVEL = 2, DOMINIO = @vdominio, DOCTOR=@doctor, EQUIPO=@equipo, CODACT=@codact WHERE (CUSER = @vuser)" 
        DeleteCommand="delete from users where cuser=@cuser">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="VUSER" 
                PropertyName="SelectedValue" />
        </SelectParameters>
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridView1" Name="cuser" 
                PropertyName="SelectedValue" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="username" />
            <asp:Parameter Name="unidad" />
            <asp:Parameter Name="ubicacion" />
            <asp:Parameter Name="enviaa" />
            <asp:Parameter Name="log" />
            <asp:ControlParameter ControlID="DVDOMINIO" Name="VDOMINIO" 
                PropertyName="SelectedValue" />
            <asp:Parameter Name="doctor" />
            <asp:Parameter Name="equipo" />
            <asp:Parameter Name="codact" />
            <asp:ControlParameter ControlID="GridView1" Name="vuser" 
                PropertyName="SelectedValue" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter DefaultValue="USUARIO" Name="USERNAME" />
            <asp:Parameter DefaultValue="UNIDAD" Name="UNIDAD" />
            <asp:Parameter DefaultValue="D.F" Name="UBICACION" />
            <asp:Parameter DefaultValue="TODOS" Name="ENVIAA" />
            <asp:ControlParameter ControlID="DVDOMINIO" Name="VDOMINIO" 
                PropertyName="SelectedValue" />
            <asp:Parameter Name="EQUIPO" />
            <asp:Parameter Name="CODACT" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DSUSERS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NETCONTROLConnectionString %>" 
        
        
        
        
        
        
        
        SelectCommand="SELECT *  FROM [USERS] where dominio=@dominio and nivel&gt;1">
        <SelectParameters>
            <asp:ControlParameter ControlID="DVDOMINIO" Name="DOMINIO" PropertyName="SelectedValue" 
                Type="String" DefaultValue="SSDRSIMI" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div style="font-size: medium; width: 427px;">
        <hr />
        <br />
        <asp:DetailsView ID="DVDOMINIO" runat="server" AutoGenerateRows="False" 
            CellPadding="4" DataSourceID="DSDominios" ForeColor="#333333" GridLines="None" 
            Height="50px" Width="417px" DataKeyNames="DOMINIO">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <Fields>
                <asp:BoundField DataField="DOMINIO" HeaderText="DOMINIO" ReadOnly="True" 
                    SortExpression="DOMINIO" />
                <asp:BoundField ApplyFormatInEditMode="True" DataField="INSTITUCION" 
                    DataFormatString="{0:4}" HeaderText="INSTITUCION" ReadOnly="True" 
                    SortExpression="INSTITUCION" />
            </Fields>
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:DetailsView>
        <br />
    </div>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" 
        AutoGenerateRows="False" CellPadding="4" DataSourceID="DSDETAIL" 
        ForeColor="#333333" GridLines="None" Height="50px" style="text-align: center" 
        Width="458px" DataKeyNames="CUSER" DataMember="DefaultView">
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
        <RowStyle BackColor="#E3EAEB" />
        <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <Fields>
            <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" 
                SortExpression="USERNAME" />
            <asp:BoundField DataField="DOCTOR" HeaderText="DOCTOR" 
                SortExpression="DOCTOR" />
            <asp:BoundField DataField="ENVIAA" HeaderText="ENVIAA" 
                SortExpression="ENVIAA" />
            <asp:BoundField DataField="UNIDAD" HeaderText="UNIDAD" 
                SortExpression="UNIDAD" />
            <asp:BoundField DataField="UBICACION" HeaderText="UBICACION" 
                SortExpression="UBICACION" />
            <asp:BoundField DataField="LOG" HeaderText="NETCONTROL" 
                SortExpression="LOG" />
            <asp:BoundField DataField="EQUIPO" HeaderText="EQUIPO" 
                SortExpression="EQUIPO" />
            <asp:BoundField DataField="CODACT" HeaderText="ACTIVATION CODE" 
                SortExpression="CODACT" />
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#7C6F57" />
        <AlternatingRowStyle BackColor="White" />
    </asp:DetailsView>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AllowSorting="True" AutoGenerateColumns="False" DataSourceID="DSUSERS" 
        Width="605px" 
        DataMember="DefaultView" CellPadding="4" ForeColor="#333333" 
        GridLines="None" style="text-align: center; margin-right: 74px;" 
        PageSize="25" DataKeyNames="CUSER" SelectedIndex="1">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
            <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" 
                SortExpression="USERNAME" />
            <asp:BoundField DataField="DOCTOR" HeaderText="DOCTOR" 
                SortExpression="DOCTOR" />
            <asp:BoundField DataField="ENVIAA" HeaderText="ENVIAA" 
                SortExpression="ENVIAA" />
            <asp:BoundField DataField="UNIDAD" HeaderText="UNIDAD" 
                SortExpression="UNIDAD" />
            <asp:BoundField DataField="LOG" HeaderText="NETCONTROL" SortExpression="LOG" />
            <asp:BoundField DataField="ONLINE" HeaderText="ONLINE" 
                SortExpression="ONLINE" />
            <asp:BoundField DataField="LASTTIME" HeaderText="LASTTIME" 
                SortExpression="LASTTIME" />
            <asp:BoundField DataField="EQUIPO" HeaderText="EQUIPO" 
                SortExpression="EQUIPO" />
            <asp:BoundField DataField="CODACT" HeaderText="ACTIVATION CODE" 
                SortExpression="CODACT" />
        </Columns>
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
