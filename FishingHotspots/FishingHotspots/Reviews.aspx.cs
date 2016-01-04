using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FishingHotspots
{
    public partial class Reviews : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Where"] != null && Session["Type"] != null)
            {
                string name = (string)Session["Where"];
                string age = (string)Session["Type"];                    
            }
            else
            {
                Response.Redirect("Index.aspx");
            }

        }

        protected void btnFindNow_Click(object sender, EventArgs e)
        {
            Session.Add("Where", ddlWhere.SelectedValue);
            Session.Add("Type", ddlFishType.SelectedValue);
            Response.Redirect("Reviews.aspx");
        }
    }
}