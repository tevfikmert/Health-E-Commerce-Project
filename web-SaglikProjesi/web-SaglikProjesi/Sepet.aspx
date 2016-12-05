<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Sepet.aspx.cs" Inherits="web_SaglikProjesi.Sepet" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        var sayfabasligi = this.document.getElementById("baslik");
        sayfabasligi.innerText = "Sepet İşlemleri";
    </script>
    <center>
    <img src="Content/style/images/sepetonay2.jpg" /><br />
    <asp:GridView ID="gvSepet" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Width="429px" DataKeyNames="sepetID" ShowFooter="True" OnRowDeleting="gvSepet_RowDeleting">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="urunAd" HeaderText="Ürün Adı" />
            <asp:BoundField DataField="fiyat" HeaderText="Fiyat" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="adet" HeaderText="Adet" >
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="tutar" HeaderText="Tutar" >
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:CommandField ShowDeleteButton="True" DeleteText="Sil" >
            <ItemStyle ForeColor="#CC0000" HorizontalAlign="Center" Width="40px" />
            </asp:CommandField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
        <EmptyDataTemplate><h2>Sepetinizde herhangi bir ürün bulunmamaktadır.</h2></EmptyDataTemplate>
    </asp:GridView>

        <asp:Button ID="btnSepetiBosalt" CssClass="bluebutton" runat="server" Text="Sepeti Boşalt" Width="110px" Height="25px" OnClick="btnSepetiBosalt_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnDevam" CssClass="bluebutton" runat="server" Text="Alışverişe Devam" Width="110px" Height="25px" OnClick="btnDevam_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSatinAl" CssClass="bluebutton" runat="server" Text="Satın Al" Width="110px" Height="25px" OnClick="btnSatinAl_Click" />
        </center>
</asp:Content>
