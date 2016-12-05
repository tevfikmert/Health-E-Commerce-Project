﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AltKategoriEkle.aspx.cs" Inherits="web_SaglikProjesi.Admin.AltKategoriEkle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <asp:Label ID="Label3" runat="server" Text="Kategori Seçiniz"></asp:Label><br />
        <asp:DropDownList ID="ddlKategoriler" runat="server" AutoPostBack="True" Height="16px" Width="171px" OnSelectedIndexChanged="ddlKategoriler_SelectedIndexChanged"></asp:DropDownList><br /><br />
        <asp:gridview runat="server" ID="gvAltKategoriler" AutoGenerateColumns="False" DataKeyNames="id" Width="445px" OnSelectedIndexChanged="gvAltKategoriler_SelectedIndexChanged">
            <Columns>
                <asp:CommandField SelectText="&gt;&gt;" ShowSelectButton="True" HeaderText="seç" >
                <ItemStyle HorizontalAlign="Center" />
                </asp:CommandField>
                <asp:BoundField DataField="altkategoriad" HeaderText="altkategori adı" >
                <ItemStyle Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="aciklama" HeaderText="açıklama" >
                <ItemStyle Width="200px" />
                </asp:BoundField>
            </Columns>
            <SelectedRowStyle BackColor="#3B8FE9" ForeColor="White" />
        </asp:gridview><br />
        <asp:LinkButton ID="lbEkle" runat="server" OnClick="lbEkle_Click">Yeni AltKategori</asp:LinkButton><br /><br />
        <asp:Panel ID="pnlEkle" runat="server" Visible="False">
            <asp:Label ID="lblMesaj" runat="server" Text="" ForeColor="Red"></asp:Label>
            <table style="width:300px">
                <tr>
                    <td style="width:200px">
                        <asp:Label ID="Label1" runat="server" Text="AltKategori" Width="140px"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtAltKategori" runat="server" Width="250px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Açıklama"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtAciklama" runat="server" Width="250px"></asp:TextBox></td>
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
