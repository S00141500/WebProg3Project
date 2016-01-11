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
    public partial class Admin_Update_Delete : System.Web.UI.Page
    {
        static string connString = WebConfigurationManager.ConnectionStrings["FishingHotspotsDB"].ConnectionString;
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand command = new SqlCommand();
        SqlDataReader reader;

        private delegate void MarkStadler(string AddOrDelete,string field,bool x);
        private delegate void MarkStadler2(string s);
        private event MarkStadler MyEvent;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DpField.Items.Add("River");
                DpField.Items.Add("Lake");

                dpFieldDelete.Items.Add("");
                dpFieldDelete.Items.Add("Rivers");
                dpFieldDelete.Items.Add("Lakes");
                dpFieldDelete.Items.Add("Species");

                AddCounties();
            }
        }

        private void AddCounties()
        {
            try
            {
                conn.Open();
                command.Connection = conn;

                command.CommandType = CommandType.StoredProcedure;

                //set the commandText to the name of our stored procedure
                command.CommandText = "[dbo].[GetRegions]";

                //execute the command
                reader = command.ExecuteReader();

                while (reader.Read())
                {
                    dpCounty.Items.Add(reader.GetValue(0).ToString());
                };

                reader.Close();
            }
            catch
            {

            }
            finally
            {
                conn.Close();
            }
        }

        protected void ExecuteStoredProcedure(string sprocToExec)
        {


        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {

                try
                {
                    conn.Open();
                    command.Connection = conn;
                    command.CommandType = CommandType.StoredProcedure;

                    if (DpField.SelectedValue.ToString() == "River")
                    {
                        command.CommandText = "[dbo].[AddRiver]";
                    }
                    else if (DpField.SelectedValue.ToString() == "Lake")
                    {
                        command.CommandText = "[dbo].[AddLake]";
                    }

                    command.Parameters.AddWithValue("@name", txtNewData.Text);
                    command.Parameters.AddWithValue("@region", dpCounty.SelectedValue.ToString());
                    //execute the command
                    command.ExecuteNonQuery();


                }
                catch { }
                finally
                {
                    conn.Close();
                }
            }
        }


        protected void btnDeleteItem_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                try
                {
                    conn.Open();
                    command.Connection = conn;
                    command.CommandType = CommandType.StoredProcedure;

                    if (dpFieldDelete.SelectedValue.ToString() == "Rivers")
                    {
                        command.CommandText = "[dbo].[DeleteRiver]";
                    }
                    else if (dpFieldDelete.SelectedValue.ToString() == "Lakes")
                    {
                        command.CommandText = "[dbo].[DeleteLake]";
                    }
                    else if (dpFieldDelete.SelectedValue.ToString() == "Species")
                    {
                        command.CommandText = "[dbo].[DeleteFishSpecie]";
                    }

                    command.Parameters.AddWithValue("@name", LstItems.SelectedValue.ToString());
                    //execute the command
                    command.ExecuteNonQuery();


                }
                catch { }
                finally { conn.Close(); }
            }
        }

        // sets the error message of status label based on success or fail
        private void GetUpdateStatus(string AddOrDelete, string field, bool status)
        {
            string statusMsg = "";

            if (status == true)
            {
                statusMsg = "<span class='glyphicon glyphicon-ok'></span>   The News Story has been sucessfully added to Database.";
            }
            else
            {
                statusMsg = "<span class='glyphicon glyphicon-remove'></span>   Error! Unable to add News Story to Database!";
            }

            lblStatus.Text = statusMsg;

        }

        // sets the class of status label based on success or fail
        private void GetStatusLabelClass(bool x)
        {
            lblStatus.Visible = true;
            if (x == true)
                lblStatus.CssClass = "alert alert-success";

            else
                lblStatus.CssClass = "alert alert-danger";

        }

        protected void dpCounty_SelectedIndexChanged(object sender, EventArgs e)
        {
           // MyEvent(dpCounty.SelectedValue);
        }

        protected void dpFieldDelete_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dpFieldDelete.SelectedIndex > 0)
            {
                try
                {
                    conn.Open();
                    command.Connection = conn;

                    command.CommandType = CommandType.StoredProcedure;

                    if (dpFieldDelete.SelectedValue.ToString() == "Rivers")
                    {
                        //set the commandText to the name of our stored procedure
                        command.CommandText = "[dbo].[GetRivers]";
                    }
                    else if (dpFieldDelete.SelectedValue.ToString() == "Lakes")
                    {
                        command.CommandText = "[dbo].[GetLakes]";
                    }
                    else if (dpFieldDelete.SelectedValue.ToString() == "Species")
                    {
                        command.CommandText = "[dbo].[GetFishSpecies]";
                    }
                    //execute the command
                    reader = command.ExecuteReader();

                    LstItems.Items.Clear();
                    while (reader.Read())
                    {
                        LstItems.Items.Add(reader.GetValue(0).ToString());
                    };

                    reader.Close();
                }
                catch
                {

                }
                finally
                {
                    conn.Close();
                }
            }
        }
    }
}