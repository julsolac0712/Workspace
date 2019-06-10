Imports System.Data

Public Class Identificacion
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
End Class
