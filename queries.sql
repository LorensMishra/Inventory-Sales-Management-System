-- 🔹 BASIC SQL QUESTIONS – SOLUTIONS

-- 1. Display all customers
SELECT * FROM customers;

-- 2. Show all products with their price and stock quantity
SELECT product_name, price, stock_quantity FROM products;

-- 3. List all suppliers and their contact details
SELECT supplier_name, contact_person, phone, email FROM suppliers;

-- 4. Display all product categories
SELECT * FROM categories;

-- 5. Show all orders with their status
SELECT order_id, order_status FROM orders;

-- 6. Display all payments with payment method and status
SELECT payment_method, payment_status FROM payments;

-- 7. Find all staff users from the users table
SELECT * FROM users WHERE role = 'staff';

-- 8. Show products whose stock quantity is less than 20
SELECT * FROM products WHERE stock_quantity < 20;

-- 9. List customers from Delhi
SELECT * FROM customers WHERE address = 'Delhi';

-- 10. Display all pending orders
SELECT * FROM orders WHERE order_status = 'Pending';

--	🔹 WHERE / ORDER BY / LIMIT

-- 11. Show products priced above 1000
SELECT * FROM products WHERE price > 1000;

-- 12. List orders sorted by order date (latest first)
SELECT * FROM orders ORDER BY order_date DESC;

-- 13. Display top 3 most expensive products
SELECT * FROM products ORDER BY price DESC LIMIT 3;

-- 14. Find payments made using UPI
SELECT * FROM payments WHERE payment_method = 'UPI';

-- 15. Show completed orders only
SELECT * FROM orders WHERE order_status = 'Completed';

-- 🔹 AGGREGATE FUNCTIONS

-- 16. Count total number of customers
SELECT COUNT(*) AS total_customers FROM customers;

-- 17. Find total number of products
SELECT COUNT(*) AS total_products FROM products;

-- 18. Calculate total sales amount
SELECT SUM(amount) AS total_sales FROM payments WHERE payment_status = 'Paid';

-- 19. Find average product price
SELECT AVG(price) AS avg_price FROM products;

-- 20. Show maximum and minimum product price
SELECT MAX(price) AS max_price, MIN(price) AS min_price FROM products;

-- 🔹 GROUP BY & HAVING

-- 21. Show total sales per customer
SELECT o.customer_id, SUM(p.amount) AS total_spent
FROM orders o
JOIN payments p ON o.order_id = p.order_id
GROUP BY o.customer_id;

-- 22. Count number of orders per customer
SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id;

-- 23. Find total quantity sold for each product
SELECT product_id, SUM(quantity) AS total_sold
FROM order_items
GROUP BY product_id;

-- 24. Display total payments grouped by payment method
SELECT payment_method, SUM(amount) AS total_amount
FROM payments
GROUP BY payment_method;

-- 25. Show suppliers supplying more than 1 product
SELECT supplier_id, COUNT(product_id) AS product_count
FROM products
GROUP BY supplier_id
HAVING COUNT(product_id) > 1;

-- 🔹 JOINS (VERY IMPORTANT 🔥)

-- 26. Display customer name with their order details
SELECT c.name, o.order_id, o.total_amount, o.order_status
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id;

-- 27. Show order details along with product names
SELECT o.order_id, p.product_name, oi.quantity, oi.price
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;

-- 28. Display product name, category name, and supplier name
SELECT p.product_name, c.category_name, s.supplier_name
FROM products p
JOIN categories c ON p.category_id = c.category_id
JOIN suppliers s ON p.supplier_id = s.supplier_id;

-- 29. Show orders with their payment status
SELECT o.order_id, o.order_status, p.payment_status
FROM orders o
LEFT JOIN payments p ON o.order_id = p.order_id;

-- 30. List customers who have made payments
SELECT DISTINCT c.name
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN payments p ON o.order_id = p.order_id;

-- 🔹 SUBQUERIES

-- 31. Find customers who placed at least one order
SELECT * FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders);

-- 32. Display products that were never ordered
SELECT * FROM products
WHERE product_id NOT IN (SELECT product_id FROM order_items);

-- 33. Find the most expensive product
SELECT * FROM products
WHERE price = (SELECT MAX(price) FROM products);

-- 34. Show customers who have not made any payment
SELECT * FROM customers
WHERE customer_id NOT IN (
  SELECT o.customer_id
  FROM orders o
  JOIN payments p ON o.order_id = p.order_id
);

-- 35. Find orders with total amount greater than average order value
SELECT * FROM orders
WHERE total_amount > (SELECT AVG(total_amount) FROM orders);

-- 🔹 UPDATE & DELETE

-- 36. Update stock quantity after a sale (reduce by 1 for product_id = 1)
UPDATE products
SET stock_quantity = stock_quantity - 1
WHERE product_id = 1;

-- 37. Change order status from Pending to Completed
UPDATE orders
SET order_status = 'Completed'
WHERE order_status = 'Pending';

-- 38. Update payment status to Paid
UPDATE payments
SET payment_status = 'Paid'
WHERE payment_status = 'Pending';

-- 39. Delete cancelled orders
DELETE FROM orders WHERE order_status = 'Cancelled';

-- 40. Remove products with zero stock
DELETE FROM products WHERE stock_quantity = 0;

-- 🔹 CONCEPT / VIVA (Written Answers – say verbally)

-- 41. Why are foreign keys used?
-- To maintain referential integrity between related tables.

-- 42. What happens if you delete a customer with orders?
-- MySQL prevents deletion due to foreign key constraint.

-- 43. Difference between PRIMARY KEY and FOREIGN KEY?
-- PK uniquely identifies a record; FK links tables.

-- 44. Why ENUM is used?
-- To restrict column values and improve data consistency.

-- 45. How does normalization help?
-- It reduces data redundancy and improves consistency.

-- 46. How to calculate total order amount automatically?
-- Use SUM(quantity * price) from order_items.

-- 47. How can stock be reduced automatically?
-- By using AFTER INSERT trigger on order_items.

-- 48. Trigger to update stock quantity
CREATE TRIGGER reduce_stock
AFTER INSERT ON order_items
FOR EACH ROW
UPDATE products
SET stock_quantity = stock_quantity - NEW.quantity
WHERE product_id = NEW.product_id;

-- 49. Stored procedure to place an order (basic)
CREATE PROCEDURE place_order(IN cid INT, IN amt DECIMAL(10,2))
INSERT INTO orders (customer_id, total_amount)
VALUES (cid, amt);

-- 50. How to design a dashboard?
-- Using JOINs, GROUP BY, and aggregate queries.
