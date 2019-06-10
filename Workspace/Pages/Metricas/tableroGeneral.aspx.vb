Public Class tableroGeneral
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            CargarReporte()
        End If
    End Sub
    Private Sub CargarReporte()
        Dim dView As New DataView
        dView = sqlDS_TipoReporte.Select(DataSourceSelectArguments.Empty)
        If dView IsNot Nothing Then
            Dim ds As New DataTable
            ds = dView.Table
            If ds.Rows.Count <> 0 Then
                If IsDBNull(ds.Rows.Item(0)("Enlace")) = False Then
                    iframe_TableroGeneral.Src = ds.Rows.Item(0)("Enlace").ToString()
                End If
            End If
        End If
    End Sub
End Class