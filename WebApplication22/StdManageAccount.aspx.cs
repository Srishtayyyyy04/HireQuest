using System;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace WebApplication22
{
    public partial class StdManageAccount : Page
    {
        private string connectionString = "uid=sa;password=manager@123;database=Srishti;server=HV4T324\\SQLEXPRESS";

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // Retrieve values from form controls
            string name = Request.Form["name"];
            string email = Request.Form["email"];
            string phone = Request.Form["phone"];
            string skills = Request.Form["skills"];
            string experience = Request.Form["experience"];
            string education = Request.Form["education"];
            string jobTitle = Request.Form["jobTitle"];
            string location = Request.Form["location"];
            string salary = Request.Form["salary"];
            string employmentType = Request.Form["employmentType"];
            bool profileVisibility = Request.Form["profileVisibility"] == "on";

            // Handle file upload if a file is selected
            string resumeFileName = string.Empty;
            if (resume.HasFile)
            {
                resumeFileName = Path.GetFileName(resume.FileName);
                string path = Server.MapPath("~/Resumes/") + resumeFileName;
                resume.SaveAs(path);
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // SQL command to insert data
                string query = "INSERT INTO JobSeekerProfile (Name, Email, Phone, Resume, Skills, Experience, Education, JobTitle, Location, Salary, EmploymentType, ProfileVisibility) " +
                               "VALUES (@Name, @Email, @Phone, @Resume, @Skills, @Experience, @Education, @JobTitle, @Location, @Salary, @EmploymentType, @ProfileVisibility)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    // Adding parameters to avoid SQL injection
                    command.Parameters.AddWithValue("@Name", name);
                    command.Parameters.AddWithValue("@Email", email);
                    command.Parameters.AddWithValue("@Phone", phone);
                    command.Parameters.AddWithValue("@Resume", resumeFileName);
                    command.Parameters.AddWithValue("@Skills", skills);
                    command.Parameters.AddWithValue("@Experience", experience);
                    command.Parameters.AddWithValue("@Education", education);
                    command.Parameters.AddWithValue("@JobTitle", jobTitle);
                    command.Parameters.AddWithValue("@Location", location);
                    command.Parameters.AddWithValue("@Salary", decimal.TryParse(salary, out var salaryValue) ? (object)salaryValue : DBNull.Value);
                    command.Parameters.AddWithValue("@EmploymentType", employmentType);
                    command.Parameters.AddWithValue("@ProfileVisibility", profileVisibility);

                    // Open connection and execute query
                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    lblMessage.Text = rowsAffected > 0 ? "Data stored successfully!" : "Error storing data."; // Message to show success or failure
                }
            }
        }
    }
}
