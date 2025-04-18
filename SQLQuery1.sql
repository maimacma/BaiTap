Create DATABASE Thang
use Thang
create table khachhang
(
 makh nvarchar(5) primary key,
 hoten nvarchar(200) not null,
 diachi nvarchar(200) not null,
 SDT nvarchar(200)
);
create table donvisanxuat
(
 madonvisanxuat nvarchar(200) PRIMARY KEY,
 tendonvisanxuat nvarchar(200) not null
)
create table hoadon
(
 mahoadon int primary key,
 makh nvarchar(5) not null,
 ngaydathang  date not null,
 ngaygiaohang  date not null,
 tongtien decimal(18,2) not null,
 ghichu nvarchar(1000) ,
 CONSTRAINT fk_hd_kh
 FOREIGN KEY (makh)
 REFERENCES khachhang  (makh)
 ON UPDATE CASCADE
 ON DELETE CASCADE
);

create table loaisanpham
(
 maloaisanpham nvarchar(200) PRIMARY KEY,
 tenloaisanpham nvarchar(200) not null
)
create table sanpham
(
 masanpham nvarchar(200)   PRIMARY KEY,
 maloaisanpham nvarchar(200) not null,
 madonvisanxuat nvarchar(200) not null,
 tensanpham nvarchar(200) not null,
 hinh nvarchar(200) not null,
 mota nvarchar(1000) not null,
 thoigianbaohanh int not null,
 dongia decimal(18,2) not null,
 quangcao bit,
 CONSTRAINT fk_sp_lsp
 FOREIGN KEY (maloaisanpham)
 REFERENCES loaisanpham (maloaisanpham)
 ON UPDATE CASCADE
 ON DELETE CASCADE,
 CONSTRAINT fk_sp_dvsx
 FOREIGN KEY (madonvisanxuat)
 REFERENCES donvisanxuat (madonvisanxuat)
 ON UPDATE CASCADE
 ON DELETE CASCADE
);
create table chitiethoadon
(
 masanpham nvarchar(200) not null,
 mahoadon int not null,
 soluong int not null,
 dongia  decimal(18,2) not null,
 thanhtien decimal(18,2) not null,
 CONSTRAINT fk_cthd_sp
 FOREIGN KEY (masanpham)
 REFERENCES sanpham (masanpham)
 ON UPDATE CASCADE
 ON DELETE CASCADE,
 CONSTRAINT fk_cthd_hd
 FOREIGN KEY (mahoadon)
 REFERENCES hoadon (mahoadon)
 ON UPDATE CASCADE
 ON DELETE CASCADE
);
create table taikhoan
(
 tendangnhap nvarchar(200) PRIMARY KEY,
 matkhau nvarchar(200) not null
)
insert into taikhoan  values
('abc','12346789'),
('abcd','12346789')
INSERT INTO loaisanpham VALUES
('001', N'Laptop'),
('002', N'Máy Tính Để Bàn'),
('003', N'Điện Thoại Di Động'),
('004', N'Linh Kiện Thay Thế');
insert into donvisanxuat values 
('abc1','donviabc'),
('abc2','donviabc1'),
('abc3','donviabc2'),
('abc4','donviabc3')
INSERT INTO khachhang VALUES 
('KH001', N'Nguyễn Văn A', N'Hà Nội, Việt Nam', '0901234567'),
('KH002', N'Trần Thị B', N'Hồ Chí Minh, Việt Nam', '0902345678'),
('KH003', N'Lê Minh C', N'Đà Nẵng, Việt Nam', '0903456789'),
('KH004', N'Phạm Thanh D', N'Hải Phòng, Việt Nam', '0904567890'),
('KH005', N'Vũ Hoàng E', N'Cần Thơ, Việt Nam', '0905678901'),
('KH006', N'Đỗ Thị F', N'Nha Trang, Việt Nam', '0906789012'),
('KH007', N'Bùi Văn G', N'Quảng Ninh, Việt Nam', '0907890123'),
('KH008', N'Ngô Thị H', N'Bình Dương, Việt Nam', '0908901234'),
('KH009', N'Hồ Minh I', N'Long An, Việt Nam', '0909012345'),
('KH010', N'Cao Thanh J', N'Vĩnh Long, Việt Nam', '0900123456');
INSERT INTO sanpham VALUES 
('SP001', '001', 'abc1', N'Dell XPS 13', 'xps13.jpg', N'Laptop Dell cao cấp, mỏng nhẹ, pin lâu', 24, 35000000.00, 1),
('SP002', '001', 'abc2', N'MacBook Pro 14', 'mac14.jpg', N'MacBook Pro màn Mini-LED, chip M1 Pro', 24, 52000000.00, 1),
('SP003', '002', 'abc3', N'PC Gaming Ryzen', 'pcgaming.jpg', N'Cấu hình mạnh mẽ cho game thủ', 18, 25000000.00, 1),
('SP004', '002', 'abc4', N'PC Văn Phòng Intel i5', 'pcvanphong.jpg', N'Thiết kế nhỏ gọn, tiết kiệm điện', 12, 12000000.00, 0),
('SP005', '003', 'abc1', N'iPhone 15 Pro Max', 'ip15promax.jpg', N'Điện thoại cao cấp Apple, camera cực đỉnh', 12, 38000000.00, 1),
('SP006', '003', 'abc2', N'Samsung Galaxy S24', 'galaxys24.jpg', N'Màn hình AMOLED 120Hz, pin 5000mAh', 12, 25000000.00, 1),
('SP007', '004', 'abc3', N'RAM DDR4 16GB', 'ram16.jpg', N'RAM tốc độ cao cho laptop/PC', 36, 1200000.00, 0),
('SP008', '004', 'abc4', N'SSD NVMe 1TB', 'ssd1tb.jpg', N'Tốc độ đọc/ghi cực nhanh, bảo hành 5 năm', 60, 2500000.00, 0);
INSERT INTO hoadon VALUES
(1, N'KH001', '2025-04-01', '2025-04-05', 35000000.00 + 52000000.00, N'Khách mua 2 sản phẩm cao cấp: Dell XPS 13 và MacBook Pro 14'),
(2, N'KH002', '2025-04-02', '2025-04-06', 25000000.00 + 12000000.00, N'Khách mua PC Gaming Ryzen và PC Văn Phòng Intel i5'),
(3, N'KH003', '2025-04-03', '2025-04-07', 38000000.00 + 25000000.00, N'Khách mua iPhone 15 Pro Max và Samsung Galaxy S24'),
(4, N'KH004', '2025-04-04', '2025-04-08', 1200000.00 + 2500000.00, N'Khách mua RAM DDR4 16GB và SSD NVMe 1TB'),
(5, N'KH005', '2025-04-05', '2025-04-09', 35000000.00, N'Khách mua Dell XPS 13'),
(6, N'KH006', '2025-04-06', '2025-04-10', 25000000.00, N'Khách mua Samsung Galaxy S24');
INSERT INTO chitiethoadon VALUES
('SP001', 1, 1, 35000000.00, 35000000.00),
('SP002', 1, 1, 52000000.00, 52000000.00),
('SP003', 2, 1, 25000000.00, 25000000.00),
('SP004', 2, 1, 12000000.00, 12000000.00),
('SP005', 3, 1, 38000000.00, 38000000.00),
('SP006', 3, 1, 25000000.00, 25000000.00),
('SP007', 4, 2, 1200000.00, 2400000.00),
('SP008', 4, 1, 2500000.00, 2500000.00),
('SP001', 5, 1, 35000000.00, 35000000.00),
('SP006', 6, 1, 25000000.00, 25000000.00);


