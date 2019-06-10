<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="TipoPalabrasClave.aspx.vb" Inherits="WorkSpace.TipoPalabrasClave" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <asp:HiddenField ID="hdf_Operacion" runat="server" />
        <asp:HiddenField ID="hdf_Usuario" runat="server" />
        <asp:HiddenField ID="hdf_Idioma" runat="server" />
        <asp:UpdatePanel ID="upAjax_Usuarios" runat="server">
            <ContentTemplate>
                <span class="page-titles">
                    <asp:Localize ID="lcl_Descripcion" runat="server" Text="Tipo de Palabras Clave"></asp:Localize>
                </span>
                <div class="margin-top-10 ">
                    <asp:GridView ID="gv_TipoPalabrasClave" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="PK_ID_TipoPalabraClave,lastUpdate" DataSourceID="sqlDS_PalabrasClave" Width="100%" AllowPaging="True" AllowSorting="True">
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="lnk_Guardar" runat="server" ClientIDMode="AutoID" CommandName="Update" ValidationGroup="Registro" CssClass="btn btn-default" ToolTip="<%$ Resources:Global, SalvarTooltip %>"><span class="glyphicon glyphicon-ok glyphicons-iica"></span></asp:LinkButton>
                                    <asp:LinkButton ID="lnk_Cancelar" runat="server" ClientIDMode="AutoID" CommandName="Cancel" CssClass="btn btn-default" ToolTip="<%$ Resources:Global, CancelarTooltip %>"><span class="glyphicon glyphicon-remove glyphicons-iica"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnk_Editar" runat="server" ClientIDMode="AutoID" CommandName="Edit" ToolTip="<%$ Resources:Global, ActualizarTooltip %>" CssClass="btn btn-default"><span class="glyphicon glyphicon-edit glyphicons-iica"></span></asp:LinkButton>
                                    <asp:LinkButton ID="lnk_Eliminar" runat="server" ClientIDMode="AutoID" CommandName="Delete" ToolTip="<%$ Resources:Global, EliminarTooltip %>" CssClass="btn btn-default" OnClientClick="return confirm('¿Desea eliminar el registro?');"><span class="glyphicon glyphicon-trash glyphicons-iica"></span></asp:LinkButton>
                                    <asp:LinkButton ID="lnk_Agregar" runat="server" ClientIDMode="AutoID" CommandName="Edit" ToolTip="<%$ Resources:Global, NuevoTooltip %>" Visible="False" CssClass="btn btn-default"><span class="glyphicon glyphicon-plus glyphicons-iica"></span></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nombre Español" SortExpression="Descripcion_Esp">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_DescripcionEspanol" runat="server" Text='<%# Bind("Descripcion_Esp") %>' CssClass="form-control" Width="100%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfv_DescripcionEsp" runat="server" ControlToValidate="txt_DescripcionEspanol"
                                        ErrorMessage="Requerido" Text="<%$ Resources:Global , CampoRequerido %>" CssClass="error-span"
                                        Display="Dynamic" ValidationGroup="Registro"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Localize ID="lcl_DescripcionEsp" runat="server" Text='<%# Eval("Descripcion_Esp") %>'></asp:Localize>
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Top" Width="35%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Nombre Inglés" SortExpression="Descripcion_Eng">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_DescripcionIngles" runat="server" Text='<%# Bind("Descripcion_Eng") %>' CssClass="form-control" Width="100%"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfv_DescripcionEng" runat="server" ControlToValidate="txt_DescripcionIngles"
                                        ErrorMessage="Requerido" Text="<%$ Resources:Global , CampoRequerido %>" CssClass="error-span"
                                        Display="Dynamic" ValidationGroup="Registro"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Localize ID="lcl_DescripcionEng" runat="server" Text='<%# Eval("Descripcion_Eng") %>'></asp:Localize>
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Top" Width="35%" />
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
                                    <asp:Localize ID="lcl_Estado" runat="server" Text='<%# Eval("TipoEstado") %>'></asp:Localize>
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Top" Width="20%" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="sqlDS_PalabrasClave" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>"
                        SelectCommand="WS_Get_Lista_TipoPalabrasClave" SelectCommandType="StoredProcedure"
                        DeleteCommand="WS_Man_TipoPalabrasClave" DeleteCommandType="StoredProcedure"
                        UpdateCommand="WS_Man_TipoPalabrasClave" UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter DefaultValue="3" Name="Operacion" Type="Int32" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                            <asp:ControlParameter ControlID="hdf_Idioma" DefaultValue="es" Name="Idioma" PropertyName="Value" Type="String" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:ControlParameter ControlID="hdf_Operacion" DefaultValue="2" Name="Operacion" PropertyName="Value" Type="Int32" />
                            <asp:ControlParameter ControlID="hdf_Usuario" DefaultValue="2818" Name="Usuario" PropertyName="Value" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
