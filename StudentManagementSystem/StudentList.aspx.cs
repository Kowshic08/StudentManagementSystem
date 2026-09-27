using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace StudentManagementSystem
{
    public partial class StudentList : System.Web.UI.Page
    {
        string connectionString =
            ConfigurationManager.ConnectionStrings["StudentDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudents();
            }
        }

        private void LoadStudents()
        {
            using (SqlConnection con =
                   new SqlConnection(connectionString))
            {
                string query =
                    "SELECT StudentId, Name, Age, Class, Email FROM Students";

                using (SqlDataAdapter da =
                       new SqlDataAdapter(query, con))
                {
                    DataTable dt = new DataTable();

                    da.Fill(dt);

                    gvStudents.DataSource = dt;
                    gvStudents.DataBind();
                }
            }
        }

        protected void gvStudents_RowCommand(
            object sender,
            GridViewCommandEventArgs e)
        {
            int studentId =
                Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditStudent")
            {
                Response.Redirect(
                    "EditStudent.aspx?id=" + studentId);
            }
            else if (e.CommandName == "DeleteStudent")
            {
                DeleteStudent(studentId);

                LoadStudents();
            }
        }

        private void DeleteStudent(int studentId)
        {
            using (SqlConnection con =
                   new SqlConnection(connectionString))
            {
                string query =
                    "DELETE FROM Students WHERE StudentId=@StudentId";

                using (SqlCommand cmd =
                       new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue(
                        "@StudentId", studentId);

                    con.Open();

                    cmd.ExecuteNonQuery();
                }
            }
        }
    }
}