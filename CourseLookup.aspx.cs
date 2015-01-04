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
    public partial class CourseLookup : System.Web.UI.Page
    {
       /* The controls are loaded during the Page load and dropdown lists 
        are populated with values from the database */
        
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    UniversityDataAccess dal = new UniversityDataAccess();
                    DataSet ds = dal.LoadData();

                    ddSemester.Items.Add("Spring");
                    ddSemester.Items.Add("Fall");
                    ddSemester.Items.Add("Summer");

                    // Bind Course Name 
                    ddCourseName.DataSource = ds.Tables[0];
                    ddCourseName.DataTextField = ds.Tables[0].Columns["CName"].ToString();
                    ddCourseName.DataValueField = ds.Tables[0].Columns["CName"].ToString();
                    ddCourseName.DataBind();

                    //Bind Course Number
                    ddCourseNumber.DataSource = ds.Tables[1];
                    ddCourseNumber.DataTextField = ds.Tables[1].Columns["CNo"].ToString();
                    ddCourseNumber.DataValueField = ds.Tables[1].Columns["CNo"].ToString();
                    ddCourseNumber.DataBind();

                    //Bind Instructor
                    int count = ds.Tables[2].Rows.Count;
                    for (int i = 0; i < count; i++)
                    {
                        ddInstructor.Items.Add(ds.Tables[2].Rows[i]["LName"].ToString() + "," + ds.Tables[2].Rows[i]["FName"].ToString());
                    }

                    //Bind Lecture Start Time
                    ddLectstart.DataSource = ds.Tables[3];
                    ddLectstart.DataTextField = ds.Tables[3].Columns["LecStartTime"].ToString();
                    ddLectstart.DataValueField = ds.Tables[3].Columns["LecStartTime"].ToString();
                    ddLectstart.DataBind();

                    //Bind Lecture End Time
                    ddLecEnd.DataSource = ds.Tables[4];
                    ddLecEnd.DataTextField = ds.Tables[4].Columns["LecEndTime"].ToString();
                    ddLecEnd.DataValueField = ds.Tables[4].Columns["LecEndTime"].ToString();
                    ddLecEnd.DataBind();
                    ddSemester.Items.Insert(0, new ListItem());
                    ddCourseName.Items.Insert(0, new ListItem());
                    ddInstructor.Items.Insert(0, new ListItem());
                    ddCourseNumber.Items.Insert(0, new ListItem());
                    ddLectstart.Items.Insert(0, new ListItem());  
                    ddLecEnd.Items.Insert(0, new ListItem());
                    

                }
            }
            catch (Exception ex)
            {
                SimpleException.HandleException(ex);
            }

        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                // No search criteria is entered
                if ((ddSemester.SelectedValue == "") & (txtYear.Text == "") & (ddCourseName.SelectedValue == "") & (ddCourseNumber.SelectedValue == "") & (ddInstructor.SelectedValue == "") & (ddLectstart.SelectedValue == "") & (ddLecEnd.SelectedValue == ""))
                {
                    ErrorMessageControl.AddWarningMessage("Please enter atleast one search criteria");
                }
                else
                {
                    string semester;
                    int year;
                    UniversityDataAccess dal = new UniversityDataAccess();
                    semester = ddSemester.SelectedValue;
                    if (txtYear.Text != "")
                        year = Convert.ToInt32(txtYear.Text);
                    else
                        year = 0;
                    string instructor = ddInstructor.SelectedValue;
                    string lname = instructor.Split(',')[0];
                    string coursename = ddCourseName.SelectedValue;
                    string coursenum = ddCourseNumber.SelectedValue;
                    string starttime = ddLectstart.SelectedValue;
                    string endtime = ddLecEnd.SelectedValue;
                    DataSet ds = dal.CourseLookup(semester, year, lname, coursename, coursenum, starttime, endtime);
                    if (ds.Tables[0].Rows.Count == 0)
                    {
                        ErrorMessageControl.AddInfoMessage("There are no classes matching your search criteria.");
                        gridCourseLookup.Visible = false;
                    }
                    else
                    {
                        gridCourseLookup.DataSource = ds;
                        gridCourseLookup.DataBind();
                        gridCourseLookup.Visible = true;
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