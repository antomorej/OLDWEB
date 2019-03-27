<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dr. ECG net &gt;Portal</title>
    <style type="text/css">
        #Button1
        {
            margin-left: 0px;
            text-align: center;
        }
        #form1
        {
            height: 1737px;
        }
        #Button2
        {
            margin-left: 73px;
        }
        #Button3
        {
            margin-left: 32px;
        }
        .style3
        {
            width: 492px;
            height: 23px;
        }
        .style4
        {
            width: 56px;
            height: 23px;
        }
        .style5
        {
            height: 23px;
            width: 435px;
            text-align: center;
        }
        .style6
        {
            width: 492px;
            height: 29px;
        }
        .style12
        {
            width: 56px;
            height: 29px;
        }
        .style13
        {
            height: 29px;
            width: 435px;
        }
        </style>
<script language="javascript" type="text/javascript">
// <!CDATA[

function Button1_onclick() {

}

// ]]>
</script>
</head>
<body>
    <form id="form1" runat="server" title="Dr. ECG &gt; Portal" 
    style="padding: 20px; margin: 20px">
    <div style="height: 237px">
    
        <img alt="logo" src="img/drecg%20front%20page/Letrero%20drecgnet.png" 
            style="width: 373px; height: 76px" /><br />
        <br />
<img alt="" src="img/drecg%20front%20page/Banner-drecgnet.png" 
            style="width: 896px; height: 130px" /><br />
        <br />
        <div style="width: 891px; height: 30px; background-color: #0099CC;">
            &nbsp; Admin&nbsp;
            <asp:TextBox ID="TextBox1" runat="server" Width="98px"></asp:TextBox>
&nbsp;&nbsp; Contrasena
            <asp:TextBox ID="TextBox2" runat="server" Width="97px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="BEntrar" runat="server" Text="Entrar" Width="62px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            &nbsp;<asp:Button ID="BUsuarios" runat="server" Text="Usuarios" Width="84px" 
                style="margin-left: 0px" />
