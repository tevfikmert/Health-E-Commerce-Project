<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="web_SaglikProjesi.Admin.Login" %>
<link href="../Content/style/style.css" rel="stylesheet" />
<div style="width:400px; height:200px; border:1px solid navy; border-radius:15px; box-shadow:black 10px 10px">
    <table style="text-align:center; width:400px; font-family:Verdana; font-size:small">
        <tr>
            <td></td>
            <td style="height:40px"><h4>Admin Girişi</h4></td>
        </tr>
        <tr>
            <td style="width:80px">
                <asp:Label ID="Label1" runat="server" Text="username"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtUsername" runat="server" Width="250px" Height="30px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Kullanıcı adı boş geçilemez." ForeColor="Red" ValidationGroup="2">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width:80px">
                <asp:Label ID="Label2" runat="server" Text="password"></asp:Label></td>
            <td>
                <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" Width="250px" Height="30px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Şifre adı boş geçilemez." ForeColor="Red" ValidationGroup="2">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="btnLogin" runat="server" Text="login" CssClass="bluebutton" Height="25px" Width="150px" ValidationGroup="2" OnClick="btnLogin_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblMesaj" runat="server" Text="" ForeColor="Red"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="2" />
            </td>
        </tr>
    </table>
</div>
