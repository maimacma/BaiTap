<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sanpham.aspx.cs" Inherits="BaiTap.Sanpham1" %>

<!DOCTYPE html>
<html lang="vi">
<head runat="server">
    <meta charset="utf-8" />
    <title>Chi tiết sản phẩm - ShopABC</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <style>
        /* Menu giống trang chủ */
        .navbar-nav .nav-item {
            padding: 0 10px;
        }
        .navbar-nav .active > a {
            font-weight: bold;
            color: #fff !important;
        }

        /* Breadcrumb */
        .breadcrumb {
            background: none;
            padding-left: 0;
            margin-bottom: 1rem;
        }

        /* Ảnh sản phẩm to */
        .product-img {
            width: 100%;
            max-height: 500px;
            object-fit: contain;
            border: 1px solid #dee2e6;
            border-radius: 0.25rem;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }

        /* Thông tin sản phẩm */
        .product-title {
            font-size: 2rem;
            font-weight: 700;
            margin-bottom: 15px;
        }
        .product-price {
            font-size: 1.5rem;
            color: #dc3545;
            font-weight: bold;
            margin-bottom: 15px;
        }
        .rating i {
            color: #ffc107;
            margin-right: 3px;
        }
        .btn-action {
            font-size: 1.1rem;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <!-- Header & Menu -->
        <header class="bg-info text-center py-4 mb-4">
            <h1 class="display-4 font-weight-bold text-white">ShopABC - Nơi Bán Điện Thoại Uy Tín Nhất VN</h1>
            <nav class="navbar navbar-expand-sm navbar-dark bg-dark">
                <a class="navbar-brand" href="WebForm1.aspx">SHOPABC</a>
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="WebForm1.aspx">Trang chủ</a></li>
                    <li class="nav-item active"><a class="nav-link" href="Sanpham.aspx">Sản phẩm</a></li>
                    <li class="nav-item"><a class="nav-link" href="WebForm6.aspx">Cửa hàng</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Tra cứu đơn hàng</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Giỏ hàng</a></li>
                  
                </ul>
                            <div class="d-flex align-items-center ml-auto" style="background-color:dark">
    <asp:PlaceHolder ID="phLogin" runat="server">
        <asp:LinkButton ID="lnkLogin" runat="server" CssClass="nav-link text-white" OnClick="lnkLogin_Click">Đăng nhập</asp:LinkButton>
    </asp:PlaceHolder>
    <asp:PlaceHolder ID="phLogout" runat="server" Visible="false">
        <asp:LinkButton ID="lnkLogout" runat="server" CssClass="nav-link text-white" OnClick="lnkLogout_Click">Đăng xuất</asp:LinkButton>
    </asp:PlaceHolder>
    <asp:Label ID="lblUsername" runat="server" CssClass="nav-link text-warning font-weight-bold ml-2" />
</div>
            </nav>
     
        </header>
       

        <div class="container">
           <div class="container">
    <div class="row">
        <asp:Repeater ID="rptSanPham" runat="server">
            <ItemTemplate>
                <div class="col-md-4 mb-4">
                    <div class="card h-100 shadow-sm">
                        <asp:Image ID="imgSP" runat="server" ImageUrl='<%#"../anh/"+ Eval("hinh") %>' CssClass="card-img-top" />
                        <div class="card-body">
                            <h5 class="card-title"><%# Eval("masanpham") %></h5>
                            <p class="card-text text-danger font-weight-bold">Giá: <%# Eval("dongia", "{0:N0}") %>₫</p>
                            <p class="card-text text-muted"><%# Eval("mota") %></p>
                        </div>
                        <div class="card-footer text-center">
                            <a href='<%# "Sanpham.aspx?id=" + Eval("masanpham") %>' class="btn btn-primary btn-sm">
                                <i class="fas fa-eye"></i> Xem chi tiết
                            </a>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>

        </div>

        <!-- Footer -->
        <footer class="bg-dark text-white text-center py-3 mt-5">
            <p>Địa chỉ: 123 Đường ABC, Quận XYZ, TP.HCM - Liên hệ: 0123456789</p>
            <p>&copy; 2025 ShopABC. All rights reserved.</p>
        </footer>

    </form>

    <!-- Optional: Bootstrap & jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

</body>
</html>
