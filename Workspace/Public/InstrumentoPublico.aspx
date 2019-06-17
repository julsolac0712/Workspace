<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/SiteEmbed.Master" CodeBehind="InstrumentoPublico.aspx.vb" Inherits="WorkSpace.InstrumentoPublico" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HiddenField ID="hdf_CronoICT" runat="server" />
    <asp:HiddenField ID="hdf_SubCronoICT" runat="server" />
    <asp:HiddenField ID="hdf_NumOperativo" runat="server" />
    <asp:HiddenField ID="hdf_Idioma" runat="server" />    
    <asp:FormView ID="fv_Instrumento" RenderOuterTable="false" runat="server" DataSourceID="sqlDS_Instrumentos">
        <ItemTemplate>
            <ul class="breadcrumb">
                <li>
                  <asp:HyperLink ID="lnk_Regresar" Text="Listado" NavigateUrl="~/Public/PanelInstrumentos.aspx" runat="server"></asp:HyperLink></li>
                <li>
                    <asp:Localize ID="lcl_ProyectoBC" Text="Proyecto: " runat="server"></asp:Localize><asp:Literal ID="ltl_CronoBC" runat="server" Text='<%# Eval("CronoICT") %>'></asp:Literal>
                </li>
            </ul> 
            <h1 class="iica-blue-header">
                <asp:Literal ID="ltl_CodigoProyecto" runat="server" Text='<%# Eval("CronoICT") %>'></asp:Literal>
                -
                <asp:Literal ID="ltl_CronoICT" runat="server" Text='<%# Eval("SubCronoICT") %>'></asp:Literal>
                <asp:Literal ID="ltl_NombreProyecto" runat="server" Text='<%# Eval("NombreInstrumento") %>'></asp:Literal>
            </h1>
            <div class="iica-project-container col-md-9">
                <div class="row">
                    <div class="col-md-12">
                        <div class="row margin-top-10">
                            <div class="col-md-6">
                                <asp:Label ID="lbl_Responsable" runat="server" Text="Responsable:" AssociatedControlID="lnk_Responsable"> </asp:Label>
                                <asp:HyperLink ID="lnk_Responsable" NavigateUrl='<%# Eval("LinkAP") %>' Target="_blank" runat="server" Text='<%# Eval("ResponsableProyecto") %>'></asp:HyperLink>
                                <hr style="margin: 2px 0;" />
                                <asp:Label ID="lbl_PaisSede" runat="server" Text="País Sede:" AssociatedControlID="ltl_PaisSede"></asp:Label>
                                <asp:Literal ID="ltl_PaisSede" runat="server" Text='<%# Eval("Pais")  %>'></asp:Literal>
                            </div>
                            <div class="col-md-6">
                                <asp:Label ID="lbl_FechaInicio" runat="server" Text="Inicio:" AssociatedControlID="ltl_FechaInicio"> </asp:Label>
                                <asp:Literal ID="ltl_FechaInicio" runat="server" Text='<%# Eval("FechaInicio", "{0:dd/MM/yyyy}") %>'></asp:Literal>
                                <hr style="margin: 2px 0;" />
                                <asp:Label ID="lbl_Vigencia" runat="server" Text="Finalización:" AssociatedControlID="ltl_Vigencia"></asp:Label>
                                <asp:Literal ID="ltl_Vigencia" runat="server" Text='<%# Eval("FechaFinalizacion", "{0:dd/MM/yyyy}") %>'></asp:Literal>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row margin-top-10">
                    <div class="col-md-12">
                        <asp:Label ID="lbl_Objetivos" runat="server" Text="Objetivo General:" AssociatedControlID="ltl_ObjetivoGeneral"></asp:Label>
                        <asp:Literal ID="ltl_ObjetivoGeneral" runat="server" Text='<%# Eval("ObjetivoGeneral") %>'></asp:Literal>
                    </div>
                </div>
                <div class="row margin-top-10">
                    <div class="col-md-12">
                        <label>
                            <asp:Localize ID="lcl_ObjetivosEspecificos" Text="Objetivos específicos:" runat="server"></asp:Localize></label>
                        <asp:ListView ID="lv_Objetivos" ItemType="" DataSourceID="sqlDS_Objetivos" runat="server">
                            <LayoutTemplate>
                                <ol>
                                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                </ol>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <li>
                                    <asp:Literal ID="ltl_Objetivo" runat="server" Text='<%# Eval("Descripcion") %>'></asp:Literal>
                                </li>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                    <asp:SqlDataSource ID="sqlDS_Objetivos" runat="server" CancelSelectOnNullParameter="false" ConnectionString='<%$ ConnectionStrings:SUGIConnectionString %>' SelectCommand="CPS2_ICT_Get_Lista_Proy_Instrumentos_ObEspecificos" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hdf_CronoICT" PropertyName="Value" Name="CronoICT" Type="Int32"></asp:ControlParameter>
                            <asp:ControlParameter ControlID="hdf_SubCronoICT" PropertyName="Value" Name="SubCronoICT" Type="String"></asp:ControlParameter>
                            <asp:ControlParameter ControlID="hdf_Idioma" PropertyName="Value" Name="Idioma" Type="String"></asp:ControlParameter>
                            <asp:Parameter Name="Usuario" Type="Int32"></asp:Parameter>
                            <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32"></asp:Parameter>
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="row margin-top-10">
                    <div class="col-md-12">
                        <label>
                            <asp:Localize ID="lvl_Resultados" Text="Resultados esperados:" runat="server"></asp:Localize></label>
                        <asp:ListView ID="lv_Resultados" ItemType="" DataSourceID="sqlDS_Resultados" runat="server">
                            <LayoutTemplate>
                                <ol>
                                    <asp:PlaceHolder ID="itemPlaceholder" runat="server" />
                                </ol>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <li>
                                    <asp:Literal ID="ltl_Resultado" runat="server" Text='<%# Eval("DesResultado") %>'></asp:Literal>
                                </li>
                            </ItemTemplate>
                        </asp:ListView>
                        <asp:SqlDataSource ID="sqlDS_Resultados" runat="server" ConnectionString="<%$ ConnectionStrings:SUGIConnectionString %>"
                            SelectCommand="SUGI_ICT_Get_Lista_Resultados" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="hdf_CronoICT" Name="CronoICT" PropertyName="Value" Type="Int32" />
                                <asp:ControlParameter ControlID="hdf_SubCronoICT" Name="subcronoICT" PropertyName="Value" Type="String" />
                                <asp:ControlParameter ControlID="hdf_NumOperativo" Name="Presupuesto" PropertyName="Value" Type="Int32" DefaultValue="24" />
                                <asp:ControlParameter ControlID="hdf_Idioma" Name="Idioma" PropertyName="Value" Type="String" DefaultValue="es" />
                                <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                </div>
                <div class="row margin-top-10">
                    <div class="col-md-12">
                        <hr />
                        <asp:Label ID="lbl_TotalRecursos" runat="server" Text="Recursos totales:" AssociatedControlID="ltl_TotalRecursos"> </asp:Label>
                        <asp:Literal ID="ltl_TotalRecursos" runat="server" Text='<%# Eval("TotalRec") %>'></asp:Literal>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <h2 class="iica-otros-rec">
                    <asp:Localize ID="lcl_Rec_Adicionales" Text="Otros Recursos" runat="server"></asp:Localize></h2>
                <asp:HyperLink ID="lnk_Noticias" CssClass="btn btn-iica-proy blue" Target="_blank" NavigateUrl='<%# "http://iica.int/noticias-proy/" & Eval("CronoICT") & "-" & Eval("SubCronoICT") %>' Text="Noticias" runat="server"></asp:HyperLink>
                <asp:HyperLink ID="lnk_Documentos" CssClass="btn btn-iica-proy blue" Target="_blank" NavigateUrl='<%# "http://iica.int/docs/" & Eval("CronoICT") & "-" & Eval("SubCronoICT") %>' Text="Documentos" runat="server"></asp:HyperLink>
                <asp:HyperLink ID="lnk_Videos" CssClass="btn btn-iica-proy blue" Target="_blank" Text="Videos" NavigateUrl='<%# "http://iica.int/videos-proy/" & Eval("CronoICT") & "-" & Eval("SubCronoICT") %>' runat="server"></asp:HyperLink>
                <asp:HyperLink ID="lnk_Fotografias" CssClass="btn btn-iica-proy blue" Target="_blank" Text="Fotografías" NavigateUrl='<%# "http://iica.int/fotografias-proy/" & Eval("CronoICT") & "-" & Eval("SubCronoICT") %>' runat="server"></asp:HyperLink>
                <asp:HyperLink ID="lnk_Eventos" CssClass="btn btn-iica-proy blue" Target="_blank" Text="Eventos" NavigateUrl='<%# "http://iica.int/eventos-proy/" & Eval("CronoICT") & "-" & Eval("SubCronoICT") %>' runat="server"></asp:HyperLink>
            </div>
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="sqlDS_Instrumentos" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>"
        SelectCommand="WS_Get_Lista_IdentificacionProyecto"
        SelectCommandType="StoredProcedure"
        UpdateCommand="WS_Man_IdentificacionProyecto"
        UpdateCommandType="StoredProcedure"
        CancelSelectOnNullParameter="False">
        <SelectParameters>
            <asp:ControlParameter ControlID="hdf_CronoICT" Name="CronoICT" PropertyName="Value" Type="Int32" />
            <asp:ControlParameter ControlID="hdf_SubCronoICT" Name="SubCronoICT" PropertyName="Value" Type="String" />
            <asp:SessionParameter SessionField="lang" Name="Idioma" Type="String" DefaultValue="es" />
            <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
