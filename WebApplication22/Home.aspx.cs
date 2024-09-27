using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication22
{
    public partial class Home : System.Web.UI.Page
    {
        private string connectionString = "uid=sa;password=manager@123;database=Srishti;server=HV4T324\\SQLEXPRESS";
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void searchButton_Click(object sender, EventArgs e)
        {
            string city = cityDropDownList.SelectedValue;
            string searchTerm = searchTextBox.Text.Trim();
            int jobCount = 0;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Start building the query
                string query = "SELECT COUNT(*) AS job_count FROM JobPostings WHERE 1=1"; // Use 1=1 to simplify adding conditions

                // Add conditions based on user input
                if (!string.IsNullOrEmpty(city))
                {
                    query += " AND City = @City";
                }
                if (!string.IsNullOrEmpty(searchTerm))
                {
                    query += " AND JobPost LIKE @SearchTerm";
                }

                // Create the SQL command
                SqlCommand command = new SqlCommand(query, connection);

                // Add parameters conditionally
                if (!string.IsNullOrEmpty(city))
                {
                    command.Parameters.AddWithValue("@City", city);
                }
                if (!string.IsNullOrEmpty(searchTerm))
                {
                    command.Parameters.AddWithValue("@SearchTerm", "%" + searchTerm + "%");
                }

                // Execute the query
                connection.Open();
                jobCount = (int)command.ExecuteScalar();
                connection.Close();
            }

            // Display the results
            if (jobCount > 0)
            {
                resultMessage.InnerText = $"Found {jobCount} job(s) matching your search.";
            }
            else
            {
                resultMessage.InnerText = "No jobs found matching your criteria.";
            }
        }
    }
}