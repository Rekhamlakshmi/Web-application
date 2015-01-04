using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using University.DataAccessLayer;
using University.Exception_Handling;
using Error_Handler_Control;

namespace University
{
    public partial class Faculty : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /* Searches for an Instructor based on Last Name and displays 
         details such as Rank, Office Hours, Office*/
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                string lname;

                lname = txtlastname.Text;
                UniversityDataAccess dal = new UniversityDataAccess();
                DataSet dr = dal.FacultyProfile(lname);
                if (dr.Tables[0].Rows.Count == 0)
                {
                    ErrorMessageControl.AddWarningMessage("The entered name does not exist.Please enter a valid name!");
                    gridfaculty.Visible = false;
                }
                else
                {
                    gridfaculty.DataSource = dr;
                    gridfaculty.DataBind();
                    gridfaculty.Visible = true;
                }
            }
            catch (Exception ex)
            {
                SimpleException.HandleException(ex);
            }
        }
    }
}