using System;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Web.UI;

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
            //Debug.WriteLine("Before Find The Update Data");
            var updateProfile = dbContext.Profiles.Single(p => p.User_UserId == userId);
            updateProfile.FirstName = InputFirstName.Text;
            updateProfile.LastName = InputLastName.Text;
            updateProfile.City = InputCity.Text;
            updateProfile.Institution = InputInstitution.Text;
            updateProfile.Education = InputEducation.Text;
            updateProfile.About = InputAbout.Text;
            updateProfile.FavTag = InputFavTag.Text;
            //Debug.WriteLine("Before Writing Data");
            dbContext.SubmitChanges();
            //Debug.WriteLine("After Writing Data");
            Response.Redirect(Request.RawUrl);
        }

        private void PopulateProfile(int userId)
        {
            var profile = dbContext.Profiles.Single(p => p.User_UserId == userId);

            InputFirstName.Text = profile.FirstName;
            InputLastName.Text = profile.LastName;
            InputDOB.Text = profile.BirthDate.ToString("dd-MM-yyyy");
            InputCity.Text = profile.City;
            InputEducation.Text = profile.Education;
            InputInstitution.Text = profile.Institution;
            InputFavTag.Text = profile.FavTag;
            InputAbout.Text = profile.About;
        }

        protected void UploadImage_Click(object sender, EventArgs e)
        {
            var profile = dbContext.Profiles.Single(p => p.User_UserId == userId);
            string memberImageUploadPath = "";
            if (ProfileImageUpload.HasFile)
            {
                string fileExtension = Path.GetExtension(ProfileImageUpload.PostedFile.FileName);
                memberImageUploadPath = @"~/Uploads/" + Session["Username"].ToString() + fileExtension;
                ProfileImageUpload.SaveAs(Server.MapPath(memberImageUploadPath));
            }
            profile.PhotoUrl = memberImageUploadPath;
            dbContext.SubmitChanges();
            Response.Redirect(Request.RawUrl);
        }
        private void RemoveFileIfExists(string filePath)
        {
            if (File.Exists(filePath))
            {
                File.Delete(filePath);
            }
        }
    }
}