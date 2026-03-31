<%@ Page Title="Ana Sayfa" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="webodev3.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<!-- Hoş geldin alanı -->
<div class="container mt-4">
    <div class="p-4 mb-4 rounded shadow-sm" 
         style="background: linear-gradient(135deg, #6366f1, #8b5cf6); color: #fff; animation: fadeIn 1s;">
        <h2 class="fw-bold mb-2">👋 Hoş geldin, 
            <span style="color: #ffeb3b;">
                <asp:Label ID="lblKullaniciAdi" runat="server" Text=""></asp:Label>
            </span>!
        </h2>
        <p class="lead mb-0 text-light">Sistemdeki güncel verileri aşağıdan görüntüleyebilirsin.</p>
    </div>
</div>

<!-- İstatistik kutuları -->
<div class="container mb-4">
    <div class="row g-3">
        <div class="col-md-4">
            <div class="card text-center border-0 shadow-sm stat-card h-100">
                <div class="card-body">
                    <i class="bi bi-box-seam display-5 text-primary"></i>
                    <h5 class="mt-3">Toplam Ürün</h5>
                    <h3 class="fw-bold text-dark">128</h3>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card text-center border-0 shadow-sm stat-card h-100">
                <div class="card-body">
                    <i class="bi bi-people-fill display-5 text-success"></i>
                    <h5 class="mt-3">Kullanıcı Sayısı</h5>
                    <h3 class="fw-bold text-dark">34</h3>
                </div>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card text-center border-0 shadow-sm stat-card h-100">
                <div class="card-body">
                    <i class="bi bi-tags-fill display-5 text-warning"></i>
                    <h5 class="mt-3">Kategoriler</h5>
                    <h3 class="fw-bold text-dark">9</h3>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Log tablosu -->
<div class="container mb-5">
    <div class="card shadow-sm border-0">
        <div class="card-header text-white fw-bold" style="background: linear-gradient(135deg, #4f46e5, #7c3aed);">
            🕒 Son İşlemler
        </div>
        <div class="card-body p-0">
            <table class="table table-hover mb-0">
                <thead class="table-light">
                    <tr>
                        <th>Tarih</th>
                        <th>Kullanıcı</th>
                        <th>İşlem</th>
                        <th>Detay</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>25.10.2025 14:22</td>
                        <td>admin</td>
                        <td>Yeni ürün eklendi</td>
                        <td>“Lenovo Laptop”</td>
                    </tr>
                    <tr>
                        <td>25.10.2025 12:15</td>
                        <td>ayse</td>
                        <td>Ürün güncellendi</td>
                        <td>“Klavye” stoğu 20 → 30</td>
                    </tr>
                    <tr>
                        <td>24.10.2025 19:40</td>
                        <td>mehmet</td>
                        <td>Kategori eklendi</td>
                        <td>“Elektronik Aksesuarlar”</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet" />

<!-- Ek stil -->
<style>
    html, body {
        height: 100%;
        margin: 0;
        padding: 0;
        background-color: #f8f9fa;
    }

    /* Sağ panelin tam alta kadar uzaması */
    .right-panel {
        min-height: 100vh !important;
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        background-color: #f1f3f5;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .stat-card {
        transition: all 0.25s ease-in-out;
    }

    .stat-card:hover {
        transform: translateY(-5px);
        box-shadow: 0 6px 15px rgba(0,0,0,0.1);
    }

    .table-hover tbody tr:hover {
        background-color: rgba(99, 102, 241, 0.1);
    }
</style>

</asp:Content>
