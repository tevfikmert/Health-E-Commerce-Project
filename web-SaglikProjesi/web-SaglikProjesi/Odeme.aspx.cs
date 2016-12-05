using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_SaglikProjesi
{
    public partial class Odeme : System.Web.UI.Page
    {
        DataModel.SaglikUrunleriEntities ent = new DataModel.SaglikUrunleriEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Session["kullanici"] != null)
                {
                    int ID = Convert.ToInt32(Session["kullanici"]);
                    var user = (from u in ent.Kullanicilar
                                where u.id == ID
                                select u).FirstOrDefault();
                    lblAdi.Text = user.ad;
                    lblSoyadi.Text = user.soyad;
                    lblTutar.Text = ToplamTutarBul().ToString();
                }
                else { Response.Redirect("Adres.aspx"); }
            }
        }
        private decimal ToplamTutarBul()
        {
            decimal ToplamTutar = 0;
            DataTable dt = (DataTable)Session["sepet"];
            foreach (DataRow dr in dt.Rows)
            {
                ToplamTutar += Convert.ToDecimal(dr["tutar"]);
            }
            return ToplamTutar;
        }
        protected void btnHavaleEFT_Click(object sender, EventArgs e)
        {
            pnlHavaleEFT.Visible = true;
        }
        protected void btnDevam_Click(object sender, EventArgs e)
        {
            Session.Remove("sepet");
            Response.Redirect("Default.aspx");
        }
        protected void btnCikis_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Default.aspx");
        }
    }
}