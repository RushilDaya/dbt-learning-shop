CREATE SCHEMA shop;
SET SCHEMA 'shop';

DROP TABLE IF EXISTS shop.raw_customers;
DROP TABLE IF EXISTS shop.raw_orders;
DROP TABLE IF EXISTS shop.raw_payments;

CREATE TABLE shop.raw_customers (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT
);

INSERT INTO shop.raw_customers (id, name, age) VALUES
(1,'Gary',21),
(2,'thomas',27),
(3,'PaUl',36);

CREATE TABLE shop.raw_orders (
    id INT PRIMARY KEY,
    customer_id INT,
    amount INT
);

INSERT INTO shop.raw_orders (id, customer_id, amount) VALUES
(1,1,100),
(2,2,50),
(3,3,100),
(4,3,20);

CREATE TABLE shop.raw_payments (
    id INT PRIMARY KEY,
    order_id INT,
    amount INT,
    type VARCHAR(100)
);

INSERT INTO shop.raw_payments (id, order_id, amount, type) VALUES
(1,1,20,'card'),
(2,1,60,'card'),
(3,1,20,'cash'),
(4,2,50,'cash'),
(5,3,50,'cash'),
(6,3,50,'card'),
(7,4,20,'bank_transfer');
