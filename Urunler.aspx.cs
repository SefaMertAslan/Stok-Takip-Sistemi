using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webodev3
{
    public partial class Urunler : Page
    {
        DataTable dt;
        static int seciliIndex = -1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                UrunListesiGetir();
        }

        private void UrunListesiGetir()
        {
            dt = new DataTable();
            dt.Columns.Add("UrunAdi");
            dt.Columns.Add("KayitTarihi");
            dt.Columns.Add("StokAdet");
            dt.Columns.Add("BirimFiyat");
            dt.Columns.Add("Not");

            dt.Rows.Add("A4 Kağıt", "02.01.2025", "10", "300", "Sarf Malzeme");
            dt.Rows.Add("Karton Kutu", "10.02.2025", "25", "120", "Ambalaj");
            dt.Rows.Add("Toner", "03.03.2025", "4", "950", "Yedek Parça");

            Session["Urunler"] = dt;
            grdUrunler.DataSource = dt;
            grdUrunler.DataBind();
        }

        protected void btnAra_Click(object sender, EventArgs e)
        {
            dt = Session["Urunler"] as DataTable;
            if (dt != null)
            {
                DataView dv = dt.DefaultView;
                string filtre = txtUrunAdi.Text.Trim();
                if (!string.IsNullOrEmpty(filtre))
                    dv.RowFilter = $"UrunAdi LIKE '%{filtre}%'";
                grdUrunler.DataSource = dv;
                grdUrunler.DataBind();
            }
        }

        protected void btnEkle_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "EkleModal", "showModal('guncelleModal');", true);
        }

        protected void grdUrunler_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            dt = Session["Urunler"] as DataTable;
            int index = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Detay")
            {
                lblDetayAdi.Text = dt.Rows[index]["UrunAdi"].ToString();
                lblDetayTarih.Text = dt.Rows[index]["KayitTarihi"].ToString();
                lblDetayStok.Text = dt.Rows[index]["StokAdet"].ToString();
                lblDetayFiyat.Text = dt.Rows[index]["BirimFiyat"].ToString();
                lblDetayNot.Text = dt.Rows[index]["Not"].ToString();

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
                txtGuncelUrunAdi.Text = dt.Rows[index]["UrunAdi"].ToString();
                txtGuncelStok.Text = dt.Rows[index]["StokAdet"].ToString();
                txtGuncelFiyat.Text = dt.Rows[index]["BirimFiyat"].ToString();
                txtGuncelNot.Text = dt.Rows[index]["Not"].ToString();

                ScriptManager.RegisterStartupScript(this, GetType(), "GuncelleModal", "showModal('guncelleModal');", true);
            }
        }

        protected void btnGuncelleKaydet_Click(object sender, EventArgs e)
        {
            dt = Session["Urunler"] as DataTable;
            if (dt != null && seciliIndex >= 0)
            {
                dt.Rows[seciliIndex]["UrunAdi"] = txtGuncelUrunAdi.Text;
                dt.Rows[seciliIndex]["StokAdet"] = txtGuncelStok.Text;
                dt.Rows[seciliIndex]["BirimFiyat"] = txtGuncelFiyat.Text;
                dt.Rows[seciliIndex]["Not"] = txtGuncelNot.Text;
                dt.Rows[seciliIndex]["KayitTarihi"] = DateTime.Now.ToString("dd.MM.yyyy");

                Session["Urunler"] = dt;
                grdUrunler.DataSource = dt;
                grdUrunler.DataBind();
            }
        }

        protected void btnSilOnay_Click(object sender, EventArgs e)
        {
            dt = Session["Urunler"] as DataTable;
            int index = Convert.ToInt32(hdnSilIndex.Value);
            if (dt != null && index >= 0 && index < dt.Rows.Count)
            {
                dt.Rows.RemoveAt(index);
                Session["Urunler"] = dt;
                grdUrunler.DataSource = dt;
                grdUrunler.DataBind();
            }
        }
    }
}
