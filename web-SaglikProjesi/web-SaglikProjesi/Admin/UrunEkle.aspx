<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="UrunEkle.aspx.cs" Inherits="web_SaglikProjesi.Admin.UrunEkle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="Label3" runat="server" Text="Kategori Seçiniz"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Text="AltKategori Seçiniz"></asp:Label><br />
        <asp:DropDownList ID="ddlKategoriler" runat="server" AutoPostBack="True" Height="16px" Width="137px" OnSelectedIndexChanged="ddlKategoriler_SelectedIndexChanged"></asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlAltKategoriler" runat="server" AutoPostBack="True" Height="16px" Width="137px" OnSelectedIndexChanged="ddlAltKategoriler_SelectedIndexChanged"></asp:DropDownList>
        <br /><br />
        <asp:gridview runat="server" ID="gvUrunler" AutoGenerateColumns="False" DataKeyNames="urunid" Width="506px" OnSelectedIndexChanged="gvAltKategoriler_SelectedIndexChanged">
            <Columns>
                <asp:CommandField SelectText="&gt;&gt;" ShowSelectButton="True" HeaderText="seç" >
                <ItemStyle HorizontalAlign="Center" Width="20px" />
                </asp:CommandField>
                <asp:BoundField DataField="urunkodu" HeaderText="ürünkodu" >
                <ItemStyle Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="urunad" HeaderText="ürünadı" >
                <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="miktar" HeaderText="miktar" />
                <asp:BoundField DataField="urunfiyat" HeaderText="fiyat" />
            </Columns>
            <SelectedRowStyle BackColor="#3B8FE9" ForeColor="White" />
        </asp:gridview><br />
        <asp:LinkButton ID="lbEkle" runat="server" OnClick="lbEkle_Click">Yeni Ürün Ekle</asp:LinkButton><br /><br />
        <asp:Panel ID="pnlEkle" runat="server" Visible="False">
            <asp:Label ID="lblMesaj" runat="server" Text="" ForeColor="Red"></asp:Label>
            <table style="width:300px">
                <tr>
                    <td style="width:200px">
                        <asp:Label ID="Label1" runat="server" Text="Ürün Kodu" Width="140px"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtUrunKodu" runat="server" Width="250px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Ürün Adı"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtUrunAdi" runat="server" Width="250px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td style="width:200px">
                        <asp:Label ID="Label5" runat="server" Text="Ürün Bilgisi" Width="140px"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtUrunBilgisi" TextMode="MultiLine" runat="server" Width="250px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text="Miktar"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtMiktar" runat="server" Width="250px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Text="Fiyat"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtFiyat" runat="server" Width="250px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Text="Küçük Resim"></asp:Label></td>
                    <td>
                        <asp:FileUpload ID="fuKucukResim" runat="server" />    
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label9" runat="server" Text="Büyük Resim"></asp:Label></td>
                    <td>
                        <asp:FileUpload ID="fuBuyukResim" runat="server" />    
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="btnKaydet" runat="server" Text="Kaydet" CssClass="bluebutton" Width="80px" OnClick="btnKaydet_Click" /></td>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                        <asp:Button ID="btnDegistir" runat="server" CssClass="bluebutton" Text="Değiştir" Width="80px" OnClick="btnDegistir_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                        <asp:Button ID="btnSil" runat="server" Text="Sil" CssClass="bluebutton" Width="80px" OnClick="btnSil_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>

</asp:Content>
