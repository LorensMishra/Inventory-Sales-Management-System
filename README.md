# Inventory & Sales Management System using MySQL

## 📌 Project Overview

The **Inventory & Sales Management System** is a database-driven project built using **MySQL**. It is designed to help small and medium-sized businesses manage their inventory, customers, suppliers, orders, and payments efficiently. This project demonstrates strong concepts of **relational database design**, **SQL querying**, and **data integrity**.

This project is suitable for:

* MCA / BCA / B.Sc. CS & IT academic projects
* SQL & Database interviews
* Portfolio demonstration on GitHub

---

## 🚀 Features

* Manage users and roles
* Store customer and supplier details
* Categorize products
* Track product inventory and stock
* Handle orders and order items
* Record payments and payment status
* Maintain data consistency using constraints

---

## 🗄️ Database Details

* **Database Name:** `inventory_sales_db`
* **Database Type:** Relational Database
* **RDBMS:** MySQL

---
<img width="143" height="119" alt="1_tables" src="https://github.com/user-attachments/assets/0a056039-9f81-406f-9a42-8ffc5f5347ef" />
---

## 📊 Database Schema (Tables)

### 1. users

Stores system user information.

* user_id (PK)
* username
* email
* role
* created_at
---
<img width="424" height="121" alt="2_describe_users_table" src="https://github.com/user-attachments/assets/36f08025-b18c-444e-a22b-45f047989dbe" />
---

### 2. customers

Stores customer details.

* customer_id (PK)
* customer_name
* phone
* email
* address
---
<img width="401" height="127" alt="3_describe_customers_table" src="https://github.com/user-attachments/assets/f91ffa95-ecba-41b1-ab54-da9743810675" />
---

### 3. suppliers

Stores supplier information.

* supplier_id (PK)
* supplier_name
* contact_number
* email

---
<img width="355" height="122" alt="4_describe_supplier_table" src="https://github.com/user-attachments/assets/8e74881e-eb3a-4d9b-a9f3-84ff3c1d7728" />
---

### 4. categories

Stores product categories.

* category_id (PK)
* category_name

---
<img width="333" height="76" alt="5_describe_category_table" src="https://github.com/user-attachments/assets/9d7842bb-e1a7-4026-9697-e50dd312586e" />
---

### 5. products

Stores product details and stock information.

* product_id (PK)
* product_name
* category_id (FK)
* supplier_id (FK)
* price
* stock_quantity

---
<img width="329" height="115" alt="5_describe_product_table" src="https://github.com/user-attachments/assets/91aef2e0-1935-4f77-b93d-824f0916ca70" />
---

### 6. orders

Stores customer orders.

* order_id (PK)
* customer_id (FK)
* order_date
* total_amount
* order_status

---
<img width="499" height="116" alt="6_describe_order_table" src="https://github.com/user-attachments/assets/ba2cc861-f9c2-4786-9bd8-cb84b51decd4" />
---

### 7. order_items

Stores products included in each order.

* order_item_id (PK)
* order_id (FK)
* product_id (FK)
* quantity
* price

---
<img width="330" height="121" alt="7_describe_order_items_table" src="https://github.com/user-attachments/assets/53afba0b-209c-49f5-994f-72cfb8af62e6" />
---

### 8. payments

Stores payment details for orders.

* payment_id (PK)
* order_id (FK)
* payment_date
* payment_method
* amount
* payment_status

---
<img width="497" height="127" alt="8_describe_paymnets_table" src="https://github.com/user-attachments/assets/a3cd82b6-0c29-4654-a9d9-d0c5d2339252" />
---


## 🧩 ER Diagram

The ER diagram represents relationships between all tables such as:

* Customers → Orders
* Orders → Order Items → Products
* Products → Categories & Suppliers
* Orders → Payments

---

## 🛠️ Technologies Used

* **Database:** MySQL
* **Tool:** MySQL Workbench
* **Language:** SQL

---

## ▶️ How to Run the Project

1. Install MySQL Server and MySQL Workbench
2. Create database:

   ```sql
   CREATE DATABASE inventory_sales_db;
   USE inventory_sales_db;
   ```
3. Run table creation SQL scripts
4. Insert sample data into tables
5. Execute queries to view results

---

## 🔍 Sample SQL Queries
---

### View all orders with customer name and order status

```sql
SELECT o.order_id, c.name AS customer_name, o.total_amount, o.order_status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;
```

---

### List all payments with order and customer details

```sql
SELECT p.payment_id, c.name AS customer_name, o.order_id, p.amount, p.payment_status, p.payment_method
FROM payments p
JOIN orders o ON p.order_id = o.order_id
JOIN customers c ON o.customer_id = c.customer_id;
```

---

### Show products that are low in stock (less than 20)

```sql
SELECT product_name, stock_quantity
FROM products
WHERE stock_quantity < 20;
```

---

### Total quantity sold per product

```sql
SELECT p.product_name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
GROUP BY p.product_name;
```

---

### List completed orders with total payment status

```sql
SELECT o.order_id, c.name AS customer_name, o.total_amount, p.payment_status
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN payments p ON o.order_id = p.order_id
WHERE o.order_status = 'Completed';
```

---

### Average order amount per customer

```sql
SELECT c.name AS customer_name, AVG(o.total_amount) AS avg_order_amount
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name;
```

---

### Count of orders per customer

```sql
SELECT c.name AS customer_name, COUNT(o.order_id) AS total_orders
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.name;
```

---

### Products never ordered

```sql
SELECT product_name
FROM products
WHERE product_id NOT IN (SELECT product_id FROM order_items);
```

---

### Total payments collected by payment method

```sql
SELECT payment_method, SUM(amount) AS total_collected
FROM payments
GROUP BY payment_method;
```

---

### Most expensive product

```sql
SELECT product_name, price
FROM products
WHERE price = (SELECT MAX(price) FROM products);
```
---

## 🧠 Advanced Concepts Used

* Primary & Foreign Keys
* Constraints (NOT NULL, DEFAULT)
* Joins (INNER JOIN)
* Aggregate Functions (SUM, COUNT)
* Subqueries
* ENUM Data Types
* Database Normalization

---

## 📁 Project Structure

```
Inventory-Sales-Management-System/
│
├── database.sql
├── insert_data.sql
├── queries.sql
└── README.md
```

---

## 💼 Use Cases

* Retail shop inventory management
* Small business sales tracking
* Academic SQL projects
* Learning relational database concepts

---

## 🎓 Learning Outcomes

* Designed a normalized relational database
* Implemented foreign key relationships
* Wrote complex SQL queries
* Understood real-world database scenarios

---

## 🔮 Future Enhancements

* Add triggers for stock updates
* Implement stored procedures
* Integrate with frontend (Java / Python / Web)
* Add user authentication

---

## 👨‍💻 Author

**Lorens Mishra**
Junior Software Engineer Trainee | SQL & MySQL | Backend & Data Enthusiast | MCA | BSc Mathematics & Computer Science

📌 *This project is created for learning, practice, and portfolio purposes.*
