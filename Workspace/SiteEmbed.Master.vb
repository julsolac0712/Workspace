Public Class SiteEmbedMaster
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
        If Not Page.IsPostBack Then
            If Session("UsuarioIntranet") IsNot Nothing Then
                hdf_ID_Intranet.Value = Session("UsuarioIntranet")
                '' ValidaMenuMetricasxRol()
            End If
        End If
    End Sub


End Class