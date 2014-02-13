<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ccgWebApp._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
      
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <script type="text/javascript">
        $(document).ready(function () {
            $('.email').bind('keyup', function () {
                regex = /^[A-z0-9]+$/;
                if (!regex.test($(this).val())) {
                    $(this).next('.error').remove();
                    $(this).after('<div class="error">Wrong</div>');
                } else {
                    $(this).next('.error').remove();
                }
            });
        });
    </script>
    Enter Quantity:<asp:TextBox ID="tbQuantity" runat="server" Width="140px" />
    <asp:RequiredFieldValidator ID="rftbQuantity" runat="server" ControlToValidate="tbQuantity" ForeColor="Red" ErrorMessage="*" ValidationGroup="product"></asp:RequiredFieldValidator>
   <asp:RegularExpressionValidator ID="rgxTbQuantity" runat="server" ControlToValidate="tbQuantity" ForeColor="Red" ErrorMessage="*Please enter a number"   ValidationExpression="[\d]" ValidationGroup="product" />

    &nbsp;

    <asp:Button ID="btnsearch" runat="server" Text="SEARCH" OnClick="btnsearch_Click" />
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate> 
    <asp:GridView ID="productsGrid" runat="server" AutoGenerateColumns="false" GridLines="Both">
        <Columns>
            <asp:BoundField DataField="sku" HeaderText="Sku" />
            <asp:BoundField DataField="name" HeaderText="Name" />
            <asp:BoundField DataField="description" HeaderText="Description" />
            <asp:BoundField DataField="quantity" HeaderText="Quantity" />
        </Columns>
    </asp:GridView>
              </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnsearch" EventName="Click" /> 
            </Triggers>
        </asp:UpdatePanel>
    <br />
            Enter Email to quantity details:<asp:TextBox ID="tbEmail" CssClass="email" runat="server" Width="140px" />
     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbEmail" ForeColor="Red" ErrorMessage="*" ValidationGroup="product"></asp:RequiredFieldValidator>
   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbEmail" ForeColor="Red" ErrorMessage="*Please enter a valid email address" 
        ValidationExpression="^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$" ValidationGroup="product" />
    &nbsp;
    <asp:Button ID="btnSend" runat="server" Text="Send Email" OnClick="btnSend_Click" ValidationGroup="product" />
            
    
</asp:Content>
