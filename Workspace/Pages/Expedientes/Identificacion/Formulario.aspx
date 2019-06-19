<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Formulario.aspx.vb" Inherits="WorkSpace.Formulario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <asp:HiddenField ID="hdf_Operacion" runat="server" />
        <asp:HiddenField ID="hdf_Usuario" runat="server" />
        <asp:HiddenField ID="hdf_Idioma" runat="server" />
        <asp:HiddenField ID="hdf_CronoICT" runat="server" />
        <asp:HiddenField ID="hdf_SubCronoICT" runat="server" />
        <asp:HiddenField ID="hdf_OperacionPaises" runat="server" />
        <asp:HiddenField ID="hdf_NumOperativo" runat="server" />
        <asp:HiddenField ID="FK_ID_Expediente" runat="server" />
        <asp:HiddenField ID="hdf_ID_Expediente" runat="server" />
        <asp:HiddenField ID="hdf_CodTerm" runat="server" />
        <asp:HiddenField ID="hdf_Ingles" runat="server" />
        <asp:HiddenField ID="hdf_Espanol" runat="server" />
        <asp:HiddenField ID="hdf_Frances" runat="server" />
        <asp:HiddenField ID="hdf_Portuguez" runat="server" />
        <asp:HiddenField ID="hdf_OperacionODS" runat="server" />
        <asp:HiddenField ID="hdf_OperacionTema" runat="server" />

        <div class="margin-top-10 ">
            <div id="exTab2" class="container margin-top-30">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#0" data-toggle="tab">
                        <asp:Localize ID="lcl_Identificacion" runat="server" Text="Identificación"></asp:Localize></a>
                    </li>
                    <li><a href="#1" data-toggle="tab">
                        <asp:Localize ID="lcl_PaisesInvolucrados" runat="server" Text="Otros datos relacionados"></asp:Localize></a>
                    </li>
                    <li><a href="#2" data-toggle="tab">
                            <asp:Localize ID="lcl_Resultados" runat="server" Text="Resultados"></asp:Localize></a>
                    </li>
                    <li><a href="#3" data-toggle="tab">
                        <asp:Localize ID="lcl_RecursosIICA" runat="server" Text="Recursos IICA y Externos"></asp:Localize></a>
                    </li>
                    <li><a href="#4" data-toggle="tab">
                        <asp:Localize ID="lcl_PalabrasClave" runat="server" Text="Palabras Clave"></asp:Localize></a>
                    </li>
                    <li><a href="#5" data-toggle="tab">
                        <asp:Localize ID="lcl_Enlaces" runat="server" Text="Enlaces"></asp:Localize></a>
                    </li>
                </ul>
                <div class="tab-content margin-top-30">
                    <div class="tab-pane active" id="0">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <span class="page-titles">
                                    <asp:Localize ID="lcl_Descripcion" runat="server" Text="Identificación e Iniciativas  Proyectos IICA"></asp:Localize>
                                </span>
                                <asp:LinkButton runat="server" class="btn edit-profile" ID="lnkBtn_EditarID" ToolTip="Editar">
                                <span class="glyphicon glyphicon-pencil imagen-edit-profile"></span>
                                </asp:LinkButton>
                                <div class="margin-top-30">
                                    <asp:FormView ID="fv_Perfil" runat="server" DataSourceID="sqlDS_Instrumentos" RenderOuterTable="False" DataKeyNames="PK_ID_Proyecto,lastUpdate">
                                        <ItemTemplate>
                                            <div class="row margin-top-10">
                                                <div class="col-md-12">
                                                    <asp:Label ID="lbl_NombreProyecto" runat="server" Text="Nombre:" AssociatedControlID="ltl_NombreProyecto"></asp:Label>
                                                    <asp:Literal ID="ltl_CodigoProyecto" runat="server" Text='<%# Eval("Codigo") + "/" %>'></asp:Literal>
                                                    <asp:Literal ID="ltl_CronoICT" runat="server" Text='<%# Eval("CronoICT") %>'></asp:Literal>
                                                    <asp:Literal ID="ltl_SubCronoICT" runat="server" Text='<%# " - " + Eval("SubCronoICT") + " / " %>'></asp:Literal>
                                                    <asp:Literal ID="ltl_NombreProyecto" runat="server" Text='<%# Eval("NombreInstrumento") %>'></asp:Literal>
                                                </div>
                                            </div>
                                            <div class="row margin-top-10">
                                                <div class="col-md-6">
                                                    <asp:Label ID="lbl_Responsable" runat="server" Text="Responsable:" AssociatedControlID="ltl_Responsable"> </asp:Label>
                                                    <asp:Literal ID="ltl_Responsable" runat="server" Text='<%# Eval("ResponsableProyecto") %>'></asp:Literal>
                                                </div>
                                                <div class="col-md-3">
                                                    <asp:Label ID="lbl_FechaInicio" runat="server" Text="F. Inicio:" AssociatedControlID="ltl_FechaInicio"> </asp:Label>
                                                    <asp:Literal ID="ltl_FechaInicio" runat="server" Text='<%# Eval("FechaInicio", "{0:dd/MM/yyyy}") %>'></asp:Literal>
                                                </div>
                                                <div class="col-md-3">
                                                    <asp:Label ID="lbl_Vigencia" runat="server" Text="F.Finalización:" AssociatedControlID="ltl_Vigencia"></asp:Label>
                                                    <asp:Literal ID="ltl_Vigencia" runat="server" Text='<%# Eval("FechaFinalizacion", "{0:dd/MM/yyyy}") %>'></asp:Literal>
                                                </div>
                                            </div>
                                            <div class="row margin-top-10">
                                                <div class="col-md-12">
                                                    <asp:Label ID="lbl_Contribucion" runat="server" Text="Relación con PMP:" AssociatedControlID="ltl_Contribucion"></asp:Label>
                                                    <asp:Literal ID="ltl_Contribucion" runat="server" Text='<%# Eval("Contribucion")  %>'></asp:Literal>
                                                </div>
                                            </div>
                                         <%--   <div class="row margin-top-10">
                                                <div class="col-md-12">
                                                    <asp:Label ID="lbl_Expediente" runat="server" Text="Expediente:" AssociatedControlID="ltl_Expediente"></asp:Label>
                                                    <asp:Literal ID="ltl_Expediente" runat="server" Text='<%# Eval("Expediente")  %>'></asp:Literal>
                                                    <asp:HiddenField ID="hdf_Expediente" runat="server" Value='<%# Eval("FK_ID_Expediente")  %>'></asp:HiddenField>
                                                </div>
                                            </div>--%>
                                            <div class="row margin-top-10">
                                                <div class="col-md-12">
                                                    <asp:Label ID="lbl_TipoInstrumento" runat="server" Text="Tipo Instrumento:" AssociatedControlID="ltl_TipoInstrumento"></asp:Label>
                                                    <asp:Literal ID="ltl_TipoInstrumento" runat="server" Text='<%# Eval("TipoInstrumento")  %>'></asp:Literal>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <asp:Label ID="lbl_PaisSede" runat="server" Text="País Sede:" AssociatedControlID="ltl_PaisSede"></asp:Label>
                                                    <asp:Literal ID="ltl_PaisSede" runat="server" Text='<%# Eval("Pais")  %>'></asp:Literal>
                                                </div>
                                            </div>
                                            <div class="row margin-top-10">
                                                <div class="col-md-12">
                                                    <asp:Label ID="lbl_Fondo" runat="server" Text="Fondos:" AssociatedControlID="ltl_Fondo"></asp:Label>
                                                    <asp:Literal ID="ltl_Fondo" runat="server" Text='<%# Eval("Fondo")  %>'></asp:Literal>
                                                </div>
                                            </div>
                                            <div class="row margin-top-10">
                                                <div class="col-md-12">
                                                    <asp:Label ID="lbl_TipoAmbito" runat="server" Text="Ámbito:" AssociatedControlID="ltl_TipoAmbito"></asp:Label>
                                                    <asp:Literal ID="ltl_TipoAmbito" runat="server" Text='<%# Eval("TipoAmbito")  %>'></asp:Literal>
                                                </div>
                                            </div>
                                            <div class="row margin-top-10">
                                                <div class="col-md-12">
                                                    <asp:Label ID="lbl_Descripcion" runat="server" Text="Descripción:" AssociatedControlID="ltl_Descripcion"></asp:Label>
                                                    <asp:Literal ID="ltl_Descripcion" runat="server" Text='<%# Eval("Descripcion") %>'></asp:Literal>
                                                </div>
                                            </div>
                                            <div class="row margin-top-10">
                                                <div class="col-md-12">
                                                    <asp:Label ID="lbl_Objetivos" runat="server" Text="Objetivo General:" AssociatedControlID="ltl_Objetivos"></asp:Label>
                                                    <asp:Literal ID="ltl_Objetivos" runat="server" Text='<%# Eval("ObjetivoGeneral") %>'></asp:Literal>
                                                </div>
                                            </div>
                                             <div class="row margin-top-10">
                                                <div class="col-md-12">
                                                    <asp:Label ID="Label1" runat="server" Text="Latitud:" AssociatedControlID="ltl_Latitud"></asp:Label>
                                                    <asp:Literal ID="ltl_Latitud" runat="server" Text='<%# Eval("Latitud") %>'></asp:Literal>
                                                </div>
                                            </div>
                                            <div class="row margin-top-10">
                                                 <div class="col-md-12">
                                                    <asp:Label ID="Label2" runat="server" Text="Longitud:" AssociatedControlID="ltl_Longitud"></asp:Label>
                                                    <asp:Literal ID="ltl_Longitud" runat="server" Text='<%# Eval("Longitud") %>'></asp:Literal>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <asp:Label ID="lbl_NombreProyecto" runat="server" Text="Nombre:" AssociatedControlID="txt_NombreProyecto"></asp:Label>
                                                    <asp:Literal ID="ltl_CronoICT" runat="server" Text='<%# Eval("CronoICT") %>'></asp:Literal>
                                                    <asp:Literal ID="ltl_SubCronoICT" runat="server" Text='<%# " - " + Eval("SubCronoICT") + " / " %>'></asp:Literal>
                                                </div>
                                                <div class="col-md-10">
                                                    <asp:TextBox ID="txt_NombreProyecto" runat="server" Text='<%# Bind("NombreInstrumento") %>' CssClass="form-control" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfv_NombreProyecto" runat="server" ControlToValidate="txt_NombreProyecto"
                                                        ErrorMessage="Requerido" Text="<%$ Resources:Global , CampoRequerido %>" CssClass="error-span"
                                                        Display="Dynamic" ValidationGroup="Registro"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="row margin-top-10">
                                                <div class="col-md-2">
                                                    <asp:Label ID="lbl_Responsable" runat="server" Text="Responsable:" AssociatedControlID="ltl_Responsable"> </asp:Label>
                                                </div>
                                                <div class="col-md-4">
                                                    <asp:Literal ID="ltl_Responsable" runat="server" Text='<%# Eval("ResponsableProyecto") %>'></asp:Literal>
                                                </div>
                                                <div class="col-md-3">
                                                    <asp:Label ID="lbl_FechaInicio" runat="server" Text="F. Inicio:" AssociatedControlID="ltl_FechaInicio"> </asp:Label>
                                                    <asp:Literal ID="ltl_FechaInicio" runat="server" Text='<%# Eval("FechaInicio", "{0:dd/MM/yyyy}") %>'></asp:Literal>
                                                </div>
                                                <div class="col-md-3">
                                                    <asp:Label ID="lbl_Vigencia" runat="server" Text="F.Finalización:" AssociatedControlID="ltl_Vigencia"></asp:Label>
                                                    <asp:Literal ID="ltl_Vigencia" runat="server" Text='<%# Eval("FechaFinalizacion", "{0:dd/MM/yyyy}") %>'></asp:Literal>
                                                </div>
                                            </div>
                                            <div class="row margin-top-10">
                                                <div class="col-md-2">
                                                    <asp:Label ID="lbl_Contribucion" runat="server" Text="Relación con PMP:" AssociatedControlID="ltl_Contribucion"></asp:Label>
                                                </div>
                                                <div class="col-md-10">
                                                    <asp:Literal ID="ltl_Contribucion" runat="server" Text='<%# Eval("Contribucion")  %>'></asp:Literal>
                                                </div>
                                            </div>
                                         <%--   <div class="row margin-top-10">
                                                <div class="col-md-2">
                                                    <asp:Label ID="lbl_Expediente" runat="server" Text="Expediente:" AssociatedControlID="ddl_Expediente"></asp:Label>
                                                </div>
                                                <div class="col-md-5">
                                                    <asp:DropDownList ID="ddl_Expediente" runat="server" CssClass="form-control" SelectedValue='<%# Bind("FK_ID_Expediente")  %>'
                                                        DataTextField="Descripcion" DataValueField="PK_ID_Expediente" DataSourceID="sqlDS_Expediente">
                                                    </asp:DropDownList>
                                                    <asp:CompareValidator ID="cv_Expediente" runat="server" ControlToValidate="ddl_Expediente" ValueToCompare="0" Operator="NotEqual"
                                                        ErrorMessage="Requerido" Text="<%$ Resources:Global , CampoRequerido %>" CssClass="error-span"
                                                        Display="Dynamic" ValidationGroup="Registro"></asp:CompareValidator>
                                                    <asp:SqlDataSource ID="sqlDS_Expediente" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>"
                                                        SelectCommand="WS_Get_Lista_Expediente"
                                                        SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="hdf_Idioma" Name="Idioma" PropertyName="Value" Type="String" DefaultValue="es" />
                                                            <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div>
                                            </div>--%>
                                            <div class="row margin-top-10">
                                                <div class="col-md-2">
                                                    <asp:Label ID="lbl_TipoInstrumento" runat="server" Text="Tipo Instrumento:" AssociatedControlID="ddl_TipoInstrumento"></asp:Label>
                                                </div>
                                                <div class="col-md-5">
                                                    <asp:DropDownList ID="ddl_TipoInstrumento" runat="server" CssClass="form-control"
                                                        SelectedValue='<%# Bind("FK_ID_TipoInstrumento")  %>'
                                                        DataTextField="Descripcion" DataValueField="PK_ID_TipoInstrumento" DataSourceID="sqlDS_TipoInstrumento">
                                                    </asp:DropDownList>
                                                    <asp:CompareValidator ID="cv_TipoInstrumento" runat="server" ControlToValidate="ddl_TipoInstrumento" ValueToCompare="0" Operator="NotEqual"
                                                        ErrorMessage="Requerido" Text="<%$ Resources:Global , CampoRequerido %>" CssClass="error-span"
                                                        Display="Dynamic" ValidationGroup="Registro"></asp:CompareValidator>
                                                    <asp:SqlDataSource ID="sqlDS_TipoInstrumento" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>"
                                                        SelectCommand="WS_Get_Lista_TipoInstrumento"
                                                        SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="hdf_Idioma" Name="Idioma" PropertyName="Value" Type="String" DefaultValue="es" />
                                                            <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div>
                                            </div>
                                             <div class="row margin-top-10">
                                                <div class="col-md-2">
                                                    <asp:Label ID="lbl_Pais" runat="server" Text="País Sede:" AssociatedControlID="ddl_PaisSede"></asp:Label>
                                                </div>
                                                   <div class="col-md-5">
                                                    <asp:DropDownList ID="ddl_PaisSede" runat="server" CssClass="form-control" DataSourceID="sqlDS_PaisSede" DataTextField="Descripcion" DataValueField="Cod_Unidad" SelectedValue='<%# Bind("SedeProy") %>'></asp:DropDownList>
                                                    <asp:SqlDataSource ID="sqlDS_PaisSede" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>" SelectCommand="WS_Get_Lista_Paises" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:Parameter DefaultValue="3" Name="Operacion" Type="Int32" />
                                                            <asp:ControlParameter ControlID="hdf_Idioma" DefaultValue="es" Name="Idioma" PropertyName="Value" Type="String" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div>
                                            </div>
                                            <div class="row margin-top-10">
                                                <div class="col-md-2">
                                                    <asp:Label ID="lbl_TipoFondo" runat="server" Text="Fondos:" AssociatedControlID="ddl_TipoFondo"></asp:Label>
                                                </div>
                                                <div class="col-md-5">
                                                    <asp:DropDownList ID="ddl_TipoFondo" runat="server" CssClass="form-control"
                                                        SelectedValue='<%# Bind("TipoFondo") %>'>
                                                        <asp:ListItem Value="0" Text="Sin Definir"></asp:ListItem>
                                                        <asp:ListItem Value="1" Text="Recursos IICA"></asp:ListItem>
                                                        <asp:ListItem Value="2" Text="Recursos Externos"></asp:ListItem>
                                                        <asp:ListItem Value="3" Text="Mixto"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:CompareValidator ID="cv_TipoFondo" runat="server" ControlToValidate="ddl_TipoFondo" ValueToCompare="0" Operator="NotEqual"
                                                        ErrorMessage="Requerido" Text="<%$ Resources:Global , CampoRequerido %>" CssClass="error-span"
                                                        Display="Dynamic" ValidationGroup="Registro"></asp:CompareValidator>
                                                </div>
                                            </div>
                                            <div class="row margin-top-10">
                                                <div class="col-md-2">
                                                    <asp:Label ID="lbl_TipoAmbito" runat="server" Text="Ámbito:" AssociatedControlID="ddl_TipoAmbito"> </asp:Label>
                                                </div>
                                                <div class="col-md-5">
                                                    <asp:DropDownList ID="ddl_TipoAmbito" runat="server" CssClass="form-control"
                                                        SelectedValue='<%# Bind("FK_ID_TipoAmbito")  %>'
                                                        DataTextField="Descripcion" DataValueField="PK_ID_TipoAmbito" DataSourceID="sqlDS_TipoAmbito">
                                                    </asp:DropDownList>
                                                    <asp:CompareValidator ID="cv_TipoAmbito" runat="server" ControlToValidate="ddl_TipoAmbito" ValueToCompare="0" Operator="NotEqual"
                                                        ErrorMessage="Requerido" Text="<%$ Resources:Global , CampoRequerido %>" CssClass="error-span"
                                                        Display="Dynamic" ValidationGroup="Registro"></asp:CompareValidator>
                                                    <asp:SqlDataSource ID="sqlDS_TipoAmbito" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>"
                                                        SelectCommand="WS_Get_Lista_TipoAmbito"
                                                        SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="hdf_Idioma" Name="Idioma" PropertyName="Value" Type="String" DefaultValue="es" />
                                                            <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div>
                                            </div>
                                            <div class="row margin-top-10">
                                                <div class="col-md-2">
                                                    <asp:Label ID="lbl_Descripcion" runat="server" Text="Descripción:" AssociatedControlID="txt_Descripcion"></asp:Label>
                                                </div>
                                                <div class="col-md-10">
                                                    <asp:TextBox ID="txt_Descripcion" runat="server" Text='<%# Bind("Descripcion") %>' CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfv_Descripcion" runat="server" ControlToValidate="txt_Descripcion"
                                                        ErrorMessage="Requerido" Text="<%$ Resources:Global , CampoRequerido %>" CssClass="error-span"
                                                        Display="Dynamic" ValidationGroup="Registro"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="row margin-top-10">
                                                <div class="col-md-2">
                                                    <asp:Label ID="lbl_Objetivos" runat="server" Text="Objetivo General:" AssociatedControlID="txt_Objetivos"></asp:Label>
                                                </div>
                                                <div class="col-md-10">
                                                    <asp:TextBox ID="txt_Objetivos" runat="server" Text='<%# Bind("ObjetivoGeneral") %>' CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="rfv_Objetivos" runat="server" ControlToValidate="txt_Objetivos"
                                                        ErrorMessage="Requerido" Text="<%$ Resources:Global , CampoRequerido %>" CssClass="error-span"
                                                        Display="Dynamic" ValidationGroup="Registro"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                            <div class="row margin-top-10">
                                                <div class="col-md-2">
                                                    <asp:Label ID="lbl_Latitud" runat="server" Text="Latitud:" AssociatedControlID="txt_Latitud"></asp:Label>
                                                </div>
                                                <div class="col-md-4">
                                                    <asp:TextBox ID="txt_Latitud" runat="server" Text='<%# Bind("Latitud") %>' CssClass="form-control"></asp:TextBox>
                                                </div>
                                                <div class="col-md-2">
                                                    <asp:Label ID="lbl_Longitud" runat="server" Text="Longitud:" AssociatedControlID="txt_Longitud"></asp:Label>
                                                </div>
                                                <div class="col-md-4">
                                                    <asp:TextBox ID="txt_Longitud" runat="server" Text='<%# Bind("Longitud") %>' CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>


                                            <div class="row margin-top-10">
                                                <div class="col-md-2 col-sm-offset-2">
                                                    <asp:Button ID="btn_Guardar_Edit" runat="server" Text="Guardar Formulario" CssClass="btn btn-iica-green" CommandName="Update" CausesValidation="true" ValidationGroup="Registro" />
                                                </div>
                                                <div class="col-md-2">
                                                    <asp:Button ID="btn_Cancelar" runat="server" Text="Cancelar" CssClass="btn btn-iica-green" CommandName="Cancel" OnClick="btn_Cancelar_Click" />
                                                </div>
                                            </div>
                                        </EditItemTemplate>
                                    </asp:FormView>
                                </div>
                                <div class="margin-top-30">
                                    <asp:GridView ID="gv_PalabrasClave" runat="server" CssClass="table table-bordered" Width="100%"
                                        AllowPaging="True" AutoGenerateColumns="False" ShowHeader="True"
                                        DataSourceID="sqlDS_PalabrasClave">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Palabras Clave del Expediente">
                                                <ItemTemplate>
                                                    <asp:Literal runat="server" ID="PalClave" Mode="PassThrough" Text='<%# PrintKeyWords(Eval("Descripcion"), Eval("Contador")) %>'></asp:Literal>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="sqlDS_PalabrasClave" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>"
                                        SelectCommand="WS_Get_Lista_PalabrasClavexExpediente"
                                        SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_ID_Expediente" Name="FK_ID_Expediente" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_Idioma" DefaultValue="es" Name="Idioma" PropertyName="Value" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="tab-pane" id="1">
                        <span class="page-titles">
                            <asp:Localize ID="lcl_Descripcion_Paises" runat="server" Text="Otros datos relacionados"></asp:Localize>
                        </span>
                        <div class="margin-top-30">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="gv_PaisesInvolucrados" runat="server" CssClass="table table-bordered" Width="100%" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="sqlDS_PaisesInvolucrados" DataKeyNames="PK_ID_PaisesxProyecto">
                                        <Columns>
                                            <asp:TemplateField ShowHeader="False">
                                                <EditItemTemplate>
                                                    <asp:LinkButton ID="lnk_Guardar_Pais" runat="server" ClientIDMode="AutoID" CommandName="Update" ValidationGroup="Registro" CssClass="btn btn-default" ToolTip="<%$ Resources:Global, SalvarTooltip %>"><span class="glyphicon glyphicon-ok glyphicons-iica"></span></asp:LinkButton>
                                                    <asp:LinkButton ID="lnk_Cancelar_Pais" runat="server" ClientIDMode="AutoID" CommandName="Cancel" CssClass="btn btn-default" ToolTip="<%$ Resources:Global, CancelarTooltip %>"><span class="glyphicon glyphicon-remove glyphicons-iica"></asp:LinkButton>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnk_Editar_Pais" runat="server" ClientIDMode="AutoID" CommandName="Edit" ToolTip="<%$ Resources:Global, ActualizarTooltip %>" CssClass="btn btn-default"><span class="glyphicon glyphicon-edit glyphicons-iica"></span></asp:LinkButton>
                                                    <asp:LinkButton ID="lnk_Eliminar_Pais" runat="server" ClientIDMode="AutoID" CommandName="Delete" ToolTip="<%$ Resources:Global, EliminarTooltip %>" CssClass="btn btn-default" OnClientClick="return confirm('¿Desea eliminar el registro?');"><span class="glyphicon glyphicon-trash glyphicons-iica"></span></asp:LinkButton>
                                                    <asp:LinkButton ID="lnk_Agregar_Pais" runat="server" ClientIDMode="AutoID" CommandName="Edit" ToolTip="<%$ Resources:Global, NuevoTooltip %>" Visible="False" CssClass="btn btn-default"><span class="glyphicon glyphicon-plus glyphicons-iica"></span></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="País" SortExpression="Pais">
                                                <EditItemTemplate>
                                                    <asp:DropDownList ID="ddl_Paises" runat="server" CssClass="form-control" DataSourceID="sqlDS_Paises" DataTextField="DesPais" DataValueField="CodPais" SelectedValue='<%# Bind("FK_ID_Pais") %>' Width="98%"></asp:DropDownList>
                                                    <asp:SqlDataSource ID="sqlDS_Paises" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>" SelectCommand="WS_Get_Lista_Paises" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                                                            <asp:ControlParameter ControlID="hdf_Idioma" DefaultValue="es" Name="Idioma" PropertyName="Value" Type="String" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Localize ID="lcl_Pais" runat="server" Text='<%# Eval("Pais") %>'></asp:Localize>
                                                </ItemTemplate>
                                                <ItemStyle VerticalAlign="Top" Width="70%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Estado" SortExpression="Estado">
                                                <EditItemTemplate>
                                                    <asp:DropDownList runat="server" ID="ddl_Estado" SelectedValue='<%# Bind("Estado") %>' CssClass="form-control">
                                                        <asp:ListItem Text="Activo" Value="1"></asp:ListItem>
                                                        <asp:ListItem Text="Inactivo" Value="0"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator ID="rfv_Estado" runat="server" ControlToValidate="ddl_Estado"
                                                        ErrorMessage="Requerido" Text="<%$ Resources:Global , CampoRequerido %>" CssClass="error-span"
                                                        Display="Dynamic" ValidationGroup="Registro"></asp:RequiredFieldValidator>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_Estado" runat="server" Text='<%# Eval("TipoEstado") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle VerticalAlign="Top" Width="20%" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="sqlDS_PaisesInvolucrados" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>"
                                        DeleteCommand="WS_Man_PaisesxProyecto" DeleteCommandType="StoredProcedure"
                                        SelectCommand="WS_Get_Lista_PaisesxProyecto"
                                        SelectCommandType="StoredProcedure"
                                        UpdateCommand="WS_Man_PaisesxProyecto" UpdateCommandType="StoredProcedure">
                                        <DeleteParameters>
                                            <asp:ControlParameter ControlID="hdf_Usuario" Name="Usuario" PropertyName="Value" Type="Int32" />
                                            <asp:Parameter Name="Operacion" Type="Int32" DefaultValue="3" />
                                        </DeleteParameters>
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_CronoICT" DefaultValue="" Name="CronoICT" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_SubCronoICT" Name="SubCronoICT" PropertyName="Value" Type="String" />
                                            <asp:ControlParameter ControlID="hdf_Idioma" DefaultValue="es" Name="Idioma" PropertyName="Value" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:ControlParameter ControlID="hdf_CronoICT" DefaultValue="" Name="CronoICT" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_SubCronoICT" Name="SubCronoICT" PropertyName="Value" Type="String" />
                                            <asp:ControlParameter ControlID="hdf_Usuario" DefaultValue="2815" Name="Usuario" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_OperacionPaises" DefaultValue="2" Name="Operacion" PropertyName="Value" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div class="margin-top-30">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="gv_ODS" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="id_Rel_ODS" DataSourceID="sqlDS_rel_ODS" Width="100%">
                                        <Columns>
                                            <asp:TemplateField ShowHeader="False">
                                                <EditItemTemplate>
                                                    <asp:LinkButton ID="lnk_Guardar_ODS" runat="server" ClientIDMode="AutoID" CommandName="Update" ValidationGroup="Registro" CssClass="btn btn-default" ToolTip="<%$ Resources:Global, SalvarTooltip %>"><span class="glyphicon glyphicon-ok glyphicons-iica"></span></asp:LinkButton>
                                                    <asp:LinkButton ID="lnk_Cancelar_ODS" runat="server" ClientIDMode="AutoID" CommandName="Cancel" CssClass="btn btn-default" ToolTip="<%$ Resources:Global, CancelarTooltip %>"><span class="glyphicon glyphicon-remove glyphicons-iica"></asp:LinkButton>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                   
                                                    <asp:LinkButton ID="lnk_Eliminar_ODS" runat="server" ClientIDMode="AutoID" CommandName="Delete" ToolTip="<%$ Resources:Global, EliminarTooltip %>" CssClass="btn btn-default" OnClientClick="return confirm('¿Desea eliminar el registro?');"><span class="glyphicon glyphicon-trash glyphicons-iica"></span></asp:LinkButton>
                                                    <asp:LinkButton ID="lnk_Agregar_ODS" runat="server" ClientIDMode="AutoID" CommandName="Edit" ToolTip="<%$ Resources:Global, NuevoTooltip %>" Visible="False" CssClass="btn btn-default"><span class="glyphicon glyphicon-plus glyphicons-iica"></span></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Objetivo de Desarrollo Sostenible" SortExpression="Descripcion_ODS">
                                                <EditItemTemplate>
                                                    <asp:DropDownList ID="ddl_ODS" runat="server" CssClass="form-control" DataSourceID="sqlDS_ODS" DataTextField="Descripcion_ODS" DataValueField="id_ODS" SelectedValue='<%# Bind("FK_id_ODS") %>' Width="98%"></asp:DropDownList>
                                                    <asp:SqlDataSource ID="sqlDS_ODS" runat="server" ConnectionString="<%$ ConnectionStrings:SUGIConnectionString %>" SelectCommand="SUGI_OPOR_Get_Lista_ODS" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                                                            <asp:ControlParameter ControlID="hdf_Idioma" DefaultValue="es" Name="Idioma" PropertyName="Value" Type="String" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_DescripcionODS" runat="server" Text='<%# Eval("Descripcion_ODS") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="sqlDS_rel_ODS" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>" SelectCommand="WS_Get_Lista_ODSxProyecto" SelectCommandType="StoredProcedure" DeleteCommand="WS_Man_Rel_ODSxProyecto" DeleteCommandType="StoredProcedure" UpdateCommand="WS_Man_Rel_ODSxProyecto" UpdateCommandType="StoredProcedure">
                                        <DeleteParameters>
                                            <asp:Parameter DefaultValue="3" Name="Operacion" Type="Int32" />
                                        </DeleteParameters>
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_CronoICT" DefaultValue="" Name="CronoICT" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_SubCronoICT" Name="SubCronoICT" PropertyName="Value" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:ControlParameter ControlID="hdf_OperacionODS" DefaultValue="1" Name="Operacion" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_CronoICT" Name="CronoICT" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_SubCronoICT" Name="SubCronoICT" PropertyName="Value" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div class="margin-top-30">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="gv_Temas" CssClass="table table-bordered" runat="server" AutoGenerateColumns="False" DataKeyNames="id_Rel_Tema" DataSourceID="sqlDS_rel_Temas" Width="100%">
                                        <Columns>
                                             <asp:TemplateField ShowHeader="False">
                                                <EditItemTemplate>
                                                    <asp:LinkButton ID="lnk_Guardar_Tema" runat="server" ClientIDMode="AutoID" CommandName="Update" ValidationGroup="Registro" CssClass="btn btn-default" ToolTip="<%$ Resources:Global, SalvarTooltip %>"><span class="glyphicon glyphicon-ok glyphicons-iica"></span></asp:LinkButton>
                                                    <asp:LinkButton ID="lnk_Cancelar_Tema" runat="server" ClientIDMode="AutoID" CommandName="Cancel" CssClass="btn btn-default" ToolTip="<%$ Resources:Global, CancelarTooltip %>"><span class="glyphicon glyphicon-remove glyphicons-iica"></asp:LinkButton>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnk_Eliminar_Tema" runat="server" ClientIDMode="AutoID" CommandName="Delete" ToolTip="<%$ Resources:Global, EliminarTooltip %>" CssClass="btn btn-default" OnClientClick="return confirm('¿Desea eliminar el registro?');"><span class="glyphicon glyphicon-trash glyphicons-iica"></span></asp:LinkButton>
                                                    <asp:LinkButton ID="lnk_Agregar_Tema" runat="server" ClientIDMode="AutoID" CommandName="Edit" ToolTip="<%$ Resources:Global, NuevoTooltip %>" Visible="False" CssClass="btn btn-default"><span class="glyphicon glyphicon-plus glyphicons-iica"></span></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Programas, tranversalidad y temas IICA" SortExpression="Descripcion_Esp">
                                                <EditItemTemplate>
                                                    <asp:DropDownList ID="ddl_TipoTema" runat="server" CssClass="form-control"
                                                        SelectedValue='<%# Bind("FK_ID_TipoTema")  %>'
                                                        DataTextField="Descripcion" DataValueField="PK_ID_TipoTema" DataSourceID="sqlDS_TipoTema">
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="sqlDS_TipoTema" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>"
                                                        SelectCommand="WS_Get_Lista_TipoTemas"
                                                        SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="hdf_Idioma" Name="Idioma" PropertyName="Value" Type="String" DefaultValue="es" />
                                                            <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_DescripcionTEMA" runat="server" Text='<%# Eval("Descripcion_Esp") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle VerticalAlign="Top" Width="90%" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="sqlDS_rel_Temas" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>" DeleteCommand="WS_Man_Rel_TemaxProyecto" DeleteCommandType="StoredProcedure" SelectCommand="WS_Get_Lista_TemaxProyecto" SelectCommandType="StoredProcedure" UpdateCommand="WS_Man_Rel_TemaxProyecto" UpdateCommandType="StoredProcedure">
                                        <DeleteParameters>
                                            <asp:Parameter DefaultValue="3" Name="Operacion" Type="Int32" />
                                        </DeleteParameters>
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_CronoICT" DefaultValue="" Name="CronoICT" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_SubCronoICT" Name="SubCronoICT" PropertyName="Value" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:ControlParameter ControlID="hdf_OperacionTema" DefaultValue="1" Name="Operacion" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_CronoICT" Name="CronoICT" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_SubCronoICT" Name="SubCronoICT" PropertyName="Value" Type="String" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                    <div class="tab-pane" id="2">
                        <span class="page-titles">
                            <asp:Localize ID="lcl_ResultadosEsperados" runat="server" Text="Resultados Esperados"></asp:Localize>
                        </span>
                        <div class="margin-top-30">
                            <asp:GridView ID="gv_Resultados" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataSourceID="sqlDS_Resultados" Width="100%">
                                <Columns>
                                    <asp:TemplateField HeaderText="Resultados" meta:resourcekey="TemplateFieldResource9">
                                        <ItemTemplate>
                                            <div class="panel-heading panel-heading-custom">
                                                <h4 class="panel-title panel-title-custom">
                                                    <a data-toggle="collapse" href='<%# "#ResultadoResumen" + Convert.ToString(Eval("NumResultado")) %>'>
                                                        <div class="row">
                                                            <div class="col-md-8 alinear-justificado">
                                                                <asp:HiddenField ID="hdf_ID_ResultadoResumen" runat="server" Value='<%# Eval("ID_Resultado") %>' />
                                                                <span class="glyphicon glyphicon-chevron-down  imagen-expandir"></span>
                                                                <asp:Literal ID="ltl_NumResultado" runat="server" Text='<%# Eval("NumResultado") %>'></asp:Literal>
                                                                <asp:Literal ID="ltl_Resultado" runat="server" Text='<%# "- " + Eval("DesResultado") %>'></asp:Literal>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <span class="glyphicon glyphicon-user imagen-usuario"></span>
                                                                <asp:Literal ID="ltl_ResponsableRes" runat="server" Text='<%# Eval("NombreResponsable") %>'></asp:Literal>
                                                                <asp:HiddenField ID="hdf_CodResponsable" runat="server" Value='<%# Eval("FK_CodResponsable") %>' />
                                                            </div>
                                                        </div>
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id='<%# "ResultadoResumen" + Convert.ToString(Eval("NumResultado")) %>' class="panel-collapse collapse">
                                                <asp:UpdatePanel runat="server" ID="upAjax_Resumen">
                                                    <ContentTemplate>
                                                        <div class="div_SubtituloGrid">
                                                            <asp:Localize ID="lcl_IndicadorGrid" runat="server" Text="Indicadores" meta:resourcekey="lcl_IndicadorGridResource1"></asp:Localize>
                                                        </div>
                                                        <asp:GridView ID="gv_IndicadoresResumen" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataSourceID="sqlDS_IndicadoresResumen" Width="100%" meta:resourcekey="gv_IndicadoresResumenResource1">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="N° ID" SortExpression="NumIndicador" meta:resourcekey="TemplateFieldResource3">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lbl_ID" runat="server" Text='<%# Eval("NumIndicador") %>' meta:resourcekey="lbl_IDResource1"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle VerticalAlign="Top" Width="7%" />
                                                                    <HeaderStyle CssClass="text-align-center" />
                                                                    <ItemStyle CssClass="text-align-center" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Descripción de la Variable" SortExpression="IndicadoresMetasIng" meta:resourcekey="TemplateFieldResource4">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lbl_IndicadorVariable" runat="server" Text='<%# Eval("IndicadorVariable") %>' meta:resourcekey="lbl_IndicadorVariableResource1"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle VerticalAlign="Top" Width="52%" CssClass="alinear-justificado" />
                                                                    <HeaderStyle CssClass="text-align-center" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Línea Base" SortExpression="IndicadorLineaBase" meta:resourcekey="TemplateFieldResource5">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lbl_IndicadoresLineaBase" runat="server" Text='<%# Eval("IndicadorLineaBase") %>' meta:resourcekey="lbl_IndicadoresLineaBaseResource1"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle VerticalAlign="Top" Width="9%" />
                                                                    <HeaderStyle CssClass="text-align-center" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Meta" SortExpression="IndicadoresMetas" meta:resourcekey="TemplateFieldResource6">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lbl_IndicadoresMeta" runat="server" Text='<%# Eval("IndicadorMeta") %>' ToolTip="Para efectos de la programación del IICA, la meta es un valor cuantitativo" meta:resourcekey="lbl_IndicadoresMetaResource1"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle VerticalAlign="Top" Width="9%" />
                                                                    <HeaderStyle CssClass="text-align-center" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Fecha Logro" SortExpression="FechaLogro" meta:resourcekey="TemplateFieldResource7">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lbl_FechaLogro" runat="server" Text='<%# Eval("FechaLogro", "{0:d}") %>' meta:resourcekey="lbl_FechaLogroResource1"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle VerticalAlign="Top" Width="15%" CssClass="text-align-center" />
                                                                    <HeaderStyle CssClass="text-align-center" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <EmptyDataTemplate>
                                                                <asp:Localize ID="lcl_msj_Indicadores" runat="server" Text="No se han definido Indicadores para el Resultado" meta:resourcekey="lcl_msj_IndicadoresResource1"></asp:Localize>
                                                            </EmptyDataTemplate>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="sqlDS_IndicadoresResumen" runat="server" ConnectionString="<%$ ConnectionStrings:SUGIConnectionString %>"
                                                            SelectCommand="SUGI_ICT_Get_Lista_PROY_ResultadosxICT_Indicadores" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="hdf_ID_ResultadoResumen" DefaultValue="0" Name="id" PropertyName="Value" Type="Int32" />
                                                                <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                                                                <asp:ControlParameter ControlID="hdf_Idioma" Name="Idioma" PropertyName="Value" Type="String" DefaultValue="es" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                        <div class="div_SubtituloGrid">
                                                            <asp:Label ID="lbl_ParticipantesResumen" runat="server" Text="Participantes del Resultado" meta:resourcekey="lbl_ParticipantesResumenResource1"></asp:Label>
                                                            <br />
                                                        </div>
                                                        <asp:GridView ID="gv_ParticipantesResumen" runat="server" SkinID="GridInterno" AutoGenerateColumns="False" CssClass="table table-bordered table-hover" ShowHeader="false"
                                                            DataKeyNames="id_Participantes,lastUpdate" DataSourceID="sqlDS_ParticipantesResumen" Width="100%" meta:resourcekey="gv_ParticipantesResumenResource1">
                                                            <Columns>
                                                                <asp:TemplateField HeaderText="Participante" SortExpression="Responsable" meta:resourcekey="TemplateFieldResource8">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lbl_Participante" runat="server" Text='<%# Eval("Responsable") %>' meta:resourcekey="lbl_ParticipanteResource1"></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle VerticalAlign="Top" Width="100%" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <EmptyDataTemplate>
                                                                <asp:Localize ID="lcl_msj_Participantes" runat="server" Text="No se han definido Participantes para el Resultado" meta:resourcekey="lcl_msj_ParticipantesResource1"></asp:Localize>
                                                            </EmptyDataTemplate>
                                                        </asp:GridView>
                                                        <asp:SqlDataSource ID="sqlDS_ParticipantesResumen" runat="server" ConnectionString="<%$ ConnectionStrings:SUGIConnectionString %>"
                                                            SelectCommand="SUGI_ICT_Get_Lista_Participantes_Resultados" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="hdf_ID_ResultadoResumen" DefaultValue="0" Name="id_Resultado" PropertyName="Value" Type="Int32" />
                                                                <asp:Parameter DefaultValue="3" Name="Operacion" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>
                                            </div>
                                        </ItemTemplate>
                                        <ItemStyle CssClass="info" />
                                        <HeaderStyle CssClass="info" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
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
                    <div class="tab-pane" id="3">
                        <span class="page-titles">
                            <asp:Localize ID="lcl_RecursosIICAT" runat="server" Text="Recursos IICA"></asp:Localize></span>
                        <div class="margin-top-30">
                            <asp:GridView ID="gv_RecursosIICA" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
                                DataSourceID="sqlDS_RecursosIICA" Width="52%" AllowPaging="True" AllowSorting="True">
                                <Columns>
                                    <asp:TemplateField HeaderText="Recursos US Dólares">
                                        <ItemTemplate>
                                            <div class="row">
                                                <div class="col-md-3 col-sm-offset-2">
                                                    <asp:Label ID="lbl_CuotasE" runat="server" Text="Cuotas:" AssociatedControlID="lcl_CuotasIICA"></asp:Label>
                                                </div>
                                                <div class="col-md-5">
                                                    <asp:Localize ID="lcl_CuotasIICA" runat="server" Text='<%# Eval("SumaCuotas", "{0:N2}") %>'></asp:Localize>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3 col-sm-offset-2">
                                                    <asp:Label ID="lbl_MiscelaneosE" runat="server" Text="Miscelaneos:" AssociatedControlID="lcl_MiscelaneosIICA"></asp:Label>
                                                </div>
                                                <div class="col-md-5">
                                                    <asp:Localize ID="lcl_MiscelaneosIICA" runat="server" Text='<%# Eval("SumaMiscelaneos", "{0:N2}") %>'></asp:Localize>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3 col-sm-offset-2">
                                                    <asp:Label ID="lbl_CostosDirE" runat="server" Text="TIN:" AssociatedControlID="lcl_CostosDirIICA"></asp:Label>
                                                </div>
                                                <div class="col-md-5">
                                                    <asp:Localize ID="lcl_CostosDirIICA" runat="server" Text='<%# Eval("SumaCatis", "{0:N2}") %>'></asp:Localize>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3 col-sm-offset-2">
                                                    <asp:Label ID="lbl_EspecieE" runat="server" Text="Especie:" AssociatedControlID="lcl_EspecieIICA"></asp:Label>
                                                </div>
                                                <div class="col-md-5">
                                                    <asp:Localize ID="lcl_EspecieIICA" runat="server" Text='<%# Eval("SumaEspecie", "{0:N2}") %>'></asp:Localize>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3 col-sm-offset-2">
                                                    <asp:Label ID="lbl_TotalE" runat="server" Text="Total US $:" AssociatedControlID="lcl_TotalIICA"></asp:Label>
                                                </div>
                                                <div class="col-md-5">
                                                    <asp:Localize ID="lcl_TotalIICA" runat="server" Text='<%# Eval("Total", "{0:N2}") %>'></asp:Localize>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <asp:Localize ID="lcl_msj_Indicadores" runat="server" Text="No se han definido Recursos IICA para este proyecto"></asp:Localize>
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <asp:SqlDataSource ID="sqlDS_RecursosIICA" runat="server" ConnectionString="<%$ ConnectionStrings:SUGIConnectionString %>"
                                SelectCommand="CPS2_ICT_Get_Lista_Recursos_Regulares" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="hdf_CronoICT" Name="CronoICT" PropertyName="Value" Type="Int32" />
                                    <asp:ControlParameter ControlID="hdf_SubCronoICT" Name="SubCronoICT" PropertyName="Value" Type="String" />
                                    <asp:ControlParameter ControlID="hdf_Idioma" Name="Idioma" PropertyName="Value" Type="String" DefaultValue="es" />
                                    <asp:Parameter DefaultValue="4" Name="Operacion" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <span class="page-titles">
                            <asp:Localize ID="lcl_RecursosExternosT" runat="server" Text="Recursos Externos"></asp:Localize></span>
                        <div class="margin-top-30">
                            <asp:GridView ID="gv_RecursosExternos" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
                                DataSourceID="sqlDS_RecursosExternos" Width="100%" AllowPaging="True" AllowSorting="True">
                                <Columns>
                                    <asp:TemplateField HeaderText="Recursos US Dólares">
                                        <ItemTemplate>
                                            <div class="row">
                                                <div class="col-md-3 col-sm-offset-2">
                                                    <asp:Label ID="lbl_CostosDir" runat="server" Text="Costos Dir:" AssociatedControlID="lcl_CostosDir"></asp:Label>
                                                </div>
                                                <div class="col-md-5">
                                                    <asp:Localize ID="lcl_CostosDir" runat="server" Text='<%# Eval("SumaCostosDir", "{0:N2}") %>'></asp:Localize>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3 col-sm-offset-2">
                                                    <asp:Label ID="lbl_TIN" runat="server" Text="TIN:" AssociatedControlID="lcl_TIN"></asp:Label>
                                                </div>
                                                <div class="col-md-5">
                                                    <asp:Localize ID="lcl_TIN" runat="server" Text='<%# Eval("SumaCatis", "{0:N2}") %>'></asp:Localize>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3 col-sm-offset-2">
                                                    <asp:Label ID="lbl_Especie" runat="server" Text="Especie:" AssociatedControlID="lcl_Especie"></asp:Label>
                                                </div>
                                                <div class="col-md-5">
                                                    <asp:Localize ID="lcl_Especie" runat="server" Text='<%# Eval("SumaEspecie", "{0:N2}") %>'></asp:Localize>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3 col-sm-offset-2">
                                                    <asp:Label ID="lbl_Total" runat="server" Text="Total US $:" AssociatedControlID="lcl_Total"></asp:Label>
                                                </div>
                                                <div class="col-md-5">
                                                    <asp:Localize ID="lcl_Total" runat="server" Text='<%# Eval("Total", "{0:N2}") %>'></asp:Localize>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Recursos Moneda Local">
                                        <ItemTemplate>
                                            <div class="row">
                                                <div class="col-md-3 col-sm-offset-2">
                                                    <asp:Label ID="lbl_CostosDirL" runat="server" Text="Costos Dir:" AssociatedControlID="lcl_CostosDirL"></asp:Label>
                                                </div>
                                                <div class="col-md-5">
                                                    <asp:Localize ID="lcl_CostosDirL" runat="server" Text='<%# Eval("SumaMLCostosDir", "{0:N2}") %>'></asp:Localize>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3 col-sm-offset-2">
                                                    <asp:Label ID="lbl_TINL" runat="server" Text="TIN:" AssociatedControlID="lcl_TINL"></asp:Label>
                                                </div>
                                                <div class="col-md-5">
                                                    <asp:Localize ID="lcl_TINL" runat="server" Text='<%# Eval("SumaMLCatiesEfe", "{0:N2}") %>'></asp:Localize>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3 col-sm-offset-2">
                                                    <asp:Label ID="lbl_EspecieL" runat="server" Text="Especie:" AssociatedControlID="lcl_EspecieL"></asp:Label>
                                                </div>
                                                <div class="col-md-5">
                                                    <asp:Localize ID="lcl_EspecieL" runat="server" Text='<%# Eval("SumaMLEspecie", "{0:N2}") %>'></asp:Localize>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-3 col-sm-offset-2">
                                                    <asp:Label ID="lbl_TotalL" runat="server" Text="Total:" AssociatedControlID="lcl_TotalL"></asp:Label>
                                                </div>
                                                <div class="col-md-5">
                                                    <asp:Localize ID="lcl_TotalL" runat="server" Text='<%# Eval("Total2", "{0:N2}") %>'></asp:Localize>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                </Columns>
                                <EmptyDataTemplate>
                                    <asp:Localize ID="lcl_msj_Indicadores" runat="server" Text="No se han definido Recursos Externos para este proyecto"></asp:Localize>
                                </EmptyDataTemplate>
                            </asp:GridView>
                            <asp:SqlDataSource ID="sqlDS_RecursosExternos" runat="server" ConnectionString="<%$ ConnectionStrings:SUGIConnectionString %>"
                                SelectCommand="CPS2_ICT_Get_Lista_Rec_Ext_Contemplados" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="hdf_CronoICT" Name="CronoICT" PropertyName="Value" Type="Int32" />
                                    <asp:ControlParameter ControlID="hdf_SubcronoICT" Name="SubcronoICT" PropertyName="Value" Type="String" />
                                    <asp:Parameter DefaultValue="4" Name="Operacion" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <div class="tab-pane" id="4">
                        <span class="page-titles">
                            <asp:Localize ID="lcl_KeyWords" runat="server" Text="Palabras Clave"></asp:Localize>
                        </span>          
                        <div class="margin-top-30">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="gv_PalabraClave" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="PK_ID_PalabrasClavexExpediente" DataSourceID="sqlDS_PalabrasClave2" Width="100%" AllowPaging="True" AllowSorting="True" OnRowCreated="gv_PalabrasClave_RowCreated" OnRowDeleted="gv_PalabrasClave_RowDeleted" OnRowUpdated="gv_PalabrasClave_RowUpdated" OnRowUpdating="gv_PalabrasClave_RowUpdating">
                                        <Columns>
                                            <asp:TemplateField ShowHeader="False">
                                                <EditItemTemplate>
                                                    <asp:LinkButton ID="lnk_Guardar" runat="server" ClientIDMode="AutoID" CommandName="Update" ValidationGroup="Registro" CssClass="btn btn-default" ToolTip="<%$ Resources:Global, SalvarTooltip %>"><span class="glyphicon glyphicon-ok glyphicons-iica"></span></asp:LinkButton>
                                                    <asp:LinkButton ID="lnk_Cancelar" runat="server" ClientIDMode="AutoID" CommandName="Cancel" CssClass="btn btn-default" ToolTip="<%$ Resources:Global, CancelarTooltip %>"><span class="glyphicon glyphicon-remove glyphicons-iica"></asp:LinkButton>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnk_Eliminar" runat="server" ClientIDMode="AutoID" CommandName="Delete" ToolTip="<%$ Resources:Global, EliminarTooltip %>" CssClass="btn btn-default" OnClientClick="return confirm('¿Desea eliminar el registro?');"><span class="glyphicon glyphicon-trash glyphicons-iica"></span></asp:LinkButton>
                                                    <asp:LinkButton ID="lnk_Agregar" runat="server" ClientIDMode="AutoID" CommandName="Edit" ToolTip="<%$ Resources:Global, NuevoTooltip %>" Visible="False" CssClass="btn btn-default"><span class="glyphicon glyphicon-plus glyphicons-iica"></span></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Palabra Clave">
                                                <EditItemTemplate>
                                                    <asp:DropDownList ID="ddl_PalabraClave" runat="server" DataSourceID="sqlDS_ListaPalabras" DataTextField="Descripcion"
                                                        DataValueField="PK_ID_PalabraClave" SelectedValue='<%# Bind("FK_ID_PalabraClave") %>' CssClass="form-control">
                                                    </asp:DropDownList>
                                                    <asp:CompareValidator ID="rfv_PalabraClave" runat="server" ControlToValidate="ddl_PalabraClave" ValueToCompare="0" Operator="NotEqual"
                                                        ErrorMessage="Requerido" Text="<%$ Resources:Global , CampoRequerido %>" CssClass="error-span"
                                                        Display="Dynamic" ValidationGroup="Registro"></asp:CompareValidator>
                                                    <asp:SqlDataSource ID="sqlDS_ListaPalabras" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>"
                                                        SelectCommand="WS_Get_Lista_PalabrasClave" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="hdf_CronoICT" DefaultValue="" Name="CronoICT" PropertyName="Value" Type="Int32" />
                                                            <asp:ControlParameter ControlID="hdf_SubCronoICT" Name="SubCronoICT" PropertyName="Value" Type="String" />
                                                            <asp:ControlParameter ControlID="hdf_Idioma" DefaultValue="es" Name="Idioma" PropertyName="Value" Type="String" />
                                                            <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Panel runat="server" Visible='<%# Eval("Visible") %>'>
                                                        <div class="tag">
                                                            <asp:Localize ID="lcl_Descripcion" runat="server" Text='<%# Eval("Descripcion") %>'></asp:Localize>
                                                        </div>
                                                    </asp:Panel>
                                                </ItemTemplate>
                                                <ItemStyle VerticalAlign="Top" Width="50%" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="sqlDS_PalabrasClave2" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>"
                                        SelectCommand="WS_Get_Lista_PalabrasClavexIdentificacionProyecto" SelectCommandType="StoredProcedure"
                                        UpdateCommand="WS_Man_PalabrasClavexIdentificacionProyecto" UpdateCommandType="StoredProcedure"
                                        DeleteCommand="WS_Man_PalabrasClavexIdentificacionProyecto" DeleteCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="hdf_Idioma" DefaultValue="es" Name="Idioma" PropertyName="Value" Type="String" />
                                            <asp:ControlParameter ControlID="hdf_CronoICT" DefaultValue="" Name="CronoICT" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_SubCronoICT" Name="SubCronoICT" PropertyName="Value" Type="String" />
                                            <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:ControlParameter ControlID="hdf_CronoICT" DefaultValue="" Name="CronoICT" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_SubCronoICT" Name="SubCronoICT" PropertyName="Value" Type="String" />
                                            <asp:ControlParameter ControlID="hdf_Operacion" DefaultValue="2" Name="Operacion" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_Usuario" DefaultValue="2815" Name="Usuario" PropertyName="Value" Type="Int32" />
                                        </UpdateParameters>
                                        <DeleteParameters>
                                            <asp:Parameter DefaultValue="3" Name="Operacion" Type="Int32" />
                                        </DeleteParameters>
                                    </asp:SqlDataSource>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <span class="page-titles">
                            <asp:Localize ID="lcl_Agrovoc" runat="server" Text="AGROVOC"></asp:Localize>
                        </span>
                        <div class="row">
                            <div class="col-md-4">
                                <asp:TextBox ID="txt_PalabraBuscarAgrovoc" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="margin-top-30">
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="gv_PalabrasAGROVOC" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataSourceID="sqlDS_PalabrasAGROVOC" Width="100%" DataKeyNames="FK_id_CodigoAgrovoc">
                                        <Columns>
                                            <asp:TemplateField ShowHeader="False">
                                                <EditItemTemplate>
                                                    <asp:LinkButton ID="lnk_Guardar_A" runat="server" ClientIDMode="AutoID" CommandName="Update" ValidationGroup="Registro" CssClass="btn btn-default" ToolTip="<%$ Resources:Global, SalvarTooltip %>"><span class="glyphicon glyphicon-ok glyphicons-iica"></span></asp:LinkButton>
                                                    <asp:LinkButton ID="lnk_Cancelar_A" runat="server" ClientIDMode="AutoID" CommandName="Cancel" CssClass="btn btn-default" ToolTip="<%$ Resources:Global, CancelarTooltip %>"><span class="glyphicon glyphicon-remove glyphicons-iica"></asp:LinkButton>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnk_Eliminar_A" runat="server" ClientIDMode="AutoID" CommandName="Delete" ToolTip="<%$ Resources:Global, EliminarTooltip %>" CssClass="btn btn-default" OnClientClick="return confirm('¿Desea eliminar el registro?');"><span class="glyphicon glyphicon-trash glyphicons-iica"></span></asp:LinkButton>
                                                    <asp:LinkButton ID="lnk_Agregar_A" runat="server" ClientIDMode="AutoID" CommandName="Edit" ToolTip="<%$ Resources:Global, NuevoTooltip %>" Visible="False" CssClass="btn btn-default"><span class="glyphicon glyphicon-plus glyphicons-iica"></span></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Término AGROVOC" SortExpression="Termino_ES">
                                                <EditItemTemplate>
                                                    <asp:DropDownList ID="ddl_Agrovoc" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddl_Agrovoc_SelectedIndexChanged"></asp:DropDownList>
                                                </EditItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_TerminoAgrovocLista" runat="server" Text='<%# Eval("Termino_ES") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle VerticalAlign="Top" Width="50%" />
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="sqlDS_PalabrasAGROVOC" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>" SelectCommand="WS_Get_Lista_PalabrasAgrovocxIdentificacionProyecto" SelectCommandType="StoredProcedure" DeleteCommand="WS_Man_PalabrasClaveAgrovoc" DeleteCommandType="StoredProcedure" UpdateCommand="WS_Man_PalabrasClaveAgrovoc" UpdateCommandType="StoredProcedure">
                                        <DeleteParameters>
                                            <asp:Parameter DefaultValue="3" Name="Operacion" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_Usuario" Name="Usuario" PropertyName="Value" Type="Int32" />
                                        </DeleteParameters>
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_CronoICT" DefaultValue="" Name="CronoICT" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_SubCronoICT" Name="SubCronoICT" PropertyName="Value" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                                            <asp:Parameter Name="FK_id_CodigoAgrovoc" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_CronoICT" DefaultValue="" Name="CronoICT" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_SubCronoICT" Name="SubCronoICT" PropertyName="Value" Type="String" />
                                            <asp:ControlParameter ControlID="hdf_CodTerm" Name="CodTerm" PropertyName="Value" Type="String" />
                                            <asp:ControlParameter ControlID="hdf_Ingles" Name="Idioma_en" PropertyName="Value" Type="String" />
                                            <asp:ControlParameter ControlID="hdf_Espanol" Name="Idioma_es" PropertyName="Value" Type="String" />
                                            <asp:ControlParameter ControlID="hdf_Frances" Name="Idioma_fr" PropertyName="Value" Type="String" />
                                            <asp:ControlParameter ControlID="hdf_Portuguez" Name="Idioma_pt" PropertyName="Value" Type="String" />
                                            <asp:ControlParameter ControlID="hdf_Usuario" DefaultValue="0" Name="Usuario" PropertyName="Value" Type="Int32" />
                                        </UpdateParameters>
                                    </asp:SqlDataSource>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                    <div class="tab-pane" id="5">
                        <span class="page-titles">
                            <asp:Localize ID="lcl_links" runat="server" Text="Enlaces"></asp:Localize>
                        </span>
                        <div class="margin-top-30">
                            <asp:GridView ID="gv_Participantes_Enlaces" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataKeyNames="Codigo" DataSourceID="sqlDS_Participantes_Enlaces">
                                <Columns>
                                    <asp:TemplateField HeaderText="Agriperfiles" SortExpression="Enlace">
                                        <ItemTemplate>
                                            
                                            <asp:LinkButton ID="lnk_Agriperfil" runat="server" PostBackUrl='<%# Eval("Enlace") %>' Text='<%# Eval("Responsable") %>'></asp:LinkButton>
                                            <asp:Label ID="lbl_Enlace" runat="server" Text="(Responsable)"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle VerticalAlign="Top" Width="100%" />
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="sqlDS_Participantes_Enlaces" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>" SelectCommand="WS_Get_Lista_Enlaces_Participantes" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                                    <asp:ControlParameter ControlID="hdf_CronoICT" DefaultValue="" Name="CronoICT" PropertyName="Value" Type="Int32" />
                                    <asp:ControlParameter ControlID="hdf_SubCronoICT" Name="SubCronoICT" PropertyName="Value" Type="String" />
                                    <asp:ControlParameter ControlID="hdf_Usuario" Name="Usuario" PropertyName="Value" Type="Int32" DefaultValue="0" />
                                    <asp:ControlParameter ControlID="hdf_Idioma" Name="Idioma" PropertyName="Value" Type="String" DefaultValue="es" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                </div>
            </div>
            <asp:SqlDataSource ID="sqlDS_Instrumentos" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>"
                SelectCommand="WS_Get_Lista_IdentificacionProyecto"
                SelectCommandType="StoredProcedure"
                UpdateCommand="WS_Man_IdentificacionProyecto"
                UpdateCommandType="StoredProcedure"
                CancelSelectOnNullParameter="False">
                <SelectParameters>
                    <asp:ControlParameter ControlID="hdf_CronoICT" Name="CronoICT" PropertyName="Value" Type="Int32" />
                    <asp:ControlParameter ControlID="hdf_SubCronoICT" Name="SubCronoICT" PropertyName="Value" Type="String" />
                    <asp:ControlParameter ControlID="hdf_Idioma" Name="Idioma" PropertyName="Value" Type="String" DefaultValue="es" />
                    <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="hdf_CronoICT" Name="CronoICT" PropertyName="Value" Type="Int32" />
                    <asp:ControlParameter ControlID="hdf_SubCronoICT" Name="SubCronoICT" PropertyName="Value" Type="String" />
                    <asp:ControlParameter ControlID="hdf_Usuario" DefaultValue="2818" Name="Usuario" PropertyName="Value" Type="Int32" />
                    <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32" />
                    <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>



        <div class="margin-top-10 margin-left-10">
            <asp:LinkButton ID="lnk_Regresar" runat="server" CssClass="btn btn-iica-green">
                <span class="glyphicon glyphicon-arrow-left imagen-miplan" runat="server"></span>&nbsp;
                         <asp:Localize runat="server" ID="lcl_Regresar" Text="Regresar"></asp:Localize>
            </asp:LinkButton>
        </div>

    </div>





   


</asp:Content>