&nbsp;&nbsp;&nbsp;
&nbsp;
            <asp:Button ID="BEstadisticas" runat="server" Text="Estadisticas" Height="26px" 
                Width="87px" />
            &nbsp;
            <br />
            <asp:SqlDataSource ID="SqlDominio" runat="server" 
                ConnectionString="<%$ ConnectionStrings:MEDLINKNETConnectionString %>" 
                ProviderName="<%$ ConnectionStrings:medlinknetconnection.ProviderName %>" 
                
                
                SelectCommand="SELECT DOMINIOS.ALIAS AS DOMINIO FROM ADMIN INNER JOIN DOMINIOS ON ADMIN.IDDOMINIO = DOMINIOS.IDDOMINIO WHERE (ADMIN.USERNAME = @USERNAME) AND (ADMIN.PASSW = @PASSW)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="USERNAME" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="TextBox2" Name="PASSW" PropertyName="Text" 
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
    <asp:SqlDataSource ID="DSUSERS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NETCONTROLConnectionString %>" 
        
        
        
        
        
        
        
        
        
                SelectCommand="SELECT CUSER, USERNAME, ENVIAA, UNIDAD, UBICACION, DOMINIO, NIVEL, [LOG], ONLINE, LASTTIME, DOCTOR, EQUIPO, CODACT FROM USERS WHERE (DOMINIO = @dominio) AND (NIVEL &gt; 1)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DOMINIOVIEW" Name="DOMINIO" PropertyName="SelectedValue" 
                Type="String" DefaultValue="" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DSDETAIL" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NETCONTROLConnectionString %>" 
        InsertCommand="INSERT INTO USERS (USERNAME,UNIDAD,UBICACION,ENVIAA,NIVEL,LOG,DOMINIO) VALUES (@USERNAME,@UNIDAD,@UBICACION,@ENVIAA,2,'S',@VDOMINIO)" 
        ProviderName="<%$ ConnectionStrings:NETCONTROLConnectionString.ProviderName %>" 
        SelectCommand="SELECT * FROM USERS where cuser=@vuser" 
        
        UpdateCommand="UPDATE USERS SET USERNAME = @username, UNIDAD = @unidad, UBICACION = @ubicacion, ENVIAA = @enviaa, [LOG] = @log ,  DOCTOR=@doctor, EQUIPO=@equipo, CODACT=@codact WHERE (CUSER = @vuser)" 
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
            <asp:ControlParameter ControlID="DOMINIOVIEW" Name="VDOMINIO" 
                PropertyName="SelectedValue" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DSCount" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NETCONTROLConnectionString %>" 
        
        
        
        
        SelectCommand="SELECT COUNT(DISTINCT[IDENT]+[NOMBRE]) AS PACIENTES FROM HISTORY WHERE  (CUSER = @CUSER) AND (FECHARESP &gt;= @FECHARESP) AND (FECHARESP &lt; @FECHARESP2) ">
        <SelectParameters>
            <asp:ControlParameter ControlID="LISTUSERS" Name="CUSER" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="desde" Name="FECHARESP" PropertyName="Text" />
            <asp:ControlParameter ControlID="hasta" Name="FECHARESP2" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DSHISTORY" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NETCONTROLConnectionString %>" 
        
        
        SelectCommand="SELECT * FROM [HISTORY] WHERE (([CUSER] = @CUSER) AND ([FECHARESP] &gt;= @FECHARESP) AND ([FECHARESP] &lt; @FECHARESP2))" 
        
        DeleteCommand="UPDATE [HISTORY] SET [REPETIDO]='S' WHERE [ID]=@VID" 
        UpdateCommand="UPDATE [HISTORY] SET [REPETIDO]='N' WHERE [ID]=@VID" 
        InsertCommand="UPDATE [HISTORY] SET [REPETIDO]='N' WHERE [ID]=@VID">
        <SelectParameters>
            <asp:ControlParameter ControlID="LISTUSERS" Name="CUSER" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="desde" Name="FECHARESP" PropertyName="Text" 
                Type="DateTime" />
            <asp:ControlParameter ControlID="hasta" Name="FECHARESP2" PropertyName="Text" 
                Type="DateTime" />
        </SelectParameters>
        <DeleteParameters>
            <asp:ControlParameter ControlID="GENVIOS" Name="VID" 
                PropertyName="SelectedValue" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="GENVIOS" Name="VID" 
                PropertyName="SelectedValue" />
        </UpdateParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="GENVIOS" Name="VID" 
                PropertyName="SelectedValue" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DSCount2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NETCONTROLConnectionString %>" 
        
        SelectCommand="SELECT COUNT(1) AS TOTAL FROM HISTORY WHERE (CUSER = @CUSER) AND (FECHARESP &gt;= @FECHARESP) AND (FECHARESP &lt; @FECHARESP2) ">
        <SelectParameters>
            <asp:ControlParameter ControlID="LISTUSERS" Name="CUSER" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="desde" Name="FECHARESP" PropertyName="Text" />
            <asp:ControlParameter ControlID="hasta" Name="FECHARESP2" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DSCount3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NETCONTROLConnectionString %>" 
        
        SelectCommand="SELECT IDENT, COUNT(1) AS VECES  FROM HISTORY WHERE (CUSER = @CUSER) AND (FECHARESP &gt;= @FECHARESP) AND (FECHARESP &lt; @FECHARESP2) GROUP BY IDENT " 
        FilterExpression="VECES&gt;1">
        <SelectParameters>
            <asp:ControlParameter ControlID="LISTUSERS" Name="CUSER" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="desde" Name="FECHARESP" PropertyName="Text" />
            <asp:ControlParameter ControlID="hasta" Name="FECHARESP2" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DSTOTAL" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NETCONTROLConnectionString %>" 
        
        
        SelectCommand="SELECT * FROM [HISTORY] WHERE (([FECHARESP] &gt;= @FECHARESP) AND ([FECHARESP] &lt; @FECHARESP2))" 
        
        
                DeleteCommand="DELETE FROM HISTORY WHERE (([FECHARESP] &gt;= @FECHARESP) AND ([FECHARESP] &lt; @FECHARESP2))">
        <SelectParameters>
            <asp:ControlParameter ControlID="desde" Name="FECHARESP" PropertyName="Text" 
                Type="DateTime" />
            <asp:ControlParameter ControlID="hasta" Name="FECHARESP2" PropertyName="Text" 
                Type="DateTime" />
        </SelectParameters>
        <DeleteParameters>
            <asp:ControlParameter ControlID="desde" Name="FECHARESP" PropertyName="Text" />
            <asp:ControlParameter ControlID="hasta" Name="FECHARESP2" PropertyName="Text" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DSEstadistica" runat="server" 
        ConnectionString="<%$ ConnectionStrings:NETCONTROLConnectionString %>" 
        
        SelectCommand="SELECT [TOUSER],COUNT(1) AS N  FROM [HISTORY] WHERE (([CUSER] = @CUSER) AND ([FECHARESP] &gt;= @FECHARESP) AND ([FECHARESP] &lt; @FECHARESP2))  GROUP BY [TOUSER] ">
        <SelectParameters>
            <asp:ControlParameter ControlID="LISTUSERS" Name="CUSER" 
                PropertyName="SelectedValue" />
            <asp:ControlParameter ControlID="desde" Name="FECHARESP" PropertyName="Text" />
            <asp:ControlParameter ControlID="hasta" Name="FECHARESP2" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
                                <asp:DetailsView ID="DOMINIOVIEW" runat="server" AutoGenerateRows="False" 
                                    DataSourceID="SqlDominio" EnableModelValidation="True" Height="16px" 
                                    style="text-align: center" Width="166px" 
                BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                CellPadding="2" DataKeyNames="DOMINIO" DataMember="DefaultView" 
                ForeColor="Black" GridLines="None">
                                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                                    <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                                    <Fields>
                                        <asp:BoundField DataField="DOMINIO" HeaderText="DOMINIO" 
                                            SortExpression="ALIAS" />
                                    </Fields>
                                    <FooterStyle BackColor="Tan" />
                                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                                        HorizontalAlign="Center" />
                                </asp:DetailsView>
            <br />
            <asp:MultiView ID="MultiView" runat="server">
                <asp:View ID="ViewDetail" runat="server">
                    &nbsp;&nbsp;
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                        CellPadding="4" DataKeyNames="CUSER" DataMember="DefaultView" 
                        DataSourceID="DSDETAIL" EnableModelValidation="True" Font-Names="Arial" 
                        Font-Size="Small" ForeColor="#333333" GridLines="None" Height="50px" 
                        style="text-align: center; margin-left: 202px;" Width="462px">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
                        <RowStyle BackColor="#EFF3FB" />
                        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <Fields>
                            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                                ShowEditButton="True" ShowInsertButton="True" />
                            <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" 
                                SortExpression="USERNAME" />
                            <asp:BoundField DataField="ENVIAA" HeaderText="ENVIAA" 
                                SortExpression="ENVIAA" />
                            <asp:BoundField DataField="UNIDAD" HeaderText="UNIDAD" 
                                SortExpression="UNIDAD" />
                            <asp:BoundField DataField="UBICACION" HeaderText="UBICACION" 
                                SortExpression="UBICACION" />
                            <asp:BoundField DataField="LOG" HeaderText="LOG" SortExpression="LOG" />
                            <asp:BoundField DataField="DOCTOR" HeaderText="DOCTOR" 
                                SortExpression="DOCTOR" />
                            <asp:BoundField DataField="EQUIPO" HeaderText="EQUIPO" 
                                SortExpression="EQUIPO" />
                            <asp:BoundField DataField="CODACT" HeaderText="CODACT" 
                                SortExpression="CODACT" />
                        </Fields>
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                    <br />
                    <asp:Button ID="BCerrar" runat="server" 
                        style="margin-left: 310px; margin-right: 0px" Text="Cerrar Vista" 
                        Width="259px" />
                </asp:View>
                <asp:View ID="ViewUsuarios" runat="server">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" 
                        DataKeyNames="CUSER" DataMember="DefaultView" DataSourceID="DSUSERS" 
                        EnableModelValidation="True" Font-Names="Arial" Font-Size="Small" 
                        ForeColor="#333333" GridLines="None" PageSize="20" SelectedIndex="1" 
                        style="text-align: center; margin-right: 74px;" Width="883px">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="USERNAME" HeaderText="USERNAME" 
                                SortExpression="USERNAME" />
                            <asp:BoundField DataField="ENVIAA" HeaderText="ENVIAA" 
                                SortExpression="ENVIAA" />
                            <asp:BoundField DataField="ONLINE" HeaderText="ONLINE" 
                                SortExpression="ONLINE" />
                            <asp:BoundField DataField="LASTTIME" HeaderText="LASTTIME" 
                                SortExpression="LASTTIME" />
                            <asp:BoundField DataField="EQUIPO" HeaderText="EQUIPO" 
                                SortExpression="EQUIPO" />
                            <asp:BoundField DataField="CODACT" HeaderText="CODACT" 
                                SortExpression="CODACT" />
                        </Columns>
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                </asp:View>
                <asp:View ID="Envios" runat="server">
                    <table bgcolor="#CCCCCC" border="0" 
                        
                        style="width: 882px; height: 81px; font-family: Arial, Helvetica, sans-serif; font-size: small;">
                        <tr>
                            <td class="style3">
                                &nbsp;<asp:DropDownList ID="LISTUSERS" runat="server" AutoPostBack="True" 
                                    DataSourceID="DSUSERS" DataTextField="USERNAME" DataValueField="CUSER" 
                                    Height="17px" style="margin-top: 0px; text-align: center;" Width="330px">
                                </asp:DropDownList>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            </td>
                            <td class="style4">
                            </td>
                            <td class="style5">
                                <strong>ESTADISTICAS</strong></td>
                        </tr>
                        <tr>
                            <td class="style6">
                                <asp:RadioButtonList ID="PERIODO" runat="server" AutoPostBack="True" 
                                    CellPadding="1" CellSpacing="1" Height="23px" RepeatDirection="Horizontal" 
                                    Width="408px">
                                    <asp:ListItem Selected="True" Value="0">Hoy</asp:ListItem>
                                    <asp:ListItem Value="1">Ayer</asp:ListItem>
                                    <asp:ListItem Value="2">Este Mes</asp:ListItem>
                                    <asp:ListItem Value="3">Mes Pasado</asp:ListItem>
                                    <asp:ListItem Value="4">Anteriores</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td class="style12">
                            </td>
                            <td class="style13">
                                <asp:DetailsView ID="TOTALENVIOS" runat="server" AutoGenerateRows="False" 
                                    DataSourceID="DSCount2" EnableModelValidation="True" Height="16px" 
                                    style="text-align: center" Width="282px">
                                    <Fields>
                                        <asp:BoundField DataField="TOTAL" HeaderText="TOTAL DE ENVIOS" ReadOnly="True" 
                                            SortExpression="TOTAL" />
                                    </Fields>
                                </asp:DetailsView>
                            </td>
                        </tr>
                        <tr>
                            <td class="style6">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Desde &nbsp;
                                <asp:TextBox ID="desde" runat="server" Width="86px"></asp:TextBox>
                                &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;Hasta&nbsp;
                                <asp:TextBox ID="hasta" runat="server" Width="88px"></asp:TextBox>
                            </td>
                            <td class="style12">
                                </td>
                            <td class="style13">
                                <asp:DetailsView ID="NOREP" runat="server" AutoGenerateRows="False" 
                                    DataSourceID="DSCount" EnableModelValidation="True" Height="16px" 
                                    style="text-align: center" Width="285px">
                                    <Fields>
                                        <asp:BoundField DataField="PACIENTES" HeaderText="NO REPETIDOS" 
                                            SortExpression="PACIENTES" />
                                    </Fields>
                                </asp:DetailsView>
                            </td>
                        </tr>
                    </table>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button 
                        ID="BBorrar" runat="server" Text="Borrar" Visible="False" Width="103px" />
