using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FishingHotspots.FishingHotspotsEntities;
using PasswordHashTool;

namespace FishingHotspots
{
    public partial class Admin : System.Web.UI.Page
    {
        FishingHotspotsDBEntities db = new FishingHotspotsDBEntities();
        private delegate string newsDel(bool b);
        protected void Page_Load(object sender, EventArgs e)
        {


        }

        protected void btnSaveNews_Click(object sender, EventArgs e)
        {
            //string pwd = PasswordHashTool.PasswordHashManager.CreateHash("Liverpool");

            //if(PasswordHashManager.ValidatePassword("Liverpool",pwd))
            //{
            //    Response.Write("it works");
            //}
            if (IsValid)
            {
                try
                {
                    NewsTbl news = new NewsTbl
                    {
                        Title = txtTitle.Text,
                        Text = txtDescription.Text,
                        PublishDate = DateTime.Now,
                        Image = null,
                        UserId = GetAdminId()

                    };

                    db.NewsTbl.Add(news);
                    db.SaveChanges();
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


    }
}