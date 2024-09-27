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
    public partial class ManageJob : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("SELECT * FROM StudentApplications", conn);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                gvStudents.DataSource = dt;
                gvStudents.DataBind();
            }
        }
        protected void btnReject_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int studentId = Convert.ToInt32(btn.CommandArgument);
            RejectApplication(studentId);
            BindGrid(); // Refresh the grid
        }
          private void RejectApplication(int id)
        {
           
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("UPDATE StudentApplications SET Status = 'Rejected' WHERE Id = @Id", conn);
                cmd.Parameters.AddWithValue("@Id", id);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }
    }
}