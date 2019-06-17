Public Class InstrumentoPublico
    Inherits Base_Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim QueryString As New Hashtable()
            QueryString = Encryptor.ConvertStringToHashtable(Encryptor.Decrypt(Request.QueryString(0)))
            If (Not QueryString("OPER") Is Nothing) Then
                hdf_CronoICT.Value = QueryString("CronoICT")
                hdf_SubCronoICT.Value = QueryString("SubCronoICT")
            End If

        End If
    End Sub

End Class