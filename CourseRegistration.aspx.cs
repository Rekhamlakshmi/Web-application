using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using University.DataAccessLayer;
using System.Data;
using University.Exception_Handling;
using Error_Handler_Control;

namespace University
{
    public partial class CourseRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void load_grid()
        {
            try
            {
                lblStudentNetID.Visible = false;
                txtSudentNetID1.Visible = false;
                lblPrompt.Visible = false;
                reqstudentID.Enabled = false;
                btnEnroll.Visible = false;
                btnDrop.Visible = false;
                int classnumber;
                classnumber = Convert.ToInt32(txtClassNumber.Text);
                UniversityDataAccess dal = new UniversityDataAccess();
                DataSet dr = dal.ViewClassDetail(classnumber);
                if (dr.Tables[0].Rows.Count > 0)
                {
                    gridClassDetail.DataSource = dr;
                    gridClassDetail.DataBind();
                    lblStudentNetID.Visible = true;
                    txtSudentNetID1.Visible = true;
                    reqstudentID.Enabled = true;
                    lblPrompt.Visible = true;
                    btnEnroll.Visible = true;
                    btnDrop.Visible = true;
                  
                }
                else
                   
                    ErrorMessageControl.AddErrorMessage("Class Number is invalid.Please check!");
            }
            catch (Exception ex)
            { 
                SimpleException.HandleException(ex); 
            }
        }

        protected void btnViewClassDetail_Click(object sender, EventArgs e)
        {    
            
            load_grid();
            
        }

        /*Enrolls a student to a particular class if he/she is not 
         already enrolled and if seats are available*/
        protected void btnEnroll_Click(object sender, EventArgs e)
        {
            try
            {

                reqstudentID.Enabled = true;
                int classnumber;
                string netid = txtSudentNetID1.Text;
                classnumber = Convert.ToInt32(txtClassNumber.Text);
                UniversityDataAccess dal = new UniversityDataAccess();
                int dr = dal.Enroll(netid, classnumber);
                //No seats available
                if (dr == 0)
                {
                    
                    ErrorMessageControl.AddWarningMessage("There are no seats available in this class! Please select another class");
                }
                //Successfully enrolled
                if (dr == 1)
                {
                   
                    ErrorMessageControl.AddSuccessMessage("Student has been successfully enrolled to the class.");
                    
                }
                //Student is already enrolled
                if (dr == 2)
                {

                    ErrorMessageControl.AddInfoMessage("Student is already enrolled in this class!");
                }
                //Invalid Class Number
                if (dr == 3)
                {
                   
                    ErrorMessageControl.AddErrorMessage("Class Number is invalid.Please check!");
                }
                //Invalid Net ID
                if (dr == 4)
                {
                    ErrorMessageControl.AddErrorMessage("Student NetID is invalid.Please check!");
                }
                load_grid();
            }
            catch (Exception ex)
            { 
                SimpleException.HandleException(ex);
            }
        }
        // Drops a student from a class if the student is enrolled
        protected void btnDrop_Click(object sender, EventArgs e)
        {
            try
            {
                reqstudentID.Enabled = true;
                int classnumber;
                string netid = txtSudentNetID1.Text;
                classnumber = Convert.ToInt32(txtClassNumber.Text);
                UniversityDataAccess dal = new UniversityDataAccess();
                int dr = dal.Drop(netid, classnumber);
                // Student Not enrolled in class
                if (dr == 0)
                {
                    
                    ErrorMessageControl.AddInfoMessage("Student is not enrolled in this class.Please check the details!");

                }
                // Dropped Successfully
                if (dr == 1)
                {
                    
                    ErrorMessageControl.AddSuccessMessage("Student has been successfully dropped from the class.");
                }
                //Invalid ClassNumber
                if (dr == 2)
                {
                    ErrorMessageControl.AddErrorMessage("Class Number is invalid.Please check!");
                }
                // Invalid NetID
                if (dr == 3)
                {
                    ErrorMessageControl.AddErrorMessage("Student NetID is invalid.Please check!");
                }
               
                load_grid();
            }
            catch (Exception ex)
            {
                SimpleException.HandleException(ex);
            }
        }
    }
}