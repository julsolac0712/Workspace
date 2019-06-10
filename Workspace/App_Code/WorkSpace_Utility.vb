Imports System.Data.SqlClient
Imports System.Data
Public Class WorkSpace_Utility : Inherits Utility.Common
#Region "Generales"

    Public Sub New(ByVal connectionString As String)
        MyBase.New(connectionString)
    End Sub

#End Region
#Region "Validar Rol"
    Public Function ValidaRolFuncionario(ByVal Usuario As Integer, ByVal Operacion As Integer) As String
        Dim cmd As New SqlCommand("WS_Seg_Valida_Usuarios", Conexion)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.AddWithValue("Usuario", Usuario)
        cmd.Parameters.AddWithValue("Operacion", Operacion)
        Return Ejecutar_Consulta_ST(cmd)
    End Function

    Public Function ValidaRolFuncionario2(ByVal Usuario As Integer, ByVal Operacion As Integer) As DataSet
        Dim cmd As New SqlCommand("WS_Seg_Valida_Usuarios", Conexion)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.AddWithValue("Usuario", Usuario)
        cmd.Parameters.AddWithValue("Operacion", Operacion)
        Return Ejecutar_Consulta_DS(cmd)
    End Function
#End Region
#Region "ValidaMenuMetricas"
    Public Function ValidaMenuMetricasxRol(ByVal FK_ID_Rol As Integer, ByVal Operacion As Integer) As DataSet
        Dim cmd As New SqlCommand("WS_Seg_Get_Lista_Menu_Roles", Conexion)
        cmd.CommandType = CommandType.StoredProcedure
        cmd.Parameters.AddWithValue("FK_ID_Rol", FK_ID_Rol)
        cmd.Parameters.AddWithValue("Operacion", Operacion)
        Return Ejecutar_Consulta_DS(cmd)
    End Function
#End Region


End Class
