<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Giohang.aspx.cs" Inherits="BaiTap.Giohang" %>

<!DOCTYPE html>
<html lang="vi">
<head runat="server">
    <meta charset="utf-8" />
    <title>Giỏ hàng - ShopABC</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
</head>
<body>
    <form id="form1" runat="server">
<asp:Label ID="lblThongBao" runat="server" CssClass="text-success font-weight-bold mt-3" />
        <header class="bg-info text-center py-4 mb-4">
            <h1 class="display-4 font-weight-bold text-white">ShopABC - Nơi Bán Điện Thoại Uy Tín Nhất VN</h1>
            <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
                <a class="navbar-brand" href="WebForm1.aspx">SHOPABC</a>
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="WebForm1.aspx">Trang chủ</a></li>
                    <li class="nav-item"><a class="nav-link" href="Sanpham.aspx">Sản phẩm</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Liên Hệ</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Tra cứu đơn hàng</a></li>
                    <li class="nav-item active"><a class="nav-link" href="Giohang.aspx">Giỏ hàng</a></li>
                </ul>
                <div class="d-flex align-items-center ml-auto" style="background-color:none;">
                    <asp:PlaceHolder ID="phLogin" runat="server">
                        <asp:LinkButton ID="lnkLogin" runat="server" CssClass="nav-link text-white" OnClick="lnkLogin_Click">Đăng nhập</asp:LinkButton>
                    </asp:PlaceHolder>
                    <asp:PlaceHolder ID="phLogout" runat="server" Visible="false">
                        <asp:LinkButton ID="lnkLogout" runat="server" 
                            CssClass="nav-link text-white" OnClick="lnkLogout_Click" Style="">Đăng xuất</asp:LinkButton>
                    </asp:PlaceHolder>
                    <asp:Label ID="lblUsername" runat="server" CssClass="nav-link text-warning font-weight-bold ml-2" />
                </div>
            </nav>
        </header>

        <!-- Nội dung giỏ hàng -->
        <div class="container mb-5">
            <h2 class="mb-4">Giỏ hàng của bạn</h2>
           <asp:GridView ID="gvGioHang" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered"
               OnRowCommand="gvGioHang_RowCommand" DataKeyNames="masanpham">

                <Columns>
                    <asp:BoundField DataField="tensanpham" HeaderText="Tên sản phẩm" />
                    <asp:BoundField DataField="dongia" HeaderText="Đơn giá" DataFormatString="{0:N0}₫" />
                    <asp:TemplateField HeaderText="Số lượng">
                        <ItemTemplate>
                            <asp:TextBox ID="txtSoLuong" runat="server" Text='<%# Eval("soluong") %>'
                                CssClass="form-control" Width="60px"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Thành tiền">
                        <ItemTemplate>
                            <%# Convert.ToDecimal(Eval("dongia")) * Convert.ToInt32(Eval("soluong")) %> ₫
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Hành động">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnCapNhat" runat="server" CommandName="CapNhat" CommandArgument='<%# Eval("masanpham") %>' CssClass="btn btn-sm btn-warning">Cập nhật</asp:LinkButton>
                            <asp:LinkButton ID="btnXoa" runat="server" CommandName="Xoa" CommandArgument='<%# Eval("masanpham") %>' CssClass="btn btn-sm btn-danger ml-2">Xoá</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <div class="text-right mt-4">
                <h4>Tổng tiền: <asp:Label ID="lblTongTien" runat="server" CssClass="text-danger font-weight-bold" /></h4>
                <asp:Button ID="btnThanhToan" runat="server" Text="Thanh toán" CssClass="btn btn-success mt-3" OnClick="btnThanhToan_Click" />
            </div>
        </div>

        <!-- Footer -->
        <footer class="bg-dark text-white text-center py-3">
            <p>Địa chỉ: 123 Đường ABC, Quận XYZ, TP.HCM - Liên hệ: 0123456789</p>
            <p>&copy; 2025 ShopABC. All rights reserved.</p>
        </footer>
    </form>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>
</body>
</html>