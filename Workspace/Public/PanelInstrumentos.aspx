<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/SiteEmbed.Master" CodeBehind="PanelInstrumentos.aspx.vb" Inherits="WorkSpace.PanelInstrumentos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>

     <div>
        <asp:HiddenField ID="hdf_Operacion" runat="server" />
        <asp:HiddenField ID="hdf_Usuario" runat="server" />
        <asp:HiddenField ID="hdf_Idioma" runat="server" />
         <asp:HiddenField ID="hdf_Operativo" runat="server" />

         <asp:UpdatePanel ID="upAjax_Usuarios" runat="server">
             <ContentTemplate>

                 <div class="row margin-top-10 margin-bottom-30">
                     <div class="col-md-2">
                         <asp:Localize ID="lcl_FiltroRegion" runat="server" Text="Filtrar por Región"></asp:Localize>
                         <asp:DropDownList ID="ddl_FiltroRegion" runat="server" CssClass="form-control" Width="98%" AutoPostBack="True">
                             <asp:ListItem Value="0" Text="Todos"></asp:ListItem>
                             <asp:ListItem Value="1" Text="Central"></asp:ListItem>
                             <asp:ListItem Value="2" Text="Caribe"></asp:ListItem>
                             <asp:ListItem Value="3" Text="Andina"></asp:ListItem>
                             <asp:ListItem Value="4" Text="Sur"></asp:ListItem>
                             <asp:ListItem Value="5" Text="Norte"></asp:ListItem>
                             <asp:ListItem Value="6" Text="Sede Central"></asp:ListItem>
                         </asp:DropDownList> 
                     </div>

                     <div class="col-md-2">
                         <asp:Localize ID="lcl_FiltroPais" runat="server" Text="Filtrar por País"></asp:Localize>
                         <asp:DropDownList ID="ddl_FiltroPais" runat="server" CssClass="form-control" Width="98%" AutoPostBack="True" DataSourceID="sqlDS_FiltroPais" DataTextField="Descripcion" DataValueField="Cod_Unidad"></asp:DropDownList>
                         <asp:SqlDataSource ID="sqlDS_FiltroPais" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>" SelectCommand="WS_Get_Lista_Paises" SelectCommandType="StoredProcedure">
                             <SelectParameters>
                                 <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                                 <asp:ControlParameter ControlID="hdf_Idioma" DefaultValue="es" Name="Idioma" PropertyName="Value" Type="String" />
                             </SelectParameters>
                         </asp:SqlDataSource>
                     </div>

                     <div class="col-md-3">
                         <asp:Localize ID="lcl_FiltroAgrovoc" runat="server" Text="Filtrar por Agrovoc"></asp:Localize>
                         <asp:DropDownList ID="ddl_FiltroAgrovoc" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="sqlDS_Agrovoc" DataTextField="Termino_ES" DataValueField="FK_id_CodigoAgrovoc" Width="98%"></asp:DropDownList>

                         <asp:SqlDataSource ID="sqlDS_Agrovoc" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>" SelectCommand="WS_Get_Lista_PalabrasAgrovocxIdentificacionProyecto" SelectCommandType="StoredProcedure">
                             <SelectParameters>
                                 <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                             </SelectParameters>
                         </asp:SqlDataSource>

                     </div>

                 </div>

                 <div class="margin-top-10 ">
                     <asp:GridView ID="gv_Identificacion" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="Codigo" DataSourceID="sqlDS_PanelIdentificacion" Width="100%" AllowPaging="True" AllowSorting="True" PageSize="12">
                         <Columns>
                             <asp:TemplateField>
                                 <ItemTemplate>
                                     <asp:LinkButton ID="lnk_Ver" runat="server" ClientIDMode="AutoID" CommandName="View" CommandArgument='<%# Eval("Codigo") %>' CssClass="btn btn-iica-green">
                                             <span class="glyphicon glyphicon-zoom-in "></span>
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
                             <asp:ControlParameter ControlID="ddl_FiltroRegion" DefaultValue="0" Name="Region" PropertyName="SelectedValue" Type="Int32" />
                             <asp:ControlParameter ControlID="ddl_FiltroPais" DefaultValue="0" Name="Cod_Unidad" PropertyName="SelectedValue" Type="String" />
                             <asp:ControlParameter ControlID="ddl_FiltroAgrovoc" DefaultValue="0" Name="FK_id_CodigoAgrovoc" PropertyName="SelectedValue" Type="Int32" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                 </div>

             </ContentTemplate>
         </asp:UpdatePanel>


     </div>

</asp:Content>
