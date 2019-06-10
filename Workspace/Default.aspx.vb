Public Class _Default
    Inherits Base_Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        Get_Cookie_Intranet()
        Session("UsuarioIntranet") = IDIntranet
    End Sub

    Private Sub _Default_PreInit(sender As Object, e As EventArgs) Handles Me.PreInit
        Response.Redirect("Pages/Default.aspx")
    End Sub


End Class