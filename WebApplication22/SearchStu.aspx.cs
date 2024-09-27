using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication22
{
    public partial class SearchStu : System.Web.UI.Page
    {
        private string connectionString = "uid=sa;password=manager@123;database=Srishti;server=HV4T324\\SQLEXPRESS";
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnFind_Click(object sender, EventArgs e)
        {
            string skill = txtSkill.Text;
            BindGrid(skill);

            // Show the loading GIF
            imgLoading.Visible = true;

            // Simulate a delay for loading data (e.g., from a database)
            System.Threading.Thread.Sleep(1000); // Simulating data fetch delay

            // Here you would fetch data based on txtSkill.Text and bind it to the GridView
            // Example: gvStudents.DataSource = yourDataSource;
            // gvStudents.DataBind();

            // After fetching data, hide the loading GIF and show the GridView
            imgLoading.Visible = false;
            gvStudents.Visible = true;
        }

        
        private void BindGrid(string skill)
        {

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Name, Location, Qualification, Skill, Experience FROM SearchStu WHERE Skill LIKE @Skill", connection))
                {
                    cmd.Parameters.AddWithValue("@Skill", "%" + skill + "%");
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        gvStudents.DataSource = dt;
                        gvStudents.DataBind();
                    }
                }
            }
        }
    }
}