Imports System.Data

Public Class PanelIdentificacion
    Inherits Base_Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'If Not Request.QueryString("Admin") Is Nothing Then
        'hdf_Usuario.Value = Session("UsuarioIntranet")
        'Else
        '    Response.Redirect("http://apps.iica.int/workspace/")
        'End If
    End Sub

#Region "Acciones Grid"
    Protected Sub gv_Identificacion_RowCommand1(sender As Object, e As GridViewCommandEventArgs) Handles gv_Identificacion.RowCommand
        If (e.CommandName = "Edit") Then
            If e.CommandArgument IsNot Nothing And e.CommandArgument <> "" Then
                Dim arrValues() As String = Split(e.CommandArgument, "-")
                Response.Redirect("Identificacion.aspx?=" & Encryptor.Encrypt("OPER=ver&CronoICT=" & arrValues(0) & "&SubCronoICT=" & arrValues(1)))
            End If
        End If
    End Sub
#End Region
#Region "AccionesFormulario"
    Protected Function PrintEstadoNoIniciado(ByVal valor As Object) As String
        Dim Estado As String = "<span class='glyphicon glyphicon-remove-sign imagen-noiniciado icon-red' data-toggle='tooltip' title='" + valor + "'></span>"
        Return Estado
    End Function
    Protected Function PrintEstadoCheck(ByVal valor As Object) As String
        Dim Estado As String = "<span class='glyphicon glyphicon-ok-sign imagen-check icon-green' data-toggle='tooltip' title='" + valor + "'></span>"
        Return Estado
    End Function
#End Region
End Class
