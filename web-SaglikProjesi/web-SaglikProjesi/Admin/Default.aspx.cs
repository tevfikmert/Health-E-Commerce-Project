using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_SaglikProjesi.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Admin"] != null)
            {
                pnlLogin.Visible = false;
                Panel pnl = (Panel)this.Master.FindControl("pnlMenu");
                pnl.Visible = true;
            }
            else
            {
                pnlLogin.Visible = true;
            }
        }
    }
}