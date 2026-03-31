using System;
using System.Data;

namespace webodev3
{
    public partial class SystemLogs : System.Web.UI.Page
    {
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LogListesiGetir();
        }

        private void LogListesiGetir()
        {
            dt = new DataTable();
            dt.Columns.Add("LogAdi");
            dt.Columns.Add("KullaniciAdi");
            dt.Columns.Add("Tarih", typeof(DateTime));
            dt.Columns.Add("Turu");
            dt.Columns.Add("IP");

            // 📋 Örnek log verileri
            dt.Rows.Add("Giriş", "admin", DateTime.Now.AddDays(-1), "Bilgi", "192.168.1.10");
            dt.Rows.Add("Ürün Ekleme", "mehmet", DateTime.Now.AddDays(-3), "İşlem", "192.168.1.11");
            dt.Rows.Add("Kategori Güncelleme", "ayşe", DateTime.Now.AddDays(-5), "İşlem", "192.168.1.15");
            dt.Rows.Add("Silme", "admin", DateTime.Now.AddDays(-8), "Uyarı", "192.168.1.10");
            dt.Rows.Add("Çıkış", "mehmet", DateTime.Now.AddDays(-2), "Bilgi", "192.168.1.11");

            Session["Loglar"] = dt;
            grdLoglar.DataSource = dt;
            grdLoglar.DataBind();
        }

        protected void btnAra_Click(object sender, EventArgs e)
        {
            dt = Session["Loglar"] as DataTable;
            if (dt == null)
                return;

            string logAdi = txtLogAdi.Text.Trim().ToLower();
            DateTime baslangic = DateTime.MinValue;
            DateTime bitis = DateTime.MaxValue;

            if (DateTime.TryParse(txtBaslangic.Text, out DateTime bas))
                baslangic = bas;

            if (DateTime.TryParse(txtBitis.Text, out DateTime bit))
                bitis = bit;

            DataView dv = dt.DefaultView;
            string filtre = $"Tarih >= #{baslangic}# AND Tarih <= #{bitis}#";

            if (!string.IsNullOrEmpty(logAdi))
                filtre += $" AND LOWER(LogAdi) LIKE '%{logAdi}%'";

            dv.RowFilter = filtre;
            grdLoglar.DataSource = dv;
            grdLoglar.DataBind();
        }
    }
}
