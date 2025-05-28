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
            border: 1px solid #ddd;
            padding: 10px;
            background-color: #fff;
        }
        .price {
            font-size: 24px;
            color: #dc3545;
            font-weight: bold;
        }
        .old-price {
            text-decoration: line-through;
            color: #888;
        }
        .btn-buy {
            font-size: 18px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container my-5">
            <asp:Panel ID="pnlChiTiet" runat="server" Visible="false">
                <div class="row">
                    <div class="col-md-6">
                        <asp:Image ID="imgSanPham" runat="server" CssClass="product-image" />
                    </div>
                    <div class="col-md-6">
                        <h2 class="font-weight-bold text-primary">
                            <asp:Label ID="lblTenSanPham" runat="server" />
                        </h2>
                        <p class="price">
                            <asp:Label ID="lblGia" runat="server" />
                        </p>
                        <p class="text-muted">
                            Trả góp 0% qua thẻ tín dụng kỳ hạn 3-6 tháng
                        </p>
                        <p>
                            <asp:Label ID="lblMoTa" runat="server" />
                        </p>
                        <asp:Button ID="btnMuaNgay" runat="server" CssClass="btn btn-danger btn-buy mt-3" Text="Mua ngay" />
                    </div>
                </div>
            </asp:Panel>

            <asp:Panel ID="pnlKhongTimThay" runat="server" Visible="false" CssClass="alert alert-warning">
                Không tìm thấy sản phẩm.
            </asp:Panel>
        </div>
    </form>
</body>
</html>
