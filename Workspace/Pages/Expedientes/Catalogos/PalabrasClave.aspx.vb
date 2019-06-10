Imports System.Data

Public Class PalabrasClave
    Inherits Base_Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Request.QueryString("Admin") Is Nothing Then
            hdf_Usuario.Value = Session("UsuarioIntranet")
        Else
            Response.Redirect("http://apps.iica.int/workspace/")
        End If
    End Sub

#Region "Acciones Grid"
    Protected Sub gv_PalabrasClave_RowCreated(sender As Object, e As GridViewRowEventArgs) Handles gv_PalabrasClave.RowCreated
        Try
            If e.Row.RowIndex <> -1 Then

                If CType(sender, GridView).DataKeys(e.Row.RowIndex).Values(0) = 0 Then

                    Dim btn As LinkButton

                    btn = CType(e.Row.FindControl("lnk_Eliminar"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                    btn = CType(e.Row.FindControl("lnk_Editar"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                    btn = CType(e.Row.FindControl("lnk_Agregar"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = True
                    End If

                End If

            End If
        Catch ex As Exception
            Gestor_Errores.Escribir_Log(ex, "Error de Registro de palabras clave - Created")
        End Try
    End Sub
    Protected Sub gv_PalabrasClave_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles gv_PalabrasClave.RowDeleted
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de palabras clave - Deleted")
        End If
    End Sub
    Protected Sub gv_PalabrasClave_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles gv_PalabrasClave.RowUpdated
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de palabras clave - Update")
        End If
    End Sub
    Protected Sub gv_PalabrasClave_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gv_PalabrasClave.RowUpdating
        If (e.Keys(0) = 0) Then
            hdf_Operacion.Value = 1
        Else
            hdf_Operacion.Value = 2
        End If
    End Sub


#End Region
End Class
