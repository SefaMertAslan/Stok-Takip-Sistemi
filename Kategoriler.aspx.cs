using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webodev3
{
    public partial class Kategoriler : System.Web.UI.Page
    {
        DataTable dt;
        static int seciliIndex = -1;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                KategoriListesiGetir();
        }

        private void KategoriListesiGetir()
        {
            dt = new DataTable();
            dt.Columns.Add("KategoriAdi");
            dt.Columns.Add("KayitTarihi");
            dt.Columns.Add("SonGuncelleme");
            dt.Columns.Add("Not");

            dt.Rows.Add("Sarf Malzemesi", "02.01.2025", "—", "Son kullanma tarihi olmayan ürün");
            dt.Rows.Add("Elektronik", "05.01.2025", "—", "Teknik cihaz kategorisi");
            dt.Rows.Add("Mobilya", "08.01.2025", "—", "Ofis ve ev eşyaları");

            Session["Kategoriler"] = dt;
            grdKategoriler.DataSource = dt;
            grdKategoriler.DataBind();
        }

        protected void btnAra_Click(object sender, EventArgs e)
        {
            dt = Session["Kategoriler"] as DataTable;
            if (dt != null)
            {
                DataView dv = dt.DefaultView;
                string filtre = txtKategoriAdi.Text.Trim();
                if (!string.IsNullOrEmpty(filtre))
                    dv.RowFilter = $"KategoriAdi LIKE '%{filtre}%'";
                grdKategoriler.DataSource = dv;
                grdKategoriler.DataBind();
            }
        }

        protected void btnEkle_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "EkleModal", "showModal('ekleModal');", true);
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            dt = Session["Kategoriler"] as DataTable;
            if (dt != null)
            {
                dt.Rows.Add(txtYeniKategoriAdi.Text, DateTime.Now.ToString("dd.MM.yyyy"), "—", txtYeniNot.Text);
                Session["Kategoriler"] = dt;
                grdKategoriler.DataSource = dt;
                grdKategoriler.DataBind();
            }
        }

        protected void grdKategoriler_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            dt = Session["Kategoriler"] as DataTable;
            int index = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "Detay")
            {
                lblDetayAdi.Text = dt.Rows[index]["KategoriAdi"].ToString();
                lblDetayTarih.Text = dt.Rows[index]["KayitTarihi"].ToString();
                lblDetayGuncelleme.Text = dt.Rows[index]["SonGuncelleme"].ToString();
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
                txtGuncelKategoriAdi.Text = dt.Rows[index]["KategoriAdi"].ToString();
                txtGuncelNot.Text = dt.Rows[index]["Not"].ToString();

                ScriptManager.RegisterStartupScript(this, GetType(), "GuncelleModal", "showModal('guncelleModal');", true);
            }
        }

        protected void btnGuncelleKaydet_Click(object sender, EventArgs e)
        {
            dt = Session["Kategoriler"] as DataTable;
            if (dt != null && seciliIndex >= 0)
            {
                dt.Rows[seciliIndex]["KategoriAdi"] = txtGuncelKategoriAdi.Text;
                dt.Rows[seciliIndex]["Not"] = txtGuncelNot.Text;
                dt.Rows[seciliIndex]["SonGuncelleme"] = DateTime.Now.ToString("dd.MM.yyyy HH:mm");

                Session["Kategoriler"] = dt;
                grdKategoriler.DataSource = dt;
                grdKategoriler.DataBind();
            }
        }

        protected void btnSilOnay_Click(object sender, EventArgs e)
        {
            dt = Session["Kategoriler"] as DataTable;
            int index = Convert.ToInt32(hdnSilIndex.Value);
            if (dt != null && index >= 0 && index < dt.Rows.Count)
            {
                dt.Rows.RemoveAt(index);
                Session["Kategoriler"] = dt;
                grdKategoriler.DataSource = dt;
                grdKategoriler.DataBind();
            }
        }
    }
}
