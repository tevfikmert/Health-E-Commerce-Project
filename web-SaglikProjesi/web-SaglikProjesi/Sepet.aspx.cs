using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_SaglikProjesi
{
    public partial class Sepet : System.Web.UI.Page
    {
        Models.cSepet spt = new Models.cSepet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Session["sepet"] != null)
                {
                    DataTable dt = (DataTable)Session["sepet"];
                    SepetGoster(dt);
                }
                else
                {
                    Session["sepet"] = spt.YeniSepet();
                    DataTable dt = (DataTable)Session["sepet"];
                    gvSepet.DataSource = dt;
                    gvSepet.DataBind();
                }
            }
        }
        private void SepetGoster(DataTable dt)
        {
            gvSepet.Columns[1].FooterText = "Toplam : ";
            gvSepet.Columns[2].FooterText = ToplamAdetBul().ToString();
            gvSepet.Columns[2].FooterStyle.HorizontalAlign = HorizontalAlign.Center;
            //gvSepet.Columns[3].FooterText = ToplamTutarBul().ToString();
            gvSepet.Columns[3].FooterText = string.Format("{0:c}", ToplamTutarBul());
            gvSepet.Columns[3].FooterStyle.HorizontalAlign = HorizontalAlign.Right;
            gvSepet.DataSource = dt;
            gvSepet.DataBind();
        }
        private int ToplamAdetBul()
        {
            int ToplamAdet = 0;
            DataTable dt = (DataTable)Session["sepet"];
            foreach (DataRow dr in dt.Rows)
            {
                ToplamAdet += Convert.ToInt32(dr["adet"]);
            }
            return ToplamAdet;
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
        protected void gvSepet_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = (DataTable)Session["sepet"];
            dt.Rows.RemoveAt(e.RowIndex);
            Session["sepet"] = dt;
            SepetGoster(dt);
        }
        protected void btnSepetiBosalt_Click(object sender, EventArgs e)
        {
            DataTable dt = (DataTable)Session["sepet"];
            dt.Rows.Clear();
            Session["sepet"] = dt;
            SepetGoster(dt);
        }
        protected void btnDevam_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
        protected void btnSatinAl_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdresOnayi.aspx");
        }
    }
}