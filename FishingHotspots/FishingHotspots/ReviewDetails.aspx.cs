using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FishingHotspots
{
    public partial class ReviewDetails : System.Web.UI.Page
    {
        static string connString = WebConfigurationManager.ConnectionStrings["FishingHotspotsDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand command = new SqlCommand();
        SqlCommand command1 = new SqlCommand();
        SqlDataReader queryResults;
        int reviewID;

        public delegate string MyStringDelegate(string str);
        public delegate void MyDelegate();
        public event MyDelegate MyEvent;
        public static string HashValue;
        public Random rnd = new Random();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] == null)
            {
                Response.Redirect("Index.aspx");
            }
            if (Request.Cookies["myAuthCookie"] != null)
            {
                btnLike.Visible = true;
            }


            conn.Open();
            command.Connection = conn;

            // get the users name
            string userName = HttpContext.Current.User.Identity.Name;

            command.CommandText = string.Format("select Ratings from RatingsTbl where Username=@User and Review =@reviewID");
            command.Parameters.AddWithValue("@User", userName);
            command.Parameters.AddWithValue("@reviewID", Request.QueryString["id"]);

            queryResults = command.ExecuteReader();

            if (queryResults.Read())
            {
                btnLike.Visible = false;
                lblRated.Visible = true;

                btnLike.Visible = false;
                lblRated.Visible = true;
                
                
            }

            command.Parameters.Clear();
            queryResults.Close();
            conn.Close();

        }
        public void AddToLikes()
        {
            try
            {
                conn.Open();
                command.Connection = conn;

                // get the users name
                string userName = HttpContext.Current.User.Identity.Name;
                reviewID = Convert.ToInt32(Request.QueryString["id"]);
                //set the commandType to storedprocedure
                command.CommandType = CommandType.StoredProcedure;

                //set the commandText to the name of our stored procedure
                command.CommandText = "[dbo].[LikeReview]";

                //provide values for the procedure's parameters
                command.Parameters.AddWithValue("@ratings", 1);
                command.Parameters.AddWithValue("@review", reviewID);
                command.Parameters.AddWithValue("@user", userName);

                command.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

            }
            finally
            {
                conn.Close();
                Response.Redirect("ReviewDetails.aspx?id=" + reviewID);
            }
        }
        protected void btnLike_Click(object sender, EventArgs e)
        {
            
            MyEvent += new MyDelegate(AddToLikes);
            MyEvent();

        }
        
    }
}
