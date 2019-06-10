<%@ Page Title="Profile" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="perfil.aspx.vb" Inherits="WorkSpace.Perfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card profile profile-card">
                <asp:Image ID="img_Perfil" runat="server" CssClass="profile-image-width"  />
                       <asp:LinkButton runat="server" class="btn edit-profile position-edit-profile " ID="lnkBtn_VerPlan" ToolTip="Editar" data-toggle="modal" data-target="#myModal">
                                <span class="glyphicon glyphicon-pencil imagen-edit-profile"></span>
                           </asp:LinkButton> 
             
                <h1>
                    <asp:Literal ID="ltl_nombre" runat="server" ></asp:Literal></h1>
                <p class="title">
                    <asp:Literal ID="ltl_Profesion" runat="server"></asp:Literal></p>
          
               
                       
                    <div><a href="../../Default.aspx">Home</a> </div>

                       

                
                
            </div>
        </div>
        
        
    </div>
    <!-- Modal -->
   
<div id="myModal" class="modal fade profile-margin-left-100 " role="dialog">
  <div class="modal-dialog ">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">
            <asp:Literal ID="ltl_Profile" runat="server" Text="Mi Perfil"></asp:Literal></h4>
      </div>
      <div class="modal-body">

          <asp:HiddenField ID="hdf_ID_Intranet" runat="server" />
          <asp:HiddenField ID="hdf_Imagen" runat="server" />
            <asp:HiddenField ID="hdf_Operacion" runat="server" />
         <asp:FormView ID="fv_Perfil" runat="server" DataSourceID="sqlDS_Perfil" RenderOuterTable="False" DefaultMode="Insert">
            <InsertItemTemplate>
                <asp:HiddenField ID="hdf_Imagen" runat="server"  Value='<%# Eval("Imagen")%>'/>         
                     <div class="row margin-top-10">
                             <div class="col-md-10">
                    <asp:Label ID="lbl_Fotografia" runat="server" Text="Foto" AssociatedControlID="fup_Fotografia"></asp:Label>
                    <asp:FileUpload ID="fup_Fotografia" CssClass="bootstrap-file-input" runat="server" />
                                   <asp:Localize ID="lcl_Foto" runat="server" Text="Localización física del archivo (jpg,png)."></asp:Localize>
                    <asp:RegularExpressionValidator ID="rev_ValidaFormatoPortada" runat="server" ControlToValidate="fup_Fotografia" CssClass="error-span"
                                    ErrorMessage="Formato del achivo" ValidationExpression="^.+(.jpg|.JPG|.jpeg|.JPEG|.gif|.GIF|.png|.PNG)$"
                                    Display="Dynamic" ValidationGroup="Registro"  Text="El archivo seleccionado no corresponde a un archivo válido (jpg,jpeg,gif)"
                                    ></asp:RegularExpressionValidator>
                             </div>
                         </div>      
                     <div class="row margin-top-10"">
                    <div class="col-md-12">
                        <asp:Button ID="btn_Guardar_Insert" runat="server" Text="Guardar" CssClass="btn btn-iica-green" CommandName="Insert"  OnClick="btn_Guardar_Insert_Click"  ValidationGroup="Registro" />
                       
                    </div>
                </div>
                     
            </InsertItemTemplate>
        </asp:FormView>
          <asp:SqlDataSource ID="sqlDS_Perfil" runat="server" ConnectionString="<%$ ConnectionStrings:WSConnectionString %>" 
              SelectCommand="WS_Get_Lista_Perfil" SelectCommandType="StoredProcedure" CancelSelectOnNullParameter="False"
              InsertCommand ="WS_Man_Perfil" InsertCommandType="StoredProcedure"
              ProviderName="System.Data.SqlClient">
              <SelectParameters>
                  <asp:ControlParameter ControlID="hdf_ID_Intranet" Name="IDIntranet" PropertyName="Value" Type="Int32" />
                  <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
              </SelectParameters>
              
              <InsertParameters>
                           <asp:ControlParameter ControlID="hdf_ID_Intranet" Name="IDIntranet" PropertyName="Value" Type="Int32" />
               <asp:ControlParameter ControlID="hdf_Imagen" Name="Imagen" PropertyName="Value" Type="String" />
                <asp:Parameter DefaultValue="1" Name="Operacion" Type="Int32" />
           </InsertParameters>
          </asp:SqlDataSource>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">
            <asp:Literal ID="Literal2" runat="server" Text="Cerrar"></asp:Literal></button>
      </div>
    </div>

  </div>
</div>
     
  
        <%--<asp:PlaceHolder runat="server">
        <webopt:BundleReference runat="server" Path="~/Content/JQueryUI" />
             <webopt:BundleReference runat="server" Path="~/Content/bootstrap-file-selector-css" />
        <%:
            Scripts.Render("~/bundles/jquery-ui","~/bundles/bootstrap-file-selector-js")
        %>
    </asp:PlaceHolder>--%>
</asp:Content>
