using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication22
{
    public partial class Landing_page : System.Web.UI.Page
    {
        private string connectionString = "uid=sa;password=manager@123;database=Srishti;server=HV4T324\\SQLEXPRESS";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadJobListings(); // Load all job listings initially
            }
        }
        private void LoadJobListings(string searchTerm = null)
        {
            var jobListings = new List<Job>();
            string query = "SELECT Position, Company, IconUrl, Location, SalaryRange, JobDescription, CompanyWebsite FROM Jobss";

            if (!string.IsNullOrEmpty(searchTerm))
            {
                query += " WHERE Position LIKE @searchTerm"; // Filter by position
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);

                if (!string.IsNullOrEmpty(searchTerm))
                {
                    command.Parameters.AddWithValue("@searchTerm", "%" + searchTerm + "%"); // Add parameter for search
                }

                try
                {
                    connection.Open();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            var job = new Job
                            {
                                Position = reader["Position"].ToString(),
                                Company = reader["Company"].ToString(),
                                IconUrl = reader["IconUrl"].ToString(),
                                Location = reader["Location"].ToString(),
                                SalaryRange = reader["SalaryRange"].ToString(),
                                JobDescription = reader["JobDescription"].ToString(),
                                CompanyWebsite = reader["CompanyWebsite"].ToString()
                            };
                            jobListings.Add(job);
                        }
                    }
                }
                catch (Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
            }

            jobsRepeater.DataSource = jobListings;
            jobsRepeater.DataBind();
        }
        protected void SearchButton_Click(object sender, EventArgs e)
        {
            // Fetch the input from the search box
            string searchTerm = Request.Form["positionInput"];
            LoadJobListings(searchTerm); // Call the method with the search term
        }
    }
    public class Job
    {
        public string Position { get; set; }
        public string Company { get; set; }
        public string IconUrl { get; set; }
        public string Location { get; set; }
        public string SalaryRange { get; set; }
        public string JobDescription { get; set; }
        public string CompanyWebsite { get; set; }
    }
}

