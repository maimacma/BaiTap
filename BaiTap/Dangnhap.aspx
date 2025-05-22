<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dangnhap.aspx.cs" Inherits="BaiTap.Dangnhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Đăng nhập</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white text-center">
                        <h4>Đăng nhập</h4>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label for="txtUsername">Tên đăng nhập:</label>
                            <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />
                        </div>
                        <div class="form-group">
                            <label for="txtPassword">Mật khẩu:</label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
                        </div>
                        <asp:Button ID="btnLogin" runat="server" Text="Đăng nhập" CssClass="btn btn-primary btn-block" OnClick="btnLogin_Click" />
                        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" CssClass="d-block mt-2"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
