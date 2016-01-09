using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FishingHotspots
{

    public partial class Register : System.Web.UI.Page
    {
        static string connString = WebConfigurationManager.ConnectionStrings["FishingHotspotsDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand command = new SqlCommand();
        SqlDataReader queryResults;

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        static string GetMd5Hash(string input)
        {
            string output = "";

            using (MD5 md5Hash = MD5.Create())
            {

                byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

                foreach (byte b in data)
                {
                    output = output + b.ToString("x2");
                }
            }
            return output;
        }


        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                try
                {
                    conn.Open();
                    command.Connection = conn;

                    //read data from the database to check if the username already exists
                    command.CommandText = string.Format("select UserName from usersTbl where UserName='{0}'", txtUserName.Text);
                    queryResults = command.ExecuteReader();

                    if (queryResults.Read())
                    {
                        lblError.Text = string.Format("The user name {0} already exists - please provide a different user name", txtUserName.Text);
                        queryResults.Close();
                    }
                    else
                    {
                        queryResults.Close();

                        //set the commandType to storedprocedure
                        command.CommandType = CommandType.StoredProcedure;

                        //set the commandText to the name of our stored procedure
                        command.CommandText = "[dbo].[CreateUser]";

                        //provide values for the procedure's parameters
                        command.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
                        command.Parameters.AddWithValue("@LastName", txtLastName.Text);
                        command.Parameters.AddWithValue("@Username", txtUserName.Text);
                        command.Parameters.AddWithValue("@Email", txtEmail.Text);
                        command.Parameters.AddWithValue("@Passwordhash", GetMd5Hash(txtPassword.Text));
                        //execute the command
                        command.ExecuteNonQuery();

                        //redirect to the home page of the site
                        FormsAuthentication.RedirectFromLoginPage(txtUserName.Text, true);
                    }
                }

                catch (Exception ex)
                {
                    lblError.Text = ex.Message;
                }

                finally
                {
                    conn.Close();
                }
            }


        }
    }
}





