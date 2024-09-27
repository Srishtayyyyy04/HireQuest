using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;

namespace WebApplication22
{
    public partial class Registration : Page
    {
        private string connectionString = "uid=sa;password=manager@123;database=Srishti;server=HV4T324\\SQLEXPRESS";
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            // Ensure to assign the values from the TextBox controls
            string companyName = firstname.Text;
            string address = lastname.Text;
            string mobileNumber = mobilenumber.Text;
            string emailValue = email.Text; // Renamed to avoid conflict with 'email'
            string passwordValue = password.Text; // Renamed to avoid conflict with 'password'

            // Ensure the connection string is set correctly in your Web.config
         

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // Use parameterized queries to prevent SQL injection
                string query = "INSERT INTO EmployerCredentials (CompanyName, Address, MobileNumber, Email, Password) VALUES (@CompanyName, @Address, @MobileNumber, @Email, @Password)";
                SqlCommand cmd = new SqlCommand(query, conn);

                // Use parameters for secure query execution
                cmd.Parameters.AddWithValue("@CompanyName", companyName);
                cmd.Parameters.AddWithValue("@Address", address);
                cmd.Parameters.AddWithValue("@MobileNumber", mobileNumber);
                cmd.Parameters.AddWithValue("@Email", emailValue);
                cmd.Parameters.AddWithValue("@Password", passwordValue); // Remember to hash this in production

                try
                {
                    conn.Open();
                    cmd.ExecuteNonQuery();
                    // Optionally redirect or show a success message
                    Response.Redirect("login.aspx");
                }
                catch (Exception ex)
                {
                    // Handle the error (logging, user message, etc.)
                }
                finally
                {
                    conn.Close();
                }
            }
        }
    }
}
