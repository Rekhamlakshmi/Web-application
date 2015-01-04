using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using University.DataAccessLayer;
using System.Data;
using University.Exception_Handling;
using Error_Handler_Control;

namespace University
{
    public partial class StudentProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        /* Displays a particular student's profile such as 
         * courses enrolled, grades,etc */
        protected void btnviewprofile_Click(object sender, EventArgs e)
        {
            try
            {
                string netid;
                netid = txtnetid.Text;
                gridProfile1.Visible = false;
                UniversityDataAccess dal = new UniversityDataAccess();
                DataSet dr = dal.StudentProfile(netid);
                if (dr.Tables[0].Rows.Count == 0)
                {
                    ErrorMessageControl.AddErrorMessage("Net ID is invalid.Please check!");
                    gridProfile.Visible = false;
                }
                else
                {
                    gridProfile.DataSource = dr;
                    gridProfile.DataBind();
                    gridProfile.Visible = true;

                }
            }
            catch (Exception ex)
            {
                SimpleException.HandleException(ex); 
            }
        }

        protected void GridData()
        {
            try
            {
                string netid;
                gridProfile.Visible = false;
                netid = txtnetid.Text;
                gridProfile1.AutoGenerateEditButton = true;
                UniversityDataAccess dal = new UniversityDataAccess();
                gridProfile1.AutoGenerateColumns = false;
                DataSet dr = dal.PersonalInfo(netid);
                if (dr.Tables[0].Rows.Count == 0)
                {
                    ErrorMessageControl.AddErrorMessage("Net ID is invalid.Please check!");
                    gridProfile1.Visible = false;
                }
                else
                {
                    gridProfile1.DataSource = dr;
                    gridProfile1.DataBind();
                    gridProfile1.Visible = true;
                }
            }
            catch (Exception ex)
            {
                SimpleException.HandleException(ex); 
            }
        }

        /*Displays a student's contact details along with an option to edit the details */
        protected void btnPersonalinfo_Click(object sender, EventArgs e)
        {
            GridData();
                 
        }

        protected void btnClassSchedule_Click(object sender, EventArgs e)
        {
            try
            {
                string netid;
                netid = txtnetid.Text;
                gridProfile1.Visible = false;
                UniversityDataAccess dal = new UniversityDataAccess();
                DataSet dr = dal.ClassSchedule(netid);
                if (dr.Tables[0].Rows.Count == 0)
                {
                    ErrorMessageControl.AddErrorMessage("Net ID is invalid.Please check!");
                    gridProfile.Visible = false;
                }
                else
                {
                    gridProfile.DataSource = dr;
                    gridProfile.DataBind();
                    gridProfile.Visible = true;

                }
            }
            catch (Exception ex)
            { 
                SimpleException.HandleException(ex); 
            }
        }

        protected void gridProfile1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            try
            {
                gridProfile1.EditIndex = e.NewEditIndex;
                GridData();
            }
            catch (Exception ex)
            { 
                SimpleException.HandleException(ex);
            }

        }

        protected void gridProfile1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                string netid;
                netid = txtnetid.Text;
                GridViewRow row = (GridViewRow)gridProfile1.Rows[e.RowIndex];
                TextBox Fname = (TextBox)row.FindControl("txtFName");
                TextBox LName = (TextBox)row.FindControl("txtLName");
                TextBox Address = (TextBox)row.FindControl("txtAddress");
                TextBox Phone = (TextBox)row.FindControl("txtPhone");
                TextBox Sex = (TextBox)row.FindControl("txtSex");
                TextBox Degree = (TextBox)row.FindControl("txtDegree");
                UniversityDataAccess dal = new UniversityDataAccess();
                string address = Address.Text;
                dal.UpdatePersonalInfo(netid, Fname.Text, LName.Text, Address.Text, Convert.ToInt64(Phone.Text), Sex.Text, Degree.Text);
                gridProfile1.EditIndex = -1;
                GridData();
                ErrorMessageControl.AddSuccessMessage("Details have been updated successfully!");

            }
            catch (Exception ex)
            {
                SimpleException.HandleException(ex);
            }
             
        }

        protected void gridProfile1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            try
            {
                gridProfile1.EditIndex = -1;
                GridData();
            }
            catch (Exception ex)
            {
                SimpleException.HandleException(ex);
            }
        }

     }
}

