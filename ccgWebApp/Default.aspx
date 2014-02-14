<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ccgWebApp._Default" %>

<%@ Register Assembly="Telerik.Web.UI, Version=2013.2.717.45, Culture=neutral, PublicKeyToken=121fae78165ba3d4" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
      
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
   <script type="text/javascript">
       $(document).ready(function () {
           $('.qty').bind('keyup', function () {
               regex = /^-*[0-9,\.]+$/;
               if (!regex.test($(this).val())) {
                   if ($(this).val().length > 0) {
                       $(this).next('.error').remove();
                       $(this).after('<div class="error">Please enter a number</div>');
                       $(this).preventdefault();
                   }
                   else {
                       $(this).next('.error').remove();
                   }
               } else {
                   $(this).next('.error').remove();
               }
           });

           $('.email').bind('keyup', function () {
               regex = /^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/;
               $(".mail").next('.error').remove();//
               if (!regex.test($(this).val())) {
                   if ($(this).val().length > 0) {
                       $(this).next('.error').remove();
                       $(this).after('<div class="error">Please enter a valid email address</div>');
                       $(this).preventdefault();
                   }
                   else {
                       $(this).next('.error').remove();
                   }
               } else {
                   $(this).next('.error').remove();
               }
           });

           $(".prod").click(function (event) {
               regex = /^-*[0-9,\.]+$/;
               if (!regex.test($(this).val())) {
                 
                       $('.qty').next('.error').remove();
                       // $('.qty').after('<div class="error">Please enter a number</div>');
                       event.preventdefault();
               } else {
                   $(this).next('.error').remove();
               }

               if ($(this).val().length == 0) {
                   $('.qty').after('<div class="error">Please enter a number</div>');
                   event.preventdefault();
               }
           });
           $(".mail").click(function (event) {
               regex = /^([0-9a-zA-Z]([-\.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$/;
               if (!regex.test($('.email').val())) {
                       $('.email').next('.error').remove();
                       $('.email').after('<div class="error">Please enter a valid email address</div>');
                       event.preventDefault();
                   
               } else {
                   $(this).next('.error').remove();
               }
           });

           $(".msg").click(function (event) {
               if ($("#message").val() == null) {
                   $("#message").next('.error').remove();
                   $("#message").after('<div class="error">Please enter a valid email address and message</div>');
                   event.preventDefault();
               }
           });
       });
   </script>

  <div id="main-content">
      <section id="top"></section><!-- do not remove ;)-->
    <section id="home">
      <div id="loader" class="loader"></div>
      <div id="ps_container" class="ps_container"> <span class="ribbon"></span>
        <div class="ps_image_wrapper"> 
          <!-- First initial image --> 
          <img src="images/1.jpg" alt="" /> </div>
        <!-- Navigation items -->
        <div class="ps_next"></div>
        <div class="ps_prev"></div>
        <!-- Dot list with thumbnail preview -->
        <ul class="ps_nav">
          <li class="selected"><a href="images/1.jpg" rel="images/thumbs/1.jpg">Image 1</a></li>
          <li><a href="images/2.jpg" rel="images/thumbs/2.jpg">Image 2</a></li>
          <li><a href="images/3.jpg" rel="images/thumbs/3.jpg">Image 3</a></li>
          <li><a href="images/4.jpg" rel="images/thumbs/4.jpg">Image 4</a></li>
          <li><a href="images/5.jpg" rel="images/thumbs/5.jpg">Image 5</a></li>
          <li class="ps_preview">
            <div class="ps_preview_wrapper"> 
              <!-- Thumbnail comes here --> 
            </div>
            <!-- Little triangle --> 
            <span></span> </li>
        </ul>
      </div>
      
    </section> <!--end section-->
    
    <section id="work" class="clearfix">
      <header>
        <h2>Product Lookup</h2>
      </header>
            <div class="recent-work columns">
        
            <strong>Enter Quantity:</strong> <asp:TextBox ID="tbQuantity" CssClass="qty" runat="server" Width="140px" ValidationGroup="quantitygrp" />
            <asp:RequiredFieldValidator ID="rfQuantity" runat="server" ControlToValidate="tbQuantity" ForeColor="Red" ErrorMessage="*"  ValidationGroup="quantitygrp"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="rgxQuantity" runat="server" ControlToValidate="tbQuantity" ForeColor="Red" ErrorMessage="*Please enter a number" Display="Dynamic"  ValidationGroup="quantitygrp"></asp:RegularExpressionValidator>

    &nbsp;

    <asp:Button ID="btnsearch" runat="server" Text="Search Quantity" CssClass="button prod" OnClick="btnsearch_Click" ValidationGroup="quantitygrp" /> <br /><br />
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate> 
            <telerik:RadGrid ID="productsGrid" runat="server" AutoGenerateColumns="false" HeaderStyle-Font-Bold="true">
             <MasterTableView Width="100%">
              <Columns>
                <telerik:GridBoundColumn SortExpression="sku" HeaderText="Sku" DataField="sku" >
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn SortExpression="name" HeaderText="Name" DataField="name">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn SortExpression="description" HeaderText="Description" DataField="description">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn SortExpression="quantity" HeaderText="Quantity" DataField="quantity" />
            </Columns>
            </MasterTableView>
            </telerik:RadGrid>
              </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnsearch" EventName="Click" /> 
            </Triggers>
        </asp:UpdatePanel> <br />
          <strong>Enter Email to quantity details: </strong> <asp:TextBox ID="tbEmail" CssClass="email" runat="server" Width="140px" ValidationGroup="productgrp" />
          <asp:RequiredFieldValidator ID="rfEmail" runat="server"  ControlToValidate="tbEmail" ForeColor="Red" ErrorMessage="*" ValidationGroup="productgrp"/>

    &nbsp;
    <asp:Button ID="btnSend" runat="server" Text="Send Email" CssClass="button mail" OnClick="btnSend_Click" ValidationGroup="productgrp" />
       

      </div>

    </section> <!--end section-->

    <section id="contact" class="clearfix">
      <header>
        <h2>Have Any Questions?</h2>
      </header>
      
    <%--  <form action="#" method="post">
      	<p><input type="text" name="name"  value="Your Name" id="name" onblur="if (this.value == ''){this.value = 'Your Name'; }" onfocus="if (this.value == 'Your Name') {this.value = '';}" /></p>
        <p><input type="text" name="email" value="Your Email" id="email"  onblur="if (this.value == ''){this.value = 'Your Email'; }" onfocus="if (this.value == 'Your Email') {this.value = '';}" /></p>
        <p><textarea cols="20" rows="7" name="message" id="message" onblur="if (this.value == ''){this.value = 'Your Message'; }" onfocus="if (this.value == 'Your Message') {this.value = '';}" >Your Message</textarea></p>
        <p><input type="submit" name="submit" value="Send Message" class="button" /></p>
      </form>--%>
        <p><input type="text" name="name" value="Your Name" id="name" runat="server" onblur="if (this.value == ''){this.value = 'Your Name'; }" onfocus="if (this.value == 'Your Name') {this.value = '';}" /></p>
        <p><input type="text" name="email" value="Your Email" id="email" runat="server" onblur="if (this.value == ''){this.value = 'Your Email'; }" onfocus="if (this.value == 'Your Email') {this.value = '';}" /></p>
        <p><textarea cols="20" rows="7" class="message" name="message" id="message" runat="server" onblur="if (this.value == ''){this.value = 'Your Message'; }" onfocus="if (this.value == 'Your Message') {this.value = '';}" >Your Message</textarea></p>
        <p><asp:Button ID="contactBtn" runat="server" Text="Send Message" CssClass="button msg" OnClick="contactBtn_Click"  /></p>
      <div class="social_wrapper">
        	<h3>Where to find me?</h3>
            <ul class="social">
            	<li class="dribble"><a href="#">Dribble</a></li>
                <li class="twitter"><a href="#">Twitter</a></li>
                <li class="lastfm"><a href="#">Last FM</a></li>
                <li class="facebook"><a href="#">Facebook</a></li>
                <li class="location"><a href="#">Location</a></li>
                <li class="forrst"><a href="#">Forrst</a></li>
            </ul>
        </div>
        
      <div class="copyright">
      	<p><small>This <abbr title="Hypertext Markup Language 5">HTML5</abbr> Single Page Portfolio was created <em>by</em> <a href="http://webdesigneraid.com/">WebDesignerAid.com</a> <em>for</em> <a href="http://speckyboy.com/">Speckyboy</a></small></p>
      </div><!--end copyright-->
    </section> <!--end section-->
   
      
  </div>
 
    
</asp:Content>
