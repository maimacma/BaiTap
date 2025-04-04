<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm8.aspx.cs" Inherits="BaiTap.WebForm8" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 61px;
        }
    </style>
</head>
<body>
   
            <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

<h3 runat="server"><%= isEdit ? "CẬP NHẬT LOẠI SẢN PHẨM" : "THÊM MỚI LOẠI SẢN PHẨM" %></h3>

<form method="post" runat="server">
    <table>
        <tr>
            <td>Mã loại:</td>
            <td><asp:TextBox ID="txtMaLoai" runat="server" ReadOnly="True"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Tên loại:</td>
            <td><asp:TextBox ID="txtTenLoai" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="btnLuu" runat="server" Text="Lưu" OnClick="btnLuu_Click" />
            </td>
        </tr>
    </table>
</form>

<hr />

<table border="1" cellpadding="5" >
    <tr>
        <th class="auto-style1">Mã loại</th>
        <th>Tên loại</th>
        <th colspan="2">Hành động</th>
    </tr>
    <%
      if (DataTable_select_loaisanpham != null)
        {
            for (int i = 0; i < DataTable_select_loaisanpham.Rows.Count; i++) 
            { %>
        <tr>
            <td class="auto-style1"><%= DataTable_select_loaisanpham.Rows[i]["maloaisanpham"] %></td>
            <td><%= DataTable_select_loaisanpham.Rows[i]["tenloaisanpham"] %></td>
            <td><a href="cuahang_loaisanpham.aspx?editID=<%= DataTable_select_loaisanpham.Rows[i]["maloaisanpham"] %>">Sửa</a></td>
            <td><a href="cuahang_loaisanpham.aspx?deleteID=<%= DataTable_select_loaisanpham.Rows[i]["maloaisanpham"] %>" onclick="return confirm('Xác nhận xoá?')">Xoá</a></td>
        </tr>
    <% 
            }
        }  %>
</table>

</body>
</html>
