<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Default.aspx.vb" Inherits="WorkSpace._Default1" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

       <div>
            <iframe  id="iframe_TableroGeneral" runat="server" class="frame-metricas" frameborder="0" allowfullscreen="true" ></iframe>
        <asp:SqlDataSource ID="sqlDS_TipoReporte" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>" 
                                            SelectCommand="WS_Get_Lista_Reportes_BI" SelectCommandType="StoredProcedure" >
                             <SelectParameters>
                                 <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                                 <asp:Parameter DefaultValue="3" Name="FK_ID_TipoReporte" Type="Int32" />
                             </SelectParameters>   
                         </asp:SqlDataSource>
    </div>
</asp:Content>
