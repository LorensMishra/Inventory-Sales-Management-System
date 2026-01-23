-- $$$$$$$$$$$$$$$$$$$$$$$$
-- insert data into users
-- $$$$$$$$$$$$$$$$$$$$$$$$

INSERT INTO users (username, password, role) VALUES
('admin', 'admin123', 'admin'),
('staff1', 'staff123', 'staff'),
('staff2', 'staff123', 'staff');

-- $$$$$$$$$$
-- customers
-- $$$$$$$$$$

INSERT INTO customers (name, email, phone, address) VALUES
('Rahul Sharma', 'rahul@gmail.com', '9876543210', 'Delhi'),
('Priya Verma', 'priya@gmail.com', '9876501234', 'Mumbai'),
('Amit Singh', 'amit@gmail.com', '9876512345', 'Lucknow');

-- $$$$$$$$$$
-- suppliers
-- $$$$$$$$$$

INSERT INTO suppliers (supplier_name, contact_person, phone, email, address) VALUES
('ABC Traders', 'Rakesh Gupta', '9123456780', 'abc@traders.com', 'Delhi'),
('Global Supplies', 'Anil Kumar', '9234567890', 'global@supplies.com', 'Noida');

-- $$$$$$$$$$$
-- categories
-- $$$$$$$$$$$

INSERT INTO categories (category_name, description) VALUES
('Electronics', 'Electronic items'),
('Groceries', 'Daily grocery products'),
('Stationery', 'Office and school items');

-- $$$$$$$$
-- products
-- $$$$$$$$

INSERT INTO products (product_name, category_id, supplier_id, price, stock_quantity) VALUES
('Laptop', 1, 1, 55000.00, 10),
('Smartphone', 1, 2, 25000.00, 15),
('Rice 10kg', 2, 1, 600.00, 50),
('Notebook', 3, 2, 50.00, 200);

-- $$$$$$$$
-- orders
-- $$$$$$$$

INSERT INTO orders (customer_id, total_amount, order_status) VALUES
(1, 80000.00, 'Completed'),
(2, 600.00, 'Pending'),
(3, 150.00, 'Completed');

-- $$$$$$$$$$$
-- order_items
-- $$$$$$$$$$$

INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 55000.00),
(1, 2, 1, 25000.00),
(2, 3, 1, 600.00),
(3, 4, 3, 50.00);

-- $$$$$$$$
-- payments
-- $$$$$$$$

INSERT INTO payments (order_id, payment_method, amount, payment_status) VALUES
(1, 'UPI', 80000.00, 'Paid'),
(2, 'Cash', 600.00, 'Pending'),
(3, 'Card', 150.00, 'Paid');

-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$
-- Verify Data (Very Important)
-- $$$$$$$$$$$$$$$$$$$$$$$$$$$$

SELECT * FROM users;
SELECT * FROM customers;
SELECT * FROM suppliers;
SELECT * FROM categories;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;
SELECT * FROM payments;



