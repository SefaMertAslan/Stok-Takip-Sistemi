using System;
using System.Web.UI;

namespace webodev3
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["kullanici"] != null)
                {
                    lblKullaniciAdi.Text = Session["kullanici"].ToString();
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
    }
}
