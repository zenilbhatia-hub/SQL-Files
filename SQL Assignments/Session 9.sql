-- 1. Create two tables, influencers and brands, with at least 3 sample rows each. 
-- Use a FULL OUTER JOIN to list all influencers and brands, showing influencer_name and brand_name, matching on city. 
-- If there is no match, display NULL for the missing side.<br><br><em><strong>Hint:</strong> 
-- Use LEFT JOIN, RIGHT JOIN, and UNION if your SQL dialect does not support FULL OUTER JOIN directly.</em>

select i.influencer_name,
		b.brand_name
from influencers as i
left join brands as b
on i.city = b.city

union

select i.influencer_name,
		b.brand_name
from influencers as i
right join brands as b
on i.city = b.city;

create table influencers(
		influencer_id int primary key,
		influencer_name varchar(50),
        City varchar(50)
);

create table brands(
		brand_id int primary key,
        brand_name varchar(50),
        City varchar(50)
);

INSERT INTO influencers (influencer_id, influencer_name, city)
VALUES
(1, 'Rahul', 'Ahmedabad'),
(2, 'Priya', 'Surat'),
(3, 'Amit', 'Vadodara');

INSERT INTO brands (brand_id, brand_name, City)
VALUES
(101, 'Nike', 'Ahmedabad'),
(102, 'Puma', 'Mumbai'),
(103, 'Adidas', 'Vadodara');

-- 2. Given a table called playlists with columns (id, playlist_name, parent_playlist_id), 
-- write a SELF JOIN query to display each playlist alongside its parent playlist's name, similar to how Spotify might nest playlists.

CREATE TABLE playlists (
    id INT PRIMARY KEY,
    playlist_name VARCHAR(100),
    parent_playlist_id INT
);

INSERT INTO playlists (id, playlist_name, parent_playlist_id)
VALUES
(1, 'My Music', NULL),
(2, 'Bollywood', 1),
(3, 'English Songs', 1),
(4, 'Arijit Singh', 2),
(5, 'Party Songs', 1);

select p.playlist_name as playlist,
		pa.playlist_name as parent_playlist
from playlists as p
left join playlists as pa
on p.parent_playlist_id = pa.id;

-- 3. Create two tables: users and offers. Write a CROSS JOIN query to generate all possible combinations of users and offers, displaying user_name and offer_title.
-- Explain in a comment how this could be used for a Flipkart-style personalized offer campaign.

CREATE TABLE users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(50)
);
select * from users;
select * from users1;

INSERT INTO users (user_id, user_name)
VALUES
(1, 'Rahul'),
(2, 'Priya'),
(3, 'Amit');

CREATE TABLE offers (
    offer_id INT PRIMARY KEY,
    offer_title VARCHAR(100)
);

INSERT INTO offers (offer_id, offer_title)
VALUES
(101, '10% Off on Mobiles'),
(102, 'Buy 1 Get 1 on Fashion'),
(103, 'Free Delivery on Orders Above 499');

select u.user_name,
		o.offer_title
from users as u
cross join offers as o;

-- 4. You have an employees table with columns (id, name, manager_id). 
-- Write a SELF JOIN to display each employee's name along with their manager's name. 
-- Then, modify your query to only show employees who do not have a manager (i.e., top-level managers).

CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees (id, name, manager_id)
VALUES
(1, 'Raj', NULL),
(2, 'Amit', 1),
(3, 'Priya', 1),
(4, 'Rahul', 2),
(5, 'Neha', 2),
(6, 'Karan', NULL); 

select 
	e.name AS employee,
	m.name AS manager
from employees as e
left join employees as m
	ON e.manager_id = m.id
where e.manager_id is null;

-- 5. Use ChatGPT or Copilot to help you write a SQL query that finds all pairs of users from a users table who live in the same city
-- (excluding pairs where the user is compared with themselves). 
-- Paste the query and briefly describe how the AI helped you improve or debug it.

select u1.user_name,
		u2.user_name,
        u1.city
from users as u1
join users as u2
	on u1.city = u2.city
	AND u1.user_id < u2.user_id;


select u1.user_name,
		u2.user_name,
        u1.city
from users as u1
join users as u2
	on u1.city = u2.city
    and u1.user_id < u2.user_id