using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Xml;


namespace University.DataAccessLayer
{
    public class UniversityDataAccess
    {
        
        public DataSet LoadData()
        {
            SqlConnection con = null;
            string connectionString = ConfigurationManager.ConnectionStrings["ReadOnlyConnection"].ConnectionString;
            using (con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand("dbo.sp_loaddata", con))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter sda = new SqlDataAdapter(command);
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    return ds;

                }
            }

        }

        public DataSet CourseLookup(string semester, int year, string lname, string coursename, string coursenum, string starttime, string endtime)
        {
            SqlConnection con = null;
            string connectionString = ConfigurationManager.ConnectionStrings["ReadOnlyConnection"].ConnectionString;
            
            using (con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand("dbo.sp_CourseLookup", con))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    if(coursename!="")
                    command.Parameters.AddWithValue("@CName",coursename );
                    if(coursenum!="")
                    command.Parameters.AddWithValue("@CNo",coursenum );
                    if(semester!="")
                    command.Parameters.AddWithValue("@Semester",semester );
                    if (year != 0)
                    {
                        command.Parameters.AddWithValue("@Year", year);
                    }
                    if(lname!="")
                    command.Parameters.AddWithValue("@Instructor",lname );
                    if(starttime!="")
                    command.Parameters.AddWithValue("@LecStartTime",starttime );
                    if(endtime!="")
                    command.Parameters.AddWithValue("@LecEndTime", endtime);

                    SqlDataAdapter sda = new SqlDataAdapter(command);
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    return ds;

                }

            }
        }

        public DataSet ListStudents(int classNumber)
        {
            SqlConnection con = null;
            string connectionString = ConfigurationManager.ConnectionStrings["ReadOnlyConnection"].ConnectionString;
            using (con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand("dbo.Students_List", con))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@ClassNumber", classNumber);
                    var returnParameter = command.Parameters.Add("@ReturnVal", SqlDbType.Int);
                    returnParameter.Direction = ParameterDirection.ReturnValue;
                    SqlDataAdapter sda = new SqlDataAdapter(command);
                    int result = Convert.ToInt32(returnParameter.Value);
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    return ds;
                }

            }
        }

        public DataSet StudentProfile(string netid)
        {
            SqlConnection con = null;
            string connectionString = ConfigurationManager.ConnectionStrings["ReadOnlyConnection"].ConnectionString;
            using (con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand("dbo.sp_StudentProfile", con))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@netid", netid);
                    SqlDataAdapter sda = new SqlDataAdapter(command);
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    return ds;

                }

            }
        }
        public DataSet PersonalInfo(string netid)
        {
            SqlConnection con = null;
            string connectionString = ConfigurationManager.ConnectionStrings["ReadOnlyConnection"].ConnectionString;
            using (con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand("dbo.sp_PersonalInfo", con))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@netid", netid);
                    SqlDataAdapter sda = new SqlDataAdapter(command);
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    return ds;

                }

            }
        }

        public DataSet FacultyProfile(string lname)
        {
            SqlConnection con = null;
            string connectionString = ConfigurationManager.ConnectionStrings["ReadOnlyConnection"].ConnectionString;
            using (con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand("dbo.sp_FacultyDetails", con))
                {
                    command.CommandType = CommandType.StoredProcedure;
                   command.Parameters.AddWithValue("@lname", lname);
                    SqlDataAdapter sda = new SqlDataAdapter(command);
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    return ds;

                }

            }
        }
        public DataSet ClassSchedule(string netid)
        {
            SqlConnection con = null;
            string connectionString = ConfigurationManager.ConnectionStrings["ReadOnlyConnection"].ConnectionString;
            using (con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand("dbo.sp_ClassSchedule", con))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@netid", netid);
                    SqlDataAdapter sda = new SqlDataAdapter(command);
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    return ds;

                }

            }
        }

        public int Enroll(string netid,int classNumber)
        {
            SqlConnection con = null;
            string connectionString = ConfigurationManager.ConnectionStrings["MainConnection"].ConnectionString;
            using (con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand("dbo.sp_Enroll", con))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Studentid", netid);
                    command.Parameters.AddWithValue("@ClassNumber",classNumber);
                    var returnParameter = command.Parameters.Add("@ReturnVal",SqlDbType.Int);
                    returnParameter.Direction = ParameterDirection.ReturnValue;
                    command.ExecuteNonQuery();
                    int result = Convert.ToInt32(returnParameter.Value);
                   return result;

                }

            }
        }

        public DataTable Login(string username, string password)
        {
            SqlConnection con = null;
            string connectionString = ConfigurationManager.ConnectionStrings["ReadOnlyConnection"].ConnectionString;
            using (con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand("dbo.sp_Login", con))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@UserName", username);
                    command.Parameters.AddWithValue("@Password", password);
                    SqlDataAdapter sda = new SqlDataAdapter(command);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    return dt;

                }

            }
        }
        public int Drop(string netid, int classNumber)
        {
            SqlConnection con = null;
            string connectionString = ConfigurationManager.ConnectionStrings["MainConnection"].ConnectionString;
            using (con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand("dbo.sp_Drop", con))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Studentid", netid);
                    command.Parameters.AddWithValue("@ClassNumber", classNumber);
                    var returnParameter = command.Parameters.Add("@ReturnVal", SqlDbType.Int);
                    returnParameter.Direction = ParameterDirection.ReturnValue;
                    command.ExecuteNonQuery();
                    int result = Convert.ToInt32(returnParameter.Value);
                    return result;

                }

            }
        }

        public DataSet ViewClassDetail(int classNumber)
        {
            SqlConnection con = null;
            string connectionString = ConfigurationManager.ConnectionStrings["ReadOnlyConnection"].ConnectionString;
            using (con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand("dbo.sp_ViewClassDetail", con))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@ClassNumber", classNumber);
                    SqlDataAdapter sda = new SqlDataAdapter(command);
                    DataSet ds = new DataSet();
                    sda.Fill(ds);
                    return ds;

                }

            }
        }

        public void UpdatePersonalInfo(string netid, string fname, string lname, string address, long phone, string sex, string degree)
        {
            SqlConnection con = null;
            string connectionString = ConfigurationManager.ConnectionStrings["MainConnection"].ConnectionString;
            using (con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand("dbo.sp_UpdatePersonalInfo", con))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@Studentid", netid);
                    command.Parameters.AddWithValue("@Fname", fname);                
                    command.Parameters.AddWithValue("@Lname", lname);
                    command.Parameters.AddWithValue("@Address", address);
                    command.Parameters.AddWithValue("@Phone", phone);
                    command.Parameters.AddWithValue("@Sex", sex);
                    command.Parameters.AddWithValue("@Degree", degree);
                    command.ExecuteNonQuery();
                }
            }
        }

    }
}