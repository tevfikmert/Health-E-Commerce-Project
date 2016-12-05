<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="web_SaglikProjesi.Admin.Default" %>

<%@ Register Src="~/Admin/Login.ascx" TagPrefix="uc1" TagName="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="pnlLogin" runat="server">
    <uc1:Login runat="server" id="Login" />
    </asp:Panel>
</asp:Content>
