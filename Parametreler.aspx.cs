using System;
using System.Web.UI;

namespace webodev3
{
    public partial class Parametreler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["KullaniciSozlesmesi"] == null)
                {
                    Session["KullaniciSozlesmesi"] =
                        "<p><strong>Varsayılan Kullanıcı Sözleşmesi:</strong><br>" +
                        "Bu sistemin kullanımı kayıtlı kullanıcılar tarafından yapılmalıdır.</p>";
                }

                ltlSozlesme.Text = Session["KullaniciSozlesmesi"].ToString();
            }
        }

        protected void btnSozlesme_Click(object sender, EventArgs e)
        {
            txtSozlesmeMetni.Text = Session["KullaniciSozlesmesi"].ToString().Replace("<br>", Environment.NewLine);
            ScriptManager.RegisterStartupScript(this, GetType(), "SozlesmeModal", "showModal('sozlesmeModal');", true);
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            Session["KullaniciSozlesmesi"] = txtSozlesmeMetni.Text.Replace(Environment.NewLine, "<br>");
            ltlSozlesme.Text = Session["KullaniciSozlesmesi"].ToString();
        }
    }
}
