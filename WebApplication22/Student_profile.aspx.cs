using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication22
{
    public partial class Student_profile : System.Web.UI.Page
    {
        public class UserProfile
        {
            public string FirstName { get; set; }
            public string MiddleName { get; set; }
            public string LastName { get; set; }
            public string Username { get; set; }
            public string Password { get; set; }
            public string MobilePhone { get; set; }
            public string WhatsApp { get; set; }
            public string Email { get; set; }
            public string Skills { get; set; }
            public string CompanyName { get; set; }
            public string Position { get; set; }
            public DateTime StartDate { get; set; }
            public DateTime EndDate { get; set; }
        }

        private static string connectionString = "uid=sa;password=manager@123;database=Srishti;server=HV4T324\\SQLEXPRESS";

        [System.Web.Services.WebMethod]
        public static string SaveProfile()
        {
            try
            {
                // Get form values from the request
                var userProfile = new UserProfile
                {
                    FirstName = HttpContext.Current.Request.Form["firstName"],
                    MiddleName = HttpContext.Current.Request.Form["middleName"],
                    LastName = HttpContext.Current.Request.Form["lastName"],
                    Username = HttpContext.Current.Request.Form["username"],
                    Password = HttpContext.Current.Request.Form["password"],
                    MobilePhone = HttpContext.Current.Request.Form["mobilePhone"],
                    WhatsApp = HttpContext.Current.Request.Form["whatsapp"],
                    Email = HttpContext.Current.Request.Form["email"],
                    Skills = string.Join(", ", HttpContext.Current.Request.Form.GetValues("skills[]") ?? new string[0]),
                    CompanyName = HttpContext.Current.Request.Form["companyName"],
                    Position = HttpContext.Current.Request.Form["position"],
                    StartDate = DateTime.Parse(HttpContext.Current.Request.Form["startDate"]),
                    EndDate = DateTime.Parse(HttpContext.Current.Request.Form["endDate"])
                };

                InsertUserProfile(userProfile);
                return "success";
            }
            catch (Exception ex)
            {
                return $"Error: {ex.Message}";
            }
        }

        protected static void InsertUserProfile(UserProfile userProfile)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                string query = "INSERT INTO UserProfiles (FirstName, MiddleName, LastName, Username, Password, MobilePhone, WhatsApp, Email, Skills, CompanyName, Position, StartDate, EndDate) " +
                               "VALUES (@FirstName, @MiddleName, @LastName, @Username, @Password, @MobilePhone, @WhatsApp, @Email, @Skills, @CompanyName, @Position, @StartDate, @EndDate)";

                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@FirstName", System.Data.SqlDbType.NVarChar).Value = userProfile.FirstName;
                    command.Parameters.Add("@MiddleName", System.Data.SqlDbType.NVarChar).Value = userProfile.MiddleName;
                    command.Parameters.Add("@LastName", System.Data.SqlDbType.NVarChar).Value = userProfile.LastName;
                    command.Parameters.Add("@Username", System.Data.SqlDbType.NVarChar).Value = userProfile.Username;
                    command.Parameters.Add("@Password", System.Data.SqlDbType.NVarChar).Value = userProfile.Password;
                    command.Parameters.Add("@MobilePhone", System.Data.SqlDbType.NVarChar).Value = userProfile.MobilePhone;
                    command.Parameters.Add("@WhatsApp", System.Data.SqlDbType.NVarChar).Value = userProfile.WhatsApp;
                    command.Parameters.Add("@Email", System.Data.SqlDbType.NVarChar).Value = userProfile.Email;
                    command.Parameters.Add("@Skills", System.Data.SqlDbType.NVarChar).Value = userProfile.Skills;
                    command.Parameters.Add("@CompanyName", System.Data.SqlDbType.NVarChar).Value = userProfile.CompanyName;
                    command.Parameters.Add("@Position", System.Data.SqlDbType.NVarChar).Value = userProfile.Position;
                    command.Parameters.Add("@StartDate", System.Data.SqlDbType.DateTime).Value = userProfile.StartDate;
                    command.Parameters.Add("@EndDate", System.Data.SqlDbType.DateTime).Value = userProfile.EndDate;

                    command.ExecuteNonQuery();
                }
            }
        }
    }
}
