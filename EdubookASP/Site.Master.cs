using System;

namespace EdubookASP
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] == null && Session["Username"] == null && Session["Email"] == null)
            {
                Response.Redirect("~/Account/Login");
            }
        }
    }
}