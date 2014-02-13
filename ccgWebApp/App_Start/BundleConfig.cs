using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;

namespace ccgWebApp
{
    public class BundleConfig
    {
        // For more information on Bundling, visit http://go.microsoft.com/fwlink/?LinkId=254726
        public static void RegisterBundles(BundleCollection bundles)
        {
            //bundles.Add(new ScriptBundle("~/bundles/WebFormsJs").Include(
            //      "~/Scripts/WebForms/WebForms.js",
            //      "~/Scripts/WebForms/WebUIValidation.js",
            //      "~/Scripts/WebForms/MenuStandards.js",
            //      "~/Scripts/WebForms/Focus.js",
            //      "~/Scripts/WebForms/GridView.js",
            //      "~/Scripts/WebForms/DetailsView.js",
            //      "~/Scripts/WebForms/TreeView.js",
            //      "~/Scripts/WebForms/WebParts.js"));
            bundles.Add(new ScriptBundle("~/bundles/WebFormsJs").Include(
                  "~/Scripts/WebForms/config.js",
                  "~/Scripts/WebForms/html5shiv.js",
                  "~/Scripts/WebForms/jquery.min.js",
                  "~/Scripts/WebForms/skel.js",
                  "~/Scripts/WebForms/skel-panels.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/MsAjaxJs").Include(
                "~/Scripts/WebForms/MsAjax/MicrosoftAjax.js",
                "~/Scripts/WebForms/MsAjax/MicrosoftAjaxApplicationServices.js",
                "~/Scripts/WebForms/MsAjax/MicrosoftAjaxTimer.js",
                "~/Scripts/WebForms/MsAjax/MicrosoftAjaxWebForms.js"));

            //bundles.Add(new StyleBundle("~/Content/css").Include(
            //       "~/Content/skel-noscript.css",
            //       "~/Content/style.css",
            //       "~/Content/style-mobile.css",
            //       "~/Content/style-desktop.css",
            //       "~/Content/style-1000px.css",
            //       "~/Content/ie7.css",
            //       "~/Content/ie8.css",
            //       "~/Content/ie9.css",
            //        "~/Content/Site.css"));

            // Use the Development version of Modernizr to develop with and learn from. Then, when you’re
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                "~/Scripts/modernizr-*"));
        }
    }
}