<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="UyeKayit.aspx.cs" Inherits="web_SaglikProjesi.UyeKayit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        var sayfabasligi = this.document.getElementById("baslik");
        sayfabasligi.innerText = "Üye Kayıt İşlemi";
    </script>
    <div>
            <table style="text-align:left; width:500px">
            <tr>
                <td colspan="2" style="text-align:center">
                    <asp:Label ID="lblMesaj" runat="server" Text="" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label1" Width="120px" runat="server" Text="Kullanıcı adı(email)"></asp:Label></td>
                <td><asp:TextBox ID="txtEmail" runat="server" Width="300px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="kullanıcı adı boş geçilemez." ControlToValidate="txtEmail" ForeColor="Red" >*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="mail adresi uygun formatta değil." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label2" runat="server" Text="Şifre"></asp:Label></td>
                <td><asp:TextBox ID="txtSifre" runat="server" Width="300px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSifre" runat="server" ErrorMessage="şifre boş geçilemez." ControlToValidate="txtSifre" ForeColor="Red" >*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label8" runat="server" Text="Şifre tekrar"></asp:Label></td>
                <td><asp:TextBox ID="txtSifreTekrar" runat="server" Width="300px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="şifre tekrar boş geçilemez." ControlToValidate="txtSifre" ForeColor="Red" >*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvSifreTekrar" runat="server" ControlToCompare="txtSifre" ControlToValidate="txtSifreTekrar" ErrorMessage="Şifreler aynı olmalıdır." ForeColor="Red">*</asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label9" runat="server" Text="Adı"></asp:Label></td>
                <td><asp:TextBox ID="txtAdi" runat="server" Width="300px" ></asp:TextBox>                    
                    <asp:RequiredFieldValidator ID="rfvAdi" runat="server" ErrorMessage="Adı boş geçilemez." ControlToValidate="txtAdi" ForeColor="Red" >*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label10" runat="server" Text="Soyadı"></asp:Label></td>
                <td><asp:TextBox ID="txtSoyadi" runat="server" Width="300px" ></asp:TextBox>                    
                    <asp:RequiredFieldValidator ID="rfvSoyadi" runat="server" ErrorMessage="Soyadı boş geçilemez." ControlToValidate="txtSoyadi" ForeColor="Red" >*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label7" runat="server" Text="TCKimlikNo"></asp:Label></td>
                <td><asp:TextBox ID="txtTCKNo" runat="server" Width="300px" ></asp:TextBox>                    
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="Label6" runat="server" Text="Telefon"></asp:Label></td>
                <td><asp:TextBox ID="txtTelefon" runat="server" Width="300px" ></asp:TextBox>                    
                </td>
            </tr>
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
                <td></td>
                <td>
                    <asp:CheckBox ID="cbxOkudum" runat="server" Text="Gizlilik Sözleşmesini Okudum" /></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnKayit" CssClass="bluebutton" runat="server" Text="Kayıt Ol" Width="110px" Height="25px" OnClick="btnKayit_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    <asp:Button ID="btnDevam" CssClass="bluebutton" runat="server" Text="Devam" Width="110px" Height="25px" OnClick="btnDevam_Click" Visible="False" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:TextBox ID="txtSozlesme" TextMode="MultiLine" runat="server" Text="Gizlilik Sözleşmesi : Girmiş olduğunuz kişisel bilgileriniz 3.şahıs ve kurumlarla kesinlikle paylaşılmayacaktır. Her türlü özel bilgi ve ödeme işlemleriniz 128 bit SSL güvenlik sertifikalarıyla şifrelenmektedir." ReadOnly="true" Width="295px" Height="56px"></asp:TextBox>
                </td>
            </tr>
        </table>

    </div>
</asp:Content>
