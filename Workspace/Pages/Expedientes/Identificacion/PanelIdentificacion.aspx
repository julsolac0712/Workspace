<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="PanelIdentificacion.aspx.vb" Inherits="WorkSpace.PanelIdentificacion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <div class="container">
        <asp:HiddenField ID="hdf_Operacion" runat="server" />
        <asp:HiddenField ID="hdf_Usuario" runat="server" />
        <asp:HiddenField ID="hdf_Idioma" runat="server" />

         <asp:UpdatePanel ID="upAjax_Usuarios" runat="server">
             <ContentTemplate>
                 <span class="page-titles">
                     <asp:Localize ID="lcl_Descripcion" runat="server" Text="Instrumentos IICA"></asp:Localize>
                 </span>
                 <div class="margin-top-10 ">
                     <asp:GridView ID="gv_Identificacion" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="Codigo" DataSourceID="sqlDS_PanelIdentificacion" Width="100%" AllowPaging="True" AllowSorting="True" PageSize="12">
                         <Columns>
                             <asp:TemplateField HeaderText="Editar">
                                 <ItemTemplate>
                                     <asp:LinkButton ID="lnk_Editar" runat="server" ClientIDMode="AutoID" CommandName="Edit" CommandArgument='<%# Eval("Codigo") %>' ToolTip="<%$ Resources:Global, ActualizarTooltip %>" CssClass="btn btn-iica-green">
                                             <span class="glyphicon glyphicon-folder-close "></span>
                                     </asp:LinkButton>
                                 </ItemTemplate>
                                 <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="5%" />
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="Código" SortExpression="Codigo">
                                 <ItemTemplate>
                                     <asp:Localize ID="lcl_Codigo" runat="server" Text='<%# Eval("Codigo") %>'></asp:Localize>
                                 </ItemTemplate>
                                 <ItemStyle VerticalAlign="Top" Width="10%" HorizontalAlign="Center" />
                                 <HeaderStyle CssClass="text-align-center" />
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="Descripción" SortExpression="NombreResumen">
                                 <ItemTemplate>
                                     <asp:Localize ID="lcl_DescripcionEsp" runat="server" Text='<%# Eval("Descripcion") %>'></asp:Localize>
                                 </ItemTemplate>
                                 <ItemStyle VerticalAlign="Top" Width="75%" />
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                                 <ItemTemplate>
                                     <asp:Literal ID="ltl_EstadoNoIniciado" runat="server" Mode="PassThrough" Text='<%# PrintEstadoNoIniciado(Eval("TipoEstado")) %>' Visible='<%# IIf(Eval("Estado") = 0, True, False) %>' />
                                     <asp:Literal ID="ltl_EstadoActualizado" runat="server" Mode="PassThrough" Text='<%# PrintEstadoCheck(Eval("TipoEstado")) %>' Visible='<%# IIf(Eval("Estado") = 1, True, False) %>' />
                                 </ItemTemplate>
                                 <ItemStyle VerticalAlign="Top" Width="10%" HorizontalAlign="Center" />
                                 <HeaderStyle CssClass="text-align-center" />
                             </asp:TemplateField>

                         </Columns>
                     </asp:GridView>
                     <asp:SqlDataSource ID="sqlDS_PanelIdentificacion" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>"
                         SelectCommand="WS_Get_Lista_IdentificacionProyecto" SelectCommandType="StoredProcedure">

                         <SelectParameters>
                             <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                             <asp:ControlParameter ControlID="hdf_Idioma" DefaultValue="es" Name="Idioma" PropertyName="Value" Type="String" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                 </div>
             </ContentTemplate>
             <Triggers>
             </Triggers>
         </asp:UpdatePanel>
     </div>

</asp:Content>
