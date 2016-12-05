using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using web_SaglikProjesi.DataModel;

namespace web_SaglikProjesi
{
    public partial class AdresOnayi : System.Web.UI.Page
    {
        DataModel.SaglikUrunleriEntities ent = new DataModel.SaglikUrunleriEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                txtEmail.Focus();
        }
        protected void btnGiris_Click(object sender, EventArgs e)
        {
            //kullanıcı giriş kontrolü
            var kullanici = (from k in ent.Kullanicilar
                             where k.kullaniciad == txtEmail.Text && k.sifre == txtSifre.Text && k.silindi == false
                             select k).FirstOrDefault();
            if(kullanici == null)
            {
                lblMesaj.Text = "Hatalı kullanıcı yada şifre girişi!";
                txtEmail.Focus();
            }
            else
            {
                Session["kullanici"] = kullanici.id;
                lblMesaj.Text = "";
                pnlAdres.Visible = true;
                txtAdres.Text = kullanici.adres;
                txtIlce.Text = kullanici.ilce;
                txtIl.Text = kullanici.il;
                txtTelefon.Text = kullanici.telefon;
                txtTCKNo.Text = kullanici.tckno;
                txtAdres.Focus();
            }
        }
        protected void btnAdresOnay_Click(object sender, EventArgs e)
        {
            if(txtAdres.Text.Trim() != "" && txtTelefon.Text.Trim() != "")
            {
                int degisenID = Convert.ToInt32(Session["kullanici"]);
                var degisen = (from k in ent.Kullanicilar
                               where k.id == degisenID
                               select k).FirstOrDefault();
                degisen.adres = txtAdres.Text;
                degisen.ilce = txtIlce.Text;
                degisen.il = txtIl.Text;
                degisen.telefon = txtTelefon.Text;
                degisen.tckno = txtTCKNo.Text;
                try
                {
                    ent.SaveChanges();
                    lblMesaj.Text = "Adres bilgileriniz güncellendi.";
                    //Alışveriş detayları (sepet) satış ve satış detay tablolarına işlenmeli.
                    Satislar satis = new Satislar();
                    satis.tarih = DateTime.Now;
                    satis.kullanicino = Convert.ToInt32(Session["kullanici"]);
                    satis.teslimtarihi = DateTime.Now.AddDays(3);
                    satis.tutar = ToplamTutarBul();
                    satis.miktar = ToplamAdetBul();
                    satis.durumu = (byte)Models.cEnum.SatisDurumu.siparis;
                    ent.Satislar.Add(satis);
                    ent.SaveChanges();
                    //Bu satışa ait satış detaylarına sepet bilgileri kayıt edilmeli.
                    SatisDetaylari detay = new SatisDetaylari();
                    var sonsatis = (from s in ent.Satislar
                                    where s.kullanicino == satis.kullanicino && s.silindi == false
                                    select s).ToList().Last();
                    int SonSatisno = sonsatis.satisno;
                    //int SonSatisno = ent.Satislar.Where(s => s.kullanicino == satis.kullanicino && s.silindi == false).ToList().Last().satisno;
                    DataTable dt = (DataTable)Session["sepet"];
                    foreach (DataRow urun in dt.Rows)
                    {
                        detay.satisno = SonSatisno;
                        detay.urunid = Convert.ToInt32(urun["urunid"]);
                        detay.adet = Convert.ToInt32(urun["adet"]);
                        detay.birimfiyat = Convert.ToDecimal(urun["fiyat"]);
                        detay.tutar = Convert.ToDecimal(urun["tutar"]);
                        ent.SatisDetaylari.Add(detay);
                        ent.SaveChanges();
                    }
                    //Session.Remove("sepet"); //Sepet detayları veritabanına kayıt edildiği için mevcut session temizlenmeli. ??? -> Odeme sayfasında gerekebilir.
                    Response.Redirect("Odeme.aspx");
                }
                catch (Exception ex)
                {
                    string hata = ex.Message;
                }
            }
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
        protected void cbxUnuttum_CheckedChanged(object sender, EventArgs e)
        {
            if(txtEmail.Text.Trim() != "")
            {
                Kullanicilar k = EmailKontrol(txtEmail.Text);
                if(k != null)
                {
                    //Hangi kütüphaneler (library-namespace) yüklenmeli -> System.Net, System.Net.Mail
                    MailMessage mail = new MailMessage();
                    mail.From = new MailAddress("wissendeneme@gmail.com", "Wissen .NET Erp-6", System.Text.Encoding.UTF8);
                    mail.To.Add(txtEmail.Text);
                    //mail.CC.Add(); Diğer gönderilmek istenilen adresler girilebilir.
                    mail.Subject = "Sağlık Ürünleri e-Ticaret Sitesi";
                    //mail.Body = "Sayın, " + k.ad + " " + k.soyad + "<br/> Şifreniz : " + k.sifre;
                    StringBuilder sbMesaj = new StringBuilder();
                    sbMesaj.Append("Sayın, " + k.ad + " " + k.soyad + "<br/> Şifreniz : " + k.sifre);
                    sbMesaj.Append("<a href=\"" + Request.Url.Host + "/AdresOnayi.aspx\" >Alışverişe devam etmek için tıklayınız...</a>");
                    mail.Body = sbMesaj.ToString();
                    mail.IsBodyHtml = true;
                    //Hangi mailserver kullanılacak (mail.domain.com) örn: smtp.gmail.com
                    SmtpClient sc = new SmtpClient();
                    sc.Host = "smtp.gmail.com"; //mail.domain.com
                    sc.Port = 587;
                    sc.EnableSsl = true;
                    sc.Credentials = new NetworkCredential("wissendeneme@gmail.com", "wissen123");
                    try
                    { 
                        sc.Send(mail);
                        lblMesaj.Text = "Şifreniz mail adresinize gönderilmiştir.";
                    }
                    catch (Exception ex)
                    {
                        string hata = ex.Message;
                    }                  
                }
                else { lblMesaj.Text = "Bu email adresi kayıtlı değildir."; }
            }
        }
        private Kullanicilar EmailKontrol(string Email)
        {
            var user = (from k in ent.Kullanicilar
                        where k.kullaniciad == Email && k.silindi == false
                        select k).FirstOrDefault();
            return user;
        }
    }
}