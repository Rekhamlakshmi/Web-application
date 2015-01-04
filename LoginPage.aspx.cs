using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;
using University.DataAccessLayer;
using University.Exception_Handling;

namespace University
{
    public partial class LoginPage : System.Web.UI.Page
    {
        public string strLoginErrorMsg;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

       /* The user name and password are authenticated and if authentication fails, 
        the appropriate Error Message is displayed  */

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            try
            {
                e.Authenticated = false;
                DataTable dt;
                UniversityDataAccess dal = new UniversityDataAccess();
                dt = dal.Login(Login1.UserName, Login1.Password);

                if (dt.Rows.Count == 0)
                {
                    strLoginErrorMsg = "Invalid UserName";
                    dt.Dispose();
                    e.Authenticated = false;

                }
                else
                {
                    string strTemppwd = Convert.ToString(dt.Rows[0]["Password"]).Trim();
                    if ((strTemppwd.ToLower() != Login1.Password.ToLower()))
                    {
                        strLoginErrorMsg = "Invalid Password";
                        e.Authenticated = false;
                    }
                    else
                        e.Authenticated = true;
                }
            }
            catch (Exception ex)
            { 
                SimpleException.HandleException(ex); 
            }
        }

        protected void Login1_LoginError(object sender, EventArgs e)
        {
            Login1.FailureText = strLoginErrorMsg;
        }
    }
}