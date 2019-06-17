Imports System.Data

Public Class PanelInstrumentos
    Inherits Panel

    Protected Overrides Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub

#Region "Acciones Grid"
    Protected Overrides Sub gv_Identificacion_RowCommand1(sender As Object, e As GridViewCommandEventArgs) Handles gv_Identificacion.RowCommand
        If (e.CommandName = "View") Then
            If e.CommandArgument IsNot Nothing And e.CommandArgument <> "" Then
                Dim arrValues() As String = Split(e.CommandArgument, "-")
                Response.Redirect("InstrumentoPublico.aspx?=" & Encryptor.Encrypt("OPER=ver&CronoICT=" & arrValues(0) & "&SubCronoICT=" & arrValues(1)))
            End If
        End If
    End Sub
#End Region
End Class
