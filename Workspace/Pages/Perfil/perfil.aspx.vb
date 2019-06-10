Imports System.IO

Public Class Perfil
    Inherits Base_Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If (Not Page.IsPostBack) Then
            Dim Operacion As String = String.Empty
            Get_Cookie_Intranet()
            hdf_ID_Intranet.Value = IDIntranet
            Session("UsuarioIntranet") = IDIntranet
            CargarImagen()
        End If
    End Sub
    Protected Sub sqlDS_Perfil_Updated(sender As Object, e As SqlDataSourceStatusEventArgs) Handles sqlDS_Perfil.Inserted 

        Session("Status") = "<b>Información de la noticia actualizada con éxito</b>"
        Response.Redirect("~/pages/Perfil/perfil.aspx")
    End Sub
    Public Function validaLogo() As Boolean

        Dim retorno As Boolean = True
        Dim carpeta As String = String.Empty
        Dim fup_Fotografia As FileUpload
        fup_Fotografia = DirectCast(fv_Perfil.FindControl("fup_Fotografia"), FileUpload)
        'Valida Formato Archivo
        If fup_Fotografia.HasFile = True Then
            Dim filePath As String = String.Empty
            Dim fileName As String = String.Empty

            filePath = fup_Fotografia.PostedFile.FileName.ToLower
            fileName = fup_Fotografia.FileName.ToString

            Dim fileExt As String
            Dim fileInfo As New FileInfo(fup_Fotografia.PostedFile.FileName)
            fileExt = fileInfo.Extension.ToString

            carpeta = CrearCarpetaArchivos("\Perfil")
            Dim destFilePath As String = String.Empty
            'destFilePath = carpeta + "\" + fileName
            ''''''
            Dim filenameArray As String()
            filenameArray = fileName.Split(" ")
            fileName = String.Empty
            For indice As Integer = 0 To filenameArray.Length - 1
                fileName += filenameArray(indice).ToString()
            Next
            'filename = fup_Archivo.FileName
            If fileName.Length > 20 Then
                fileName = Trim(fileName).Substring(0, 20)
                destFilePath += carpeta + "\" + Convert.ToString(DateTime.Today.Day) + "_" + Convert.ToString(DateTime.Today.Month) + "_" + fileName + fileExt
            Else
                destFilePath += carpeta + "\" + Convert.ToString(DateTime.Today.Day) + "_" + Convert.ToString(DateTime.Today.Month) + "_" + fileName

            End If

        Else
            retorno = True
        End If
        Return retorno
    End Function
    Private Function CrearCarpetaArchivos(ByVal nuevaCarpeta As String) As String
        Dim carpeta As String = String.Empty
        Try

            Dim directoryPath As String
            directoryPath = ConfigurationManager.AppSettings.Get("serverPath") + "Archivos"
            If System.IO.Directory.Exists(directoryPath) = False Then
                System.IO.Directory.CreateDirectory(directoryPath)
            End If


            carpeta = directoryPath + nuevaCarpeta '"\biblioteca"
            If System.IO.Directory.Exists(carpeta) = False Then
                System.IO.Directory.CreateDirectory(carpeta)
            End If

        Catch ex As Exception

        End Try
        Return carpeta
    End Function
    Private Function CargarLogo() As String
        Dim serverPath As String
        Dim filePath As String
        Dim fup_Fotografia As FileUpload
        fup_Fotografia = DirectCast(fv_Perfil.FindControl("fup_Fotografia"), FileUpload)
        filePath = CrearCarpetaArchivos("\Perfil")

        serverPath = ConfigurationManager.AppSettings.Get("serverPath")

        If fup_Fotografia.HasFile = True Then

            Dim filename As String
            Dim fileInfo As New FileInfo(fup_Fotografia.PostedFile.FileName)
            Dim fileExt As String
            fileExt = fileInfo.Extension.ToString
            Try
                filename = fileInfo.Name.Substring(0, fileInfo.Name.IndexOf(fileExt))
                Dim filenameArray As String()
                filenameArray = filename.Split(" ")
                filename = String.Empty
                For indice As Integer = 0 To filenameArray.Length - 1
                    filename += filenameArray(indice).ToString()
                Next
                'filename = fup_Archivo.FileName
                If filename.Length > 20 Then
                    filename = Trim(filename).Substring(0, 20)
                End If
                filename = Convert.ToString(DateTime.Today.Day) + "_" + Convert.ToString(DateTime.Today.Month) + "_" + filename + fileExt
                filePath += "\" + filename

                fup_Fotografia.SaveAs(filePath)
                hdf_Imagen.Value = filename
                Return filename
            Catch ex As Exception
                ScriptManager.RegisterStartupScript(Me, Me.GetType, "alert", "window.alert('Error al cargar el archivo. Comuníquese con el administrador." + " " + ex.ToString + "');", True)
                Return ""
            End Try
        Else
            Return ""
        End If
    End Function
    Protected Sub btn_Guardar_Insert_Click(sender As Object, e As EventArgs)
        If validaLogo() Then
            CargarLogo()

        End If

    End Sub

    Private Sub CargarImagen()
        Dim dView As New DataView
        dView = sqlDS_Perfil.Select(DataSourceSelectArguments.Empty)
        If dView IsNot Nothing Then
            Dim ds As New DataTable
            ds = dView.Table
            If ds.Rows.Count <> 0 Then
                If IsDBNull(ds.Rows.Item(0)("Imagen")) = False Then
                    img_Perfil.ImageUrl = "~\Content\Archivos\Perfil\" + ds.Rows.Item(0)("Imagen").ToString()
                End If
                If IsDBNull(ds.Rows.Item(0)("Nombre")) = False Then
                    ltl_nombre.Text = ds.Rows.Item(0)("Nombre").ToString()
                End If
                If IsDBNull(ds.Rows.Item(0)("Puesto")) = False Then
                    ltl_Profesion.Text = ds.Rows.Item(0)("Puesto").ToString()
                End If
            End If
        End If
    End Sub

End Class