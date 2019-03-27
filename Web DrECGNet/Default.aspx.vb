
Partial Class _Default
    Inherits System.Web.UI.Page

 
    Protected Sub BEntrar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BEntrar.Click
        SqlDominio.DataBind()
        DSUSERS.DataBind()
        RefreshEstad()
        MultiView.ActiveViewIndex = 1
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        MultiView.ActiveViewIndex = 0
    End Sub

    Protected Sub BCerrar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BCerrar.Click
        MultiView.ActiveViewIndex = 1
        DSUSERS.DataBind()
    End Sub

    Protected Sub DetailsView4_PageIndexChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewPageEventArgs) Handles TOTALENVIOS.PageIndexChanging

    End Sub

    Protected Sub BUsuarios_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BUsuarios.Click
        MultiView.ActiveViewIndex = 1
        DSUSERS.DataBind()
    End Sub

    Protected Sub BEstadisticas_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BEstadisticas.Click
        MultiView.ActiveViewIndex = 2
        RefreshEstad()
    End Sub

    Private Sub RefreshEstad()
        DSCount.DataBind()
        DSCount2.DataBind()
        DSCount3.DataBind()
        DSHISTORY.DataBind()
    End Sub

    Protected Sub PERIODO_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles PERIODO.SelectedIndexChanged, PERIODO.Load
        Dim Hoy, Ayer, Mannana, InicioMes, MesPasado, AnoPasado As Date

        Hoy = DateValue(DateString)
        Ayer = DateSerial(Year(Hoy), Month(Hoy), Day(Hoy) - 1)
        Mannana = DateSerial(Year(Hoy), Month(Hoy), Day(Hoy) + 1)
        InicioMes = DateSerial(Year(Hoy), Month(Hoy), 1)
        MesPasado = DateSerial(Year(Hoy), Month(Hoy) - 1, 1)
        AnoPasado = DateSerial(Year(Hoy) - 1, Month(Hoy) - 1, 1)

        BBorrar.Visible = False

        If PERIODO.Text = "0" Then
            desde.Text = Hoy
            hasta.Text = Mannana
        End If

        If PERIODO.Text = "1" Then
            desde.Text = Ayer
            hasta.Text = Hoy
        End If

        If PERIODO.Text = "2" Then
            desde.Text = InicioMes
            hasta.Text = Mannana
        End If

        If PERIODO.Text = "3" Then
            desde.Text = MesPasado
            hasta.Text = InicioMes
        End If

        If PERIODO.Text = "4" Then
            desde.Text = AnoPasado
            hasta.Text = MesPasado
            BBorrar.Visible = True
        End If

        RefreshEstad()

    End Sub

    Protected Sub desde_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles desde.TextChanged
        RefreshEstad()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub BBorrar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BBorrar.Click
        DSTOTAL.Delete()
        RefreshEstad()
    End Sub

    Protected Sub DSDETAIL_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles DSDETAIL.Selecting

    End Sub

    Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        DSUSERS.DataBind()
    End Sub

    Protected Sub DetailsView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles DetailsView1.ItemUpdated
        DSUSERS.DataBind()
    End Sub

    Protected Sub Recall_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Recall.Click
        RefreshEstad()
    End Sub
End Class
