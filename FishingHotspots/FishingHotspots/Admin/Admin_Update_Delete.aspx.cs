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

        public delegate void MarkStadlerDel(string AddOrDelete, string field, bool x);
        public delegate void MarkStadlerDel2(string s);
        public event MarkStadlerDel2 MarkStadlerEvent;


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

                lblStatus.Visible = false;

                AddCounties();

            }
        }

        private void AddCounties()
        {

            MarkStadlerDel del = new MarkStadlerDel(GetUpdateStatus);
            try
            {
                conn.Open();
                command.Connection = conn;

                command.CommandType = CommandType.StoredProcedure;

                //set the commandText to the name of our stored procedure
                command.CommandText = "[dbo].[GetRegions]";

                //execute the command
                reader = command.ExecuteReader();

                // add each counrty to dropdown list
                while (reader.Read())
                {
                    dpCounty.Items.Add(reader.GetValue(0).ToString());
                };

                reader.Close();
            }
            catch
            {
                del("load", "counties", false);
            }
            finally
            {
                conn.Close();
            }
        }


        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                MarkStadlerDel del = new MarkStadlerDel(GetUpdateStatus);

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

                    del("add", DpField.SelectedValue.ToString(), true);

                }
                catch
                {
                    del("add", DpField.SelectedValue.ToString(), false);
                }
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
                MarkStadlerDel del = new MarkStadlerDel(GetUpdateStatus);

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

                    del("delete", dpFieldDelete.SelectedValue.ToString(), true);

                }
                catch
                {
                    del("delete", dpFieldDelete.SelectedValue.ToString(), false);
                }
                finally
                {
                    conn.Close();
                }
            }
        }

        // sets the error message of status label based on success or fail
        private void GetUpdateStatus(string addOrDeleteOrLoad, string field, bool status)
        {
            string statusMsg = "";
            lblStatus.Visible = true;

            if (status == true)
            {
                lblStatus.CssClass = "alert alert-success";
                statusMsg = "<span class='glyphicon glyphicon-ok'></span>  Sucessfully ";

                if (addOrDeleteOrLoad.ToLower() == "delete")
                {
                    statusMsg += "deleted " + field + " from Database";
                }
                else if (addOrDeleteOrLoad.ToLower() == "add")
                {
                    statusMsg += "added " + field + " to Database";
                }

            }
            else
            {
                lblStatus.CssClass = "alert alert-danger";
                statusMsg = "<span class='glyphicon glyphicon-remove'></span>   Error! Unable to ";

                if (addOrDeleteOrLoad.ToLower() == "delete")
                {
                    statusMsg += "delete " + field + " from Database";
                }
                else if (addOrDeleteOrLoad.ToLower() == "add")
                {
                    statusMsg += "add " + field + " to Database";
                }
                else if (addOrDeleteOrLoad.ToLower() == "load")
                {
                    statusMsg += "load " + field + " from Database";
                }
            }

            lblStatus.Text = statusMsg;

        }

        protected void dpFieldDelete_SelectedIndexChanged(object sender, EventArgs e)
        {
            MarkStadlerEvent = new MarkStadlerDel2(LoadDeleteFields);

            if (dpFieldDelete.SelectedIndex > 0)
            {
                MarkStadlerEvent(dpFieldDelete.SelectedValue.ToString());
            }
        }


        private void LoadDeleteFields(string itemToDeleteField)
        {
            MarkStadlerDel del = new MarkStadlerDel(GetUpdateStatus);
            try
            {
                conn.Open();
                command.Connection = conn;

                command.CommandType = CommandType.StoredProcedure;

                if (itemToDeleteField == "Rivers")
                {
                    //set the commandText to the name of our stored procedure
                    command.CommandText = "[dbo].[GetRivers]";
                }
                else if (itemToDeleteField == "Lakes")
                {
                    command.CommandText = "[dbo].[GetLakes]";
                }
                else if (itemToDeleteField == "Species")
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

                del("load", itemToDeleteField, true);
            }
            catch
            {
                del("load", itemToDeleteField, false);
            }
            finally
            {
                conn.Close();
            }
        }
    }
}