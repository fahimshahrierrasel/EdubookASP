using System.Web.Optimization;

namespace EdubookASP.App_Start
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            StyleBundle thirdPartyStyle = new StyleBundle("~/bundles/styles");
            thirdPartyStyle.Include("~/Content/bootstrap.css", "~/Content/font-awesome.css", "~/Content/site.css");


            ScriptBundle thirdPartyScripts = new ScriptBundle("~/bundles/scripts");
            thirdPartyScripts.Include("~/Scripts/jquery-3.3.1.js",
                "~/Scripts/bootstrap.js",
                "~/Scripts/jquery.validate.js",
                "~/Scripts/modernizer-3.4.0.js");

            bundles.Add(thirdPartyStyle);
            bundles.Add(thirdPartyScripts);
            BundleTable.EnableOptimizations = true;
        }
    }
}