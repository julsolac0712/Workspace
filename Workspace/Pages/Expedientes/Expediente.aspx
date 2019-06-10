<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Expediente.aspx.vb" Inherits="WorkSpace.Expediente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <asp:HiddenField ID="hdf_Operacion" runat="server" />
        <asp:HiddenField ID="hdf_Usuario" runat="server" />
        <asp:HiddenField ID="hdf_Idioma" runat="server" />
        <asp:UpdatePanel ID="upAjax_Usuarios" runat="server">
            <ContentTemplate>
                <span class="page-titles">
                    <asp:Localize ID="lcl_Descripcion" runat="server" Text="Expedientes"></asp:Localize>
                </span>
                <div class="margin-top-10 ">
                    <asp:GridView ID="gv_Expediente" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="PK_ID_Expediente,lastUpdate" DataSourceID="sqlDS_Expedientes" Width="100%" AllowPaging="True" AllowSorting="True">
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
                            <asp:TemplateField HeaderText="Descripción" SortExpression="Descripcion">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txt_Descripcion" runat="server" Text='<%# Bind("Descripcion") %>' CssClass="form-control" Width="100%" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfv_DescripcionEng" runat="server" ControlToValidate="txt_Descripcion"
                                        ErrorMessage="Requerido" Text="<%$ Resources:Global , CampoRequerido %>" CssClass="error-span"
                                        Display="Dynamic" ValidationGroup="Registro"></asp:RequiredFieldValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Localize ID="lcl_Descripcion" runat="server" Text='<%# Eval("Descripcion") %>'></asp:Localize>
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Top" Width="35%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Tipo" SortExpression="Tipo">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddl_TipoExpediente" runat="server" DataSourceID="sqlDS_TipoExpediente" DataTextField="Descripcion"
                                        DataValueField="FK_ID_TipoExpediente" SelectedValue='<%# Bind("FK_ID_TipoExpediente") %>' CssClass="form-control">
                                    </asp:DropDownList>
                                    <asp:CompareValidator ID="rfv_TipoExpediente" runat="server" ControlToValidate="ddl_TipoExpediente" ValueToCompare="0" Operator="NotEqual"
                                        ErrorMessage="Requerido" Text="<%$ Resources:Global , CampoRequerido %>" CssClass="error-span"
                                        Display="Dynamic" ValidationGroup="Registro"></asp:CompareValidator>
                                    <asp:SqlDataSource ID="sqlDS_TipoExpediente" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>"
                                        SelectCommand="WS_Get_Lista_TipoExpediente" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="hdf_Idioma" DefaultValue="es" Name="Idioma" PropertyName="Value" Type="String" />
                                            <asp:Parameter DefaultValue="2" Name="Operacion" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Localize ID="lcl_Tipo" runat="server" Text='<%# Eval("NombreTipoExpediente") %>'></asp:Localize>
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Top" Width="15%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Palabras Clave">
                                <ItemTemplate>
                                    <asp:HiddenField ID="hdf_ID_Expediente" runat="server" Value='<%# Bind("PK_ID_Expediente") %>'></asp:HiddenField>
                                    <asp:Panel runat="server" Visible='<%# Eval("Visible") %>'>
                                        <asp:GridView ID="gv_PalabraClave" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="PK_ID_PalabrasClavexExpediente" DataSourceID="sqlDS_PalabrasClave" Width="100%" AllowPaging="True" AllowSorting="True" OnRowCreated="gv_PalabrasClave_RowCreated" OnRowDeleted="gv_PalabrasClave_RowDeleted" OnRowUpdated="gv_PalabrasClave_RowUpdated" OnRowUpdating="gv_Expediente_RowUpdating" ShowHeader="false">
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
                                                <asp:TemplateField ShowHeader="False">
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
                                                                <asp:ControlParameter ControlID="hdf_ID_Expediente" Name="FK_ID_Expediente" PropertyName="Value" Type="Int32" />
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
                                        <asp:SqlDataSource ID="sqlDS_PalabrasClave" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>"
                                            SelectCommand="WS_Get_Lista_PalabrasClavexExpediente" SelectCommandType="StoredProcedure"
                                            UpdateCommand="WS_Man_PalabrasClavexExpediente" UpdateCommandType="StoredProcedure"
                                            DeleteCommand="WS_Man_PalabrasClavexExpediente" DeleteCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="hdf_Idioma" DefaultValue="es" Name="Idioma" PropertyName="Value" Type="String" />
                                                <asp:ControlParameter ControlID="hdf_ID_Expediente" Name="FK_ID_Expediente" PropertyName="Value" Type="Int32" />
                                                <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                                            </SelectParameters>
                                            <UpdateParameters>
                                                <asp:ControlParameter ControlID="hdf_ID_Expediente" Name="FK_ID_Expediente" PropertyName="Value" Type="Int32" />
                                                <asp:ControlParameter ControlID="hdf_Operacion" DefaultValue="2" Name="Operacion" PropertyName="Value" Type="Int32" />
                                                <asp:ControlParameter ControlID="hdf_Usuario" DefaultValue="2815" Name="Usuario" PropertyName="Value" Type="Int32" />
                                            </UpdateParameters>
                                            <DeleteParameters>
                                                <asp:Parameter DefaultValue="3" Name="Operacion" Type="Int32" />
                                            </DeleteParameters>
                                        </asp:SqlDataSource>
                                    </asp:Panel>
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Top" Width="30%" />
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
                                <HeaderStyle CssClass="text-align-center" />
                                <ItemStyle VerticalAlign="Top" Width="10%" CssClass="text-align-center" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="sqlDS_Expedientes" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>"
                        SelectCommand="WS_Get_Lista_Expediente" SelectCommandType="StoredProcedure"
                        DeleteCommand="WS_Man_Expediente" DeleteCommandType="StoredProcedure"
                        UpdateCommand="WS_Man_Expediente" UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter DefaultValue="3" Name="Operacion" Type="Int32" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="hdf_Usuario" DefaultValue="2815" Name="Usuario" PropertyName="Value" Type="Int32" />
                            <asp:ControlParameter ControlID="hdf_Idioma" DefaultValue="es" Name="Idioma" PropertyName="Value" Type="String" />
                            <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:ControlParameter ControlID="hdf_Usuario" DefaultValue="2815" Name="Usuario" PropertyName="Value" Type="Int32" />
                            <asp:ControlParameter ControlID="hdf_Operacion" DefaultValue="2" Name="Operacion" PropertyName="Value" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
