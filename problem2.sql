CREATE TABLE products (
    id SERIAL PRIMARY KEY,        -- Switching to id SERIAL as apparently PGAdmin doesn't like auto_increment
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT NOT NULL
    
);

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100)UNIQUE NOT NULL  -- Unique so people can't sign up 100 times with their ex's account and ruin their lives
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

CREATE TABLE order_items (
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO customers (first_name, last_name, email) VALUES
('Nell', 'Crain', 'nellcrain@thohh.com'), 
('Dani', 'Clayton', 'daniclayton@thobm.com'), 
('Paul', 'Hill', 'paulhill@midnightmass.com'), 
('Robert', 'Baratheon', 'robbaratheon@got.com'),
('Barney', 'Stinson', 'barnetstinson@himym.com');

INSERT INTO products (product_name, price, stock_quantity) VALUES
('Guitar', 499.99, 3),
('iPhone 16 Pro Max', 1599.99, 8),
('Monster Energy (white)', 3.99, 324),
('Sony PS5', 599.99, 11);


INSERT INTO orders (customer_id, order_date) VALUES
(1, '2023-07-21'),
(2, '2023-07-23'),
(3, '2023-07-25'),
(4, '2023-07-22'),
(5, '2023-07-26');



INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1,1,2),
(2,4,1),
(3,3,2),
(4,4,10),
(5,2,1);


SELECT 
    product_name, stock_quantity
FROM products;

SELECT 
    products.product_name, order_items.quantity
FROM order_items
JOIN products ON order_items.product_id = products.id
WHERE order_items.order_id = 1;

UPDATE products
SET stock_quantity = stock_quantity - 2
WHERE id = 5;

DELETE FROM order_items
WHERE order_id = 1;

DELETE FROM orders
WHERE id = 1;