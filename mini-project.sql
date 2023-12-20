USE sakila;

-- 1
SELECT CONCAT(first_name, " ", last_name) AS "Actor Name"
FROM actor;
-- 2
SELECT actor_id, first_name, last_name
FROM actor
WHERE actor.first_name  LIKE "%Joe%";
-- 3
SELECT actor_id, first_name, last_name, last_update
FROM actor
WHERE actor.last_name LIKE "%GEN%";
-- 4
SELECT actor_id, first_name, last_name, last_update
FROM actor
WHERE actor.last_name LIKE "%LI%"
ORDER BY last_name, first_name;
-- 5
SELECT country_id, country
from country
WHERE country IN ('Afghanistan','Bangladesh','China');
-- 6
SELECT last_name, COUNT(*) AS actor_count
FROM actor
GROUP BY last_name 
HAVING COUNT(*) >= 2
ORDER BY actor_count DESC;
-- 7
UPDATE actor
SET first_name = 'HARPO'
WHERE first_name = 'GROUCHO' AND last_name = 'WILLIAMS';
-- CHECK
SELECT * FROM actor
WHERE first_name = 'HARPO' AND last_name = 'WILLIAMS';
-- 8
UPDATE actor
SET first_name = 'GROUCHO'
WHERE first_name = 'HARPO' AND last_name = 'WILLIAMS';
-- CHECK
SELECT * FROM actor
WHERE first_name = 'GROUCHO' AND last_name = 'WILLIAMS';
-- 9
SELECT staff.staff_id, staff.first_name, staff.last_name, SUM(payment.amount) AS 'sum(pay.amount)'
FROM staff staff
JOIN payment ON staff.staff_id = payment.staff_id
WHERE MONTH(payment.payment_date) = 8 AND YEAR(payment.payment_date) = 2005
GROUP BY staff.staff_id, staff.first_name, staff.last_name;

-- 10
SELECT film.film_id, film.title, COUNT(film_actor.actor_id) AS number_of_actors
FROM film
INNER JOIN film_actor ON film.film_id = film_actor.film_id
GROUP BY film.film_id, film.title
ORDER BY number_of_actors DESC;

-- 11
SELECT title, COUNT(*) AS number_in_inventory
FROM inventory
JOIN film ON inventory.film_id = film.film_id
WHERE film.title = 'HUNCHBACK IMPOSSIBLE';

-- 12
SELECT title
FROM film
WHERE title LIKE 'Q%' OR title LIKE 'K%'
AND language_id = (
    SELECT language_id
    FROM language
    WHERE name = 'English'
);

-- 13
-- Assuming rental table has columns: rental_id, rental_date, inventory_id, customer_id, and staff_id
INSERT INTO rental (rental_date, inventory_id, customer_id, staff_id, return_date)
VALUES (CURRENT_TIMESTAMP, 
        (SELECT inventory_id 
        FROM inventory 
        WHERE film_id = (SELECT film_id 
        FROM film 
        WHERE title = 'ACADEMY DINOSAUR') AND store_id = 1 LIMIT 1),
        (SELECT customer_id 
        FROM customer 
        WHERE first_name = 'Mary' AND last_name = 'Smith' LIMIT 1),
        (SELECT staff_id 
        FROM staff 
        WHERE first_name = 'Mike' AND last_name = 'Hillyer' LIMIT 1),
        NULL);

-- exact row
SELECT *
FROM rental
WHERE customer_id = (SELECT customer_id 
FROM customer 
WHERE first_name = 'Mary' AND last_name = 'Smith' LIMIT 1)
  AND inventory_id = (SELECT inventory_id 
  FROM inventory 
  WHERE film_id = (SELECT film_id 
  FROM film 
  WHERE title = 'ACADEMY DINOSAUR') AND store_id = 1 LIMIT 1)
  AND staff_id = (SELECT staff_id 
  FROM staff 
  WHERE first_name = 'Mike' AND last_name = 'Hillyer' LIMIT 1)
  AND rental_date = (SELECT MAX(rental_date) 
  FROM rental 
  WHERE customer_id = (SELECT customer_id 
  FROM customer 
  WHERE first_name = 'Mary' AND last_name = 'Smith' LIMIT 1));
