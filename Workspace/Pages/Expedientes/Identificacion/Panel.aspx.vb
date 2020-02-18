Imports System.Data

Public Class Panel
    Inherits Base_Page

    Protected Overridable Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Request.QueryString("Admin") Is Nothing Then
            hdf_Usuario.Value = Session("UsuarioIntranet")
        Else
            Response.Redirect("http://apps.iica.int/workspace/")
        End If

        '    hdf_Usuario.Value = 2802

    End Sub

#Region "Acciones Grid"
    Protected Overridable Sub gv_Identificacion_RowCommand1(sender As Object, e As GridViewCommandEventArgs) Handles gv_Identificacion.RowCommand
        If (e.CommandName = "Edit") Then
            If e.CommandArgument IsNot Nothing And e.CommandArgument <> "" Then
                Dim arrValues() As String = Split(e.CommandArgument, "-")
                Response.Redirect("Formulario.aspx?=" & Encryptor.Encrypt("OPER=ver&CronoICT=" & arrValues(0) & "&SubCronoICT=" & arrValues(1)))
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

    Protected Sub lnk_ListadoCompleto_Click(sender As Object, e As EventArgs) Handles lnk_ListadoCompleto.Click
        If gv_Identificacion.AllowPaging = True Then
            gv_Identificacion.AllowPaging = False
            lcl_ListadoCompleto.Text = "Agrupado"
        Else
            gv_Identificacion.AllowPaging = True
            lcl_ListadoCompleto.Text = "Lista Completa"
        End If
        lcl_Conteo1.Text = gv_Identificacion.Rows.Count
    End Sub

    Protected Sub sqlDS_PanelIdentificacion_Selected(sender As Object, e As SqlDataSourceStatusEventArgs) Handles sqlDS_PanelIdentificacion.Selected
        If (e.Exception Is Nothing) Then
            lcl_Conteo1.Text = e.Command.Parameters("@CantResultados").Value
        End If
    End Sub


#End Region
End Class
