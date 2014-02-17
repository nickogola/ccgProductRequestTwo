using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web.UI;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using ccgWebApp.Model;

namespace ccgWebApp
{
    public partial class _Default : Page
    {

        private List<Product> products
        {
            get
            {
                if (ViewState["products"] == null)
                    ViewState["products"] = new List<Product>();

                return (List<Product>)ViewState["products"];
            }
            set
            {
                ViewState["products"] = value;
            }
        }
       
        public bool EmailFromProductLookup
        {
            get { return ViewState["EmailFromProductLookup"] == null ? false : (bool)ViewState["EmailFromProductLookup"]; }
            set { ViewState["EmailFromProductLookup"] = value; }
        }

        public bool EmailFromContactSection
        {
            get { return ViewState["EmailFromContactSection"] == null ? false : (bool)ViewState["EmailFromContactSection"]; }
            set { ViewState["EmailFromContactSection"] = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadGrid();
            }
        }

        protected void LoadGrid()
        {
            WebClient client = new WebClient();
            var data = client.DownloadString("http://www.corpcomm.com/ccgwebapi/sample.ashx");
            var jArray = JArray.Parse(data);
            var jArr = jArray[0];

            products.Clear();
          //  List<Product> products = new List<Product>();
            if (products.Count() == 0)
            {
                foreach (var j in jArray)
                    products.Add(JsonConvert.DeserializeObject<Product>(j.ToString()));
            }

            //Product deserializedProduct = JsonConvert.DeserializeObject<Product>(jArray[0].ToString());
            if (!String.IsNullOrEmpty(tbQuantity.Text))
                products = products.Where(p => p.quantity == Convert.ToInt32(tbQuantity.Text)).ToList();
            //products.Add(deserializedProduct);
            productsGrid.DataSource = products;
            productsGrid.DataBind();

            if (productsGrid.Rows.Count == 0)
                lNoResults.Text = "No Records to display";
            else
                lNoResults.Text = string.Empty;

        }
        protected void sendMail()
        {
            try
            {

                SmtpClient mySmtpClient = new SmtpClient("smtp.gmail.com", 587);

                // set smtp-client with basicAuthentication
                mySmtpClient.UseDefaultCredentials = false;
                System.Net.NetworkCredential basicAuthenticationInfo = new
                   System.Net.NetworkCredential("ogolanick@gmail.com", "gzee6900");
                mySmtpClient.Credentials = basicAuthenticationInfo;

                if (EmailFromProductLookup)
                {
                    // add from,to mailaddresses
                    MailAddress from = new MailAddress("ogolanick@gmail.com", "Nick Ogola");
                    MailAddress to = new MailAddress(tbEmail.Text, "8th wonder");
                    MailMessage myMail = new System.Net.Mail.MailMessage(from, to);

                    // add ReplyTo
                    MailAddress replyto = new MailAddress("ogolanick@gmail.com");
                    myMail.ReplyTo = replyto;

                    // set subject and encoding
                    myMail.Subject = "Product Details";
                    myMail.SubjectEncoding = System.Text.Encoding.UTF8;

                    // set body-message and encoding
                    myMail.Body = "<b>Below are product details sent to you from " + from;
                    if (products.Count() > 1)
                    {
                        foreach (Product product in products)
                        {
                            myMail.Body += " </b><br /><br /><b>Product Sku: </b> " + product.sku +
                            "<br /> <b>Name: </b>" + product.name + "<br /> <b>Description: </b>" + product.description + "<br /> <b>Quantity: </b>" + product.quantity;
                        }
                    }
                    else
                    {
                        myMail.Body += " </b><br /><br /><b>Product Sku: </b> " + products[0].sku +
                            "<br /> <b>Name: </b>" + products[0].name + "<br /> <b>Description: </b>" + products[0].description + "<br /> <b>Quantity: </b>" + products[0].quantity;
                    }

                    myMail.BodyEncoding = System.Text.Encoding.UTF8;
                    // text or html
                    myMail.IsBodyHtml = true;
                    mySmtpClient.EnableSsl = true;
                    mySmtpClient.Send(myMail);
                }
                else if (EmailFromContactSection)
                {
                    // add from,to mailaddresses
                    MailAddress from = new MailAddress(email.Value, "Nick Ogola");
                    MailAddress to = new MailAddress("ogolanick@gmail.com", name.Value);
                    MailMessage myMail = new System.Net.Mail.MailMessage(from, to);

                    // add ReplyTo
                    MailAddress replyto = new MailAddress("ogolanick@gmail.com");
                    myMail.ReplyTo = replyto;

                    // set subject and encoding
                    myMail.Subject = "Customer Contact";
                    myMail.SubjectEncoding = System.Text.Encoding.UTF8;

                    // set body-message and encoding
                    myMail.Body = "<b>Below is a message sent to you from " + name.Value + "<br /><br />" + message.Value;
                        
                        //"<b>Below are product details sent to you from " + from;
                   
                        //myMail.Body += " </b><br /><br /><b>Product Sku: </b> " + products[0].sku +
                        //    "<br /> <b>Name: </b>" + products[0].name + "<br /> <b>Description: </b>" + products[0].description + "<br /> <b>Quantity: </b>" + products[0].quantity;
                    

                    myMail.BodyEncoding = System.Text.Encoding.UTF8;
                    // text or html
                    myMail.IsBodyHtml = true;
                    mySmtpClient.EnableSsl = true;
                    mySmtpClient.Send(myMail);
                }
               
            }

            catch (SmtpException ex)
            {
                throw new ApplicationException
                  ("SmtpException has occured: " + ex.Message);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        protected void btnSend_Click(object sender, EventArgs e)
        {
            EmailFromContactSection = false;
            EmailFromProductLookup = true;
            sendMail();
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            LoadGrid();
        }

        protected void contactBtn_Click(object sender, EventArgs e)
        {
            EmailFromContactSection = true;
            EmailFromProductLookup = false;
            sendMail();
        }
    }
}