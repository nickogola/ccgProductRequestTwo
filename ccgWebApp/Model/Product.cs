using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ccgWebApp.Model
{
    [Serializable]
    public class Product
    {
        public int sku { get; set; }
        public string name { get; set; }
        public int quantity { get; set; }
        public string description { get; set; }
    }
}