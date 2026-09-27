using System;
using System.Configuration;
using System.Data.SqlClient;

namespace StudentManagementSystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connectionString =
                ConfigurationManager.ConnectionStrings["StudentDB"].ConnectionString;

            string query =
                "SELECT COUNT(*) FROM Users WHERE Username=@Username AND Password=@Password";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

                    con.Open();

                    int count = (int)cmd.ExecuteScalar();

                    if (count > 0)
                    {
                        Response.Redirect("StudentList.aspx");
                    }
                    else
                    {
                        lblMessage.Text = "Invalid username or password";
                    }
                }
            }
        }
    }
}