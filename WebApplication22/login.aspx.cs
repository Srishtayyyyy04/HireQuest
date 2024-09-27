using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication22
{
    public partial class login : System.Web.UI.Page
    {
        private string connectionString = "uid=sa;password=manager@123;database=Srishti;server=HV4T324\\SQLEXPRESS";
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string email = Request.Form["email"] ?? Request.Form["email-employer"];
            string password = Request.Form["password"] ?? Request.Form["password-employer"];

            if (ValidateUser(email, password))
            {
                // Redirect to the student dashboard
                Response.Redirect("Student_profile.aspx");
            }
            else
            {
                // Handle invalid login
                ErrorMessageLabel.Text = "Invalid email or password.";
            }
        }

        private bool ValidateUser(string email, string password)
        {
            bool isValid = false;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM StudentCredentials WHERE Email = @Email AND Password = @Password";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password); // Make sure to hash passwords in a real application!

                    conn.Open();
                    int count = (int)cmd.ExecuteScalar();
                    isValid = count > 0;
                }
            }

            return isValid;
        }


    }
}