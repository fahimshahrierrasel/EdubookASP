using EdubookASP.Utils;
using System;
using System.Linq;

namespace EdubookASP.Account
{
    public partial class Login : System.Web.UI.Page
    {
        EdubookDataClassesDataContext dbContext;
        public Login()
        {
            dbContext = new EdubookDataClassesDataContext();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string email = InputEmail.Text;
            string password = InputPassword.Text;

            var user = from usr in dbContext.Users where usr.Email == email select usr;
            if(user.Count() == 1)
            {
                foreach (User usr in user)
                {
                    if(PasswordHasher.Verify(password, usr.Password))
                    {
                        Session["UserId"] = usr.UserId;
                        Session["Username"] = usr.Username;
                        Session["Email"] = usr.Email;
                        Response.Redirect("~/");
                    }
                    else
                    {
                        WarningPanel.Visible = true;
                        WaringLabel.Text = "Password does not match!!";
                    }
                }
            }
            else
            {
                WarningPanel.Visible = true;
                WaringLabel.Text = "User not found!!";
            }
        }
    }
}