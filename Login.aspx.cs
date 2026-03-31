using System;
using System.Web.UI;

namespace webodev3
{
    public partial class Login : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["KullaniciSozlesmesi"] == null)
                {
                    Session["KullaniciSozlesmesi"] =
                        "<p><strong>KULLANICI SÖZLEŞMESİ</strong><br>" +
                        "Bu sistemin kullanımı kayıtlı kullanıcılar tarafından yapılmalıdır. " +
                        "Siteye giriş yapan her kullanıcı, sistemin kullanım şartlarını kabul etmiş sayılır.</p>";
                }

                ltlSozlesme.Text = Session["KullaniciSozlesmesi"].ToString();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string kullanici = txtKullaniciAdi.Text.Trim().ToLower();
            string sifre = txtSifre.Text.Trim();

            if ((kullanici == "admin" && sifre == "123") ||
                (Session["YeniKullanici"] != null &&
                 kullanici == Session["YeniKullanici"].ToString().Trim().ToLower() &&
                 sifre == Session["YeniSifre"].ToString()))
            {
                Session["kullanici"] = kullanici;
                Response.Redirect("Default.aspx");
            }
            else
            {
                lblHataMesaj.Text = "Kullanıcı adı veya şifre hatalı! Lütfen tekrar deneyin.";
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowError",
                    "var myModal = new bootstrap.Modal(document.getElementById('errorModal')); myModal.show();", true);
            }
        }

        protected void btnUyeOl_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "ShowUyeModal",
                "var myModal = new bootstrap.Modal(document.getElementById('uyeModal')); myModal.show();", true);
        }

        protected void btnKaydetUye_Click(object sender, EventArgs e)
        {
            if (txtYeniSifre.Text != txtYeniSifreTekrar.Text)
            {
                lblHataMesaj.Text = "Şifreler uyuşmuyor. Lütfen tekrar deneyin.";
                ScriptManager.RegisterStartupScript(this, GetType(), "ShowError",
                    "var myModal = new bootstrap.Modal(document.getElementById('errorModal')); myModal.show();", true);
            }
            else
            {
                Session["YeniKullanici"] = txtYeniKullanici.Text.Trim().ToLower();
                Session["YeniSifre"] = txtYeniSifre.Text.Trim();
                Session["AdSoyad"] = txtAd.Text.Trim() + " " + txtSoyad.Text.Trim();
                Session["Email"] = txtEmail.Text.Trim();

                ScriptManager.RegisterStartupScript(this, GetType(), "KayitBasarili",
                    "alert('Üyelik başarıyla oluşturuldu! Şimdi giriş yapabilirsiniz.');", true);
            }
        }
    }
}
