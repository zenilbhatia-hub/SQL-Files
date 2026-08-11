use assignments;
-- 1. Write an SQL query to display the total number of orders placed by each user in a 'food_orders' table, grouped by user_id.

select 	user_id,
		count(order_id) as Total_Orders
from food_orders
group by user_id;

-- 2. Using a 'transactions' table with columns (transaction_id, user_id, amount, payment_method), 
-- write an SQL query to show the total amount spent by each payment_method.

create table transactions(
	transaction_id int primary key,
    user_id int,
    amount decimal(10,2),
    payment_method varchar (50)
);

INSERT INTO transactions (transaction_id, user_id, amount, payment_method)
VALUES
(1, 101, 250.00, 'UPI'),
(2, 102, 500.00, 'Credit Card'),
(3, 103, 300.00, 'UPI'),
(4, 104, 750.00, 'Debit Card'),
(5, 105, 450.00, 'Credit Card'),
(6, 106, 200.00, 'Cash'),
(7, 107, 350.00, 'UPI'),
(8, 108, 600.00, 'Cash');

select 	payment_method,
		sum(amount) as Total_Amounts
from transactions
group by payment_method;

-- 3.Given a 'movies' table with columns (movie_id, genre, box_office_collection),
--  write an SQL query to display each genre and its total box_office_collection,
--  but only show genres where the total collection is above 10 crore.
-- <br><br><em><strong>Hint:</strong> Use GROUP BY and HAVING together to filter the aggregated results.</em>

alter table movies
add column box_office_collection varchar (50);

update movies
set box_office_collection = 202.00
where movie_id = 1;

update movies
set box_office_collection = 387.00
where movie_id = 2;

update movies
set box_office_collection = 250.00
where movie_id = 3;

update movies
set box_office_collection = 365.00
where movie_id = 4;

update movies
set box_office_collection = 1200.00
where movie_id = 5;

select 	genre,
		sum(box_office_collection) as Total_Collection
from movies
group by genre
having sum(box_office_collection) > 10

-- 4. Suppose you have a 'playlist' table with columns (playlist_id, user_id, song_id, duration).
-- Write an SQL query to find users who have created playlists with a combined song duration of more than 2 hours (7200 seconds), 
-- showing user_id and total duration.

select 	user_id,
		sum(duration) as Total_Duration
from spotify_playlists
group by user_id
having sum(duration) > 7200

alter table spotify_playlists
add column duration int

update spotify_playlists
set duration = 1800
WHERE playlist_id = 1 AND song_id = 1001;

UPDATE spotify_playlists
SET duration = 2500
WHERE playlist_id = 1 AND song_id = 1002;

UPDATE spotify_playlists
SET duration = 3200
WHERE playlist_id = 1 AND song_id = 1003;

UPDATE spotify_playlists
SET duration = 1500
WHERE playlist_id = 2 AND song_id = 1004;

UPDATE spotify_playlists
SET duration = 2000
WHERE playlist_id = 2 AND song_id = 1005;

UPDATE spotify_playlists
SET duration = 4000
WHERE playlist_id = 3 AND song_id = 1006;

UPDATE spotify_playlists
SET duration = 3500
WHERE playlist_id = 3 AND song_id = 1007;

UPDATE spotify_playlists
SET duration = 1000
WHERE playlist_id = 3 AND song_id = 1008;

UPDATE spotify_playlists
SET duration = 900
WHERE playlist_id = 3 AND song_id = 1009;

