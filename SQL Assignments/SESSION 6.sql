-- use assignments; 

-- 1. Write an SQL query using the SUM() function to calculate the total amount spent by users on food orders in a table food_orders 
-- (columns: order_id, user_id, amount) — imagine it's like Zomato's order history.

create table food_orders(
	order_id int primary key,
    user_id int,
    amount decimal(10,2)
);

insert into food_orders (order_id,user_id,amount) values
(101,1,500.00),
(102,2,450.20),
(103,1,540.30),
(104,3,250.36),
(105,4,120.30),
(106,2,320.50);

select sum(amount) as Total_Amount
from food_orders;

-- 2. Using the COUNT() function, find out how many songs a user has added to their playlist in a table spotify_playlists 
-- (columns: playlist_id, user_id, song_id).

create table spotify_playlists(
	playlist_id int,
    user_id int,
    song_id int
);

INSERT INTO spotify_playlists (playlist_id, user_id, song_id)
VALUES
(1, 101, 1001),
(1, 101, 1002),
(1, 101, 1003),
(2, 102, 1004),
(2, 102, 1005),
(3, 103, 1006),
(3, 103, 1007),
(3, 103, 1008),
(3, 103, 1009);

select 	user_id,
		count(song_id) as Total_Songs
from spotify_playlists
group by user_id
order by Total_Songs desc;

-- 3. Write an SQL query to get the average rating given to a movie in a table bookmyshow_reviews 
-- (columns: review_id, movie_id, rating), and round the result to 1 decimal place using the ROUND() function.
-- <br><br><em><strong>Hint:</strong> Use AVG() with ROUND() to format the output.</em>

CREATE TABLE bookmyshow_reviews (
    review_id INT PRIMARY KEY,
    movie_id INT,
    rating DECIMAL(2,1)
);

INSERT INTO bookmyshow_reviews (review_id, movie_id, rating)
VALUES
(1, 101, 4.5),
(2, 101, 4.0),
(3, 101, 5.0),
(4, 102, 3.5),
(5, 102, 4.2),
(6, 103, 4.8);

select round(avg(rating),2) as Avrage_Rating
from bookmyshow_reviews;

-- 4.Find the minimum and maximum transaction values for a user from a table paytm_transactions 
-- (columns: txn_id, user_id, amount) — show both the smallest and largest transaction amounts.

create table paytm_transactions(
	txn_id int,
    user_id int,
    amount decimal(10,2)
);

INSERT INTO paytm_transactions (txn_id, user_id, amount)
VALUES
(1, 101, 250.00),
(2, 101, 1200.00),
(3, 101, 450.00),
(4, 102, 800.00),
(5, 102, 150.00),
(6, 103, 2000.00),
(7, 101, 75.00),
(8, 103, 500.00);

select 	max(amount) as Maximum_amount,
		min(amount) as Minimum_amount
from paytm_transactions;

-- 5. Given a table myntra_orders (columns: order_id, user_id, total_price),
-- write an SQL query to display the total number of orders, the average order value 
-- (rounded to 2 decimals), and the highest order value for each user_id.
-- <br><br><em><strong>Constraint:</strong> Use GROUP BY to get results per user.</em>

CREATE TABLE myntra_orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    total_price DECIMAL(10,2)
);

INSERT INTO myntra_orders (order_id, user_id, total_price)
VALUES
(1, 101, 1200.50),
(2, 101, 850.00),
(3, 101, 1500.75),
(4, 102, 2200.00),
(5, 102, 1800.50),
(6, 103, 950.00),
(7, 103, 1100.25),
(8, 103, 750.75);

select 	
		user_id,
		count(order_id) as Total_Orders,
		round(avg(total_price),2)as avrage_order_value,
        max(total_price)as Highest_order_value
from myntra_orders
group by user_id;