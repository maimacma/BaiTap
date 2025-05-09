<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm8.aspx.cs" Inherits="BaiTap.WebForm8" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
   /* Nếu ASP.NET render theo bảng: */
.customMenu .level1 td {
    width: 200px;
    text-align: center;
}

    </style>
</head>
<body>
    <form runat="server">
<asp:Menu ID="MainMenu" runat="server" Orientation="Horizontal" CssClass="customMenu">
    <Items>
        <asp:MenuItem Text="Trang chủ" NavigateUrl="~/home.aspx"/>
        <asp:MenuItem Text="Giới thiệu" NavigateUrl="~/about.aspx" />
        <asp:MenuItem Text="Liên hệ" NavigateUrl="~/contact.aspx" />
    </Items>
</asp:Menu>
</form>

</body>
</html>
