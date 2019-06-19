<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Panel.aspx.vb" Inherits="WorkSpace.Panel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>

     <div class="container">
        <asp:HiddenField ID="hdf_Operacion" runat="server" />
        <asp:HiddenField ID="hdf_Usuario" runat="server" />
        <asp:HiddenField ID="hdf_Idioma" runat="server" />
         <asp:HiddenField ID="hdf_Operativo" runat="server" />

         <asp:UpdatePanel ID="upAjax_Usuarios" runat="server">
             <ContentTemplate>

                 <span class="page-titles">
                     <asp:Localize ID="lcl_Descripcion" runat="server" Text="Instrumentos IICA"></asp:Localize>
                 </span>

                 <div class="row">
                     <div class="col-md-8" runat="server" id="IntroduccionExpandir">
                     </div>
                     <div class="col-md-2" runat="server">
                         <div class="margin-top-10 alineado-justificado">
                             <asp:LinkButton ID="lnk_ListadoCompleto" runat="server" CssClass="btn btn-iica-blue-light">
                                 <span class="glyphicon glyphicon-list-alt imagen-miplan" runat="server"></span>&nbsp;
                         <asp:Localize runat="server" ID="lcl_ListadoCompleto" Text="Listado Completo"></asp:Localize>
                             </asp:LinkButton>
                         </div>
                     </div>
                     <div class="col-md-2" runat="server">
                         <div class="alinear-justificado margin-top-10">
                             <asp:LinkButton ID="lnk_Estadisticas" runat="server" CssClass="btn btn-iica-blue-light" data-toggle="modal" data-target="#myModal">
                                 <span class="glyphicon glyphicon-stats imagen-miplan" runat="server"></span>&nbsp;
                                 <asp:Localize runat="server" ID="lcl_Estadisticas" Text="Estadísticas"></asp:Localize>
                             </asp:LinkButton>
                             <!-- Modal -->
                             <div id="myModal" class="modal fade" role="dialog" tabindex="-1" aria-hidden="true">
                                 <div class="modal-dialog">
                                     <!-- Modal content-->
                                     <div class="modal-content">
                                         <div class="modal-header">
                                             <button type="button" class="close" data-dismiss="modal">&times;</button>
                                             <h4 class="modal-title">
                                                 <asp:Localize ID="lcl_Tit_Estadisticas" runat="server" Text="Estadísticas"></asp:Localize>
                                             </h4>
                                         </div>
                                         <div class="modal-body">
                                             <div class="col-md-12" style="padding: 25px">
                                                 <div id="container2" style="min-width: 310px; height: 80%; max-width: 90%; margin: 0 auto"></div>
                                                 <asp:Literal runat="server" Text="<script type='text/javascript'>" Mode="PassThrough"></asp:Literal>
                                                 Highcharts.theme = {colors: ['#669933', '#007da4', '#C9920E', '#005850', '#660000', '#003366', '#eeaaee','#55BF3B', '#DF5353', '#7798BF', '#aaeeee']};
                                            Highcharts.setOptions(Highcharts.theme);
                                            <asp:Literal runat="server" Text="</script>" Mode="PassThrough"></asp:Literal>
                                                 <asp:Literal runat="server" Text="<script type='text/javascript'>" Mode="PassThrough"></asp:Literal>
                                                 Highcharts.chart('container2', {
                                            chart: {type: 'column'},
                                            title: {text: '<asp:Literal ID="ltl_EstadoPlaneacion" runat="server" Text="Avance de Registro de Información"></asp:Literal>'
                                            },
                                                xAxis: {
                                                    type: 'category'
                                                },
                                                yAxis: {
                                                    title: {
                                                        text: '<asp:Literal ID="ltl_Avance" runat="server" Text="Porcentaje"></asp:Literal>'
                                                    }
                                                },
                                                legend: {
                                                    enabled: false
                                                },
                                                plotOptions: {
                                                    series: {
                                                        borderWidth: 0,
                                                        dataLabels: {
                                                            enabled: true,
                                                            format: '{point.y:.2f}%'
                                                        }
                                                    }
                                                },
                                                tooltip: {
                                                    headerFormat: '<span style="font-size: 11px">{series.name}</span><br>',
                                                    pointFormat: '<span style="color: {point.color}">{point.name}</span>: <b>{point.y:.2f}%</b><br />'
                                                },
                                                   series: [{
                                                    name: '<asp:Literal ID="ltl_Avance2" runat="server" Text="% de Avance/Progress"></asp:Literal>',
                                                    colorByPoint: true,
                                                                data: [
                                                                     <asp:Repeater ID="rpt_Resumen" runat="server" DataSourceID="sqlDS_Grafico">
                                                                         <ItemTemplate>
                                                                             {name: '<%# Eval("Nombre")%>',
                                                                              y: <%# Eval("Porcentaje")%>, 
                                                                              drilldown: null
                                                                             },
                                                                         </ItemTemplate>
                                                                     </asp:Repeater>
                                                 ]
                                                            }]
                                                   });
                                            <asp:Literal runat="server" Text="</script>" Mode="PassThrough"></asp:Literal>
                                                 <asp:SqlDataSource ID="sqlDS_Grafico" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>" SelectCommand="WS_Get_Lista_Estadisticas" SelectCommandType="StoredProcedure" CancelSelectOnNullParameter="False" FilterExpression="Orden < 5">
                                                     <SelectParameters>
                                                         <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                                                         <asp:ControlParameter ControlID="hdf_Idioma" DefaultValue="" Name="Idioma" PropertyName="Value" Type="String" />
                                                         <asp:ControlParameter ControlID="ddl_FiltroRegion" DefaultValue="0" Name="Region" PropertyName="SelectedValue" Type="Int32" />
                                                         <asp:ControlParameter ControlID="ddl_FiltroPais" DefaultValue="0" Name="Cod_Unidad" PropertyName="SelectedValue" Type="String" />
                                                     </SelectParameters>
                                                 </asp:SqlDataSource>
                                             </div>
                                             <div class="panel-group">
                                                 <div class="panel panel-default">
                                                     <div class="panel-heading">
                                                         <h4 class="panel-title">
                                                             <a data-toggle="collapse" href="#cllp_Detalle">
                                                                 <span class="caret"></span>
                                                                 <asp:Localize ID="lcl_Detalle" runat="server" Text="Detalle"></asp:Localize>
                                                             </a>
                                                         </h4>
                                                     </div>
                                                     <div id="cllp_Detalle" class="panel-collapse collapse">
                                                         <div class="panel-body">
                                                             <asp:GridView ID="gv_Estadisticas" runat="server" CssClass="table" DataSourceID="sqlDS_Instrumentos" Width="98%" AutoGenerateColumns="False" GridLines="None" ShowHeader="False">
                                                                 <Columns>
                                                                     <asp:TemplateField HeaderText="Estadísticas">
                                                                         <ItemTemplate>
                                                                             <div class="align-left">
                                                                                 <div class="row">
                                                                                     <div class="col-md-6">
                                                                                         <asp:Literal ID="ltl_NombreEstado" runat="server" Text='<%# Eval("Nombre") %>'></asp:Literal>
                                                                                     </div>
                                                                                     <div class="col-md-2">
                                                                                         <asp:Literal ID="ltlSinIniciarEst" runat="server" Mode="PassThrough" Text="<span class='glyphicon glyphicon-remove-sign imagen-noiniciado icon-red' data-toggle='tooltip' title='Sin Iniciar'></span>" Visible='<%# IIf(CInt(Eval("Orden")) = 1, True, False) %>' />
                                                                                         <asp:Literal ID="ltlRevisionEst" runat="server" Mode="PassThrough" Text="<span class='glyphicon glyphicon-ok-sign imagen-check icon-green' data-toggle='tooltip' title='En Revisión'></span>" Visible='<%# IIf(CInt(Eval("Orden")) = 2, True, False) %>' />
                                                                                     </div>
                                                                                     <div class="col-md-2" style="text-align: right">
                                                                                         <asp:Literal ID="ltl_Instrumentos" runat="server" Text='<%# Eval("Estado") %>'></asp:Literal>
                                                                                     </div>
                                                                                     <div class="col-md-2" style="text-align: right">
                                                                                         <asp:Literal ID="ltl_Porcentajes" runat="server" Text='<%# Eval("Porcentaje") %>'></asp:Literal>%
                                                                                     </div>
                                                                                 </div>
                                                                             </div>
                                                                         </ItemTemplate>
                                                                     </asp:TemplateField>
                                                                 </Columns>
                                                             </asp:GridView>
                                                             <asp:SqlDataSource ID="sqlDS_Instrumentos" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>" SelectCommand="WS_Get_Lista_Estadisticas" SelectCommandType="StoredProcedure" CancelSelectOnNullParameter="False">
                                                                 <SelectParameters>
                                                                     <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                                                                     <asp:ControlParameter ControlID="hdf_Idioma" DefaultValue="" Name="Idioma" PropertyName="Value" Type="String" />
                                                                     <asp:ControlParameter ControlID="ddl_FiltroRegion" DefaultValue="0" Name="Region" PropertyName="SelectedValue" Type="Int32" />
                                                                     <asp:ControlParameter ControlID="ddl_FiltroPais" DefaultValue="0" Name="Cod_Unidad" PropertyName="SelectedValue" Type="String" />
                                                                 </SelectParameters>
                                                             </asp:SqlDataSource>
                                                         </div>
                                                         <div class="panel-footer"></div>
                                                     </div>
                                                 </div>
                                             </div>
                                         </div>
                                         <div class="modal-footer">
                                             <button type="button" class="btn btn-default" data-dismiss="modal">
                                                 <asp:Localize ID="lcl_Cerrar" runat="server" Text="Cerrar"></asp:Localize>
                                             </button>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                         </div>
                     </div>
                 </div>
                 <div class="row margin-top-10">

                 </div>

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

                     <div class="col-md-2">
                         <asp:Localize ID="lcl_FiltroAgrovoc" runat="server" Text="Filtrar por Agrovoc"></asp:Localize>
                         <asp:DropDownList ID="ddl_FiltroAgrovoc" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="sqlDS_Agrovoc" DataTextField="Termino_ES" DataValueField="FK_id_CodigoAgrovoc" Width="98%"></asp:DropDownList>

                         <asp:SqlDataSource ID="sqlDS_Agrovoc" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>" SelectCommand="WS_Get_Lista_PalabrasAgrovocxIdentificacionProyecto" SelectCommandType="StoredProcedure">
                             <SelectParameters>
                                 <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                             </SelectParameters>
                         </asp:SqlDataSource>

                     </div>
                     <div class="col-md-2">
                         <asp:Localize ID="lcl_FiltroFondos" runat="server" Text="Filtrar por Fondos"></asp:Localize>
                         <asp:DropDownList ID="ddl_TipoFondo" runat="server" CssClass="form-control"
                             SelectedValue='<%# Bind("TipoFondo") %>' AutoPostBack="True" Width="98%">
                             <asp:ListItem Value="0" Text="Todos"></asp:ListItem>
                             <asp:ListItem Value="1" Text="Recursos IICA"></asp:ListItem>
                             <asp:ListItem Value="2" Text="Recursos Externos"></asp:ListItem>
                             <asp:ListItem Value="3" Text="Mixto"></asp:ListItem>
                         </asp:DropDownList>
                     </div>
                     <div class="col-md-4">
                         <div class="divFloatRight">
                             <asp:Localize ID="Localize1" runat="server" Text="Filtrar por"></asp:Localize>
                             <div class="input-group">
                                 <asp:TextBox ID="txt_buscar" runat="server" CssClass="form-control" Width="70%" placeholder="Palabra clave"></asp:TextBox>&nbsp;
                            <asp:Button ID="btn_buscar" runat="server" Text="Buscar" CssClass="btn btn-info" />
                             </div>
                    </div>
                </div>

                 </div>

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
                             <asp:ControlParameter ControlID="ddl_FiltroRegion" DefaultValue="0" Name="Region" PropertyName="SelectedValue" Type="Int32" />
                             <asp:ControlParameter ControlID="ddl_FiltroPais" DefaultValue="0" Name="Cod_Unidad" PropertyName="SelectedValue" Type="String" />
                             <asp:ControlParameter ControlID="ddl_FiltroAgrovoc" DefaultValue="0" Name="FK_id_CodigoAgrovoc" PropertyName="SelectedValue" Type="Int32" />

                             <asp:ControlParameter ControlID="ddl_TipoFondo" Name="Fondo" PropertyName="SelectedValue" Type="Int32" />

                             <asp:ControlParameter ControlID="txt_buscar" DefaultValue="0" Name="Clave" PropertyName="Text" Type="String" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                 </div>

             </ContentTemplate>
         </asp:UpdatePanel>


     </div>

</asp:Content>