&nbsp;<asp:Button ID="Recall" runat="server" Text="Recalcular" Width="103px" />
                    <asp:GridView ID="GENVIOS" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" 
                        BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                        Caption="ENVIOS DE ECG" CaptionAlign="Top" CellPadding="2" DataKeyNames="ID" 
                        DataMember="DefaultView" DataSourceID="DSHISTORY" Font-Names="Arial" 
                        Font-Size="Small" ForeColor="Black" GridLines="Horizontal" PageSize="20" 
                        ShowFooter="True" style="text-align: center; margin-right: 4px;" 
                        Width="884px" Height="490px">
                        <FooterStyle BackColor="Tan" />
                        <Columns>
                            <asp:BoundField DataField="FECHARESP" HeaderText="ENVIO" 
                                SortExpression="FECHARESP" />
                            <asp:BoundField DataField="FECHAECG" HeaderText="ECG" 
                                SortExpression="FECHAECG" />
                            <asp:BoundField DataField="IDENT" HeaderText="FOLIO" SortExpression="IDENT" />
                            <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" 
                                SortExpression="NOMBRE" />
                            <asp:BoundField DataField="REVISION" HeaderText="REVISION" 
                                SortExpression="REVISION" />
                            <asp:BoundField DataField="TOUSER" HeaderText="ENVIADO A" 
                                SortExpression="TOUSER" />
                            <asp:BoundField DataField="CEQUIPO" HeaderText="EQUIPO" 
                                SortExpression="CEQUIPO" />
                        </Columns>
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                            HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    </asp:GridView>
                    <br />
                    <asp:GridView ID="GridEstadistica" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" Caption="DESGLOSE POR UNIDAD" 
                        CellPadding="4" DataSourceID="DSEstadistica" EnableModelValidation="True" 
                        Font-Names="Arial" Font-Size="Small" ForeColor="#333333" GridLines="None" 
                        HorizontalAlign="Center" style="text-align: center; margin-right: 0px;" 
                        Width="522px">
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#EFF3FB" />
                        <Columns>
                            <asp:BoundField DataField="TOUSER" HeaderText="UNIDAD" 
                                SortExpression="TOUSER" />
                            <asp:BoundField DataField="N" HeaderText="CANTIDAD" SortExpression="N" />
                        </Columns>
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <br />
                    <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
                        AllowSorting="True" AutoGenerateColumns="False" Caption="FOLIOS REPETIDOS" 
                        CellPadding="4" DataSourceID="DSCount3" Font-Names="Arial" Font-Size="Small" 
                        ForeColor="#333333" GridLines="None" HorizontalAlign="Center" ShowFooter="True" 
                        style="text-align: center" Width="522px">
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <RowStyle BackColor="#E3EAEB" />
                        <Columns>
                            <asp:BoundField DataField="IDENT" HeaderText="FOLIO" SortExpression="IDENT" />
                            <asp:BoundField DataField="VECES" HeaderText="VECES" SortExpression="VECES" />
                        </Columns>
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#7C6F57" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </asp:View>
                <br />
            </asp:MultiView>
        </div>
    
    </div>
    </form>
</body>
</html>
