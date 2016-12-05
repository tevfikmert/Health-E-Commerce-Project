using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using web_SaglikProjesi.Models;

namespace web_SaglikProjesi
{
    public partial class UrunDetay : System.Web.UI.Page
    {
        DataModel.SaglikUrunleriEntities ent = new DataModel.SaglikUrunleriEntities();
        cSepet spt = new cSepet();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = Convert.ToInt32(Request.QueryString["urunid"]);
                var secilen = (from urun in ent.Urunler
                               where urun.urunid == id
                               select urun).ToList();
                dlstUrunler.DataSource = secilen;
                dlstUrunler.DataBind();

                if (Session["sepet"] != null)
                {
                    DataTable dt = (DataTable)Session["sepet"];
                    GridView Ozet = (GridView)this.Master.FindControl("gvSepetOzet");
                    Ozet.Columns[0].FooterText = "Toplam : ";
                    Ozet.Columns[1].FooterText = string.Format("{0:c}", ToplamTutarBul());
                    Ozet.DataSource = dt;
                    Ozet.DataBind();
                }
            }
        }
        protected void dlstUrunler_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "sepet")
            {
                if (Session["sepet"] == null)
                {
                    Session["sepet"] = spt.YeniSepet();
                }
                DataTable dt = (DataTable)Session["sepet"];
                int id = Convert.ToInt32(e.CommandArgument);
                Label UrunAdi = (Label)e.Item.FindControl("lblUrunAd");
                Label Fiyat = (Label)e.Item.FindControl("lblUrunFiyat");
                TextBox Adet = (TextBox)e.Item.FindControl("txtAdet");
                //Sepete atılmak istenen ürün zaten sepette var mı? Eğer varsa; yeni satır eklenmemeli, mevcut satırdaki adet ve tutar artırılmalı.
                bool Varmi = false;
                foreach (DataRow urun in dt.Rows)
                {
                    if (Convert.ToInt32(urun["urunid"]) == id)
                    {
                        urun["adet"] = Convert.ToInt32(urun["adet"]) + Convert.ToInt32(Adet.Text);
                        urun["tutar"] = Convert.ToDecimal(urun["tutar"]) + (Convert.ToInt32(Adet.Text) * Convert.ToDecimal(Fiyat.Text));
                        Varmi = true;
                        break;
                    }
                }
                if (Varmi == false)
                {
                    //Sepette bu ürün olmadığından yeni satır olarak sipariş bilgileri sepete eklenir.
                    DataRow dr;
                    dr = dt.NewRow();
                    dr["urunid"] = id;
                    dr["urunAd"] = UrunAdi.Text;
                    dr["adet"] = Convert.ToInt32(Adet.Text);
                    dr["fiyat"] = Convert.ToDecimal(Fiyat.Text);
                    dr["tutar"] = Convert.ToInt32(Adet.Text) * Convert.ToDecimal(Fiyat.Text);
                    dt.Rows.Add(dr);
                }

                Session["sepet"] = dt;
                Response.Redirect("Sepet.aspx");

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
    }
}