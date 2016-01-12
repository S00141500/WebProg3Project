using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PasswordHashTool;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.Security;

namespace FishingHotspots
{
    public partial class Admin : System.Web.UI.Page
    {
        static string connString = WebConfigurationManager.ConnectionStrings["FishingHotspotsDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand command = new SqlCommand();

        // Delegate used to fire methods to control the output msg.
        public delegate void markStadler1(bool s);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["myAuthCookie"] == null)
            {
                FormsAuthentication.RedirectToLoginPage();
            }
            else
            {
                // if user is athutneticated
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {

                    if (HttpContext.Current.User.Identity is FormsIdentity)
                    {
                        FormsIdentity id = (FormsIdentity)HttpContext.Current.User.Identity;
                        FormsAuthenticationTicket ticket = id.Ticket;
                        string userData = ticket.UserData;

                        // if user is not an administrator redirect to index\login page
                        if (userData != "Administrator")
                        {
                            FormsAuthentication.RedirectToLoginPage();
                        }
                    }
                }
            }
        }


        protected void btnSaveNews_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                // Create a delegate and assign methods
                markStadler1 del = new markStadler1(GetUpdateStatus);
                del += GetStatusLabelClass;
                del += ResetInputValuesOnResult;

                // open connection
                conn.Open();
                command.Connection = conn;

                try
                {
                    // holds image path
                    string image = "";

                    // checks if there is an image to be uploaded
                    if (ImgUpload.HasFile)
                    {
                        image = UploadImage();
                    }

                    // get the users name
                    string userName = HttpContext.Current.User.Identity.Name;
                    //set the commandType to storedprocedure
                    command.CommandType = CommandType.StoredProcedure;

                    //set the commandText to the name of our stored procedure
                    command.CommandText = "[dbo].[AddNewsStory]";

                    //provide values for the procedure's parameters
                    command.Parameters.AddWithValue("@title", txtTitle.Text);
                    command.Parameters.AddWithValue("@text", txtDescription.Text);
                    command.Parameters.AddWithValue("@publishDate", DateTime.Now);
                    command.Parameters.AddWithValue("@image", image);
                    command.Parameters.AddWithValue("@username", userName);
                    //execute the command
                    command.ExecuteNonQuery();

                    // if this is passed to delegate the news story has been added
                    // and will then fire the methods to output relevent msg 
                    del(true);
                }
                catch
                {
                    // if this is passed to delegate the news story has NOT been added
                    // and will then fire the methods to output relevent msg 
                    del(false);
                }
                finally
                {
                    conn.Close();
                }

            }
        }

        // sets the error message of status label based on success or fail
        private void GetUpdateStatus(bool status)
        {
            string statusMsg = "";

            if (status == true)
            {
                statusMsg = "<span class='glyphicon glyphicon-ok'></span>   The News Story has been sucessfully added to Database.";
            }
            else
            {
                statusMsg = "<span class='glyphicon glyphicon-remove'></span>   Error! Unable to add News Story to Database!";
            }

            lblStatus.Text = statusMsg;

        }

        // sets the class of status label based on success or fail
        private void GetStatusLabelClass(bool x)
        {
            lblStatus.Visible = true;
            if (x == true)
                lblStatus.CssClass = "alert alert-success";

            else
                lblStatus.CssClass = "alert alert-danger";

        }

        // clears inputs if storty is added successfully to allow for another to be added
        private void ResetInputValuesOnResult(bool x)
        {
            if (x == true)
            {
                txtTitle.Text = "";
                txtDescription.Text = "";
            }
        }

        // Gets the image path
        private string UploadImage()
        {
            // gets path of image
            string imgPath = string.Format("../NewsImages/{0}", ImgUpload.FileName);

            // saves to folder folder 
            ImgUpload.SaveAs(Server.MapPath(imgPath));

            return imgPath;
        }

        // custom validator ensures only .jpg,.png,.gif images are allowed to be uploaded
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string extension = ImgUpload.FileName.Substring(ImgUpload.FileName.LastIndexOf('.'));

            switch (extension)
            {
                case ".jpg":
                    args.IsValid = true;
                    break;
                case ".png":
                    args.IsValid = true;
                    break;
                case ".gif":
                    args.IsValid = true;
                    break;
                default:
                    args.IsValid = false;
                    break;
            }

        }
    }
}