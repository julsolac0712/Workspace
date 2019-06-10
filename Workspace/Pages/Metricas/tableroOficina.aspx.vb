Public Class tableroOficina
    Inherits Base_Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            'Dim QueryString As New Hashtable()
            'QueryString = Encryptor.ConvertStringToHashtable(Encryptor.Decrypt(Request.QueryString(0)))
            'If (Not QueryString("OPER") Is Nothing) Then
            '    hdf_FK_ID_TipoReporte.Value = QueryString("FK_ID_TipoReporte")
            'End If

            If Request.Params("Of") IsNot Nothing Then
                hdf_FK_ID_TipoReporte.Value = Request.Params("Of").ToString
            End If
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
                    iframe_TableroDirectivo.Src = ds.Rows.Item(0)("Enlace").ToString()
                End If
            End If
        End If
    End Sub
End Class