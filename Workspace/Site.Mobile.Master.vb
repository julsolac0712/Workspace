Public Class Site_Mobile
    Inherits System.Web.UI.MasterPage
    Private Const AntiXsrfTokenKey As String = "__AntiXsrfToken"
    Private Const AntiXsrfUserNameKey As String = "__AntiXsrfUserName"
    Private _antiXsrfTokenValue As String

    Dim AccesoDatos As New WorkSpace_Utility(ConfigurationManager.ConnectionStrings("WSConnectionString").ToString())

    Protected Sub Page_Init(sender As Object, e As EventArgs)
        ' The code below helps to protect against XSRF attacks
        Dim requestCookie = Request.Cookies(AntiXsrfTokenKey)
        AddHandler Page.PreLoad, AddressOf master_Page_PreLoad
    End Sub
    Protected Sub master_Page_PreLoad(sender As Object, e As EventArgs)
        If Not IsPostBack Then
            ' Set Anti-XSRF token
            ViewState(AntiXsrfTokenKey) = Page.ViewStateUserKey
            ViewState(AntiXsrfUserNameKey) = If(Context.User.Identity.Name, [String].Empty)

            If Session("Idioma") = "en" Then
                Page.Title = "IICA - " & ConfigurationManager.AppSettings.Get("appNameEng")
            Else
                Page.Title = "IICA - " & ConfigurationManager.AppSettings.Get("appName")
            End If
        Else
            ' Validate the Anti-XSRF token
            If DirectCast(ViewState(AntiXsrfTokenKey), String) <> _antiXsrfTokenValue OrElse DirectCast(ViewState(AntiXsrfUserNameKey), String) <> (If(Context.User.Identity.Name, [String].Empty)) Then
                Throw New InvalidOperationException("Validation of Anti-XSRF token failed.")
            End If
        End If
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Session("UsuarioIntranet") IsNot Nothing Then
            hdf_ID_Intranet.Value = Session("UsuarioIntranet")
            CargarImagen()
            ValidaMenuxRol()
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
            End If
        End If
    End Sub
    'Private Sub ValidaMenuxRol()
    '    If hdf_ID_Intranet.Value IsNot Nothing Or hdf_ID_Intranet.Value <> "" Then
    '        If AccesoDatos.ValidaRolFuncionario(hdf_ID_Intranet.Value, 1) = "1" Then
    '            li_Tablero_Directivo.Visible = True
    '            li_MenuToolbox.Visible = True
    '        End If
    '        If AccesoDatos.ValidaRolFuncionario(hdf_ID_Intranet.Value, 1) = "2" Then
    '            li_Tablero_Directivo.Visible = True
    '            li_MenuToolbox.Visible = False
    '        End If
    '        If AccesoDatos.ValidaRolFuncionario(hdf_ID_Intranet.Value, 1) = "0" Then
    '            li_Tablero_Directivo.Visible = False
    '            li_MenuToolbox.Visible = False
    '        End If
    '    End If
    'End Sub
    Private Sub ValidaMenuxRol()
        Dim ds As Data.DataSet
        Dim dt_dt As DataTable
        Dim dsMenu As Data.DataSet
        Dim dt_dtMenu As DataTable
        ds = AccesoDatos.ValidaRolFuncionario2(hdf_ID_Intranet.Value, 2)
        If ds IsNot Nothing Then
            dt_dt = ds.Tables("Table")
            If dt_dt.Rows.Count > 0 Then
                For vAN_Indice As Integer = 0 To dt_dt.Rows.Count - 1
                    If dt_dt.Rows(vAN_Indice).Item("FK_id_rol").ToString <> "" Then
                        Dim rol As Integer = dt_dt.Rows(vAN_Indice).Item("FK_id_rol").ToString
                        dsMenu = AccesoDatos.ValidaMenuMetricasxRol(rol, 1)
                        If dsMenu IsNot Nothing Then
                            dt_dtMenu = dsMenu.Tables("Table")
                            If dt_dtMenu.Rows.Count > 0 Then
                                For vAN_Indice2 As Integer = 0 To dt_dtMenu.Rows.Count - 1
                                    If dt_dtMenu.Rows(vAN_Indice2).Item("ControlID").ToString <> "" Then
                                        Dim li As HtmlGenericControl = FindControl(dt_dtMenu.Rows(vAN_Indice2).Item("ControlID"))
                                        li.Visible = True
                                    End If
                                Next vAN_Indice2
                            End If
                        End If
                    End If
                Next vAN_Indice
            End If
        End If
    End Sub
End Class