Imports System.Data

Public Class Identificacion2
    Inherits Base_Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            '  Dim QueryString As New Hashtable()
            '     QueryString = Encryptor.ConvertStringToHashtable(Encryptor.Decrypt(Request.QueryString(0)))
            '   If (Not QueryString("OPER") Is Nothing) Then
            hdf_CronoICT.Value = 4444 'QueryString("CronoICT")
                hdf_SubCronoICT.Value = "01" 'QueryString("SubCronoICT")
            '    End If

        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles lnkBtn_EditarID.Click
        fv_Perfil.ChangeMode(FormViewMode.Edit)
        lnkBtn_EditarID.Visible = False
    End Sub

    Protected Sub sqlDS_Instrumentos_Updated(sender As Object, e As SqlDataSourceStatusEventArgs) Handles sqlDS_Instrumentos.Updated
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de Tipo Ambito - Update")
        End If
    End Sub

    Protected Sub btn_Cancelar_Click(sender As Object, e As EventArgs)
        lnkBtn_EditarID.Visible = True
    End Sub

#Region "Paises Involucrados"

    Protected Sub gv_PaisesInvolucrados_RowCreated(sender As Object, e As GridViewRowEventArgs) Handles gv_PaisesInvolucrados.RowCreated
        Try
            If e.Row.RowIndex <> -1 Then

                If CType(sender, GridView).DataKeys(e.Row.RowIndex).Values(0) = 0 Then

                    Dim btn As LinkButton

                    btn = CType(e.Row.FindControl("lnk_Eliminar_Pais"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                    btn = CType(e.Row.FindControl("lnk_Editar_Pais"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                    btn = CType(e.Row.FindControl("lnk_Agregar_Pais"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = True
                    End If

                End If

            End If
        Catch ex As Exception
            Gestor_Errores.Escribir_Log(ex, "Error de Registro de País Involucrado - Created")
        End Try
    End Sub

    Protected Sub gv_PaisesInvolucrados_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles gv_PaisesInvolucrados.RowDeleted
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de País Involucrado - Deleted")
        End If
    End Sub

    Protected Sub gv_PaisesInvolucrados_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles gv_PaisesInvolucrados.RowUpdated
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de País Involucrado - Update")
        End If
    End Sub

    Protected Sub gv_PaisesInvolucrados_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gv_PaisesInvolucrados.RowUpdating
        If (e.Keys(0) = 0) Then
            hdf_OperacionPaises.Value = 1
        Else
            hdf_OperacionPaises.Value = 2
        End If
    End Sub

#End Region
End Class
