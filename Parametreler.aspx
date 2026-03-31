<%@ Page Title="Parametreler" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Parametreler.aspx.cs" Inherits="webodev3.Parametreler" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h4 class="mb-3">Parametreler</h4>

        <asp:Button ID="btnSozlesme" runat="server" Text="Kullanıcı Sözleşmesi Güncelle" CssClass="btn btn-primary mb-3" OnClick="btnSozlesme_Click" />

        <div class="card shadow-sm">
            <div class="card-body">
                <h5 class="card-title">Mevcut Kullanıcı Sözleşmesi</h5>
                <asp:Literal ID="ltlSozlesme" runat="server"></asp:Literal>
            </div>
        </div>
    </div>

    <!-- 🟢 Sözleşme Güncelle Modal -->
    <div class="modal fade" id="sozlesmeModal" tabindex="-1" aria-labelledby="sozlesmeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title" id="sozlesmeModalLabel">Kullanıcı Sözleşmesini Güncelle</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <asp:TextBox ID="txtSozlesmeMetni" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="12"></asp:TextBox>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">İptal</button>
                    <asp:Button ID="btnKaydet" runat="server" Text="Kaydet" CssClass="btn btn-success" OnClick="btnKaydet_Click" />
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
