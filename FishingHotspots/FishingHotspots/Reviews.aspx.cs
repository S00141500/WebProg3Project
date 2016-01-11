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
    public partial class Reviews : System.Web.UI.Page
    {
        static string connString = WebConfigurationManager.ConnectionStrings["FishingHotspotsDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand command = new SqlCommand();
        SqlDataReader queryResults;
        protected void Page_Load(object sender, EventArgs e)
        {
            //checks for session where and type to display correct info
            if (Session["Where"] != null && Session["Type"] != null)
            {
                int Where = Convert.ToInt32(Session["Where"]);
                int Type = Convert.ToInt32(Session["Type"]);

                try
                {
                    conn.Open();
                    command.Connection = conn;

                    command.CommandType = CommandType.StoredProcedure;

                    //set the commandText to the name of our stored procedure
                    command.CommandText = "[dbo].[SelectedReviews]";

                    //provide values for the procedure's parameters
                    command.Parameters.AddWithValue("@Region", Where);
                    command.Parameters.AddWithValue("@Type", Type);
                    //execute the command
                    queryResults = command.ExecuteReader();

                    if (!queryResults.Read())
                    {
                        lblError.Text = "No Reviews match your search. Please try again";
                    }

                        ListViewReviews.DataSource = queryResults;
                    ListViewReviews.DataBind();

                    command.Connection.Close();
                }
                catch (Exception ex)
                {

                }

                finally
                {
                    conn.Close();
                }
            }
            //displays all reviews if no seesion state exists
            else
            {
                try
                {
                    conn.Open();
                    command.Connection = conn;

                    command.CommandType = CommandType.StoredProcedure;

                    //set the commandText to the name of our stored procedure
                    command.CommandText = "[dbo].[AllReviews]";

                    //execute the command
                    queryResults = command.ExecuteReader();

                    

                    ListViewReviews.DataSource = queryResults;
                    ListViewReviews.DataBind();

                    command.Connection.Close();
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
            Session.Clear();

        }

        protected void btnFindNow_Click(object sender, EventArgs e)
        {
            Session.Add("Where", ddlWhere.SelectedValue);
            Session.Add("Type", ddlFishType.SelectedValue);

            Response.Redirect("Reviews.aspx");
        }
    }
}