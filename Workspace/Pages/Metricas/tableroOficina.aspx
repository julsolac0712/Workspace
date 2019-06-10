<%@ Page Title="Métricas" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="tableroOficina.aspx.vb" Inherits="WorkSpace.tableroOficina" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:HiddenField ID="hdf_FK_ID_TipoReporte" runat="server" />
        <iframe  id="iframe_TableroDirectivo" runat="server" class="frame-metricas" frameborder="0" allowfullscreen="true" ></iframe>
        <asp:SqlDataSource ID="sqlDS_TipoReporte" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>" 
                                            SelectCommand="WS_Get_Lista_Reportes_BI" SelectCommandType="StoredProcedure" >
                             <SelectParameters>
                                 <asp:ControlParameter ControlID="hdf_FK_ID_TipoReporte"  Name="FK_ID_TipoReporte" PropertyName="Value" Type="Int32" />
                                 <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />

                             </SelectParameters>   
                         </asp:SqlDataSource>
    </div>
</asp:Content>
