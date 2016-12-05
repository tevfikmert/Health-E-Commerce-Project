using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_SaglikProjesi.Admin
{
    public partial class KategoriEkle : System.Web.UI.Page
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
            gvKategoriler.DataSource = categories;
            gvKategoriler.DataBind();
        }
        protected void lbEkle_Click(object sender, EventArgs e)
        {
            pnlEkle.Visible = true;
            Temizle();
            txtKategori.Focus();
        }
        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            if (txtKategori.Text.Trim() != "")
            {
                if (KategoriKontrol(txtKategori.Text))
                {
                    lblMesaj.Text = "Aynı kategori zaten kayıtlı!";
                    txtKategori.Focus();
                }
                else
                {
                    DataModel.Kategoriler k = new DataModel.Kategoriler();
                    k.kategoriad = txtKategori.Text;
                    k.aciklama = txtAciklama.Text;
                    ent.Kategoriler.Add(k);
                    try
                    {
                        ent.SaveChanges();
                        Temizle();
                        pnlEkle.Visible = false;
                        KategorileriGetir();
                    }
                    catch (Exception ex)
                    {
                        string hata = ex.Message;
                    }
                }
            }else { lblMesaj.Text = "Kategori girmelisiniz!"; txtKategori.Focus(); }
        }
        protected void gvKategoriler_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlEkle.Visible = true;
            txtKategori.Text = HttpUtility.HtmlDecode(gvKategoriler.SelectedRow.Cells[1].Text);
            txtAciklama.Text = HttpUtility.HtmlDecode(gvKategoriler.SelectedRow.Cells[2].Text);
            txtKategori.Focus();
        }
        protected void btnDegistir_Click(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32(gvKategoriler.SelectedValue);
            var degisen = (from kategori in ent.Kategoriler
                           where kategori.id == ID
                           select kategori).FirstOrDefault();
            degisen.kategoriad = txtKategori.Text;
            degisen.aciklama = txtAciklama.Text;
            try
            {
                ent.SaveChanges();
                Temizle();
                pnlEkle.Visible = false;
                KategorileriGetir();
            }
            catch (Exception ex)
            {
                string hata = ex.Message;
            }
        }
        protected void btnSil_Click(object sender, EventArgs e)
        {
            int ID = Convert.ToInt32(gvKategoriler.SelectedValue);
            var silinen = (from kategori in ent.Kategoriler
                           where kategori.id == ID
                           select kategori).FirstOrDefault();
            //ent.Kategoriler.Remove(silinen);
            silinen.silindi = true; //Kaydı gerçekten silmek yerine silindi kolonunu true (1) yapıyoruz.
            try
            {
                ent.SaveChanges();
                Temizle();
                pnlEkle.Visible = false;
                KategorileriGetir();
            }
            catch (Exception ex)
            {
                string hata = ex.Message;
            }
        }
        private bool KategoriKontrol(string Kategori)
        {
            var Varmi = (from k in ent.Kategoriler
                         where k.kategoriad == Kategori && k.silindi == false
                         select k).FirstOrDefault();
            if (Varmi != null) return true;
            else return false;
        }
        private void Temizle()
        {
            lblMesaj.Text = "";
            txtKategori.Text = "";
            txtAciklama.Text = "";
        }


    }
}