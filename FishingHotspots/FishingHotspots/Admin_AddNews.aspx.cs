using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PasswordHashTool;

namespace FishingHotspots
{
    public partial class Admin : System.Web.UI.Page
    {
        private delegate string newsDel(bool b);
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void btnSaveNews_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                try
                {
                    byte[] image = new byte[] { };
                    if (ImgUpload.PostedFile != null)
                    {
                        image = UploadImage();
                    }
                }
                catch
                {
                    lblStatus.CssClass = "";
                    //lblStatus.Text = "<span class='glyphicon glyphicon-ok'></span>"+statusMsg;
                    lblStatus.Visible = true;
                }

            }
        }

        private int GetAdminId()
        {
            // this value is hard coded for testing.

            return 9;
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

        // Gets the posted image in binary
        private byte[] UploadImage()
        {
            // creates a new byte array to store image
            byte[] img = new byte[ImgUpload.PostedFile.ContentLength];

            // Reads posted image into byte[] img
            HttpPostedFile image = ImgUpload.PostedFile;
            image.InputStream.Read(img, 0, (int)ImgUpload.PostedFile.ContentLength);

            return img;
        }

    }
}