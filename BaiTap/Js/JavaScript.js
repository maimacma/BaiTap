var biendem = 0;
var masanpham = 0;
var hinh = 0;
var timeout;

// Chạy slideshow khi tải trang
window.onload = function () {
    if (manghinh.length > 0) {
        xoay(); // Bắt đầu hiển thị ảnh
    }
};

// Hàm thay đổi hình ảnh
function xoay() {
    if (biendem >= manghinh.length) biendem = 0;

    masanpham = biendem;
    hinh = biendem;
    document.khunghinhngang.src = "../images/" + manghinh[hinh];

    timeout = setTimeout(xoay, 3000);
    biendem++;
}

// Dừng hình khi rê chuột vào ảnh
function dunghinhlai() {
    clearTimeout(timeout);
}

// Đổi hình ngay khi rê chuột ra ngoài
function doihinhkhac() {
    clearTimeout(timeout);
    xoay();
}

// Chuyển đến trang chi tiết sản phẩm
function trangchitiet() {
    if (mangid.length > 0) {
        window.location.href = "khachhang_chitietsanpham.aspx?masanpham=" + mangid[masanpham];
    }
}
