using System;
using System.Diagnostics;
using System.Linq;

namespace EdubookASP
{
    public partial class Site : System.Web.UI.MasterPage
    {
        EdubookDataClassesDataContext dbContext;
        public Site()
        {
            dbContext = new EdubookDataClassesDataContext();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Debug.WriteLine("Master Page Load");
            if (Session["UserId"] == null && Session["Username"] == null && Session["Email"] == null)
            {
                Response.Redirect("~/Account/Login");
            }
            else
            {
                int userId = Convert.ToInt32(Session["UserId"]);
                var profiles = from prof in dbContext.Profiles where prof.User_UserId == userId select prof;
                foreach (Profile profile in profiles)
                {
                    LabelUserName.Text = profile.FirstName + " " + profile.LastName;
                    LabelAbout.Text = profile.About;
                    UserImage.ImageUrl = profile.PhotoUrl;
                }
            }
            
        }
    }
}