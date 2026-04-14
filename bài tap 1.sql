DROP DATABASE IF EXISTS ecommerce_db;

CREATE DATABASE ecommerce_db;
USE ecommerce_db;

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    quantity INT UNSIGNED NOT NULL DEFAULT 0,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    total_amount DECIMAL(12,2) NOT NULL CHECK (total_amount >= 0),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT UNSIGNED NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10,2) NOT NULL CHECK (unit_price >= 0),

    CONSTRAINT fk_order
        FOREIGN KEY (order_id) REFERENCES orders(order_id)
        ON DELETE CASCADE,

    CONSTRAINT fk_product
        FOREIGN KEY (product_id) REFERENCES products(product_id)
        ON DELETE CASCADE
);

INSERT INTO products (product_name, price, quantity)
VALUES 
('Áo thun', 150000.00, 100),
('Quần jeans', 350000.00, 50),
('Giày sneaker', 1200000.00, 30);

INSERT INTO orders (total_amount)
VALUES (500000.00);

INSERT INTO order_items (order_id, product_id, quantity, unit_price)
VALUES 
(1, 1, 2, 150000.00),
(1, 2, 1, 350000.00);