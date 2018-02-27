using System.Web.Optimization;

namespace EdubookASP.App_Start
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            StyleBundle thirdPartyStyle = new StyleBundle("~/bundles/styles");
            thirdPartyStyle.Include("~/Content/bootstrap.css", "~/Content/font-awesome.css", "~/Content/site.css");

            ScriptBundle validationBundle = new ScriptBundle("~/bundles/validation");
            validationBundle.Include("~/Scripts/jquery.validate.js");

            ScriptBundle thirdPartyScripts = new ScriptBundle("~/bundles/scripts");
            thirdPartyScripts.Include("~/Scripts/jquery-3.3.1.js", "~/Scripts/bootstrap.js", "~/Scripts/modernizer-3.4.0.js");

            bundles.Add(thirdPartyStyle);
            bundles.Add(validationBundle);
            bundles.Add(thirdPartyScripts);
            BundleTable.EnableOptimizations = true;
        }
    }
}