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
    public partial class FS : System.Web.UI.MasterPage
    {
        static string connString = WebConfigurationManager.ConnectionStrings["FishingHotspotsDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand command = new SqlCommand();
        SqlDataReader queryResults;

        public object ClientScript { get; private set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Request.Cookies["myAuthCookie"] == null)
                {
                    btnLogOut.Visible = false;
                }
                else
                {
                    btnLogin.Visible = false;
                    btnLogOut.Visible = true;
                    liWrite.Visible = true;
                }
            }



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
        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                command.Connection = conn;

                command.CommandType = CommandType.StoredProcedure;

                //set the commandText to the name of our stored procedure
                command.CommandText = "[dbo].[Login]";

                //provide values for the procedure's parameters
                command.Parameters.AddWithValue("@Username", txtUserName.Text);
                command.Parameters.AddWithValue("@PasswordHash", GetMd5Hash(txtPassword.Text));
                //execute the command
                queryResults = command.ExecuteReader();

                if (queryResults.Read())
                {
                    queryResults.Close();

                    HttpCookie S00140633 = new HttpCookie("LoggedIn");

                    //creates an autorization cookie which lasts a month
                    if (cbxRemember.Checked)
                    {
                        Response.Cookies.Clear();

                        // Set the new expiry date - to thirty days from now
                        DateTime expiryDate = DateTime.Now.AddDays(30);

                        // Create a new forms auth ticket
                        FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(2, txtUserName.Text, DateTime.Now, expiryDate, true, String.Empty);

                        // Encrypt the ticket
                        string encryptedTicket = FormsAuthentication.Encrypt(ticket);

                        // Create a new authentication cookie - and set its expiration date
                        HttpCookie authenticationCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
                        authenticationCookie.Expires = ticket.Expiration;

                        // Add the cookie to the response.
                        Response.Cookies.Add(authenticationCookie);

                        Response.Redirect("Index.aspx");
                    }
                    else
                    {
                        FormsAuthentication.RedirectFromLoginPage(txtUserName.Text, true);
                    }
                }
                else
                {
                    lblError.Text = string.Format("Invalid Login. Please Try Again");

                    if (IsPostBack)
                    {
                        Response.Write("<script>alert('Invalid Login. Please Try again');</script>");
                    }
                    queryResults.Close();
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

        protected void btnJoin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();

            Response.Redirect("Index.aspx");
        }
    }
}