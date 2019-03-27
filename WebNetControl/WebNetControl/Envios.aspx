<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Envios.aspx.cs" Inherits="WebNetControl.Envios" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

    .style47
    {
        width: 94%;
    }
    .style39
    {
        width: 464px;
    }
        .style37
    {
        width: 420px;
    }
    .style45
    {
        width: 213px;
    }
    .style44
    {
        width: 88px;
    }
        .style29
        {
            width: 103px;
        }
        
a:link, a:visited
{
    color: #034af3;
}

        .style48
        {
            width: 762px;
        }
        .style49
        {
            width: 155px;
        }
        .style51
        {
            width: 186px;
        }
    </style>
</head>
<body style="width: 792px">
    <form id="form1" runat="server" class="style48">
    <asp:Panel ID="Panel1" runat="server" BackColor="#999999" ForeColor="White" 
        Width="759px">
        <table style="margin: 5px; " class="style47">
            <tr>
                <td class="style39">
                    &nbsp;&nbsp;Usuario
                    <asp:TextBox ID="UserBx" runat="server" Width="107px"></asp:TextBox>
                    &nbsp; &nbsp; Passw&nbsp;<asp:TextBox ID="PasswBx" runat="server" Width="106px" 
                        TextMode="Password"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="OkBtn1" runat="server" Height="22px" 
                        onclick="OkBtn_Click" Text="Ok" Width="38px" />
                </td>
                <td>
                    &nbsp;&nbsp;&nbsp;Admin&nbsp; &nbsp;<asp:TextBox ID="SuperID" runat="server" Width="72px" 
                        TextMode="Password"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Button 
                        ID="DeleteBtn" runat="server" Height="26px" 
                        onclick="Button1_Click" Text="Borrar" Width="57px" 
                        Visible="False" />
                </td>
            </tr>
        </table>
        <table style="margin: 5px; background-color: #336699;" class="style37" >
            <tr>
                <td class="style51" align="center">
                    <asp:DropDownList ID="DomainList" 
                        runat="server" DataSourceID="SqlDominio" DataTextField="DESCRIPTION" 
                        DataValueField="IDDOMINIO" Width="211px" 
                        onselectedindexchanged="DomainList_SelectedIndexChanged" 
                        AutoPostBack="True">
                    </asp:DropDownList>
                    <br />
                    Grupo de Trabajo<br />
                    <asp:TextBox ID="GroupText" runat="server" BackColor="Black" ForeColor="White" 
                        ontextchanged="Desde_TextChanged" Width="210px"></asp:TextBox>
                    &nbsp;<asp:ListBox ID="GroupList" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlGrupo" DataTextField="DESCRIPTION" 
                        DataValueField="IDWORKGROUP" Height="51px" 
                        onselectedindexchanged="GroupList_SelectedIndexChanged" Width="210px">
                    </asp:ListBox>
                </td>
                <td class="style49" align="center">
                    Usuario<br />
                    <asp:ListBox ID="UserList" runat="server" 
                        DataSourceID="SqlUser" DataTextField="NOMBRE" DataValueField="USERID" 
                        Height="102px" Width="220px" AutoPostBack="True" style="margin-left: 0px"></asp:ListBox>
                    </td>
                <td class="style45">
                    <table ID="timeselec" border="0" class="menu" 
                        frame="border" 
                        style="margin: 5px; background-color: #003399; font-size: small;">
                        <tr>
                            <td class="style44">
                                &nbsp;&nbsp; Desde<br /> &nbsp;
                                <asp:TextBox ID="Desde" runat="server" Width="66px" 
                                    ontextchanged="Desde_TextChanged">1/1/2000</asp:TextBox>
                                <br />
                                &nbsp; Hasta<br /> &nbsp;
                                <asp:TextBox ID="Hasta" runat="server" Width="67px">1/1/2020</asp:TextBox>
                            </td>
                            <td class="style29">
                                <asp:RadioButtonList ID="PERIODO" runat="server" 
                                    CellPadding="1" CellSpacing="1" Height="34px" 
                                    onselectedindexchanged="PERIODO_SelectedIndexChanged" Width="132px" 
                                    AutoPostBack="True">
                                    <asp:ListItem Value="0">Hoy</asp:ListItem>
                                    <asp:ListItem Value="1">Ayer</asp:ListItem>
                                    <asp:ListItem Selected="True" Value="2">Este Mes</asp:ListItem>
                                    <asp:ListItem Value="3">Mes Pasado</asp:ListItem>
                                    <asp:ListItem Value="4">Anteriores</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <asp:SqlDataSource ID="SqlUser" runat="server" 
        ConnectionString="<%$ ConnectionStrings:medlinknetConnectionString %>" 
        
        
        
        
        
        
        
        SelectCommand="SELECT [USERID], [NOMBRE] FROM [USERS] WHERE ([IDWORKGROUP] = @IDWORKGROUP)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GroupList" Name="IDWORKGROUP" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlTrans" runat="server" 
        ConnectionString="<%$ ConnectionStrings:medlinknetConnectionString %>" 
        
        
        SelectCommand="SELECT TRANSACTIONS.IDTRANSACTION AS ID, TRANSACTIONS.DATETIME AS FECHA, TRANSACTIONS.TRANSACTIONGUID AS GUID, USERS.NOMBRE AS DE, STATUS.STATUS, TRANSACTIONTYPE.TRANSTYPE AS TIPO, USERS_1.NOMBRE AS PARA, TRANSACTIONS.SENDERID, PATIENTDATA.PATIENTNAME FROM TRANSACTIONS INNER JOIN STATUS ON TRANSACTIONS.STATUSID = STATUS.IDSTATUS INNER JOIN TRANSACTIONTYPE ON TRANSACTIONS.TRASTYPE = TRANSACTIONTYPE.IDTYPE INNER JOIN USERS ON TRANSACTIONS.SENDERID = USERS.USERID INNER JOIN USERS AS USERS_1 ON TRANSACTIONS.TOID = USERS_1.USERID INNER JOIN PATIENTDATA ON TRANSACTIONS.PATIENTID = PATIENTDATA.PATIENTID WHERE (TRANSACTIONS.DATETIME &gt; @date1) AND (TRANSACTIONS.DATETIME &lt;= @date2) AND (TRANSACTIONS.SENDERID = @fromuser) " 
        
        
        
        
        DeleteCommand="DELETE TRANSACTIONS WHERE (TRANSACTIONS.DATETIME &gt; @date1) AND (TRANSACTIONS.DATETIME &lt;= @date2)">
        <DeleteParameters>
            <asp:ControlParameter ControlID="Desde" Name="date1" PropertyName="Text" />
            <asp:ControlParameter ControlID="Hasta" Name="date2" PropertyName="Text" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="Desde" DefaultValue="1/1/2000" Name="date1" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="Hasta" DefaultValue="1/1/2100" Name="date2" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="UserList" DefaultValue="" Name="fromuser" 
                PropertyName="SelectedValue" />
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
    <asp:SqlDataSource ID="SqlGrupo" runat="server" 
        ConnectionString="<%$ ConnectionStrings:medlinknetConnectionString %>" 
        SelectCommand="SELECT [IDWORKGROUP], [DESCRIPTION] FROM [WORKGROUP] WHERE ([IDDOMINIO] = @IDDOMINIO)" 
        EnableCaching="True" EnableViewState="False">
        <SelectParameters>
            <asp:ControlParameter ControlID="DomainList" Name="IDDOMINIO" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="DSCount2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:medlinknetConnectionString %>" 
        
        
        
        
        
        
        SelectCommand="SELECT COUNT(1) AS PACIENTES FROM TRANSACTIONS WHERE (TRANSACTIONS.DATETIME &gt; @date1) AND (TRANSACTIONS.DATETIME &lt;= @date2) AND (TRANSACTIONS.SENDERID = @fromuser)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Desde" Name="date1" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="Hasta" Name="date2" PropertyName="Text" />
            <asp:ControlParameter ControlID="UserList" Name="fromuser" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                DataSourceID="DSCount2" Height="16px" style="text-align: center" 
                Width="282px" EnableModelValidation="True">
                <Fields>
                    <asp:BoundField DataField="PACIENTES" HeaderText="TOTAL DE PACIENTES" ReadOnly="True" 
                        SortExpression="PACIENTES" />
                </Fields>
            </asp:DetailsView>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" BackColor="White" 
                BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                DataKeyNames="ID" DataSourceID="SqlTrans" Font-Size="9pt" GridLines="Vertical" 
                Width="759px" 
                EnableModelValidation="True">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="FECHA" HeaderText="FECHA" SortExpression="FECHA" />
                    <asp:BoundField DataField="PATIENTNAME" HeaderText="PATIENTNAME" 
                        SortExpression="PATIENTNAME" />
                    <asp:BoundField DataField="PARA" HeaderText="PARA" SortExpression="PARA" />
                    <asp:BoundField DataField="TIPO" HeaderText="TIPO" SortExpression="TIPO" />
                    <asp:BoundField DataField="STATUS" HeaderText="STATUS" 
                        SortExpression="STATUS" />
                    <asp:BoundField DataField="GUID" HeaderText="GUID" SortExpression="GUID" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            </asp:GridView>
                    <asp:Button ID="BEnvios" runat="server" Height="22px" onclick="BEnvios_Click" 
                        Text="Envios" Width="95px" Visible="False" />
    &nbsp;
                    <asp:Button ID="BEstad" runat="server" Height="22px" onclick="BEstad_Click" 
                        Text="Estadisticas" Width="95px" Visible="False" />
    <br />
    </form>
</body>
</html>
