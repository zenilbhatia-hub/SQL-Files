-- create database assignments;

-- use assignments;

-- create table restaurant(
-- 	Customer_id int not null,
--     Customer_Name varchar(50) not null,
--     Phone varchar(15),
--     City varchar(20)
-- );
drop table restaurant
-- insert into restaurant value
-- (1,"Ram","123456789","Vadodara"),
-- (2,"Shyam","987465632","Ahmedabad"),
-- (3, 'Rahul Mehta', '9988776655', 'Surat'),
-- (4, 'Neha Shah', '9123456789', 'Rajkot');

-- select * from restaurant;

-- CREATE TABLE zomato_reviews (
--     id INT PRIMARY KEY,
--     name VARCHAR(50) NOT NULL,
--     restaurant_name VARCHAR(100),
--     rating DECIMAL(2,1),
--     review TEXT
-- );

-- INSERT INTO zomato_reviews (id, name, restaurant_name, rating, review)
-- VALUES
-- (1, 'Amit Sharma', 'Pizza Hub', 4.5, 'Delicious pizza and quick service.'),
-- (2, 'Priya Patel', 'Burger Point', 4.0, 'Good taste and affordable price.'),
-- (3, 'Rahul Mehta', 'Spice Villa', 3.8, 'Food was good but service was slow.'),
-- (4, 'Neha Shah', 'Food Corner', 5.0, 'Excellent food and ambience.'),
-- (5, 'Karan Joshi', 'Royal Thali', 4.2, 'Authentic Gujarati thali.');

-- SELECT name, rating
-- FROM zomato_reviews;

-- CREATE TABLE movies (
--     movie_id INT PRIMARY KEY,
--     movie_name VARCHAR(100) NOT NULL,
--     release_year INT,
--     genre VARCHAR(50),
--     rating DECIMAL(2,1)
-- );

INSERT INTO movies (movie_id, movie_name, release_year, genre, rating)
VALUES
(1, '3 Idiots', 2009, 'Comedy', 4.8),
(2, 'Dangal', 2016, 'Sports', 4.9),
(3, 'KGF Chapter 1', 2018, 'Action', 4.6),
(4, 'Pushpa', 2021, 'Action', 4.5),
(5, 'RRR', 2022, 'Action', 4.7);

-- select * from movies;

-- select 
-- 	movie_name as 'Title',
--     release_year as 'Year Released'
-- from movies

CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock INT
);

INSERT INTO products (product_id, product_name, category, price, stock)
VALUES
(1, 'Laptop', 'Electronics', 55000.00, 10),
(2, 'Mouse', 'Electronics', 800.00, 50),
(3, 'Keyboard', 'Electronics', 1500.00, 30),
(4, 'Headphones', 'Accessories', 2500.00, 20),
(5, 'USB Cable', 'Accessories', 300.00, 100);

SELECT * FROM products;