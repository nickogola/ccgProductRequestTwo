<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ccgWebApp._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
      
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
   

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
        
            <strong>Enter Quantity:</strong> <asp:TextBox ID="tbQuantity" runat="server" Width="140px" />
    <asp:RequiredFieldValidator ID="rftbQuantity" runat="server" ControlToValidate="tbQuantity" ForeColor="Red" ErrorMessage="*" ValidationGroup="product"></asp:RequiredFieldValidator>
   <asp:RegularExpressionValidator ID="rgxTbQuantity" runat="server" ControlToValidate="tbQuantity" ForeColor="Red" ErrorMessage="*Please enter a number" Display="Dynamic"  ValidationExpression="[\d]" ValidationGroup="product" />

    &nbsp;

    <asp:Button ID="btnsearch" runat="server" Text="Search Quantity" ValidationGroup="product" CssClass="button" OnClick="btnsearch_Click" /> <br /><br />
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate> 
    <asp:GridView ID="productsGrid" runat="server" CellPadding="10" CellSpacing="10"  HeaderStyle-Font-Bold="true" Width="900px"
        AutoGenerateColumns="false" GridLines="Both">
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
        </asp:UpdatePanel> <br />
          <strong>Enter Email to quantity details: </strong> <asp:TextBox ID="tbEmail" CssClass="email" runat="server" Width="140px" />
     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tbEmail" ForeColor="Red" ErrorMessage="*" ValidationGroup="product"></asp:RequiredFieldValidator>
   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbEmail" ForeColor="Red" ErrorMessage="*Please enter a valid email address"  Display="Dynamic"
        ValidationExpression="^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$" ValidationGroup="product" />
    &nbsp;
    <asp:Button ID="btnSend" runat="server" Text="Send Email" CssClass="button" OnClick="btnSend_Click" ValidationGroup="product" />
        <%--<div class="two-column">
          <figure><a href="images/pricing_table_3.jpg" rel="recent_work" class="zoom"><img src="images/work_1.jpg" alt="Image"></a></figure>
        </div>
        <div class="two-column last">
          <figure><a href="images/pricing_table_3.jpg" rel="recent_work" class="zoom"><img src="images/work_2.jpg" alt="Image"></a></figure>
        </div>--%>

      </div>

    </section> <!--end section-->

    <section id="contact" class="clearfix">
      <header>
        <h2>Have Any Questions?</h2>
      </header>
      
      <form action="#" method="post">
      	<p><input type="text" name="name"  value="Your Name" id="name" onblur="if (this.value == ''){this.value = 'Your Name'; }" onfocus="if (this.value == 'Your Name') {this.value = '';}" /></p>
        <p><input type="text" name="email" value="Your Email" id="email"  onblur="if (this.value == ''){this.value = 'Your Email'; }" onfocus="if (this.value == 'Your Email') {this.value = '';}" /></p>
        <p><textarea cols="20" rows="7" name="message" id="message" onblur="if (this.value == ''){this.value = 'Your Message'; }" onfocus="if (this.value == 'Your Message') {this.value = '';}" >Your Message</textarea></p>
        <p><input type="submit" name="submit" value="Send Message" class="button" /></p>
      </form>
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
