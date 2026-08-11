use assignments;
-- 1. Write an SQL query to find all restaurants in a table called Restaurants whose names end with 'Cafe' using the LIKE operator.

-- select * from restaurants
-- where restaurant_name like '%Cafe'

-- 2.In a Flipkart-style Products table, use the BETWEEN operator to select all products with a price between 500 and 1500 rupees.

-- select * from products
-- where price between 500 and 1500

-- 3. Write an SQL query to display all users from a Users table whose city is either 'Ahmedabad', 'Surat', or 'Vadodara' using the IN operator.
-- SELECT *
-- FROM Users
-- where city in ('Ahmedabad','Surat','Vadodara');

-- 4. Given a table called Songs with columns song_name and artist_name, find all songs where the artist_name contains the letter
-- sequence 'ar' anywhere in the name using the LIKE operator.<br><br><em><strong>Hint:</strong> 
-- Use wildcards on both sides of the pattern.</em>

CREATE TABLE Songs (
    song_id INT PRIMARY KEY,
    song_name VARCHAR(100),
    artist_name VARCHAR(100)
);

INSERT INTO Songs (song_id, song_name, artist_name)
VALUES
(1, 'Kesariya', 'Arijit Singh'),
(2, 'Apna Bana Le', 'Arijit Singh'),
(3, 'Tum Hi Ho', 'Armaan Malik'),
(4, 'Levitating', 'Dua Lipa'),
(5, 'Believer', 'Imagine Dragons'),
(6, 'Raataan Lambiyan', 'Jasleen Royal');

select * from Songs
where artist_name like '%ar%'