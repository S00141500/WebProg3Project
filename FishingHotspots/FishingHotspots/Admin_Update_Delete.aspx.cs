using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FishingHotspots
{
    public partial class Admin_Update_Delete : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                DpField.Items.Add("River");
                DpField.Items.Add("Lake");

                dpFieldDelete.Items.Add("Rivers");
                dpFieldDelete.Items.Add("Lakes");
                dpFieldDelete.Items.Add("Species");
            }
        }

        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            if(IsValid)
            {
                // use method to add new item
            }
        }

        protected void btnDeleteItem_Click(object sender, EventArgs e)
        {
            if(IsValid)
            {
                // use method to delete item
            }
        }
    }
}