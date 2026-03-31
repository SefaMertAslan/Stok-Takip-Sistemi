using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webodev3
{
    public partial class KullaniciAra : Page
    {
        DataTable dt;
        static int seciliIndex = -1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                KullaniciListesiGetir();
        }

        private void KullaniciListesiGetir()
        {
            dt = new DataTable();
            dt.Columns.Add("AdSoyad");
            dt.Columns.Add("KullaniciAdi");
            dt.Columns.Add("KayitTarihi");
            dt.Columns.Add("Mail");
            dt.Columns.Add("Rol");

            
            dt.Rows.Add("Ahmet DEMİR", "ahmet.demir", "15.02.2025", "ahmet@example.com", "Kullanıcı");
            dt.Rows.Add("Ayşe KAYA", "ayse.kaya", "20.03.2025", "ayse@example.com", "Yönetici");
            dt.Rows.Add("Mehmet YILMAZ", "mehmet.yilmaz", "04.04.2025", "mehmet@example.com", "Kullanıcı");

            Session["Kullanicilar"] = dt;
            grdKullanicilar.DataSource = dt;
            grdKullanicilar.DataBind();
        }

        protected void btnAra_Click(object sender, EventArgs e)
        {
            dt = Session["Kullanicilar"] as DataTable;
            if (dt != null)
            {
                DataView dv = dt.DefaultView;
                string filtre = txtAdSoyad.Text.Trim();
                if (!string.IsNullOrEmpty(filtre))
                    dv.RowFilter = $"AdSoyad LIKE '%{filtre}%'";
                grdKullanicilar.DataSource = dv;
                grdKullanicilar.DataBind();
            }
        }

        protected void btnEkle_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "EkleModal", "showModal('guncelleModal');", true);
        }

        protected void grdKullanicilar_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            dt = Session["Kullanicilar"] as DataTable;
            int index = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Detay")
            {
                lblDetayAdSoyad.Text = dt.Rows[index]["AdSoyad"].ToString();
                lblDetayKullaniciAdi.Text = dt.Rows[index]["KullaniciAdi"].ToString();
                lblDetayKayitTarihi.Text = dt.Rows[index]["KayitTarihi"].ToString();
                lblDetayMail.Text = dt.Rows[index]["Mail"].ToString();
                lblDetayRol.Text = dt.Rows[index]["Rol"].ToString();

                ScriptManager.RegisterStartupScript(this, GetType(), "DetayModal", "showModal('detayModal');", true);
            }
            else if (e.CommandName == "Sil")
            {
                hdnSilIndex.Value = index.ToString();
                ScriptManager.RegisterStartupScript(this, GetType(), "SilModal", "showModal('silModal');", true);
            }
            else if (e.CommandName == "Guncelle")
            {
                seciliIndex = index;
                txtGuncelAdSoyad.Text = dt.Rows[index]["AdSoyad"].ToString();
                txtGuncelMail.Text = dt.Rows[index]["Mail"].ToString();
                txtGuncelRol.Text = dt.Rows[index]["Rol"].ToString();

                ScriptManager.RegisterStartupScript(this, GetType(), "GuncelleModal", "showModal('guncelleModal');", true);
            }
        }

        protected void btnGuncelleKaydet_Click(object sender, EventArgs e)
        {
            dt = Session["Kullanicilar"] as DataTable;
            if (dt != null && seciliIndex >= 0)
            {
                dt.Rows[seciliIndex]["AdSoyad"] = txtGuncelAdSoyad.Text;
                dt.Rows[seciliIndex]["Mail"] = txtGuncelMail.Text;
                dt.Rows[seciliIndex]["Rol"] = txtGuncelRol.Text;
                dt.Rows[seciliIndex]["KayitTarihi"] = DateTime.Now.ToString("dd.MM.yyyy");

                Session["Kullanicilar"] = dt;
                grdKullanicilar.DataSource = dt;
                grdKullanicilar.DataBind();
            }
        }

        protected void btnSilOnay_Click(object sender, EventArgs e)
        {
            dt = Session["Kullanicilar"] as DataTable;
            int index = Convert.ToInt32(hdnSilIndex.Value);
            if (dt != null && index >= 0 && index < dt.Rows.Count)
            {
                dt.Rows.RemoveAt(index);
                Session["Kullanicilar"] = dt;
                grdKullanicilar.DataSource = dt;
                grdKullanicilar.DataBind();
            }
        }
    }
}
