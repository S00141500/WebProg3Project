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
        SqlDataReader queryResults;

        private delegate string newsDel(bool b);
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Request.Cookies["myAuthCookie"] == null)
            //    FormsAuthentication.RedirectToLoginPage();

            //else
            //{

            //}


        }

        protected void btnSaveNews_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                conn.Open();
                command.Connection = conn;

                try
                {
                    string image = "";
                    if (ImgUpload.PostedFile != null)
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

                    // redirect to news page to see new article
                    Response.Redirect("../News.aspx");
                }
                catch (Exception ex)
                {
                    lblStatus.CssClass = "";
                    //lblStatus.Text = "<span class='glyphicon glyphicon-ok'></span>"+statusMsg;
                    lblStatus.Visible = true;
                }
                finally
                {
                    conn.Close();
                }

            }
        }
        

        private string GetUpdateStatus(bool status)
        {
            string statusMsg = "";

            if (status == true)
            {
                statusMsg = "The News Story has been sucessfully added to Database.";
            }
            else
            {
                statusMsg = "Error! Unable to add News Story to Database!";
            }

            return statusMsg;
        }

        private string GetStatusLableClass()
        {

            return "";
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