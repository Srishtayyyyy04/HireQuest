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
    public partial class PostJob : System.Web.UI.Page
    {
        private string connectionString = "uid=sa;password=manager@123;database=Srishti;server=HV4T324\\SQLEXPRESS";
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void PostJobButton_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO JobHire (Position, CompanyName, Location, Username, Password, MobilePhone, Address, Email, JobDescription, Skills) " +
                               "VALUES (@Position, @CompanyName, @Location, @Username, @Password, @MobilePhone, @Address, @Email, @JobDescription, @Skills)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Position", Position.Text);
                cmd.Parameters.AddWithValue("@CompanyName", CompanyName.Text);
                cmd.Parameters.AddWithValue("@Location", Location.Text);
                cmd.Parameters.AddWithValue("@Username", Username.Text);
                cmd.Parameters.AddWithValue("@Password", Password.Text);
                cmd.Parameters.AddWithValue("@MobilePhone", MobilePhone.Text);
                cmd.Parameters.AddWithValue("@Address", Address.Text);
                cmd.Parameters.AddWithValue("@Email", Email.Text);
                cmd.Parameters.AddWithValue("@JobDescription", JobDescription.Text);
                cmd.Parameters.AddWithValue("@Skills", Skills.Text);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                // Optionally show a success message
                Response.Write("<script>alert('Job posted successfully!');</script>");
            }
        }

    }
}