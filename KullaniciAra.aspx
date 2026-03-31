<%@ Page Title="Kullanıcılar" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="KullaniciAra.aspx.cs" Inherits="webodev3.KullaniciAra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container mt-4">
    <h4 class="mb-3">Kullanıcılar</h4>

    <div class="row mb-3 align-items-center">
        <div class="col-md-6">
            <label class="form-label">Ad Soyad</label>
            <div class="input-group">
                <asp:TextBox ID="txtAdSoyad" runat="server" CssClass="form-control" placeholder="Ad veya soyad girin..." />
                <asp:Button ID="btnAra" runat="server" Text="Ara" CssClass="btn btn-primary" OnClick="btnAra_Click" />
                <asp:Button ID="btnEkle" runat="server" Text="Yeni Kullanıcı" CssClass="btn btn-success ms-2" OnClick="btnEkle_Click" />
            </div>
        </div>
    </div>

    <asp:GridView ID="grdKullanicilar" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped"
        OnRowCommand="grdKullanicilar_RowCommand">
        <Columns>
            <asp:BoundField DataField="AdSoyad" HeaderText="Ad Soyad" />
            <asp:BoundField DataField="KullaniciAdi" HeaderText="Kullanıcı Adı" />
            <asp:BoundField DataField="KayitTarihi" HeaderText="Kayıt Tarihi" />
            <asp:BoundField DataField="Mail" HeaderText="E-Posta" />
            <asp:BoundField DataField="Rol" HeaderText="Rol" />

            <asp:TemplateField HeaderText="Detay">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkDetay" runat="server" Text="Detay" CommandName="Detay" CommandArgument="<%# Container.DataItemIndex %>" CssClass="text-primary"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Güncelle">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkGuncelle" runat="server" Text="Güncelle" CommandName="Guncelle" CommandArgument="<%# Container.DataItemIndex %>" CssClass="text-warning"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Sil">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkSil" runat="server" Text="Sil" CommandName="Sil" CommandArgument="<%# Container.DataItemIndex %>" CssClass="text-danger"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>

<!-- 🔵 DETAY MODAL -->
<div class="modal fade" id="detayModal" tabindex="-1" aria-labelledby="detayModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-info text-white">
        <h5 class="modal-title" id="detayModalLabel">Kullanıcı Detayı</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <p><strong>Ad Soyad:</strong> <asp:Label ID="lblDetayAdSoyad" runat="server" /></p>
        <p><strong>Kullanıcı Adı:</strong> <asp:Label ID="lblDetayKullaniciAdi" runat="server" /></p>
        <p><strong>Kayıt Tarihi:</strong> <asp:Label ID="lblDetayKayitTarihi" runat="server" /></p>
        <p><strong>E-Posta:</strong> <asp:Label ID="lblDetayMail" runat="server" /></p>
        <p><strong>Rol:</strong> <asp:Label ID="lblDetayRol" runat="server" /></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Kapat</button>
      </div>
    </div>
  </div>
</div>

<!-- 🟨 GÜNCELLE MODAL -->
<div class="modal fade" id="guncelleModal" tabindex="-1" aria-labelledby="guncelleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-warning text-white">
        <h5 class="modal-title" id="guncelleModalLabel">Kullanıcı Güncelle</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <label>Ad Soyad</label>
        <asp:TextBox ID="txtGuncelAdSoyad" runat="server" CssClass="form-control mb-2" />
        <label>E-Posta</label>
        <asp:TextBox ID="txtGuncelMail" runat="server" CssClass="form-control mb-2" />
        <label>Rol</label>
        <asp:TextBox ID="txtGuncelRol" runat="server" CssClass="form-control mb-2" />
      </div>
      <div class="modal-footer">
        <asp:Button ID="btnGuncelleKaydet" runat="server" Text="Kaydet" CssClass="btn btn-warning" OnClick="btnGuncelleKaydet_Click" />
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Kapat</button>
      </div>
    </div>
  </div>
</div>

<!-- 🔴 SİL MODAL -->
<div class="modal fade" id="silModal" tabindex="-1" aria-labelledby="silModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-danger text-white">
        <h5 class="modal-title" id="silModalLabel">Silme Onayı</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body text-center">
        <p>Bu kullanıcıyı silmek istediğinizden emin misiniz?</p>
        <asp:HiddenField ID="hdnSilIndex" runat="server" />
      </div>
      <div class="modal-footer">
        <asp:Button ID="btnSilOnay" runat="server" Text="Evet, Sil" CssClass="btn btn-danger" OnClick="btnSilOnay_Click" />
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">İptal</button>
      </div>
    </div>
  </div>
</div>

<script>
    function showModal(id) {
        var modal = new bootstrap.Modal(document.getElementById(id));
        modal.show();
    }
</script>

</asp:Content>
