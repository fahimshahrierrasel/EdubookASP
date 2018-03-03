using System;
using System.Linq;

namespace EdubookASP
{
    public partial class Default : System.Web.UI.Page
    {
        EdubookDataClassesDataContext dbContext;
        public Default()
        {
            dbContext = new EdubookDataClassesDataContext();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            PopulatePosts();
        }

        protected void PostSubmitButton_Click(object sender, EventArgs e)
        {
            string postText = InputPost.Text;
            string tags = InputPostTag.Text;

            if (string.IsNullOrEmpty(tags))
                tags = "All";

            int userID = Convert.ToInt32(Session["UserId"]);


            int profileId = (from profile 
                             in dbContext.Profiles
                             where profile.User_UserId == userID
                             select profile.ProfileId)
                             .First();

            dbContext.Posts.InsertOnSubmit(new Post()
            {
                PostText = postText,
                PostDateTime = DateTime.Now,
                Likes = 0,
                Tags = tags,
                Profile_ProfileId = profileId
            });

            dbContext.SubmitChanges();
            Response.Redirect(Request.RawUrl);
        }

        private void PopulatePosts()
        {
            var posts = from post in dbContext.Posts select post;
            RepeaterPosts.DataSource = posts;
            RepeaterPosts.DataBind();
        }
    }
}