<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="webodev3.Login" %>

<!DOCTYPE html>
<html lang="tr">
<head runat="server">
    <meta charset="utf-8" />
    <title>Giriş Sayfası</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body {
            background: linear-gradient(135deg, #3b82f6, #9333ea);
            background-attachment: fixed;
            color: #fff;
            font-family: 'Segoe UI', sans-serif;
        }

        .login-container {
            width: 400px;
            margin: 100px auto;
            background-color: rgba(255, 255, 255, 0.95);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 25px rgba(0,0,0,0.2);
            color: #333;
            animation: fadeIn 1s ease-in-out;
        }

        /* MODAL STİLİ */
        .modal-content {
            background-color: #fff !important;
            color: #212529 !important;
            border-radius: 10px;
            animation: slideUp 0.4s ease-out;
        }

        .modal-body {
            color: #212529 !important;
        }

        .modal-header, .modal-footer {
            border-color: #dee2e6;
        }

        /* Buton grubu */
        .btn-group-custom button {
            width: 32%;
        }

        /* 🔹 Animasyonlar */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @keyframes slideUp {
            from { transform: translateY(40px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        /* Hover efektleri */
        .btn:hover {
            transform: scale(1.03);
            transition: transform 0.2s;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="login-container text-center">
            <!-- LOGO KALDIRILDI -->
            <h4 class="mb-4">Kullanıcı Girişi</h4>

            <div class="mb-3 text-start">
                <label for="txtKullaniciAdi" class="form-label">Kullanıcı Adı</label>
                <asp:TextBox ID="txtKullaniciAdi" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="mb-4 text-start">
                <label for="txtSifre" class="form-label">Şifre</label>
                <asp:TextBox ID="txtSifre" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="d-flex justify-content-between btn-group-custom">
                <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#sozlesmeModal">
                    📜 Sözleşme
                </button>

                <asp:Button ID="btnUyeOl" runat="server" Text="Üye Ol" CssClass="btn btn-warning" OnClick="btnUyeOl_Click" />

                <asp:Button ID="btnLogin" runat="server" Text="Giriş Yap" CssClass="btn btn-primary" OnClick="btnLogin_Click" />
            </div>
        </div>

        <!-- 🧾 Sözleşme Modal -->
        <div class="modal fade" id="sozlesmeModal" tabindex="-1" aria-labelledby="sozlesmeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title" id="sozlesmeModalLabel">Kullanıcı Sözleşmesi</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body" style="font-size: 0.95rem; line-height: 1.6; text-align: justify;">
                        <asp:Literal ID="ltlSozlesme" runat="server"></asp:Literal>
                    </div>
                    <div class="modal-footer bg-light">
                        <button type="button" class="btn btn-success" data-bs-dismiss="modal">Okudum ve Kabul Ediyorum</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- ❌ Hatalı Giriş Modal -->
        <div class="modal fade" id="errorModal" tabindex="-1" aria-labelledby="errorModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content border-danger">
                    <div class="modal-header bg-danger text-white">
                        <h5 class="modal-title" id="errorModalLabel">Giriş Hatası</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <p><strong>Hata:</strong> <asp:Label ID="lblHataMesaj" runat="server" Text="Kullanıcı adı veya şifre hatalı!"></asp:Label></p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-outline-danger" data-bs-dismiss="modal">Tamam</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- 🟢 Üye Ol Modal -->
        <div class="modal fade" id="uyeModal" tabindex="-1" aria-labelledby="uyeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header bg-warning">
                        <h5 class="modal-title" id="uyeModalLabel">Yeni Üyelik Oluştur</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label class="form-label">Ad</label>
                            <asp:TextBox ID="txtAd" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Soyad</label>
                            <asp:TextBox ID="txtSoyad" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">E-posta</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Kullanıcı Adı</label>
                            <asp:TextBox ID="txtYeniKullanici" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Şifre</label>
                            <asp:TextBox ID="txtYeniSifre" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Şifre Tekrar</label>
                            <asp:TextBox ID="txtYeniSifreTekrar" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">İptal</button>
                        <asp:Button ID="btnKaydetUye" runat="server" Text="Kaydet" CssClass="btn btn-warning" OnClick="btnKaydetUye_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
