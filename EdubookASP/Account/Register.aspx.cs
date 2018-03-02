using EdubookASP.Utils;
using System;

namespace EdubookASP.Account
{
    public partial class Register : System.Web.UI.Page
    {
        EdubookDataClassesDataContext dbContext;
        public Register()
        {
            dbContext = new EdubookDataClassesDataContext();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            string firstName = InputFirstName.Text;
            string lastName = InputLastName.Text;
            string city = InputCity.Text;
            string dob = InputDOB.Text;
            string username = InputUsername.Text;
            string email = InputEmail.Text;
            string password = InputPassword.Text;
            string confPassword = InputConfPassword.Text;
            if (password.Equals(confPassword))
            {
                try
                {
                    dbContext.InsertNewUser(
                        username: username,
                        email: email,
                        passHash: PasswordHasher.Hash(password),
                        firstName: firstName,
                        lastName: lastName,
                        birthDate: DateTime.Parse(dob).Date,
                        city: city
                    );

                    dbContext.SubmitChanges();

                    SuccessPanel.Visible = true;
                }
                catch (Exception exception)
                {
                    WarningPanel.Visible = true;
                    WaringLabel.Text = exception.Message;
                }
            }
            else
            {
                WarningPanel.Visible = true;
                WaringLabel.Text = "Password did not mathched!!";
            }
        }
    }
}