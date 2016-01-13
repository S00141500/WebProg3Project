using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FishingHotspots
{
    public partial class Index : System.Web.UI.Page
    {
        static string connString = WebConfigurationManager.ConnectionStrings["FishingHotspotsDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand command = new SqlCommand();
        SqlDataReader ddlWhereValues;


        protected void Page_Load(object sender, EventArgs e)
        {
            //check for authentication cookie
            if (Request.Cookies["myAuthCookie"] != null)
            {
                btnloginCentre.Visible = false;
                txtCentreLogin.Text = string.Format("Welcome {0}. Search for reviews here", HttpContext.Current.User.Identity.Name);
            }

            //populates where dropdown
            PopulateWhere();

        }

        //takes user selection and passes it to review page
        protected void btnFindReviews_Click(object sender, EventArgs e)
        {
            Session.Add("Where", ddlWhere.SelectedValue);
            Session.Add("Type", ddlFishType.SelectedValue);
            Response.Redirect("Reviews.aspx");
        }
        //populates where dropdown
        public void PopulateWhere()
        {
            conn.Open();
            command.Connection = conn;

            //read data from the database to check if the username already exists
            command.CommandText = string.Format("select * from RegionsTbl");

            ddlWhereValues = command.ExecuteReader();

            ddlWhere.DataSource = ddlWhereValues;
            ddlWhere.DataValueField = "Id";
            ddlWhere.DataTextField = "County";
            ddlWhere.DataBind();

            command.Connection.Close();
            command.Connection.Dispose();
        }
    }
}
