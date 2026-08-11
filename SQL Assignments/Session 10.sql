-- 1. Create two tables: AppOrders (for orders placed via a food delivery app like Zomato) 
-- and InStoreOrders (for direct restaurant orders),
--  each with columns: order_id, customer_name, amount, and order_date. Insert at least 3 sample records into each table.

create table AppOrders(
		order_id int auto_increment primary key,
        customer_name varchar(50),
        amount int,
        order_date date
);
insert into AppOrders(customer_name,amount,order_date) values
('Amit',550.00,'2026-08-01'),
('Priya',720.00,'2026-08-02'),
('Rahul',450.00,'2026-08-03');

select * from AppOrders;

-- 2. Write a SQL query using UNION to combine all unique customer names from both AppOrders and InStoreOrders tables into a single list.
CREATE TABLE InStoreOrders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO InStoreOrders (order_id, customer_name, amount, order_date)
VALUES
(201, 'Neha', 600.00, '2026-08-01'),
(202, 'Karan', 850.00, '2026-08-02'),
(203, 'Pooja', 400.00, '2026-08-04');

SELECT customer_name
FROM AppOrders

UNION

SELECT customer_name
FROM InStoreOrders;

-- 3. Write a SQL query using UNION ALL to display every order (including duplicates if any)
--  from both AppOrders and InStoreOrders, showing order_id, customer_name, amount, and order_date.

SELECT order_id, 
		customer_name, 
        amount, 
        order_date
FROM AppOrders

UNION all

SELECT order_id, 
		customer_name, 
        amount, 
        order_date
FROM InStoreOrders;

-- 4.Demonstrate the difference between UNION and UNION ALL by adding a duplicate customer_name in both tables, then running both queries and noting the difference in the result count.<br><br><em><strong>Hint:</strong> UNION removes duplicates, UNION ALL does not.</em>

CREATE TABLE InStoreOrders1 (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO InStoreOrders1 (order_id, customer_name, amount, order_date)
VALUES
(201, 'Amit', 600.00, '2026-08-01'),
(202, 'Rahul', 850.00, '2026-08-02'),
(203, 'Pooja', 400.00, '2026-08-04');

select 
		customer_name
from AppOrders

union

select customer_name
from InStoreOrders1;
        
select 
		customer_name
from AppOrders

union all

select customer_name
from InStoreOrders1;