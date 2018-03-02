using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EdubookASP
{
    public partial class ProfilePage : System.Web.UI.Page
    {
        EdubookDataClassesDataContext dbContext;
        int userId;
        public ProfilePage()
        {
            dbContext = new EdubookDataClassesDataContext();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Debug.WriteLine("On Page Load");
            userId = Convert.ToInt32(Session["UserId"]);
            if (!Page.IsPostBack)
            {
                PopulateProfile(userId);
                Debug.WriteLine("On Post Back");
            }
        }
        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            string firstName = InputFirstName.Text;
            string lastName = InputLastName.Text;
            string birthDate = InputDOB.Text;
            string city = InputCity.Text;
            string education = InputEducation.Text;
            string institution = InputInstitution.Text;
            string tags = InputFavTag.Text;
            string about = InputAbout.Text;

            Debug.WriteLine("Before Find The Update Data");
            var updateProfile = dbContext.Profiles.Single(p => p.User_UserId == userId);
            updateProfile.FirstName = firstName;
            updateProfile.LastName = lastName;
            updateProfile.About = InputAbout.Text;
            Debug.WriteLine("Before Writing Data");
            dbContext.SubmitChanges();
            Debug.WriteLine("After Writing Data");
            //Response.Redirect(Request.RawUrl);
        }

        private void PopulateProfile(int userId)
        {
            var profiles = from prof in dbContext.Profiles where prof.User_UserId == userId select prof;

            foreach (Profile profile in profiles)
            {
                InputFirstName.Text = profile.FirstName;
                InputLastName.Text = profile.LastName;
                InputDOB.Text = profile.BirthDate.ToString("dd-MM-yyyy");
                InputCity.Text = profile.City;
                InputEducation.Text = profile.Education;
                InputInstitution.Text = profile.Institution;
                InputFavTag.Text = profile.FavTag;
                InputAbout.Text = profile.About;
            }

        }
    }
}