using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace WebApplication22
{
    public partial class RegistrationStudent : Page
    {
        private string connectionString = "uid=sa;password=manager@123;database=Srishti;server=HV4T324\\SQLEXPRESS";
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optionally handle any logic for page load here
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            // Access the TextBox controls directly
            string firstName = firstname.Text;
            string lastName = lastname.Text;
            string mobileNumber = mobilenumber.Text;
            string emailValue = email.Text; // Changed to avoid confusion with variable name
            string passwordValue = password.Text; // Changed to avoid confusion with variable name

            // Use the connection string from Web.config

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO StudentCredentials (FirstName, LastName, MobileNumber, Email, Password) VALUES (@FirstName, @LastName, @MobileNumber, @Email, @Password)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@LastName", lastName);
                    cmd.Parameters.AddWithValue("@MobileNumber", mobileNumber);
                    cmd.Parameters.AddWithValue("@Email", emailValue); // Use the updated variable
                    cmd.Parameters.AddWithValue("@Password", HashPassword(passwordValue)); // Use the updated variable

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            // Optionally, redirect or display a success message
            Response.Redirect("login.aspx"); // Redirect to a success page
        }

        private string HashPassword(string password)
        {
            // Hash the password using SHA256
            using (var sha256 = System.Security.Cryptography.SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(System.Text.Encoding.UTF8.GetBytes(password));
                return Convert.ToBase64String(bytes);
            }
        }
    }
}
