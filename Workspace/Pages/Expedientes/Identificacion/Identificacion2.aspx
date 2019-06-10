<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Identificacion2.aspx.vb" Inherits="WorkSpace.Identificacion2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <asp:HiddenField ID="hdf_Operacion" runat="server" />
        <asp:HiddenField ID="hdf_Usuario" runat="server" />
        <asp:HiddenField ID="hdf_Idioma" runat="server" />
        <asp:HiddenField ID="hdf_CronoICT" runat="server" />
        <asp:HiddenField ID="hdf_SubCronoICT" runat="server" />
        <asp:HiddenField ID="hdf_OperacionPaises" runat="server" />
        <asp:UpdatePanel ID="upAjax_Usuarios" runat="server">
            <ContentTemplate>


                <div class="margin-top-10 ">
                    <div id="exTab2" class="container margin-top-30">
                        <ul class="nav nav-tabs">
                                <li>
                                <a href="#0" data-toggle="tab">
                                    <asp:Localize ID="lcl_Identificacion" runat="server" Text="Identificación"></asp:Localize></a>
                            </li>
                            <li >
                                <a href="#1" data-toggle="tab">
                                    <asp:Localize ID="lcl_Resultados" runat="server" Text="Resultados"></asp:Localize></a>
                            </li>
                            <li><a href="#2" data-toggle="tab">
                                <asp:Localize ID="lcl_RecursosIICA" runat="server" Text="Recursos IICA"></asp:Localize></a>
                            </li>
                            <li><a href="#3" data-toggle="tab">
                                <asp:Localize ID="lcl_RecursosExternos" runat="server" Text="Recursos Externos"></asp:Localize></a>
                            </li>
                            <li class="active"><a href="#4" data-toggle="tab">
                                <asp:Localize ID="lcl_Paises" runat="server" Text="Países"></asp:Localize></a>
                            </li>
                        </ul>

                        <div class="tab-content margin-top-30">
                            <div class="tab-pane" id="0">
                                <span class="page-titles">
                                    <asp:Localize ID="lcl_Descripcion" runat="server" Text="Identificación Proyectos IICA"></asp:Localize>
                                </span>
                                <asp:LinkButton runat="server" class="btn edit-profile" ID="lnkBtn_EditarID" ToolTip="Editar">
                                <span class="glyphicon glyphicon-pencil imagen-edit-profile"></span>
                                </asp:LinkButton>

                                <div class="margin-top-30">
                                    <asp:FormView ID="fv_Perfil" runat="server" DataSourceID="sqlDS_Instrumentos" RenderOuterTable="False" DataKeyNames="PK_ID_Proyecto,lastUpdate">
                                        <ItemTemplate>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <asp:Label ID="lbl_NombreProyecto" runat="server" Text="Nombre:" AssociatedControlID="ltl_NombreProyecto"></asp:Label>
                                                    <asp:Literal ID="ltl_CodigoProyecto" runat="server" Text='<%# Eval("Codigo") + "/" %>'></asp:Literal>
                                                    <asp:Literal ID="ltl_CronoICT" runat="server" Text='<%# Eval("CronoICT") %>'></asp:Literal>
                                                    <asp:Literal ID="ltl_SubCronoICT" runat="server" Text='<%# " - " + Eval("SubCronoICT") + " / " %>'></asp:Literal>
                                                    <asp:Literal ID="ltl_NombreProyecto" runat="server" Text='<%# Eval("NombreInstrumento") %>'></asp:Literal>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <asp:Label ID="lbl_Responsable" runat="server" Text="Responsable:" AssociatedControlID="ltl_Responsable"> </asp:Label>
                                                    <asp:Literal ID="ltl_Responsable" runat="server" Text='<%# Eval("ResponsableProyecto") %>'></asp:Literal>
                                                </div>
                                                <div class="col-md-3">
                                                    <asp:Label ID="lbl_FechaInicio" runat="server" Text="F. Inicio:" AssociatedControlID="ltl_FechaInicio"> </asp:Label>
                                                    <asp:Literal ID="ltl_FechaInicio" runat="server" Text='<%# Eval("FechaFinalizacion", "{0:dd/MM/yyyy}") %>'></asp:Literal>
                                                </div>
                                                <div class="col-md-3">
                                                    <asp:Label ID="lbl_Vigencia" runat="server" Text="F.Finalización:" AssociatedControlID="ltl_Vigencia"></asp:Label>
                                                    <asp:Literal ID="ltl_Vigencia" runat="server" Text='<%# Eval("FechaFinalizacion", "{0:dd/MM/yyyy}") %>'></asp:Literal>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <asp:Label ID="lbl_Expediente" runat="server" Text="Expediente:" AssociatedControlID="ltl_Expediente"></asp:Label>
                                                    <asp:Literal ID="ltl_Expediente" runat="server" Text='<%# Eval("Expediente")  %>'></asp:Literal>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <asp:Label ID="lbl_TipoInstrumento" runat="server" Text="Tipo Instrumento:" AssociatedControlID="ltl_TipoInstrumento"></asp:Label>
                                                    <asp:Literal ID="ltl_TipoInstrumento" runat="server" Text='<%# Eval("TipoInstrumento")  %>'></asp:Literal>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <asp:Label ID="lbl_TipoTema" runat="server" Text="Tema:" AssociatedControlID="ltl_TipoTema"></asp:Label>
                                                    <asp:Literal ID="ltl_TipoTema" runat="server" Text='<%# Eval("TipoTema")  %>'></asp:Literal>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <asp:Label ID="lbl_TipoAmbito" runat="server" Text="Ámbito:" AssociatedControlID="ltl_TipoAmbito"></asp:Label>
                                                    <asp:Literal ID="ltl_TipoAmbito" runat="server" Text='<%# Eval("TipoAmbito")  %>'></asp:Literal>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <asp:Label ID="lbl_Descripcion" runat="server" Text="Descripción:" AssociatedControlID="ltl_Descripcion"></asp:Label>
                                                    <asp:Literal ID="ltl_Descripcion" runat="server" Text='<%# Eval("Descripcion") %>'></asp:Literal>

                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <asp:Label ID="lbl_Objetivos" runat="server" Text="Objetivo General:" AssociatedControlID="ltl_Objetivos"></asp:Label>
                                                    <asp:Literal ID="ltl_Objetivos" runat="server" Text='<%# Eval("ObjetivoGeneral") %>'></asp:Literal>

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
                                                <div class="col-md-3">
                                                    <asp:Label ID="lbl_Responsable" runat="server" Text="Responsable:" AssociatedControlID="ltl_Responsable"> </asp:Label>
                                                    <asp:Literal ID="ltl_Responsable" runat="server" Text='<%# Eval("ResponsableProyecto") %>'></asp:Literal>
                                                </div>
                                                <div class="col-md-3">
                                                    <asp:Label ID="lbl_FechaInicio" runat="server" Text="F. Inicio:" AssociatedControlID="ltl_FechaInicio"> </asp:Label>
                                                    <asp:Literal ID="ltl_FechaInicio" runat="server" Text='<%# Eval("FechaFinalizacion", "{0:dd/MM/yyyy}") %>'></asp:Literal>
                                                </div>
                                                <div class="col-md-3">
                                                    <asp:Label ID="lbl_Vigencia" runat="server" Text="F.Finalización:" AssociatedControlID="ltl_Vigencia"></asp:Label>
                                                    <asp:Literal ID="ltl_Vigencia" runat="server" Text='<%# Eval("FechaFinalizacion", "{0:dd/MM/yyyy}") %>'></asp:Literal>
                                                </div>
                                            </div>
                                            <div class="row margin-top-10">
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
                                            </div>
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
                                                    <asp:Label ID="lbl_TipoTema" runat="server" Text="Tema:" AssociatedControlID="ddl_TipoTema"></asp:Label>
                                                </div>
                                                <div class="col-md-5">
                                                    <asp:DropDownList ID="ddl_TipoTema" runat="server" CssClass="form-control"
                                                        SelectedValue='<%# Bind("FK_ID_TipoTema")  %>'
                                                        DataTextField="Descripcion" DataValueField="PK_ID_TipoTema" DataSourceID="sqlDS_TipoTema">
                                                    </asp:DropDownList>
                                                    <asp:CompareValidator ID="cv_TipoTema" runat="server" ControlToValidate="ddl_TipoTema" ValueToCompare="0" Operator="NotEqual"
                                                        ErrorMessage="Requerido" Text="<%$ Resources:Global , CampoRequerido %>" CssClass="error-span"
                                                        Display="Dynamic" ValidationGroup="Registro"></asp:CompareValidator>
                                                    <asp:SqlDataSource ID="sqlDS_TipoTema" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>"
                                                        SelectCommand="WS_Get_Lista_TipoTemas"
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
                            </div>
                            <div class="tab-pane" id="1">
                            </div>
                            <div class="tab-pane" id="2">
                            </div>
                            <div class="tab-pane" id="3">
                            </div>
                            <div class="tab-pane active" id="4">
                                <span class="page-titles">
                                    <asp:Localize ID="lcl_Descripcion_Paises" runat="server" Text="Países Involucrados"></asp:Localize>
                                </span>

                                <div class="margin-top-10">
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
                                                    <asp:Label ID="lbl_Pais" runat="server" Text='<%# Eval("Pais") %>'></asp:Label>
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
                                    <asp:SqlDataSource ID="sqlDS_PaisesInvolucrados" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>" DeleteCommand="WS_Man_PaisesxProyecto" DeleteCommandType="StoredProcedure" InsertCommand="WS_Man_PaisesxProyecto" InsertCommandType="StoredProcedure" SelectCommand="WS_Get_Lista_PaisesxProyecto" SelectCommandType="StoredProcedure" UpdateCommand="WS_Man_PaisesxProyecto" UpdateCommandType="StoredProcedure">
                                        <DeleteParameters>
                                            <asp:ControlParameter ControlID="hdf_Usuario" Name="Usuario" PropertyName="Value" Type="Int32" />
                                            <asp:Parameter Name="Operacion" Type="Int32" DefaultValue="3" />
                                        </DeleteParameters>
                                        <InsertParameters>
                                            <asp:ControlParameter ControlID="hdf_CronoICT" DefaultValue="" Name="CronoICT" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_SubCronoICT" Name="SubCronoICT" PropertyName="Value" Type="String" />
                                            <asp:ControlParameter ControlID="hdf_Usuario" Name="Usuario" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_OperacionPaises" DefaultValue="1" Name="Operacion" PropertyName="Value" Type="Int32" />
                                        </InsertParameters>
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_CronoICT" DefaultValue="" Name="CronoICT" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_SubCronoICT" Name="SubCronoICT" PropertyName="Value" Type="String" />
                                            <asp:ControlParameter ControlID="hdf_Idioma" DefaultValue="es" Name="Idioma" PropertyName="Value" Type="String" />
                                        </SelectParameters>
                                        <UpdateParameters>
                                            <asp:ControlParameter ControlID="hdf_CronoICT" DefaultValue="" Name="CronoICT" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_SubCronoICT" Name="SubCronoICT" PropertyName="Value" Type="String" />
                                            <asp:ControlParameter ControlID="hdf_Usuario" DefaultValue="" Name="Usuario" PropertyName="Value" Type="Int32" />
                                            <asp:ControlParameter ControlID="hdf_OperacionPaises" DefaultValue="2" Name="Operacion" PropertyName="Value" Type="Int32" />
                                        </UpdateParameters>
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
                             <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>

            </ContentTemplate>
            <Triggers>
            </Triggers>
        </asp:UpdatePanel>


    </div>

</asp:Content>
