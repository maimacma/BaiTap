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
                    <li class="nav-item active"><a class="nav-link" href="WebForm6.aspx">Sản phẩm</a></li>
                    <li class="nav-item"><a class="nav-link" href="WebForm6.aspx">Cửa hàng</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Tra cứu đơn hàng</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Giỏ hàng</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Đăng nhập</a></li>
                </ul>
            </nav>
        </header>
       

        <!-- Nội dung chi tiết sản phẩm -->
        <div class="container">
            <asp:Image ID="imgSanPham" runat="server" CssClass="product-img" />

            <h3 class="product-title">
                <asp:Label ID="lblTenSanPham" runat="server" />
            </h3>

            <div class="product-price">
                <asp:Label ID="lblGia" runat="server" />
            </div>

            <div class="rating mb-3">
                <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                <i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i>
            </div>

            <div class="mb-4">
                <asp:Label ID="lblMoTa" runat="server" CssClass="text-muted" />
            </div>

            <div>
                <button type="button" class="btn btn-primary btn-action mr-2">
                    <i class="fas fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                <button type="button" class="btn btn-outline-danger btn-action">
                    <i class="fas fa-heart"></i> Yêu thích
                </button>
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
