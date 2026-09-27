using System;
using System.Configuration;
using System.Data.SqlClient;

namespace StudentManagementSystem
{
    public partial class AddStudent : System.Web.UI.Page
    {
        string connectionString =
            ConfigurationManager.ConnectionStrings["StudentDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            using (SqlConnection con =
                   new SqlConnection(connectionString))
            {
                string query =
                    @"INSERT INTO Students
                      (Name, Age, Class, Email)
                      VALUES
                      (@Name, @Age, @Class, @Email)";

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

                    con.Open();

                    cmd.ExecuteNonQuery();
                }
            }

            Response.Redirect("StudentList.aspx");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentList.aspx");
        }
    }
}