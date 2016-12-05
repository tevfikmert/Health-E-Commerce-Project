<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Odeme.aspx.cs" Inherits="web_SaglikProjesi.Odeme" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 146px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align:center">
        <img src="Content/style/images/odeme2.jpg" /><br /><br />
        <table style="text-align:left; width:350px">
            <tr>
                <td class="auto-style1"><asp:Label ID="Label1" Width="60px" runat="server" Text="Adı"></asp:Label></td>
                <td><asp:Label ID="lblAdi" Width="188px" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style1"><asp:Label ID="Label2" Width="60px" runat="server" Text="Soyadı"></asp:Label></td>
                <td><asp:Label ID="lblSoyadi" Width="188px" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style1"><asp:Label ID="Label3" Width="133px" runat="server" Text="Toplam Tutar"></asp:Label></td>
                <td><asp:Label ID="lblTutar" Width="186px" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td style="text-align:center" class="auto-style1"><asp:Button ID="btnKrediKarti" CssClass="bluebutton" runat="server" Text="Kredi Kartı" Width="110px" Height="25px" /></td>
                <td style="text-align:center"><asp:Button ID="btnHavaleEFT" CssClass="bluebutton" runat="server" Text="Havale/EFT" Width="110px" Height="25px" OnClick="btnHavaleEFT_Click" /></td>
            </tr>
        </table>
        <asp:Panel ID="pnlHavaleEFT" runat="server" Visible="false">
        <table style="text-align:left; width:350px">
            <tr>
                <td class="auto-style1"><asp:Label ID="Label4" Width="112px" runat="server" Text="Firma Ünvan"></asp:Label></td>
                <td><asp:Label ID="Label5" Width="188px" runat="server" Text="ERP-6 Sağlık Ürünleri Ltd.Şti."></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style1"><asp:Label ID="Label6" Width="60px" runat="server" Text="Banka"></asp:Label></td>
                <td><asp:Label ID="Label7" Width="188px" runat="server" Text="PakBank"></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style1"><asp:Label ID="Label8" Width="133px" runat="server" Text="Şube"></asp:Label></td>
                <td><asp:Label ID="Label9" Width="186px" runat="server" Text="Beşiktaş-Barbaros"></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style1"><asp:Label ID="Label10" Width="60px" runat="server" Text="Hesap No"></asp:Label></td>
                <td><asp:Label ID="Label11" Width="188px" runat="server" Text="4265426"></asp:Label></td>
            </tr>
            <tr>
                <td class="auto-style1"><asp:Label ID="Label12" Width="133px" runat="server" Text="IBANNO"></asp:Label></td>
                <td><asp:Label ID="Label13" Width="186px" runat="server" Text="TR12 4234 4534 3533 8574 26"></asp:Label></td>
            </tr>
            <tr>
                <td style="text-align:center" class="auto-style1"><asp:Button ID="btnDevam" CssClass="bluebutton" runat="server" Text="Alışverişe Devam" Width="110px" Height="25px" OnClick="btnDevam_Click" /></td>
                <td style="text-align:center"><asp:Button ID="btnCikis" CssClass="bluebutton" runat="server" Text="Güvenli Çıkış" Width="110px" Height="25px" OnClick="btnCikis_Click" /></td>
            </tr>
        </table>
        </asp:Panel>
    </div>
</asp:Content>
