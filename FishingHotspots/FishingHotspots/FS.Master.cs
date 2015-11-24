using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FishingHotspots
{
    public partial class FS : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            liWrite.Visible=true;
            btnLogOut.Visible = false;
        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {

        }

        protected void btnJoin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {

        }
    }
}