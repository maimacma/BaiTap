CREATE DATABASE roblox_shop;
USE roblox_shop;

-- Bảng sản phẩm (unit, trái ác quỷ, v.v.)
CREATE TABLE products (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    product_type NVARCHAR(50) NOT NULL,   -- Unit, Devil Fruit, Roblox Account
    product_name NVARCHAR(100) NOT NULL,
    rarity NVARCHAR(50),                  -- Legendary, Mythical, Rare, etc.
    description NVARCHAR(255),
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 1,
    created_at DATETIME DEFAULT GETDATE()
);

-- Bảng tài khoản khách hàng
CREATE TABLE customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    username NVARCHAR(50) NOT NULL UNIQUE,
    email NVARCHAR(100) UNIQUE,
    password_hash NVARCHAR(255) NOT NULL,  -- Lưu hash mật khẩu, không lưu raw password
    created_at DATETIME DEFAULT GETDATE()
);

-- Bảng đơn hàng
CREATE TABLE orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT DEFAULT 1,
    total_price DECIMAL(10,2),
    status NVARCHAR(20) DEFAULT 'pending', -- pending, completed, canceled
    ordered_at DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Bảng tài khoản Roblox để bán
CREATE TABLE accounts (
    account_id INT IDENTITY(1,1) PRIMARY KEY,
    roblox_username NVARCHAR(50) NOT NULL,
    password NVARCHAR(100) NOT NULL,  -- Hoặc lưu dạng mã hóa tùy yêu cầu
    level INT,
    description NVARCHAR(255),
    price DECIMAL(10,2) NOT NULL,
    sold BIT DEFAULT 0,  -- 0: chưa bán, 1: đã bán
    created_at DATETIME DEFAULT GETDATE()
);
CREATE TABLE game (
magame int primary key,
tengame NVARCHAR(200)
);
INSERT INTO products (product_type, product_name, rarity, description, price, stock)
VALUES 
('Devil Fruit', 'Dragon Fruit', 'Legendary', 'Hóa rồng cực mạnh', 5000, 3),
('Unit', 'Goku Ultra Instinct', 'Mythical', 'Unit mạnh nhất game Anime Vanguard', 7500, 2),
('Devil Fruit', 'Magma Fruit', 'Rare', 'Trái Magma với sát thương cao', 2500, 5);
INSERT INTO accounts (roblox_username, password, level, description, price)
VALUES
('PlayerSuper1', 'password123', 500, 'Acc VIP, có nhiều item quý', 8000),
('NoobMaster69', 'hunter2', 150, 'Acc mới tập chơi nhưng có Dragon Fruit', 3000);
INSERT INTO customers (username, email, password_hash)
VALUES
('customer01', 'customer01@example.com', 'hashpassword01'),
('customer02', 'customer02@example.com', 'hashpassword02');
INSERT INTO orders (customer_id, product_id, quantity, total_price, status)
VALUES
(1, 1, 1, 5000, 'completed'),
(2, 2, 1, 7500, 'pending');

