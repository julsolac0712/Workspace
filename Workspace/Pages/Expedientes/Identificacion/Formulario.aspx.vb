Imports System.Data

Public Class Formulario
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
        Else
            ' Dim FK_ID_Expediente As DropDownList = fv_Perfil.FindControl("ddl_Expediente")
            'hdf_ID_Expediente.Value = FK_ID_Expediente.SelectedValue
            'gv_PalabrasClave.DataBind()
            lnkBtn_EditarID.Visible = True
        End If
    End Sub

    Protected Sub btn_Cancelar_Click(sender As Object, e As EventArgs)
        lnkBtn_EditarID.Visible = True
    End Sub

#Region "AccionesGrid"
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
#Region "PalabrasClave"
    Protected Sub gv_PalabrasClave_RowCreated(sender As Object, e As GridViewRowEventArgs)
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
            Gestor_Errores.Escribir_Log(ex, "Error de Registro de expedientes - Created")
        End Try
    End Sub
    Protected Sub gv_PalabrasClave_RowDeleted(sender As Object, e As GridViewDeletedEventArgs)
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de expedientes - Deleted")
        End If
    End Sub
    Protected Sub gv_PalabrasClave_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs)
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de expedientes - Update")
        End If
    End Sub
    Protected Sub gv_PalabrasClave_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        If (e.Keys(0) = 0) Then
            hdf_Operacion.Value = 1
        Else
            hdf_Operacion.Value = 2
        End If
    End Sub
#End Region
#End Region
    Protected Function PrintKeyWords(ByVal valor As Object, ByVal count As Object) As String
        Dim arrValues() As String = Split(valor, ",")
        Dim Estado As String = ""
        For vAN_Indice As Integer = 0 To count - 1
            Estado += "<span class='tag'>" + arrValues(vAN_Indice) + " </span>"
        Next
        Return Estado
    End Function

    Protected Sub gv_PalabrasAGROVOC_RowEditing(sender As Object, e As GridViewEditEventArgs) Handles gv_PalabrasAGROVOC.RowEditing

    End Sub

    Protected Sub gv_PalabrasAGROVOC_RowCreated(sender As Object, e As GridViewRowEventArgs) Handles gv_PalabrasAGROVOC.RowCreated
        Try
            If e.Row.RowIndex <> -1 Then

                If CType(sender, GridView).DataKeys(e.Row.RowIndex).Values(0) = 0 Then

                    Dim btn As LinkButton

                    btn = CType(e.Row.FindControl("lnk_Eliminar_A"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                    btn = CType(e.Row.FindControl("lnk_Editar_A"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                    btn = CType(e.Row.FindControl("lnk_Agregar_A"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = True
                    End If

                End If

            End If
        Catch ex As Exception
            Gestor_Errores.Escribir_Log(ex, "Error de Registro de AGROVOC - Created")
        End Try
    End Sub

    Protected Sub gv_PalabrasAGROVOC_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gv_PalabrasAGROVOC.RowDataBound
        Dim TbL As New Agrovoc.SKOSWSClient


        If gv_PalabrasAGROVOC.EditIndex = 0 Then
            Dim ddl As DropDownList = e.Row.FindControl("ddl_Agrovoc")

            If Not ddl Is Nothing Then
                Dim Resultado As String
                Dim array() As String
                Dim t As Integer = 0


                If txt_PalabraBuscarAgrovoc.Text <> "" Then
                    Resultado = TbL.simpleSearchByMode2(txt_PalabraBuscarAgrovoc.Text, "containing", "--")
                    ' txt_Palabra1.Text = Resultado

                    ddl.Items.Clear()

                    array = Split(Resultado, "--")

                    ddl.Items.Add(New ListItem("--Seleccione--", 0))

                    For a = 0 To array.Count - 3
                        If t < array.Count Then
                            If array(t) <> "NumberOfResults" Then

                                If array(t + 2) = "es" Then
                                    ddl.Items.Add(New ListItem(array(t + 1), array(t)))
                                End If

                            End If
                        End If

                        t = t + 3

                    Next
                    ddl.DataBind()
                End If
            End If

        End If

    End Sub

    Protected Sub gv_PalabrasAGROVOC_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gv_PalabrasAGROVOC.RowUpdating
        If (e.Keys(0) = 0) Then
            hdf_OperacionPaises.Value = 1
        Else
            hdf_OperacionPaises.Value = 2
        End If
    End Sub

    Protected Sub gv_PalabrasAGROVOC_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles gv_PalabrasAGROVOC.RowUpdated
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de País Involucrado - Update")
        End If
    End Sub

    Protected Sub ddl_Agrovoc_SelectedIndexChanged(sender As Object, e As EventArgs)
        Dim ddl As DropDownList = (CType(sender, DropDownList).FindControl("ddl_Agrovoc"))

        Dim valor As String = ddl.SelectedValue
        Dim Idioma_EN As String = ""

        Dim TbL As New Agrovoc.SKOSWSClient

        hdf_CodTerm.Value = valor
        hdf_Ingles.Value = TbL.getTermByLanguage(valor, "en")
        hdf_Frances.Value = TbL.getTermByLanguage(valor, "fr")
        hdf_Espanol.Value = ddl.SelectedItem.Text
        hdf_Portuguez.Value = TbL.getTermByLanguage(valor, "pt")


    End Sub

    Protected Sub gv_PalabrasAGROVOC_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles gv_PalabrasAGROVOC.RowDeleted
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de País Involucrado - Update")
        End If
    End Sub
End Class
