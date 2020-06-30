Imports System.Data

Public Class Formulario
    Inherits Base_Page

    Dim tiposeleccion As Integer

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

    Protected Function PrintKeyWords(ByVal valor As Object, ByVal count As Object) As String
        Dim arrValues() As String = Split(valor, ",")
        Dim Estado As String = ""
        For vAN_Indice As Integer = 0 To count - 1
            Estado += "<span class='tag'>" + arrValues(vAN_Indice) + " </span>"
        Next
        Return Estado
    End Function

    Protected Sub lnk_Regresar_Click(sender As Object, e As EventArgs) Handles lnk_Regresar.Click
        Response.Redirect("Panel?Admin=1", False)
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

#Region "AGROVOC"
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
                Dim ds As DataSet


                If txt_PalabraBuscarAgrovoc.Text <> "" Then

                    ddl.Items.Clear()


                    ' busca datos que ya se hayan registrado
                    ds = AccesoDatos.DatosRegistradosAgrovoc(txt_PalabraBuscarAgrovoc.Text, 5)

                    If ds.Tables(0).Rows.Count > 0 Then

                        tiposeleccion = 1

                        ddl.Items.Add(New ListItem("--Seleccione--", 0))

                        For Each row As DataRow In ds.Tables(0).Rows

                            ddl.Items.Add(New ListItem(row("Espanol"), row("CodeTermAgrovoc")))

                        Next

                    Else

                        tiposeleccion = 2

                        Resultado = TbL.simpleSearchByMode2(txt_PalabraBuscarAgrovoc.Text, "containing", "--")
                        ' txt_Palabra1.Text = Resultado



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

                    End If

                    ddl.DataBind()
                Else
                    ddl.Items.Clear()
                    ddl.Items.Add(New ListItem("--Seleccione--", 0))
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

        hdf_CodTerm.Value = valor
        hdf_Espanol.Value = ddl.SelectedItem.Text

        If tiposeleccion = 2 Then
            Dim TbL As New Agrovoc.SKOSWSClient

            hdf_Ingles.Value = TbL.getTermByLanguage(valor, "en")
            hdf_Frances.Value = TbL.getTermByLanguage(valor, "fr")
            hdf_Portuguez.Value = TbL.getTermByLanguage(valor, "pt")

        Else

            hdf_Ingles.Value = ""
            hdf_Frances.Value = ""
            hdf_Portuguez.Value = ""

        End If

    End Sub

    Protected Sub gv_PalabrasAGROVOC_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles gv_PalabrasAGROVOC.RowDeleted
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro de País Involucrado - Update")
        End If
    End Sub
#End Region

