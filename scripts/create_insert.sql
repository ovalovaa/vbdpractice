DROP DATABASE IF EXISTS store;
CREATE DATABASE IF NOT EXISTS store;
USE store;

CREATE TABLE IF NOT EXISTS categories (
  category_id INT AUTO_INCREMENT PRIMARY KEY,
  category_name VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2) CHECK (price > 0),
    quantity INT CHECK (quantity >= 0),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE IF NOT EXISTS customers (
  customer_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  email VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT,
  order_date DATE,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE IF NOT EXISTS order_items (
  item_id INT AUTO_INCREMENT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT CHECK (quantity > 0),
  price_at_purchase DECIMAL(10, 2) CHECK (price_at_purchase > 0),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO categories (category_name) VALUES
('Electronics'), ('Books'), ('Clothing');

INSERT INTO products (name, price, quantity, category_id) VALUES
('Laptop', 1000, 10, 1),
('T-Shirt', 20, 50, 3),
('Book A', 15, 30, 2),
('Book B', 25, 25, 2),
('Headphones', 50, 20, 1);

INSERT INTO customers (name, email) VALUES
('Alice', 'alice@email.com'),
('Bob', 'bob@email.com'),
('Carol', 'carol@email.com');

INSERT INTO orders (customer_id, order_date) VALUES
(1, '2024-05-01'),
(2, '2024-05-02'),
(1, '2024-05-03');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1), (1, 2, 2),
(2, 3, 1), (2, 4, 1),
(3, 5, 2), (3, 2, 1);

UPDATE order_items oi
JOIN products p ON oi.product_id = p.product_id
SET oi.price_at_purchase = p.price;
