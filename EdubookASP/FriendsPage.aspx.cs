using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EdubookASP
{
    public partial class FriendsPage : System.Web.UI.Page
    {
        EdubookDataClassesDataContext dbContext;
        public FriendsPage()
        {
            dbContext = new EdubookDataClassesDataContext();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            int userId = Convert.ToInt32(Session["UserId"]);
            var friends = from friend in dbContext.Friends
                          join profile in dbContext.Profiles on friend.Profile_FriendId equals profile.ProfileId  
                          where friend.User_UserId == userId select new { profile.PhotoUrl, profile.FirstName, profile.LastName };

            FriendRepeater.DataSource = friends.ToList();
            FriendRepeater.DataBind();
        }
    }
}