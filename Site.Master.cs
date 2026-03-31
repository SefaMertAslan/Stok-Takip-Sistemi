using System;

namespace webodev3
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Eğer oturum varsa kullanıcı adını yazdır
                if (Session["kullanici"] != null)
                {
                    lblHosgeldin.Text = "Hoş geldin, " + Session["kullanici"].ToString();
                }
                else
                {
                    lblHosgeldin.Text = "";
                }
            }
        }
    }
}
