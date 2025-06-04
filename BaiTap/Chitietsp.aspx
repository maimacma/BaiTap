<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Chitietsp.aspx.cs" Inherits="BaiTap.Chitietsp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Chi tiết sản phẩm</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>
        .product-image {
            width: 100%;
            height: 400px;
            object-fit: contain;
            background-color: #fff;
            border-radius: 10px;
            border: 1px solid #ddd;
            padding: 10px;
        }

        .product-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            padding: 30px;
            background-color: #fdfdfd;
        }

        .price {
            font-size: 26px;
            color: #dc3545;
            font-weight: bold;
        }

        .old-price {
            font-size: 18px;
            text-decoration: line-through;
            color: #888;
            margin-left: 10px;
        }

        .btn-buy {
            font-size: 18px;
            padding: 10px 25px;
        }

        .alert-warning {
            font-size: 18px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container my-5">
           <!-- Breadcrumb -->
<nav aria-label="breadcrumb">
    <ol class="breadcrumb bg-white px-3 py-2 rounded shadow-sm">
        <li class="breadcrumb-item"><a href="Webform1.aspx">Trang chủ</a></li>
        <li class="breadcrumb-item"><a href="Sanpham.aspx">Sản phẩm</a></li>
        <li class="breadcrumb-item active" aria-current="page">
            <asp:Label ID="lblBreadcrumbTen" runat="server" />
        </li>
    </ol>
</nav>

            <asp:Panel ID="pnlChiTiet" runat="server" Visible="false">
                <div class="row justify-content-center">
                    <div class="col-lg-10">
                        <div class="card product-card">
                            <div class="row">
                            
                                <div class="col-md-6 text-center">
                                    <asp:Image ID="imgSanPham" runat="server" CssClass="product-image" />
                                </div>

                           
                                <div class="col-md-6 d-flex flex-column justify-content-center">
                                    <h2 class="text-primary font-weight-bold mb-3">
                                        <asp:Label ID="lblTenSanPham" runat="server" />
                                    </h2>

                                    <div class="mb-3">
                                        <span class="price">
                                            <asp:Label ID="lblGia" runat="server" />
                                        </span>
                                    </div>

                                    <p class="mb-4">
                                        <asp:Label ID="lblMoTa" runat="server" />
                                    </p>

                                    <asp:Button ID="btnMuaNgay" runat="server" CssClass="btn btn-danger btn-buy" Text=" Mua ngay" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
    </form>
</body>
</html>
