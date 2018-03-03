using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EdubookASP
{
    public partial class Search : System.Web.UI.Page
    {
        EdubookDataClassesDataContext dbContext;
        public Search()
        {
            dbContext = new EdubookDataClassesDataContext();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void ButtonSearch_Click(object sender, EventArgs e)
        {
            string inputText = InputSearch.Text;
            var profiles = from profile in dbContext.Profiles where profile.FirstName.Contains(inputText) || profile.LastName.Contains(inputText) select profile;
            SearchRepeater.DataSource = profiles;
            SearchRepeater.DataBind();
        }
    }
}