use assignments;
-- 1. Write an SQL query to select all restaurants from a table named 'restaurants' where the rating is greater than or equal to 4.5

CREATE TABLE Restaurants (
    restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    city VARCHAR(50),
    cuisine VARCHAR(50),
    rating DECIMAL(2,1)
);

INSERT INTO Restaurants (restaurant_id, restaurant_name, city, cuisine, rating)
VALUES
(1, 'Green Cafe', 'Ahmedabad', 'Cafe', 4.6),
(2, 'Royal Kitchen', 'Vadodara', 'Indian', 4.4),
(3, 'Moon Cafe', 'Surat', 'Cafe', 4.8),
(4, 'Food Corner', 'Rajkot', 'Fast Food', 4.2),
(5, 'Sunrise Cafe', 'Anand', 'Cafe', 4.5);

	select *
	from restaurants
	where rating >= 4.5

-- 2. In a table called 'movies', filter and display only the movies released after 2020 and with genre 'Action' using the WHERE clause and AND operator.

-- SELECT *
-- FROM movies
-- WHERE release_year > 2020
-- AND genre = 'Action';

-- 3. Given a table 'products' with columns (id, name, price, category), 
-- write a query to find all products not in the 'Electronics' category or with a price less than 500.

-- select * from products
-- where category != 'Electronics'
-- or price < 500

-- task 4 Write an SQL query for a table 'users' to show all users who are NOT from 'Ahmedabad' 
-- and have more than 1000 followers.<br><br><em><strong>Hint:</strong> Use the NOT operator combined with AND.</em>

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50),
    city VARCHAR(50),
    followers INT
);

INSERT INTO users (user_id, user_name, city, followers)
VALUES
(1, 'Amit', 'Ahmedabad', 1500),
(2, 'Priya', 'Surat', 2500),
(3, 'Rahul', 'Vadodara', 800),
(4, 'Neha', 'Rajkot', 1800),
(5, 'Karan', 'Ahmedabad', 900),
(6, 'Pooja', 'Anand', 1200);

select * from users
where city != 'Ahmedabad'
and followers > 1000;
