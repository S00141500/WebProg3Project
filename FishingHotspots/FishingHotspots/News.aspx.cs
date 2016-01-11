using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FishingHotspots
{
    public partial class News : System.Web.UI.Page
    {
        static string connString = WebConfigurationManager.ConnectionStrings["FishingHotspotsDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand command = new SqlCommand();
        SqlDataReader queryResults;



        protected void Page_Load(object sender, EventArgs e)
        {

            lblError.Visible = false;


            ShowNewsList();
        }


        private void ShowNewsList()
        {
            try
            {
                conn.Open();
                command.Connection = conn;
                command.CommandType = CommandType.StoredProcedure;
                //set the commandText to the name of our stored procedure
                command.CommandText = "[dbo].[ListNewsItems]";
                //command.CommandText = string.Format("select * from NewsTbl");
                queryResults = command.ExecuteReader();

                if (!queryResults.Read())
                {   //used emptydata template in News.aspx instead
                    // lblError.Text = "No News Items recorded ";
                }

                ListViewNews.DataSource = queryResults;
                ListViewNews.DataBind();

                command.Connection.Close();
            }
            catch (Exception ex)
            {

                lblError.Visible = true;
                lblError.Text = ex.Message;

            }

            finally
            {
                conn.Close();
            }

        }


    }
}