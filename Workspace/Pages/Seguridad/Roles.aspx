<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Roles.aspx.vb" Inherits="WorkSpace.Roles" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <div class="container">
        <asp:HiddenField ID="hdf_Operacion" runat="server" />
        <asp:HiddenField ID="hdf_Usuario" runat="server" />
        <asp:HiddenField ID="hdf_Idioma" runat="server" />

         <asp:UpdatePanel ID="upAjax_Usuarios" runat="server">
             <ContentTemplate>      
                   
                        <span class="page-titles"><asp:Localize ID="lcl_Descripcion" runat="server" Text="Administración de Roles" ></asp:Localize>
                        </span>
                 <div class="margin-top-10 ">
                 <asp:GridView ID="gv_Roles" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="id_Rol,lastUpdate" DataSourceID="sqlDS_Roles" Width="100%" AllowPaging="True" AllowSorting="True">
                             <Columns>
                                 <asp:TemplateField ShowHeader="False">
                                     <EditItemTemplate>
                                         <asp:LinkButton ID="lnk_Guardar" runat="server" ClientIDMode="AutoID" CommandName="Update" ValidationGroup="Registro" CssClass="btn btn-default" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><span class="glyphicon glyphicon-ok glyphicons-iica"></span></asp:LinkButton>
                                         <asp:LinkButton ID="lnk_Cancelar" runat="server" ClientIDMode="AutoID" CommandName="Cancel" CssClass="btn btn-default" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><span class="glyphicon glyphicon-remove glyphicons-iica"></asp:LinkButton>
                                     </EditItemTemplate>
                                     <ItemTemplate>
                                         <asp:LinkButton ID="lnk_Editar" runat="server" ClientIDMode="AutoID" CommandName="Edit" ToolTip="Editar" CssClass="btn btn-default" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><span class="glyphicon glyphicon-edit glyphicons-iica"></span></asp:LinkButton>
                                         <asp:LinkButton ID="lnk_Eliminar" runat="server" ClientIDMode="AutoID" CommandName="Delete" ToolTip="Eliminar" CssClass="btn btn-default" OnClientClick="return confirm('¿Desea eliminar el registro?');" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><span class="glyphicon glyphicon-trash glyphicons-iica"></span></asp:LinkButton>
                                         <asp:LinkButton ID="lnk_Agregar" runat="server" ClientIDMode="AutoID" CommandName="Edit" ToolTip="Agregar Nuevo" Visible="False" CssClass="btn btn-default" CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'><span class="glyphicon glyphicon-plus glyphicons-iica"></span></asp:LinkButton>
                                     </ItemTemplate>
                                     <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                                 </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                                     <EditItemTemplate>
                                         <asp:TextBox ID="txt_Descripcion" runat="server" Text='<%# Bind("Descripcion") %>' CssClass="form-control" Width="100%"></asp:TextBox>
                                                 <asp:RequiredFieldValidator ID="rfv_Descripcion" runat="server" ControlToValidate="txt_Descripcion"
                                                  ErrorMessage="Requerido" Text="<%$ Resources:Global , CampoRequerido %>" CssClass="error-span"
                                                 Display="Dynamic" ValidationGroup="Registro"></asp:RequiredFieldValidator>
                                     </EditItemTemplate>
                                     <ItemTemplate>
                                         <asp:localize ID="lcl_Descripcion" runat="server" Text='<%# Eval("Descripcion") %>'></asp:localize>
                                     </ItemTemplate>
                                     <ItemStyle VerticalAlign="Top" Width="30%" />
                                 </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Detalle" SortExpression="Detalle">
                                     <EditItemTemplate>
                                         <asp:TextBox ID="txt_Detalle" runat="server" Text='<%# Bind("Detalle") %>' TextMode="MultiLine" Rows="3" CssClass="form-control" Width="100%"></asp:TextBox>
                                         <asp:RequiredFieldValidator ID="rfv_Detalle" runat="server" ControlToValidate="txt_Detalle"
                                                  ErrorMessage="Requerido" Text="<%$ Resources:Global , CampoRequerido %>" CssClass="error-span"
                                                 Display="Dynamic" ValidationGroup="Registro"></asp:RequiredFieldValidator>
                                     </EditItemTemplate>
                                     <ItemTemplate>
                                         <asp:localize ID="lcl_Detalle" runat="server" Text='<%# Eval("Detalle") %>'></asp:localize>
                                     </ItemTemplate>
                                     <ItemStyle VerticalAlign="Top" Width="60%" />
                                 </asp:TemplateField>
                                 <%--<asp:TemplateField HeaderText="Tipo" SortExpression="Tipo">
                                     <EditItemTemplate>
                                         <asp:TextBox ID="txt_Tipo" runat="server" Text='<%# Bind("Tipo") %>' CssClass="form-control" Width="100%"></asp:TextBox>
                                     </EditItemTemplate>
                                     <ItemTemplate>
                                         <asp:Label ID="lbl_Tipo" runat="server" Text='<%# Eval("Tipo") %>'></asp:Label>
                                     </ItemTemplate>
                                     <ItemStyle VerticalAlign="Top" Width="10%" />
                                 </asp:TemplateField>--%>
                             </Columns>
                         </asp:GridView>
                         <asp:SqlDataSource ID="sqlDS_Roles" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>" 
                                            SelectCommand="WS_Seg_Get_Lista_Roles" SelectCommandType="StoredProcedure" 
                                            DeleteCommand="WS_Seg_Man_Roles" DeleteCommandType="StoredProcedure"
                                            UpdateCommand="WS_Seg_Man_Roles" UpdateCommandType="StoredProcedure">
                             <DeleteParameters>
                                 <asp:Parameter DefaultValue="3" Name="Operacion" Type="Int32" />
                             </DeleteParameters>
                             <SelectParameters>
                                 <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                             </SelectParameters>
                             <UpdateParameters>
                                 <asp:ControlParameter ControlID="hdf_Operacion" DefaultValue="2" Name="Operacion" PropertyName="Value" Type="Int32" />
                                 <asp:Parameter Name="Descripcion" Type="String" />
                                 <asp:Parameter Name="Detalle" Type="String" />
                                 <asp:Parameter Name="Tipo" Type="Int32" />
                             </UpdateParameters>
                         </asp:SqlDataSource>
       </div>

             </ContentTemplate>
             <Triggers>
             </Triggers>
         </asp:UpdatePanel>


     </div>

</asp:Content>