#Region "ODS"
    Protected Sub gv_ODS_RowCreated(sender As Object, e As GridViewRowEventArgs) Handles gv_ODS.RowCreated
        Try
            If e.Row.RowIndex <> -1 Then

                If CType(sender, GridView).DataKeys(e.Row.RowIndex).Values(0) = 0 Then

                    Dim btn As LinkButton

                    btn = CType(e.Row.FindControl("lnk_Eliminar_ODS"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                    btn = CType(e.Row.FindControl("lnk_Editar_ODS"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                    btn = CType(e.Row.FindControl("lnk_Agregar_ODS"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = True
                    End If

                End If

            End If
        Catch ex As Exception
            Gestor_Errores.Escribir_Log(ex, "Error de Registro de País Involucrado - Created")
        End Try
    End Sub

    Protected Sub gv_ODS_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gv_ODS.RowUpdating
        If (e.Keys(0) = 0) Then
            hdf_OperacionODS.Value = 1
        Else
            hdf_OperacionODS.Value = 2
        End If
    End Sub

    Protected Sub gv_ODS_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles gv_ODS.RowUpdated
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro al actualizar ODS - Updated")
        End If
    End Sub

    Protected Sub gv_ODS_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles gv_ODS.RowDeleted
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro al Borrar ODS - Deleted")
        End If
    End Sub
#End Region

#Region "Temas"
    Protected Sub gv_Temas_RowCreated(sender As Object, e As GridViewRowEventArgs) Handles gv_Temas.RowCreated
        Try
            If e.Row.RowIndex <> -1 Then

                If CType(sender, GridView).DataKeys(e.Row.RowIndex).Values(0) = 0 Then

                    Dim btn As LinkButton

                    btn = CType(e.Row.FindControl("lnk_Eliminar_Tema"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                    btn = CType(e.Row.FindControl("lnk_Editar_Tema"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                    btn = CType(e.Row.FindControl("lnk_Agregar_Tema"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = True
                    End If

                End If

            End If
        Catch ex As Exception
            Gestor_Errores.Escribir_Log(ex, "Error de Registro de Tema Involucrado - Created")
        End Try
    End Sub

    Protected Sub gv_Temas_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gv_Temas.RowUpdating
        If (e.Keys(0) = 0) Then
            hdf_OperacionTema.Value = 1
        Else
            hdf_OperacionTema.Value = 2
        End If
    End Sub

    Protected Sub gv_Temas_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles gv_Temas.RowUpdated
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro al actualizar Temas - Updated")
        End If
    End Sub

    Protected Sub gv_Temas_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles gv_Temas.RowDeleted
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro al Borrar Temas - Deleted")
        End If
    End Sub


#End Region

#Region "Enlaces"
    Protected Sub gv_Enlaces_RowCreated(sender As Object, e As GridViewRowEventArgs) Handles gv_Enlaces.RowCreated
        Try
            If e.Row.RowIndex <> -1 Then

                If CType(sender, GridView).DataKeys(e.Row.RowIndex).Values(0) = 0 Then

                    Dim btn As LinkButton

                    btn = CType(e.Row.FindControl("lnk_Eliminar_Enlace"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                    btn = CType(e.Row.FindControl("lnk_Editar_Enlace"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                    btn = CType(e.Row.FindControl("lnk_Agregar_Enlace"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = True
                    End If

                End If

            End If
        Catch ex As Exception
            Gestor_Errores.Escribir_Log(ex, "Error de Registro de Enlace - Created")
        End Try
    End Sub

    Protected Sub gv_Enlaces_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles gv_Enlaces.RowDeleted
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro al Borrar Enlaces - Deleted")
        End If
    End Sub

    Protected Sub gv_Enlaces_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gv_Enlaces.RowUpdating
        If (e.Keys(0) = 0) Then
            hdf_OperacionEnlace.Value = 1
        Else
            hdf_OperacionEnlace.Value = 2
        End If
    End Sub

    Protected Sub gv_Enlaces_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles gv_Enlaces.RowUpdated
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro al Modificar Enlaces - Updated")
        End If
    End Sub

#Region "Contrapartes"

#End Region

    Protected Sub gv_ContraparteFinanciera_RowCreated(sender As Object, e As GridViewRowEventArgs) Handles gv_ContraparteFinanciera.RowCreated
        Try
            If e.Row.RowIndex <> -1 Then

                If CType(sender, GridView).DataKeys(e.Row.RowIndex).Values(0) = 0 Then

                    Dim btn As LinkButton

                    btn = CType(e.Row.FindControl("lnk_Eliminar_Contra"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                    btn = CType(e.Row.FindControl("lnk_Editar_Contra"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = False
                    End If

                    btn = CType(e.Row.FindControl("lnk_Agregar_Contra"), LinkButton)
                    If Not btn Is Nothing Then
                        btn.Visible = True
                    End If

                End If

            End If
        Catch ex As Exception
            Gestor_Errores.Escribir_Log(ex, "Error de Registro de Enlace - Created")
        End Try
    End Sub

    Protected Sub gv_ContraparteFinanciera_RowDeleted(sender As Object, e As GridViewDeletedEventArgs) Handles gv_ContraparteFinanciera.RowDeleted
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro al Modificar Enlaces - Updated")
        End If
    End Sub

    Protected Sub gv_ContraparteFinanciera_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles gv_ContraparteFinanciera.RowUpdated
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro al Modificar Enlaces - Updated")
        End If
    End Sub

    Protected Sub gv_ContraparteFinanciera_RowUpdating(sender As Object, e As GridViewUpdateEventArgs) Handles gv_ContraparteFinanciera.RowUpdating
        If (e.Keys(0) = 0) Then
            hdf_OperacionContraparte.Value = 1
        Else
            hdf_OperacionContraparte.Value = 2
        End If
    End Sub

    Protected Sub gv_ActivarEnlaces_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles gv_ActivarEnlaces.RowCommand
        Dim rowIndex As Integer = 0 'Convert.ToInt32(e.CommandArgument)
        gv_ActivarEnlaces.SelectedIndex = rowIndex


        Dim seletedRowPrimaryKey As Integer = Integer.Parse(gv_ActivarEnlaces.SelectedDataKey(0).ToString())

        hdf_Cambio.Value = Integer.Parse(gv_ActivarEnlaces.SelectedDataKey(0).ToString())


        If CType(gv_ActivarEnlaces.Rows(0).FindControl("chk_Documentos"), CheckBox).Checked Then
            hdf_ConDocumentos.Value = 1
        Else
            hdf_ConDocumentos.Value = 0
        End If

        If CType(gv_ActivarEnlaces.Rows(rowIndex).FindControl("chk_Videos"), CheckBox).Checked Then
            hdf_ConVideos.Value = 1
        Else
            hdf_ConVideos.Value = 0
        End If

        If CType(gv_ActivarEnlaces.Rows(rowIndex).FindControl("chk_Imagenes"), CheckBox).Checked Then
            hdf_ConImagenes.Value = 1
        Else
            hdf_ConImagenes.Value = 0
        End If

        If CType(gv_ActivarEnlaces.Rows(rowIndex).FindControl("chk_Noticias"), CheckBox).Checked Then
            hdf_ConNoticias.Value = 1
        Else
            hdf_ConNoticias.Value = 0
        End If

        If CType(gv_ActivarEnlaces.Rows(rowIndex).FindControl("chk_Eventos"), CheckBox).Checked Then
            hdf_ConEventos.Value = 1
        Else
            hdf_ConEventos.Value = 0
        End If

        hdf_Operacion.Value = 1

        sqlDS_ActivarEnlaces.Update()


    End Sub

    Protected Sub gv_ActivarEnlaces_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles gv_ActivarEnlaces.RowUpdated
        If e.Exception IsNot Nothing Then
            e.ExceptionHandled = True
            Gestor_Errores.Escribir_Log(e.Exception, "Error de Registro al Modificar Enlaces - Updated")
        End If
    End Sub


#End Region

End Class
