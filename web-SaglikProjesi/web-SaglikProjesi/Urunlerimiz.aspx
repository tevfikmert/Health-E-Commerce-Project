<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Urunlerimiz.aspx.cs" Inherits="web_SaglikProjesi.Urunlerimiz" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <asp:DataList ID="dlstUrunler" runat="server" DataKeyField="urunid" RepeatColumns="3" Width="506px" OnItemCommand="dlstUrunler_ItemCommand">
        <ItemTemplate>
            <div style="text-align:center">
                <asp:Label ID="lblUrunAd" runat="server" Text='<%# Eval("urunad") %>'></asp:Label><br />
                <asp:ImageButton ID="imgResim" ImageUrl='<%# Eval("urunresimyolu1") %>' runat="server" Width="100px" Height="120px" CommandName="detay" CommandArgument='<%# Eval("urunid") %>' /><br />
                <asp:Label ID="lblUrunFiyat" runat="server" Text='<%# Eval("urunfiyat", "{0:N}") %>'></asp:Label>
                <asp:TextBox ID="txtAdet" runat="server" width="30px" Text="1" TextMode="Number"></asp:TextBox><br />
                <asp:ImageButton ID="btnSepeteAt" CommandName="sepet" CommandArgument='<%# Eval("urunid") %>' ImageUrl="/Content/style/images/btnSepeteAt.png" runat="server" />
            </div>
        </ItemTemplate>
    </asp:DataList>
</asp:Content>
