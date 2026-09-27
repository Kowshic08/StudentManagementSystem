using System;
using System.Configuration;
using System.Data.SqlClient;

namespace StudentManagementSystem
{
    public partial class EditStudent : System.Web.UI.Page
    {
        string connectionString =
            ConfigurationManager.ConnectionStrings["StudentDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int studentId =
                    Convert.ToInt32(Request.QueryString["id"]);

                LoadStudent(studentId);
            }
        }

        private void LoadStudent(int studentId)
        {
            using (SqlConnection con =
                   new SqlConnection(connectionString))
            {
                string query =
                    "SELECT * FROM Students WHERE StudentId=@StudentId";

                using (SqlCommand cmd =
                       new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue(
                        "@StudentId", studentId);

                    con.Open();

                    SqlDataReader reader =
                        cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        hfStudentId.Value =
                            reader["StudentId"].ToString();

                        txtName.Text =
                            reader["Name"].ToString();

                        txtAge.Text =
                            reader["Age"].ToString();

                        txtClass.Text =
                            reader["Class"].ToString();

                        txtEmail.Text =
                            reader["Email"].ToString();
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con =
                   new SqlConnection(connectionString))
            {
                string query =
                    @"UPDATE Students
                      SET Name=@Name,
                          Age=@Age,
                          Class=@Class,
                          Email=@Email
                      WHERE StudentId=@StudentId";

                using (SqlCommand cmd =
                       new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue(
                        "@Name", txtName.Text);

                    cmd.Parameters.AddWithValue(
                        "@Age", txtAge.Text);

                    cmd.Parameters.AddWithValue(
                        "@Class", txtClass.Text);

                    cmd.Parameters.AddWithValue(
                        "@Email", txtEmail.Text);

                    cmd.Parameters.AddWithValue(
                        "@StudentId", hfStudentId.Value);

                    con.Open();

                    cmd.ExecuteNonQuery();
                }
            }

            Response.Redirect("StudentList.aspx");
        }
    }
}