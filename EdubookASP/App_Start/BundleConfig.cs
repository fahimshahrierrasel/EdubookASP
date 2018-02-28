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

            StyleBundle simpleMdeStyle = new StyleBundle("~/bundles/mdestyle");
            simpleMdeStyle.Include("~/Content/simplemde.min.css");

            ScriptBundle simpleMdeScripts = new ScriptBundle("~/bundles/mdescript");
            simpleMdeScripts.Include("~/Scripts/simplemde.min.js");

            bundles.Add(thirdPartyStyle);
            bundles.Add(simpleMdeStyle);
            bundles.Add(validationBundle);
            bundles.Add(thirdPartyScripts);
            bundles.Add(simpleMdeScripts);
            BundleTable.EnableOptimizations = true;
        }
    }
}