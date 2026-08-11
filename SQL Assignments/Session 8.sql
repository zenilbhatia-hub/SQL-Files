use assignments;
-- 1.Create two tables in your SQL database: Users (user_id, username, city) and Orders (order_id, user_id, product, amount). 
-- Insert at least 3 users and 5 orders, making sure some users have no orders.

select 	u.user_id,
		u.username,
        u.city
from Users1 as u
left join Orders1 as o
on u.user_id = o.user_id
where o.order_id is null

CREATE TABLE Users1 (
    user_id INT PRIMARY KEY,
    username VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE Orders1 (
    order_id INT PRIMARY KEY,
    user_id INT,
    product VARCHAR(100),
    amount DECIMAL(10,2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

INSERT INTO Users1 (user_id, username, city)
VALUES
(1, 'Amit', 'Ahmedabad'),
(2, 'Priya', 'Surat'),
(3, 'Rahul', 'Vadodara'),
(4, 'Neha', 'Rajkot');

INSERT INTO Orders1 (order_id, user_id, product, amount)
VALUES
(101, 1, 'Laptop', 55000.00),
(102, 1, 'Mouse', 800.00),
(103, 2, 'Keyboard', 1500.00),
(104, 3, 'Monitor', 12000.00),
(105, 3, 'USB Cable', 300.00);

-- 2. Write an SQL query using INNER JOIN to list all usernames and their ordered products, 
-- showing only users who have placed at least one order.

select 	
		u.username as UserName,
        o.product as Products
from Users1 as u
inner join Orders1 as o
on u.user_id = o.user_id

-- 3. Write an SQL query using LEFT JOIN to display all usernames along with their ordered products. 
-- For users who haven't placed any orders, show NULL for the product.

select 
		username,
        product
from Users1 as u
left join Orders1 as o
on u.user_id = o.user_id

-- 4. Write an SQL query using RIGHT JOIN to show all orders and the corresponding username for each order.
-- If an order has a user_id that doesn't exist in the Users table, display NULL for the username.
-- <br><br><em><strong>Hint:</strong> Try deleting one user and keeping their order to test this case.</em>

delete from Users1
where user_id = 3

select 	u.username,
		o.order_id,
        o.product,
        o.amount
from Users1 as u
right join Orders1 as o
on u.user_id = o.user_id

-- 5.Suppose you want to analyze food delivery data like Zomato. Create a CustomerSegments table (segment_id, segment_name), 
-- and link it to Users with a foreign key. Write an SQL query to show each username, 
-- their segment name, and total order amount (use JOINs as needed). 

select 	u.username,
		cs.segment_name,
        sum(o.amount)
from Users1 as u
join CustomerSegments as cs
on u.segment_id = cs.segment_id
left join Orders1 as o
on u.user_id = o.user_id
group by u.username,
		cs.segment_name;



create table CustomerSegments(
		segment_id int primary key,
        segment_name varchar(50)
)

INSERT INTO CustomerSegments (segment_id, segment_name)
VALUES
(1, 'Premium'),
(2, 'Regular'),
(3, 'New');

ALTER TABLE Users1
ADD COLUMN segment_id INT;

update Users1
set segment_id = 1
where user_id = 1;

update Users1
set segment_id = 2
where user_id = 2;

update Users1
set segment_id = 3
where User_id = 4;

select * from Users1;
select * from CustomerSegments;
select * from Orders1;

select u.username,
		cs.segment_name,
        sum(amount) as Total_Amount
from Users1 as u
join CustomerSegments as cs
on u.segment_id = cs.segment_id
left join Orders1 as o
on o.user_id = u.user_id
group by u.username,
		segment_name
