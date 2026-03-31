<%@ Page Title="Kategoriler" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Kategoriler.aspx.cs" Inherits="webodev3.Kategoriler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h4 class="mb-3">Kategoriler</h4>

        <div class="row mb-3 align-items-center">
            <div class="col-md-6">
                <label for="txtKategoriAdi" class="form-label">Kategori Adı</label>
                <div class="input-group">
                    <asp:TextBox ID="txtKategoriAdi" runat="server" CssClass="form-control" placeholder="Kategori adı girin..."></asp:TextBox>
                    <asp:Button ID="btnAra" runat="server" Text="Ara" CssClass="btn btn-primary" OnClick="btnAra_Click" />
                    <asp:Button ID="btnEkle" runat="server" Text="Kategori Ekle" CssClass="btn btn-success ms-2" OnClick="btnEkle_Click" />
                </div>
            </div>
        </div>

        <asp:GridView ID="grdKategoriler" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped"
            OnRowCommand="grdKategoriler_RowCommand">
            <Columns>
                <asp:BoundField DataField="KategoriAdi" HeaderText="Kategori Adı" />
                <asp:BoundField DataField="KayitTarihi" HeaderText="Kayıt Tarihi" />
                <asp:BoundField DataField="SonGuncelleme" HeaderText="Son Güncelleme Tarihi" />
                <asp:BoundField DataField="Not" HeaderText="Not" />

                <asp:TemplateField HeaderText="Detay">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDetay" runat="server" Text="Detaylar" CommandName="Detay" CommandArgument="<%# Container.DataItemIndex %>" CssClass="text-primary"></asp:LinkButton>
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

    <!-- 🟢 KATEGORİ EKLE MODAL -->
    <div class="modal fade" id="ekleModal" tabindex="-1" aria-labelledby="ekleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                    <h5 class="modal-title" id="ekleModalLabel">Kategori Ekle</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-2">
                        <label>Kategori Adı</label>
                        <asp:TextBox ID="txtYeniKategoriAdi" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="mb-2">
                        <label>Not</label>
                        <asp:TextBox ID="txtYeniNot" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">İptal</button>
                    <asp:Button ID="btnKaydet" runat="server" Text="Kaydet" CssClass="btn btn-success" OnClick="btnKaydet_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- 🟡 GÜNCELLE MODAL -->
    <div class="modal fade" id="guncelleModal" tabindex="-1" aria-labelledby="guncelleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header bg-warning text-white">
                    <h5 class="modal-title" id="guncelleModalLabel">Kategori Güncelle</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-2">
                        <label>Kategori Adı</label>
                        <asp:TextBox ID="txtGuncelKategoriAdi" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="mb-2">
                        <label>Not</label>
                        <asp:TextBox ID="txtGuncelNot" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">İptal</button>
                    <asp:Button ID="btnGuncelleKaydet" runat="server" Text="Güncelle" CssClass="btn btn-warning" OnClick="btnGuncelleKaydet_Click" />
                </div>
            </div>
        </div>
    </div>

    <!-- 🔵 DETAY MODAL -->
    <div class="modal fade" id="detayModal" tabindex="-1" aria-labelledby="detayModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header bg-info text-white">
                    <h5 class="modal-title" id="detayModalLabel">Kategori Detayı</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p><strong>Kategori Adı:</strong> <asp:Label ID="lblDetayAdi" runat="server" /></p>
                    <p><strong>Kayıt Tarihi:</strong> <asp:Label ID="lblDetayTarih" runat="server" /></p>
                    <p><strong>Son Güncelleme:</strong> <asp:Label ID="lblDetayGuncelleme" runat="server" /></p>
                    <p><strong>Not:</strong> <asp:Label ID="lblDetayNot" runat="server" /></p>
                </div>
                <div class="modal-footer">
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
                    <p>Bu kategoriyi silmek istediğinizden emin misiniz?</p>
                    <asp:HiddenField ID="hdnSilIndex" runat="server" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">İptal</button>
                    <asp:Button ID="btnSilOnay" runat="server" Text="Evet, Sil" CssClass="btn btn-danger" OnClick="btnSilOnay_Click" />
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
