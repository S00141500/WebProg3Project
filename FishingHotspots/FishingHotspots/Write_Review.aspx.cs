using System;
using System.Collections.Generic;
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
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

        }

        protected void ddlRiverOrLake_SelectedIndexChanged(object sender, EventArgs e)
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

            command.Connection.Close();
            command.Connection.Dispose();
        }
    }
}