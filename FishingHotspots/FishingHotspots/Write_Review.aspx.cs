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
    public partial class Write_Review : System.Web.UI.Page
    {
        static string connString = WebConfigurationManager.ConnectionStrings["FishingHotspotsDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand command = new SqlCommand();
        SqlDataReader ddlWhereValues;
        string Path;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //saves review inputs to database
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                try
                {
                    conn.Open();
                    command.Connection = conn;

                        //saves images into Review images
                        if (ImgUpload.HasFile && ImgUpload.PostedFile.ContentLength > 0)
                        {

                            Path = ("~/ReviewImages/" + ImgUpload.FileName);
                            ImgUpload.SaveAs(Server.MapPath(Path));

                        }
                        // get the users name
                        string userName = HttpContext.Current.User.Identity.Name;
                    //set the commandType to storedprocedure
                    command.CommandType = CommandType.StoredProcedure;

                    //set the commandText to the name of our stored procedure
                    command.CommandText = "[dbo].[WriteReview]";

                    //provide values for the procedure's parameters
                    command.Parameters.AddWithValue("@Title", txtTitle.Text);
                    command.Parameters.AddWithValue("@Photo", Path);
                    command.Parameters.AddWithValue("@Username", HttpContext.Current.User.Identity.Name);
                    if(ddlType.SelectedIndex == 0)
                    {
                        command.Parameters.AddWithValue("@FishingType", 1);
                    }
                    else
                    {
                        command.Parameters.AddWithValue("@FishingType", 2);
                    }

                    command.Parameters.AddWithValue("@Region", ddlCounties.SelectedValue);
                    command.Parameters.AddWithValue("@ReviewText", txtDescription.Text);
                    if (ddlRiverOrLake.SelectedIndex == 0)
                    { 
                        command.Parameters.AddWithValue("@River", 1);
                        command.Parameters.AddWithValue("@Lake", DBNull.Value);
                    }
                    else
                    {
                        command.Parameters.AddWithValue("@Lake", 2);
                        command.Parameters.AddWithValue("@River", DBNull.Value);
                    }
                    //execute the command
                    command.ExecuteNonQuery();
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
        }
        
        //displays either river or lake for each county
        protected void ddlRiverOrLake_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                command.Connection = conn;

                //displays rivers
                if (ddlRiverOrLake.SelectedIndex == 0)
                {
                    command.CommandText = string.Format("select * from RiversTbl where Region = {0}", ddlCounties.SelectedValue);
                    ddlWhereValues = command.ExecuteReader();

                    ddlRiverLake.DataSource = ddlWhereValues;
                    ddlRiverLake.DataValueField = "Id";
                    ddlRiverLake.DataTextField = "RiverName";
                    ddlRiverLake.DataBind();
                }
                //displays lakes
                else
                {
                    command.CommandText = string.Format("select * from LakesTbl where Region = {0}", ddlCounties.SelectedValue);
                    ddlWhereValues = command.ExecuteReader();

                    ddlRiverLake.DataSource = ddlWhereValues;
                    ddlRiverLake.DataValueField = "Id";
                    ddlRiverLake.DataTextField = "LakeName";
                    ddlRiverLake.DataBind();
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

        // river or lake placeholders
        protected void ddlRiverLake_DataBound(object sender, EventArgs e)
        {
            ddlRiverLake.Items.Insert(0, new ListItem("--Select River or Lake--", ""));
        }

        //displays counties
        protected void ddlCounties_DataBound(object sender, EventArgs e)
        {
            ddlCounties.Items.Insert(0, new ListItem("--Select County--", ""));
        }

        //displays either river or lakes in each county
        protected void ddlCounties_SelectedIndexChanged(object sender, EventArgs e)
        {
            try {
                conn.Open();
                command.Connection = conn;

                command.CommandText = string.Format("select * from RiversTbl where Region = {0}", ddlCounties.SelectedValue);
                ddlWhereValues = command.ExecuteReader();

                ddlRiverLake.DataSource = ddlWhereValues;
                ddlRiverLake.DataValueField = "Id";
                ddlRiverLake.DataTextField = "RiverName";
                ddlRiverLake.DataBind();
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
    }
}