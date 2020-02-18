<%@ Page Title="Mantenimiento de Contrapartes" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="Contrapartes.aspx.vb" Inherits="WorkSpace.Contrapartes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

      <div class="container">
          <asp:HiddenField ID="hdf_Operacion" runat="server" />
          <asp:HiddenField ID="hdf_Usuario" runat="server" />
          <asp:HiddenField ID="hdf_Idioma" runat="server" />

          <asp:UpdatePanel ID="upAjax_Contrapartes" runat="server">
              <ContentTemplate>
                  <span class="page-titles">
                      <asp:Localize ID="lcl_Descripcion" runat="server" Text="Contrapartes Financieras"></asp:Localize>
                  </span>

                  <div class="row">
                      <div class="margin-top-10  col-md-4">
                          <div class="divFloatRight">
                              <asp:Localize ID="Localize1" runat="server" Text="Filtrar por"></asp:Localize>
                              <div class="input-group">
                                  <asp:TextBox ID="txt_buscar" runat="server" CssClass="form-control" Width="70%" placeholder="Palabra clave"></asp:TextBox>&nbsp;
                                    <asp:Button ID="btn_buscar" runat="server" Text="Buscar" CssClass="btn btn-info" />
                              </div>
                          </div>
                      </div>
                  </div>
                  <div class="margin-top-30 ">
                      <asp:GridView ID="gv_Contrapartes" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False" DataKeyNames="id_ContraFinanciera" DataSourceID="sqlDS_Contrapartes" Width="100%" AllowPaging="True" AllowSorting="True" PageSize="20">
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

                                      <div class="row">
                                          <div class="col-md-12">
                                              <asp:Label ID="lbl_Descripcion" runat="server" Text="Descripción Español" AssociatedControlID="txt_Descripcion"></asp:Label>
                                              <asp:TextBox ID="txt_Descripcion" runat="server" Text='<%# Bind("Descripcion") %>' CssClass="form-control"></asp:TextBox>
                                              <asp:RequiredFieldValidator ID="rfv_Descripcion" runat="server" ErrorMessage="Requerido" ValidationGroup="Registro" ControlToValidate="txt_Descripcion" Display="Dynamic" Font-Bold="True" ForeColor="Red">*</asp:RequiredFieldValidator>
                                          </div>
                                      </div>
                                      <div class="row">
                                          <div class="col-md-12">
                                              <asp:Label ID="lbl_Descripcion_En" runat="server" Text="Descripción Ingles" AssociatedControlID="txt_Descripcion_En"></asp:Label>
                                              <asp:TextBox ID="txt_Descripcion_En" runat="server" Text='<%# Bind("Descripcion_En") %>' CssClass="form-control"></asp:TextBox>
                                          </div>
                                      </div>
                                      <div class="row">
                                          <div class="col-md-6">
                                              <asp:Label ID="lbl_Abrev" runat="server" Text="Siglas Español" AssociatedControlID="txt_Abrev"></asp:Label>
                                              <asp:TextBox ID="txt_Abrev" runat="server" Text='<%# Bind("Abrev") %>' CssClass="form-control"></asp:TextBox>
                                              
                                          </div>
                                          <div class="col-md-6">
                                              <asp:Label ID="lbl_Abrev_En" runat="server" Text="Siglas Inglés" AssociatedControlID="txt_Abrev_En"></asp:Label>
                                              <asp:TextBox ID="txt_Abrev_En" runat="server" Text='<%# Bind("Abrev_En") %>' CssClass="form-control"></asp:TextBox>
                                          </div>
                                      </div>
                                      <div class="row">
                                          <div class="col-md-6">
                                              <asp:Label ID="lbl_CodPais" runat="server" Text="País" AssociatedControlID="ddl_Pais"></asp:Label>
                                              <asp:DropDownList ID="ddl_Pais" runat="server" CssClass="form-control" DataSourceID="sqlDS_Pais" DataTextField="DesPais" DataValueField="CodPais" SelectedValue='<%# Bind("FK_CodPais") %>' Width="100%"></asp:DropDownList>
                                              <asp:SqlDataSource ID="sqlDS_Pais" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>" SelectCommand="WS_Get_Lista_Paises" SelectCommandType="StoredProcedure">
                                                  <SelectParameters>
                                                      <asp:Parameter DefaultValue="5" Name="Operacion" Type="Int32" />
                                                      <asp:ControlParameter ControlID="hdf_Idioma" DefaultValue="es" Name="Idioma" PropertyName="Value" Type="String" />
                                                  </SelectParameters>
                                              </asp:SqlDataSource>
                                             
                                          </div>
                                      </div>

                                      <div class="row">
                                          <div class="col-md-12">
                                              <asp:Label ID="lbl_Web" runat="server" Text="Sitio Web" AssociatedControlID="txt_Web"></asp:Label>
                                              <asp:TextBox ID="txt_Web" runat="server" Text='<%# Bind("Web") %>' CssClass="form-control" TextMode="Url"></asp:TextBox>
                                          </div>
                                      </div>
                                      <div class="row">
                                          <div class="col-md-12">
                                              <asp:Label ID="lbl_Contacto" runat="server" Text="Contacto" AssociatedControlID="txt_Contacto"></asp:Label>
                                              <asp:TextBox ID="txt_Contacto" runat="server" Text='<%# Bind("Contacto") %>' CssClass="form-control"></asp:TextBox>
                                          </div>
                                      </div>
                                      <div class="row">
                                          <div class="col-md-12">
                                              <asp:Label ID="lbl_Telefono" runat="server" Text="Teléfono" AssociatedControlID="txt_Telefono"></asp:Label>
                                              <asp:TextBox ID="txt_Telefono" runat="server" Text='<%# Bind("Telefono") %>' CssClass="form-control" TextMode="Phone"></asp:TextBox>
                                          </div>
                                      </div>
                                      <div class="row">
                                          <div class="col-md-12">
                                              <asp:Label ID="lbl_Email" runat="server" Text="Email" AssociatedControlID="txt_Email"></asp:Label>
                                              <asp:TextBox ID="txt_Email" runat="server" Text='<%# Bind("Email") %>' CssClass="form-control" TextMode="Email"></asp:TextBox>
                                          </div>
                                      </div>

                                  </EditItemTemplate>
                                  <ItemTemplate>
                                      <asp:Label ID="Label1" runat="server" Text='<%# Eval("Descripcion") %>'></asp:Label>
                                  </ItemTemplate>
                                  <ItemStyle VerticalAlign="Top" Width="60%" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="Siglas" SortExpression="Abrev">
                                  <ItemTemplate>
                                      <asp:Label ID="Label2" runat="server" Text='<%# Eval("Abrev") %>'></asp:Label>
                                  </ItemTemplate>
                                  <ItemStyle VerticalAlign="Top" Width="15%" />
                              </asp:TemplateField>
                              <asp:TemplateField HeaderText="País" SortExpression="DesPais">
                                  <ItemTemplate>
                                      <asp:Label ID="Label3" runat="server" Text='<%# Eval("DesPais") %>'></asp:Label>
                                  </ItemTemplate>
                                  <ItemStyle VerticalAlign="Top" Width="15%" />
                              </asp:TemplateField>

                          </Columns>
                      </asp:GridView>
                      <asp:SqlDataSource ID="sqlDS_Contrapartes" runat="server" ConnectionString="<%$ ConnectionStrings:SUGIConnectionString %>" DeleteCommand="SUGI_OPOR_Man_ContrapartesFinancieras" DeleteCommandType="StoredProcedure" InsertCommand="SUGI_OPOR_Man_ContrapartesFinancieras" InsertCommandType="StoredProcedure" SelectCommand="SUGI_OPOR_Get_Lista_Financieras" SelectCommandType="StoredProcedure" UpdateCommand="SUGI_OPOR_Man_ContrapartesFinancieras" UpdateCommandType="StoredProcedure">
                          <DeleteParameters>
                              <asp:Parameter Name="Operacion" Type="Int32" DefaultValue="3" />
                              <asp:ControlParameter ControlID="hdf_Usuario" DefaultValue="0" Name="Usuario" PropertyName="Value" Type="Int32" />
                          </DeleteParameters>
                          <InsertParameters>
                              <asp:ControlParameter ControlID="hdf_Operacion" DefaultValue="1" Name="Operacion" PropertyName="Value" Type="Int32" />
                              <asp:Parameter Name="Descripcion" Type="String" />
                              <asp:Parameter Name="Descripcion_En" Type="String" />
                              <asp:Parameter Name="Abrev" Type="String" />
                              <asp:Parameter Name="Abrev_En" Type="String" />
                              <asp:Parameter Name="FK_CodPais" Type="String" />
                              <asp:Parameter Name="Web" Type="String" />
                              <asp:Parameter Name="Contacto" Type="String" />
                              <asp:Parameter Name="Telefono" Type="String" />
                              <asp:Parameter Name="Email" Type="String" />
                              <asp:ControlParameter ControlID="hdf_Usuario" DefaultValue="0" Name="Usuario" PropertyName="Value" Type="Int32" />
                          </InsertParameters>
                          <SelectParameters>
                              <asp:Parameter DefaultValue="3" Name="Operacion" Type="Int32" />
                              <asp:Parameter DefaultValue="es" Name="Idioma" Type="String" />
                              <asp:ControlParameter ControlID="txt_buscar" DefaultValue="0" Name="filtro" PropertyName="Text" Type="String" />
                          </SelectParameters>
                          <UpdateParameters>
                              <asp:ControlParameter ControlID="hdf_Operacion" DefaultValue="2" Name="Operacion" PropertyName="Value" Type="Int32" />
                              <asp:Parameter Name="Descripcion" Type="String" />
                              <asp:Parameter Name="Descripcion_En" Type="String" />
                              <asp:Parameter Name="Abrev" Type="String" />
                              <asp:Parameter Name="Abrev_En" Type="String" />
                              <asp:Parameter Name="FK_CodPais" Type="String" />
                              <asp:Parameter Name="Web" Type="String" />
                              <asp:Parameter Name="Contacto" Type="String" />
                              <asp:Parameter Name="Telefono" Type="String" />
                              <asp:Parameter Name="Email" Type="String" />
                              <asp:ControlParameter ControlID="hdf_Usuario" DefaultValue="0" Name="Usuario" PropertyName="Value" Type="Int32" />
                          </UpdateParameters>
                      </asp:SqlDataSource>
                  </div>
              </ContentTemplate>
          </asp:UpdatePanel>
      </div>

</asp:Content>
