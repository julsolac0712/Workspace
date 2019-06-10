<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ErrorGeneral.aspx.vb" Inherits="WorkSpace.ErrorGeneral" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <div class="form-header">
        <h3>
            <asp:Localize id="lcl_Error" runat="server" Text="Error General"></asp:Localize>
        </h3>
    
    </div>
        <div class="form-body">
            <div class="row">
                <div class="col-md-3">
                    <asp:Image ID="img_Informacion" runat="server"  ImageUrl="~/Images/alert01.png" />
                </div>
                   <div class="col-md-9">
                       <div class="row">
                           <div class="col-md-12">
                                <asp:Label ID="lbl_Mensaje" runat="server"></asp:Label> 
                           </div>
                       </div>
                        <div class="row">
                           <div class="col-md-12">
                                        <asp:Label ID="lbl_InfoContacto" runat="server" 
                    Text="En caso de cualquier duda, comentario o sugerencia acerca del sistema puede escribir a" 
                    SkinID="lbl_H4Normal"></asp:Label>
                           </div>
                       </div>
                           <div class="row">
                           <div class="col-md-12">
                                 <asp:HyperLink ID="hlnk_CorreoAdministrador" runat="server" ></asp:HyperLink>
                           </div>
                       </div>
   
                
                               
                </div>
            </div>
        </div>
</asp:Content>
