using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_SaglikProjesi.Admin
{
    public partial class Login : System.Web.UI.UserControl
    {
        DataModel.SaglikUrunleriEntities ent = new DataModel.SaglikUrunleriEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) txtUsername.Focus();
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var Varmi = (from k in ent.Kullanicilar
                         where k.kullaniciad == txtUsername.Text && k.sifre == txtPassword.Text && k.admin == true && k.silindi == false
                         select k).Count();
            if(Varmi > 0)
            {
                Session["Admin"] = txtUsername.Text;
                Response.Redirect("Default.aspx");
            }
            else
            {
                lblMesaj.Text = "Hatalı kullanıcı yada şifre girişi!";
                txtUsername.Focus();
            }
        }
    }
}