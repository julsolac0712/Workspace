<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="TipoReportes_BI.aspx.vb" Inherits="WorkSpace.TipoReportes_BI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

     <div class="container">
        <asp:HiddenField ID="hdf_Operacion" runat="server" />
        <asp:HiddenField ID="hdf_Usuario" runat="server" />
        <asp:HiddenField ID="hdf_Idioma" runat="server" />

         <asp:UpdatePanel ID="upAjax_Usuarios" runat="server">
             <ContentTemplate>      
                   
                        <span class="page-titles"><asp:Localize ID="lcl_Descripcion" runat="server" Text="Administración Tipo de Reportes BI" ></asp:Localize>
                        </span>
                 <div class="margin-top-10 ">
                 <asp:GridView ID="gv_Reportes" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="PK_ID_TipoReporte,lastUpdate" DataSourceID="sqlDS_TipoReportes" Width="100%" AllowPaging="True" AllowSorting="True">
                             <Columns>
                                 <asp:TemplateField ShowHeader="False">
                                     <EditItemTemplate>
                                         <asp:LinkButton ID="lnk_Guardar" runat="server" ClientIDMode="AutoID" CommandName="Update" ValidationGroup="Registro" CssClass="btn btn-default"  ToolTip="<%$ Resources:Global, SalvarTooltip %>"><span class="glyphicon glyphicon-ok glyphicons-iica"></span></asp:LinkButton>
                                         <asp:LinkButton ID="lnk_Cancelar" runat="server" ClientIDMode="AutoID" CommandName="Cancel" CssClass="btn btn-default"  ToolTip="<%$ Resources:Global, CancelarTooltip %>"><span class="glyphicon glyphicon-remove glyphicons-iica"></asp:LinkButton>
                                     </EditItemTemplate>
                                     <ItemTemplate>
                                         <asp:LinkButton ID="lnk_Editar" runat="server" ClientIDMode="AutoID" CommandName="Edit" ToolTip="<%$ Resources:Global, ActualizarTooltip %>" CssClass="btn btn-default" ><span class="glyphicon glyphicon-edit glyphicons-iica"></span></asp:LinkButton>
                                         <asp:LinkButton ID="lnk_Eliminar" runat="server" ClientIDMode="AutoID" CommandName="Delete" ToolTip="<%$ Resources:Global, EliminarTooltip %>" CssClass="btn btn-default" OnClientClick="return confirm('¿Desea eliminar el registro?');" ><span class="glyphicon glyphicon-trash glyphicons-iica"></span></asp:LinkButton>
                                         <asp:LinkButton ID="lnk_Agregar" runat="server" ClientIDMode="AutoID" CommandName="Edit"  ToolTip="<%$ Resources:Global, NuevoTooltip %>" Visible="False" CssClass="btn btn-default"><span class="glyphicon glyphicon-plus glyphicons-iica"></span></asp:LinkButton>
                                     </ItemTemplate>
                                     <ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="10%" />
                                 </asp:TemplateField>
                                 
                                 <asp:TemplateField HeaderText="Nombre" SortExpression="Nombre">
                                     <EditItemTemplate>
                                         <asp:TextBox ID="txt_Descripcion" runat="server" Text='<%# Bind("Descripcion") %>' CssClass="form-control" Width="100%"></asp:TextBox>
                                          <asp:RequiredFieldValidator ID="rfv_Titulo" runat="server" ControlToValidate="txt_Descripcion"
                                                  ErrorMessage="Requerido" Text="<%$ Resources:Global , CampoRequerido %>" CssClass="error-span"
                                                 Display="Dynamic" ValidationGroup="Registro"></asp:RequiredFieldValidator>
                                     </EditItemTemplate>
                                     <ItemTemplate>
                                         <asp:localize ID="lcl_Descripcion" runat="server" Text='<%# Eval("Descripcion") %>'></asp:localize>
                                     </ItemTemplate>
                                     <ItemStyle VerticalAlign="Top" Width="90%" />
                                 </asp:TemplateField>
                                 
                                
                             </Columns>
                         </asp:GridView>
                         <asp:SqlDataSource ID="sqlDS_TipoReportes" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>" 
                                            SelectCommand="WS_Get_Lista_TipoReportes_BI" SelectCommandType="StoredProcedure" 
                                            DeleteCommand="WS_Man_TipoReportes_BI" DeleteCommandType="StoredProcedure"
                                            UpdateCommand="WS_Man_TipoReportes_BI" UpdateCommandType="StoredProcedure">
                             <DeleteParameters>
                                 <asp:Parameter DefaultValue="3" Name="Operacion" Type="Int32" />
                             </DeleteParameters>
                             <SelectParameters>
                                 <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
                             </SelectParameters>
                             <UpdateParameters>
                                 <asp:ControlParameter ControlID="hdf_Operacion" DefaultValue="2" Name="Operacion" PropertyName="Value" Type="Int32" />
                             </UpdateParameters>
                         </asp:SqlDataSource>
       </div>

             </ContentTemplate>
         </asp:UpdatePanel>


     </div>

</asp:Content>
