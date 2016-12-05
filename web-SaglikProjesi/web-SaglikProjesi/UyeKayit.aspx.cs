using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_SaglikProjesi
{
    public partial class UyeKayit : System.Web.UI.Page
    {
        DataModel.SaglikUrunleriEntities ent = new DataModel.SaglikUrunleriEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMesaj.Text = "";
        }

        protected void btnKayit_Click(object sender, EventArgs e)
        {
            if(cbxOkudum.Checked == false)
            {
                lblMesaj.Text = "Gizlilik Sözleşmesi okudum, işaretlemelisiniz!";
                txtEmail.Focus();
            }
            else
            {
                if(EmailKontrol(txtEmail.Text))
                {
                    lblMesaj.Text = "Bu mail adresi zaten kayıtlı!";
                    txtEmail.Focus();
                }
                else
                {
                    DataModel.Kullanicilar k = new DataModel.Kullanicilar();
                    k.kullaniciad = txtEmail.Text;
                    k.sifre = txtSifre.Text;    //md5 gibi yöntemlerle şifrelenerek veritabanına kayıt edilir.
                    k.ad = txtAdi.Text;
                    k.soyad = txtSoyadi.Text;
                    k.tckno = txtTCKNo.Text;
                    k.telefon = txtTelefon.Text;
                    k.adres = txtAdres.Text;
                    k.ilce = txtIlce.Text;
                    k.il = txtIl.Text;
                    ent.Kullanicilar.Add(k);
                    try
                    {
                        ent.SaveChanges();
                        lblMesaj.Text = "Üye kayıt işleminiz gerçekleşmiştir.";
                        btnKayit.Visible = false;
                        btnDevam.Visible = true;
                    }
                    catch (Exception ex)
                    {
                        string hata = ex.Message;
                    }

                }
            }
        }
        private bool EmailKontrol(string Email)
        {
            var user = (from k in ent.Kullanicilar
                        where k.kullaniciad == Email && k.silindi == false
                        select k).FirstOrDefault();
            if (user != null)
                return true;
            else
                return false;
        }
        protected void btnDevam_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdresOnayi.aspx");
        }
    }
}