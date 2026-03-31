<%@ Page Title="Sistem Logları" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SystemLogs.aspx.cs" Inherits="webodev3.SystemLogs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container mt-4">
        <h4 class="mb-3">Sistem Logları</h4>

        <div class="row mb-3 align-items-center">
            <div class="col-md-3">
                <label for="txtLogAdi" class="form-label">Log Adı</label>
                <asp:TextBox ID="txtLogAdi" runat="server" CssClass="form-control" placeholder="Log adı girin..."></asp:TextBox>
            </div>
            <div class="col-md-3">
                <label for="txtBaslangic" class="form-label">Başlangıç Tarihi</label>
                <asp:TextBox ID="txtBaslangic" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-3">
                <label for="txtBitis" class="form-label">Bitiş Tarihi</label>
                <asp:TextBox ID="txtBitis" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="col-md-2 mt-3">
                <asp:Button ID="btnAra" runat="server" Text="Ara" CssClass="btn btn-primary mt-3" OnClick="btnAra_Click" />
            </div>
        </div>

        <asp:GridView ID="grdLoglar" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped">
            <Columns>
                <asp:BoundField DataField="LogAdi" HeaderText="Log Adı" />
                <asp:BoundField DataField="KullaniciAdi" HeaderText="Kullanıcı Adı" />
                <asp:BoundField DataField="Tarih" HeaderText="Tarihi" />
                <asp:BoundField DataField="Turu" HeaderText="Türü" />
                <asp:BoundField DataField="IP" HeaderText="IP" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
