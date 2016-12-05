using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_SaglikProjesi.Admin
{
    public partial class AltKategoriEkle : System.Web.UI.Page
    {
        DataModel.SaglikUrunleriEntities ent = new DataModel.SaglikUrunleriEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Admin"] != null)
                {
                    Panel pnl = (Panel)this.Master.FindControl("pnlMenu");
                    pnl.Visible = true;
                    KategorileriGetir();
                    AltKategorilerGetirByKategoriNo(Convert.ToInt32(ddlKategoriler.SelectedValue));
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }
        private void KategorileriGetir()
        {
            var categories = (from c in ent.Kategoriler
                              where c.silindi == false
                              select c).ToList();
            ddlKategoriler.DataTextField = "kategoriad";
            ddlKategoriler.DataValueField = "id";
            ddlKategoriler.DataSource = categories;
            ddlKategoriler.DataBind();
        }
        protected void ddlKategoriler_SelectedIndexChanged(object sender, EventArgs e)
        {
            AltKategorilerGetirByKategoriNo(Convert.ToInt32(ddlKategoriler.SelectedValue));
        }
        private void AltKategorilerGetirByKategoriNo(int KategoriNo)
        {
            var subcategories = (from subc in ent.AltKategoriler
                                 where subc.kategorino == KategoriNo && subc.silindi == false
                                 select subc).ToList();
            gvAltKategoriler.DataSource = subcategories;
            gvAltKategoriler.DataBind();
        }
        protected void gvAltKategoriler_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlEkle.Visible = true;
            txtAltKategori.Text = HttpUtility.HtmlDecode(gvAltKategoriler.SelectedRow.Cells[1].Text);
            txtAciklama.Text = HttpUtility.HtmlDecode(gvAltKategoriler.SelectedRow.Cells[2].Text);
            txtAltKategori.Focus();
        }
        protected void lbEkle_Click(object sender, EventArgs e)
        {
            pnlEkle.Visible = true;
            Temizle();
            txtAltKategori.Focus();
        }
        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            if (txtAltKategori.Text.Trim() != "")
            {
                if (AltKategoriKontrol(txtAltKategori.Text))
                {
                    lblMesaj.Text = "Aynı altkategori zaten kayıtlı!";
                    txtAltKategori.Focus();
                }
                else
                {
                    DataModel.AltKategoriler altk = new DataModel.AltKategoriler();
                    altk.altkategoriad = txtAltKategori.Text;
                    altk.aciklama = txtAciklama.Text;
                    altk.kategorino = Convert.ToInt32(ddlKategoriler.SelectedValue);
                    ent.AltKategoriler.Add(altk);
                    try
                    {
                        ent.SaveChanges();
                        Temizle();
                        pnlEkle.Visible = false;
                        AltKategorilerGetirByKategoriNo(Convert.ToInt32(ddlKategoriler.SelectedValue));
                    }
                    catch (Exception ex)
                    {
                        string hata = ex.Message;
                    }
                }
            }
            else { lblMesaj.Text = "AltKategori girmelisiniz!"; txtAltKategori.Focus(); }
        }
        protected void btnDegistir_Click(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32(gvAltKategoriler.SelectedValue);
            var degisen = (from altkategori in ent.AltKategoriler
                           where altkategori.id == ID
                           select altkategori).FirstOrDefault();
            degisen.altkategoriad = txtAltKategori.Text;
            degisen.aciklama = txtAciklama.Text;
            try
            {
                ent.SaveChanges();
                Temizle();
                pnlEkle.Visible = false;
                AltKategorilerGetirByKategoriNo(Convert.ToInt32(ddlKategoriler.SelectedValue));
            }
            catch (Exception ex)
            {
                string hata = ex.Message;
            }
        }
        protected void btnSil_Click(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32(gvAltKategoriler.SelectedValue);
            var silinen = (from altkategori in ent.AltKategoriler
                           where altkategori.id == ID
                           select altkategori).FirstOrDefault();
            silinen.silindi = true;
            try
            {
                ent.SaveChanges();
                Temizle();
                pnlEkle.Visible = false;
                AltKategorilerGetirByKategoriNo(Convert.ToInt32(ddlKategoriler.SelectedValue));
            }
            catch (Exception ex)
            {
                string hata = ex.Message;
            }
        }
        private void Temizle()
        {
            lblMesaj.Text = "";
            txtAltKategori.Text = "";
            txtAciklama.Text = "";
        }
        private bool AltKategoriKontrol(string AltKategori)
        {
            var Varmi = (from altk in ent.AltKategoriler
                         where altk.altkategoriad == AltKategori && altk.silindi == false
                         select altk).FirstOrDefault();
            if (Varmi != null) return true;
            else return false;
        }
    }
}