using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using University.DataAccessLayer;
using System.Data;
using Error_Handler_Control;
using University.Exception_Handling;

namespace University
{
    public partial class ViewStudents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

      //View the names of students registered in a particular class

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                int classnumber;
                classnumber = Convert.ToInt32(txtClassNum.Text);
                UniversityDataAccess dal = new UniversityDataAccess();
                DataSet dr = dal.ListStudents(classnumber);
                // Invalid Class Number
                if (dr.Tables.Count == 0)
                {
                    ErrorMessageControl.AddErrorMessage("Class Number is invalid.Please check!");
                    listStudents1.Visible = false;
                    
                }
                else
                {
                    // No student in the class
                    if (dr.Tables[0].Rows.Count == 0)
                    {
                        ErrorMessageControl.AddInfoMessage("There are no students enrolled in this class!");
                        listStudents1.Visible = false;
                    }
                    else
                    {
                        listStudents1.DataSource = dr;
                        listStudents1.DataBind();
                        listStudents1.Visible = true;

                    }
                }
            }
            catch (Exception ex)
            {
                SimpleException.HandleException(ex);
            }
        }

        
    }
}
      