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
using System.Configuration;
using System.Security.Principal;

namespace FishingHotspots
{
    public partial class FS : System.Web.UI.MasterPage
    {
        static string connString = WebConfigurationManager.ConnectionStrings["FishingHotspotsDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand command = new SqlCommand();

        //declare delegate and event
        public delegate void DelEventHandler(int i);
        public event DelEventHandler MyEvent;

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

                    if (HttpContext.Current.User.Identity.IsAuthenticated)
                    {

                        if (HttpContext.Current.User.Identity is FormsIdentity)
                        {
                            FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
                            FormsAuthenticationTicket ticket = id.Ticket;
                            string userData = ticket.UserData;

                            if (userData == "Administrator")
                            {
                                btnAdmin.Visible = true;
                            }
                        }
                    }
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

                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    //reader.Read();
                    // int userId = Convert.ToInt32(reader["UserId"]);
                    // string roles = reader["Roles"].ToString();
                    string roles = reader.GetSqlValue(6).ToString();

                    reader.Close();

                    HttpCookie S00140633 = new HttpCookie("LoggedIn");

                    Response.Cookies.Clear();

                    // Set the new expiry date - to thirty days from now
                    DateTime expiryDate;

                    if (cbxRemember.Checked)
                    {
                        //creates an autorization cookie which lasts a month
                        expiryDate = DateTime.Now.AddDays(30);
                    }
                    else
                    {
                        //creates an autorization cookie which lasts a month
                        expiryDate = DateTime.Now.AddHours(1);
                        // FormsAuthentication.RedirectFromLoginPage(txtUserName.Text, true);
                    }

                    // Create a new forms auth ticket
                    FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(2, txtUserName.Text, DateTime.Now, expiryDate, true, roles);

                    // Encrypt the ticket
                    string encryptedTicket = FormsAuthentication.Encrypt(ticket);

                    // Create a new authentication cookie - and set its expiration date
                    HttpCookie authenticationCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
                    authenticationCookie.Expires = ticket.Expiration;

                    // Add the cookie to the response.
                    Response.Cookies.Add(authenticationCookie);

                    HttpContext.Current.ApplicationInstance.CompleteRequest();
                    Response.Redirect("Index.aspx",false);

                }
                else
                {
                    Application.Lock();

                    int atts = Convert.ToInt32(Application["Attempts"]) + 1;
                    Application["Attempts"] = atts;

                    Application.UnLock();

                    MyEvent += new DelEventHandler(attemptsMade);     //** Step 3 **//
                    MyEvent += new DelEventHandler(attemptsLeft);

                    MyEvent(atts);

                    reader.Close();
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
            Response.Redirect("~/Register.aspx");
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Application.Lock();
            Application["Attempts"] = 0;
            Application.UnLock();

            Response.Redirect("Index.aspx");
        }
        public void attemptsMade(int i)
        {
            if (IsPostBack)
            {
                if (!Page.ClientScript.IsStartupScriptRegistered("alert"))
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(),
                        "alert", "alertMessage('" + i + "');", true);
                }

            }

        }
        public void attemptsLeft(int i)
        {
            if (3 - i <= 0)
            {
                lblError.Text = string.Format("Invalid Login. Please Try Again. Maybe you should register");
            }
            else
                lblError.Text = string.Format("Invalid Login. Please Try Again. {0} Attempts remaining", 3 - i);
        }

    }
}