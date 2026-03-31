<%@ Page Title="Ürünler" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Urunler.aspx.cs" Inherits="webodev3.Urunler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container mt-4">
    <h4 class="mb-3">Ürünler</h4>

    <div class="row mb-3 align-items-center">
        <div class="col-md-6">
            <label class="form-label">Ürün Adı</label>
            <div class="input-group">
                <asp:TextBox ID="txtUrunAdi" runat="server" CssClass="form-control" placeholder="Ürün adı girin..." />
                <asp:Button ID="btnAra" runat="server" Text="Ara" CssClass="btn btn-primary" OnClick="btnAra_Click" />
                <asp:Button ID="btnEkle" runat="server" Text="Ürün Ekle" CssClass="btn btn-success ms-2" OnClick="btnEkle_Click" />
            </div>
        </div>
    </div>

    <asp:GridView ID="grdUrunler" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped"
        OnRowCommand="grdUrunler_RowCommand">
        <Columns>
            <asp:BoundField DataField="UrunAdi" HeaderText="Ürün Adı" />
            <asp:BoundField DataField="KayitTarihi" HeaderText="Kayıt Tarihi" />
            <asp:BoundField DataField="StokAdet" HeaderText="Stok Adedi" />
            <asp:BoundField DataField="BirimFiyat" HeaderText="Fiyat (₺)" />
            <asp:BoundField DataField="Not" HeaderText="Not" />

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

<!-- 🔵 Detay Modal -->
<div class="modal fade" id="detayModal" tabindex="-1" aria-labelledby="detayModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-info text-white">
        <h5 class="modal-title" id="detayModalLabel">Ürün Detayı</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <p><strong>Ürün Adı:</strong> <asp:Label ID="lblDetayAdi" runat="server" /></p>
        <p><strong>Kayıt Tarihi:</strong> <asp:Label ID="lblDetayTarih" runat="server" /></p>
        <p><strong>Stok Adedi:</strong> <asp:Label ID="lblDetayStok" runat="server" /></p>
        <p><strong>Fiyat:</strong> <asp:Label ID="lblDetayFiyat" runat="server" /></p>
        <p><strong>Not:</strong> <asp:Label ID="lblDetayNot" runat="server" /></p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Kapat</button>
      </div>
    </div>
  </div>
</div>

<!-- 🟡 Güncelle Modal -->
<div class="modal fade" id="guncelleModal" tabindex="-1" aria-labelledby="guncelleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-warning text-white">
        <h5 class="modal-title" id="guncelleModalLabel">Ürün Güncelle</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <label>Ürün Adı</label>
        <asp:TextBox ID="txtGuncelUrunAdi" runat="server" CssClass="form-control mb-2" />
        <label>Stok Adedi</label>
        <asp:TextBox ID="txtGuncelStok" runat="server" CssClass="form-control mb-2" />
        <label>Fiyat</label>
        <asp:TextBox ID="txtGuncelFiyat" runat="server" CssClass="form-control mb-2" />
        <label>Not</label>
        <asp:TextBox ID="txtGuncelNot" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" />
      </div>
      <div class="modal-footer">
        <asp:Button ID="btnGuncelleKaydet" runat="server" Text="Kaydet" CssClass="btn btn-warning" OnClick="btnGuncelleKaydet_Click" />
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Kapat</button>
      </div>
    </div>
  </div>
</div>

<!-- 🔴 Sil Modal -->
<div class="modal fade" id="silModal" tabindex="-1" aria-labelledby="silModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header bg-danger text-white">
        <h5 class="modal-title" id="silModalLabel">Silme Onayı</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body text-center">
        <p>Bu ürünü silmek istediğinizden emin misiniz?</p>
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
