using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EdubookASP
{
    public partial class UserDetails : System.Web.UI.Page
    {
        EdubookDataClassesDataContext dbContext;
        int profileId;
        public UserDetails()
        {
            dbContext = new EdubookDataClassesDataContext();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            profileId = Convert.ToInt32(Request.QueryString["PID"]);
            var profile = dbContext.Profiles.Single(p => p.ProfileId == profileId);
            UserImage.ImageUrl = profile.PhotoUrl;
            LabelUserName.Text = profile.FirstName + " " + profile.LastName;
            LabelAbout.Text = profile.About;
            LabelDOB.Text = profile.BirthDate.ToString("dd-MM-yyyy");
            LabelCity.Text = profile.City;
            LabelEducation.Text = profile.Education;
            LabelInstitution.Text = profile.Institution;
            HyperLinkAddFriend.NavigateUrl = "FriendRequest?PID=" + profile.ProfileId;
        }
    }
}