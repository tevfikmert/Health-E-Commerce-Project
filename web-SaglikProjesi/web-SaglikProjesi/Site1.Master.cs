using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace web_SaglikProjesi
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        DataModel.SaglikUrunleriEntities ent = new DataModel.SaglikUrunleriEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                //Kategoriler çekilip menuitem oluşturulacak.
                var Categories = (from c in ent.Kategoriler
                                  where c.silindi == false
                                  select c).ToList();
                foreach (var kategori in Categories)
                {
                    MenuItem mitm = new MenuItem();
                    mitm.Text = kategori.kategoriad;
                    mitm.Value = kategori.id.ToString();
                    mnuKategoriler.Items.Add(mitm);
                    var SubCategories = (from sc in ent.AltKategoriler
                                         where sc.silindi == false && sc.kategorino == kategori.id
                                         select sc).ToList();
                    foreach (var altkategori in SubCategories)
                    {
                            MenuItem citm = new MenuItem();
                            citm.Text = altkategori.altkategoriad;
                            citm.Value = altkategori.id.ToString();
                            mitm.ChildItems.Add(citm);
                    }
                }
                    //Her kategori için AltKategoriler çekilip childitem oluşturulacak.
            }
        }
        protected void mnuKategoriler_MenuItemClick(object sender, MenuEventArgs e)
        {
            //Response.Write("Text : " + e.Item.Text + ", Value : " + e.Item.Value);
            /*Response.Write(e.Item.Depth.ToString());*/ //Kategori tıklanırsa 0, Altkategori tıklanırsa 1 değeri veriyor.
            //Response.Write(e.Item.ValuePath); //Root item'dan itibaren seçilen yoldaki value'ları aralarında / olacak şekilde gösteriyor.
            string[] Degerler = e.Item.ValuePath.Split('/');
            int altkno = 0;
            if(Degerler.Length > 1)
            {
                altkno = Convert.ToInt32(Degerler[1]);
            }
            Response.Redirect("Urunlerimiz.aspx?kno=" + Degerler[0] + "&akno=" + altkno);
        }
    }
}