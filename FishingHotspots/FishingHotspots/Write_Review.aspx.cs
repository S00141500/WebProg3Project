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
    public partial class Write_Review : System.Web.UI.Page
    {
        static string connString = WebConfigurationManager.ConnectionStrings["FishingHotspotsDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand command = new SqlCommand();
        SqlCommand command1 = new SqlCommand();
        SqlDataReader ddlWhereValues;
        string Path;
        int? reviewID;

        public delegate void MyReviewEventHandler(string str);
        public event MyReviewEventHandler ReviewEvent;



        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["myAuthCookie"] != null)
            {
                string hashedusername = GetMd5Hash(HttpContext.Current.User.Identity.Name);
                lblHashedUsrNme.Text = String.Format("The Username hashed: {0}", hashedusername);
            }

            else
            {
                Response.Redirect("Index.aspx");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                try
                {
                    conn.Open();
                    command.Connection = conn;
                    command1.Connection = conn;


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
                    if (ddlType.SelectedIndex == 0)
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
                        command.Parameters.AddWithValue("@River", ddlRiverLake.SelectedValue);
                        command.Parameters.AddWithValue("@Lake", DBNull.Value);
                    }
                    else
                    {
                        command.Parameters.AddWithValue("@Lake", ddlRiverLake.SelectedValue);
                        command.Parameters.AddWithValue("@River", DBNull.Value);
                    }
                    command.Parameters.Add("@review", SqlDbType.Int).Direction = ParameterDirection.Output;
                    //execute the command
                    command.ExecuteNonQuery();
                    reviewID = (int)command.Parameters["@review"].Value;

                    command1.CommandType = CommandType.StoredProcedure;
                    //set the commandText to the name of our stored procedure
                    command1.CommandText = "[dbo].[AddFishCaught]";

                    if (ddlType.SelectedIndex == 0)
                    {
                        for (int i = 0; i < cbxCoarse.Items.Count - 1; i++)
                        {
                            if (cbxCoarse.Items[i].Selected)
                            {
                                command1.Parameters.AddWithValue("@FishSpecies", cbxCoarse.Items[i].Value);
                                command1.Parameters.AddWithValue("@reviewId", reviewID);
                                command1.ExecuteNonQuery();
                                command1.Parameters.Clear();
                            }
                        }
                    }
                    else
                    {
                        for (int i = 0; i < cbxGame.Items.Count - 1; i++)
                        {
                            if (cbxGame.Items[i].Selected)
                            {
                                command1.Parameters.AddWithValue("@reviewId", (Object)reviewID ?? DBNull.Value); ;
                                command1.Parameters.AddWithValue("@FishSpecies", cbxGame.Items[i].Value);

                                command1.ExecuteNonQuery();
                                command1.Parameters.Clear();
                            }
                        }
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

                Response.Redirect("ReviewDetails.aspx?id=" + reviewID);

            }


        }

        protected void ddlRiverOrLake_SelectedIndexChanged(object sender, EventArgs e)
        {
            ReviewEvent = new MyReviewEventHandler(selectedDdlRiverOrLake);

            ReviewEvent(ddlRiverOrLake.SelectedItem.Text);
            ReviewEvent -= selectedDdlRiverOrLake;


            try
            {
                conn.Open();
                command.Connection = conn;
                if (ddlRiverOrLake.SelectedIndex == 0)
                {
                    command.CommandText = string.Format("select * from RiversTbl where Region = {0}", ddlCounties.SelectedValue);
                    ddlWhereValues = command.ExecuteReader();

                    ddlRiverLake.DataSource = ddlWhereValues;
                    ddlRiverLake.DataValueField = "Id";
                    ddlRiverLake.DataTextField = "RiverName";
                    ddlRiverLake.DataBind();
                }
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

        protected void ddlRiverLake_DataBound(object sender, EventArgs e)
        {
            ddlRiverLake.Items.Insert(0, new ListItem("--Select River or Lake--", ""));
        }

        protected void ddlCounties_DataBound(object sender, EventArgs e)
        {
            ddlCounties.Items.Insert(0, new ListItem("--Select County--", ""));
        }

        protected void ddlCounties_SelectedIndexChanged(object sender, EventArgs e)
        {
            ReviewEvent = new MyReviewEventHandler(selectedDdlCounty);
            ReviewEvent(ddlCounties.SelectedItem.Text);
            ReviewEvent -= selectedDdlCounty;

            try
            {
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

        public void selectedDdlCounty(string county)
        {

            {
                lblError2.Text = String.Format("You choose county {0}", county);
                lblError2.CssClass = "alert-info";
            }

        }

        public void selectedDdlRiverOrLake(string river)
        {

            {
                lblError3.Text = String.Format("You choose  {0}s", river);
                lblError3.CssClass = "alert-info";
            }

        }

        static string GetMd5Hash(string input)
        {
            string output = "";

            using (MD5 md5Hash = MD5.Create())
            {

                byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

                foreach (byte b in data)
                {
                    output = output + b.ToString("x2");
                }
            }
            return output;
        }
    }
}