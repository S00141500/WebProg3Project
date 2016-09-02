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
                    command.Parameters.Add("@Type", SqlDbType.TinyInt).Value = Type;
                    command.Parameters.Add("@Region", SqlDbType.Int).Value = Where;

                    //execute the command
                    queryResults = command.ExecuteReader();

                    if (!queryResults.Read())
                    {
                        lblError.Text = "No Reviews match your search. Please try again";
                    }
                    selected.Visible = true;

                    // Response.Write(queryResults.GetValue(1));
                    Session.Add("SelectedReviewID", queryResults.GetValue(0).ToString());

                    lblTitle.Text = queryResults.GetValue(1).ToString();
                    lblDate.Text = queryResults.GetValue(2).ToString();
                    reviewImage.ImageUrl = queryResults.GetValue(4).ToString();
                    //ListViewReviews.DataSource = queryResults;
                    //ListViewReviews.DataBind();

                }
                catch (Exception ex)
                {
                    selected.Visible = false;
                    lblError.Text = ex.Message;
                }

                finally
                {
                    conn.Close();
                }
            }
            else
            {
                selected.Visible = false;
            }
        }

        protected void btnFindNow_Click(object sender, EventArgs e)
        {
            Session.Add("Where", ddlWhere.SelectedValue);
            Session.Add("Type", ddlFishType.SelectedValue);

            Response.Redirect("Reviews.aspx");
        }


        protected void btnReviewDetails_OnClick(object sender, EventArgs e)
        {
            int id = 0;
            if (Session["SelectedReviewID"] != null)
                id = Convert.ToInt32(Session["SelectedReviewID"]);

            Response.Redirect("ReviewDetails.aspx?id=" + id);
        }
    }
}