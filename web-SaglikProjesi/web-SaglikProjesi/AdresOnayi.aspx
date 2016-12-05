<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AdresOnayi.aspx.cs" Inherits="web_SaglikProjesi.AdresOnayi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        var sayfabasligi = this.document.getElementById("baslik");
        sayfabasligi.innerText = "Adres Onayı";
    </script>
    <div style="text-align:center">
        <img src="Content/style/images/adresonay2.jpg" />
        <p style="text-align:center">Sitemizden alışveriş yapabilmeniz üye olmanız gerekmektedir. Üye değilseniz yeni üye<a href="UyeKayit.aspx"> kayıt için tıklayınız.</a></p><br />
        <table style="text-align:left; width:450px">
            <tr>
                <td><asp:Label ID="Label1" Width="120px" runat="server" Text="kullanıcı adı(email)"></asp:Label></td>
                <td><asp:TextBox ID="txtEmail" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="kullanıcı adı boş geçilemez." ControlToValidate="txtEmail" ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label2" runat="server" Text="şifre"></asp:Label></td>
                <td><asp:TextBox ID="txtSifre" runat="server" Width="300px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSifre" runat="server" ErrorMessage="şifre boş geçilemez." ControlToValidate="txtSifre" ForeColor="Red" ValidationGroup="1">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td></td>
                <td style="text-align:center"><asp:Button ID="btnGiris" CssClass="bluebutton" runat="server" Text="Giriş" Width="110px" Height="25px" OnClick="btnGiris_Click" ValidationGroup="1" /></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                </td>
            </tr>
        </table>
        <asp:CheckBox ID="cbxUnuttum" Text="Şifremi Unuttum" runat="server" AutoPostBack="True" OnCheckedChanged="cbxUnuttum_CheckedChanged" />
        <br />
        <asp:Label ID="lblMesaj" runat="server" Text="" ForeColor="Red"></asp:Label>
        <asp:Panel ID="pnlAdres" runat="server" Visible="false">
        <table style="text-align:left; width:450px">
            <tr>
                <td><asp:Label ID="Label3" Width="120px" runat="server" Text="Teslim Adresi"></asp:Label></td>
                <td><asp:TextBox ID="txtAdres" runat="server" TextMode="MultiLine" Width="300px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label4" runat="server" Text="İlçe"></asp:Label></td>
                <td><asp:TextBox ID="txtIlce" runat="server" Width="300px" ></asp:TextBox>                    
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label5" runat="server" Text="İl"></asp:Label></td>
                <td><asp:TextBox ID="txtIl" runat="server" Width="300px" ></asp:TextBox>                    
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label6" runat="server" Text="Telefon"></asp:Label></td>
                <td><asp:TextBox ID="txtTelefon" runat="server" Width="300px" ></asp:TextBox>                    
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label7" runat="server" Text="TCKimlikNo"></asp:Label></td>
                <td><asp:TextBox ID="txtTCKNo" runat="server" Width="300px" ></asp:TextBox>                    
                </td>
            </tr>
            <tr>
                <td></td>
                <td style="text-align:center"><asp:Button ID="btnAdresOnay" CssClass="bluebutton" runat="server" Text="Adres Onay" Width="110px" Height="25px" OnClick="btnAdresOnay_Click" /></td>
            </tr>
        </table>


        </asp:Panel>
    </div>
</asp:Content>
