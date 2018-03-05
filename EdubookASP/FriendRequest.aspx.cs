using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EdubookASP
{
    public partial class FriendRequest : System.Web.UI.Page
    {
        EdubookDataClassesDataContext dbContext;

        public FriendRequest()
        {
            dbContext = new EdubookDataClassesDataContext();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            int profileId = Convert.ToInt32(Request.QueryString["PID"]);
            int userId = Convert.ToInt32(Session["UserId"]);
            dbContext.Friends.InsertOnSubmit(new Friend()
            {
                Profile_FriendId = profileId,
                User_UserId = userId
            });

            dbContext.SubmitChanges();
            Response.Redirect("FriendsPage");
        }
    }
}