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
    public partial class Messages : System.Web.UI.Page
    {
        private string connectionString = "uid=sa;password=manager@123;database=Srishti;server=HV4T324\\SQLEXPRESS";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }
        private void BindGrid()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // Adjust the query to use existing columns
                SqlCommand cmd = new SqlCommand("SELECT Name, Qualification, Skillset, Experience, PostAppliedFor FROM Candidates", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
        public static void SaveMessage(string studentName, string message)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["JobPortalConnection"].ConnectionString))
            {
                // Assuming you want to log the message against the candidate's name
                SqlCommand cmd = new SqlCommand("INSERT INTO Messages (StudentId, Message) VALUES ((SELECT CandidateId FROM Candidates WHERE Name = @Name), @Message)", conn);
                cmd.Parameters.AddWithValue("@Name", studentName);
                cmd.Parameters.AddWithValue("@Message", message);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}