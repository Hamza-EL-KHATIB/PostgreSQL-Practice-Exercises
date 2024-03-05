-- List all movies in the ‘Action’ category.
SELECT f.title AS movies
FROM film AS f
         JOIN film_category fc on f.film_id = fc.film_id
         JOIN category c on c.category_id = fc.category_id
WHERE c.name = 'Action';

-- Find all customers who have spent more than $100.
SELECT concat(c.first_name, ' ', c.last_name) AS name
FROM customer AS c
         JOIN payment AS p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
HAVING SUM(p.amount) > 100;

-- Find all movies that actor 'Kevin Bloom' has acted in.
SELECT f.title
FROM film f
         INNER JOIN film_actor fa on f.film_id = fa.film_id
         INNER JOIN actor a on a.actor_id = fa.actor_id
WHERE a.first_name = 'Kevin'
  AND a.last_name = 'Bloom';;

-- List all the actors who have appeared in more than 20 movies.
SELECT a.first_name, a.last_name, COUNT(fa.film_id) as film_count
FROM actor a
         INNER JOIN film_actor fa on a.actor_id = fa.actor_id
GROUP BY a.actor_id
HAVING COUNT(fa.film_id) > 20;;

-- List all the customers who have rented a movie more than once in a single day.
SELECT first_name, last_name, COUNT(r.rental_id)
FROM customer AS c
         INNER JOIN rental AS r ON r.customer_id = c.customer_id
GROUP BY c.customer_id, r.rental_date
HAVING COUNT(rental_date) > 1;

-- List all the movies that have not been rented yet.
SELECT f.title
FROM film f
         LEFT JOIN inventory i ON f.film_id = i.film_id
         LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_date IS NULL;;

-- List all the customers who have rented a movie in the ‘Action’ category but not in the ‘Comedy’ category.
SELECT c.first_name, c.last_name
FROM customer c
         JOIN rental r ON c.customer_id = r.customer_id
         JOIN inventory i ON r.inventory_id = i.inventory_id
         JOIN film f ON f.film_id = i.film_id
         JOIN film_category fc ON f.film_id = fc.film_id
         JOIN category ca ON ca.category_id = fc.category_id
WHERE ca.name = 'Action'
  AND c.customer_id NOT IN (SELECT c2.customer_id
                            FROM customer c2
                                     JOIN rental r2 ON c2.customer_id = r2.customer_id
                                     JOIN inventory i2 ON r2.inventory_id = i2.inventory_id
                                     JOIN film f2 ON f2.film_id = i2.film_id
                                     JOIN film_category fc2 ON f2.film_id = fc2.film_id
                                     JOIN category ca2 ON ca2.category_id = fc2.category_id
                            WHERE ca2.name = 'Comedy')
GROUP BY c.customer_id;

-- List all the movies that have been rented more than 50 times.
SELECT f.title
FROM film AS f
         JOIN inventory i on f.film_id = i.film_id
         JOIN rental AS r ON i.inventory_id = r.inventory_id
GROUP BY f.title
HAVING count(rental_id) > 50;

-- List all the movies that have been rented by a customer who has a first name starting with ‘J’.
SELECT f.title
FROM film AS f
         JOIN inventory AS i ON f.film_id = i.film_id
         JOIN rental AS r ON i.inventory_id = r.inventory_id
         JOIN customer AS c ON r.customer_id = c.customer_id
WHERE c.first_name LIKE 'J%'
GROUP BY f.title;

-- List all the movies that have been rented more than once by the same customer.
SELECT f.title
FROM film f
         JOIN inventory i ON f.film_id = i.film_id
         JOIN rental r ON i.inventory_id = r.inventory_id
         JOIN customer c ON r.customer_id = c.customer_id
GROUP BY f.title, c.customer_id
HAVING COUNT(r.rental_id) > 1;

-- List all the movies that were released in 2006.
SELECT f.title
FROM film f
WHERE f.release_year = 2006;

-- Find all movies that are longer than 2 hours.
SELECT f.title
FROM film f
WHERE f.length > 120;

-- Find all movies that are rated ‘PG-13’.
SELECT f.title
FROM film f
WHERE f.rating = 'PG-13';

-- List all the films that have ‘Love’ in their title.
SELECT f.title
FROM film f
WHERE f.title LIKE '%Love%';

-- Find all movies that were rented in the last 7 days.
SELECT f.title
FROM film f
         JOIN inventory i ON f.film_id = i.film_id
         JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_date >= DATE '2005-05-24' - INTERVAL '7 days';
-- WHERE r.rental_date >= DATE '2024-01-17' - INTERVAL '7 days';

-- Find the most popular movie (the movie that has been rented the most).
SELECT f.title, COUNT(r.rental_id) AS rental_count
FROM film f
         JOIN inventory i ON f.film_id = i.film_id
         JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY rental_count DESC
LIMIT 1;

-- Find the total rentals by store.
SELECT i.store_id, COUNT(r.rental_id) AS total_rentals
FROM inventory AS i
         JOIN rental r on i.inventory_id = r.inventory_id
GROUP BY i.store_id;

-- Find the top 5 customers who have rented the most movies.
SELECT c.first_name, count(r.rental_id) AS number_of_rentals
FROM customer AS c
         JOIN rental r on c.customer_id = r.customer_id
GROUP BY c.first_name
ORDER BY number_of_rentals DESC
LIMIT 5;

-- Find the average rental duration for each movie category.
SELECT c.name, avg(r.return_date - r.rental_date) AS average_rental_duration
FROM category AS c
         JOIN film_category AS fc ON c.category_id = fc.category_id
         JOIN film f on fc.film_id = f.film_id
         JOIN inventory i on f.film_id = i.film_id
         JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY c.name;

-- Find the total revenue generated by each movie category.
SELECT c.name, sum(p.amount) AS total_revenue
FROM category AS c
         JOIN film_category AS fc ON c.category_id = fc.category_id
         JOIN film f on fc.film_id = f.film_id
         JOIN inventory i on f.film_id = i.film_id
         JOIN rental r ON i.inventory_id = r.inventory_id
         JOIN payment p ON r.rental_id = p.rental_id
GROUP BY c.name
ORDER BY total_revenue desc;

-- Find the top 10 most rented movies in the ‘Drama’ category.
SELECT f.title, count(r.rental_id) AS rents
FROM film f
         JOIN inventory i on f.film_id = i.film_id
         JOIN rental r ON i.inventory_id = r.inventory_id
         JOIN film_category fc on f.film_id = fc.film_id
         JOIN category c on c.category_id = fc.category_id
WHERE c.name = 'Drama'
GROUP BY f.title
ORDER BY rents DESC
LIMIT 10;

-- Find the average rental duration for each store.
SELECT s.store_id, AVG(r.return_date - r.rental_date) AS average_rental_duration
FROM store AS s
         JOIN customer c on s.store_id = c.store_id
         JOIN rental r on c.customer_id = r.customer_id
GROUP BY s.store_id;

-- Find the customers who have rented the most number of movies in each city.
SELECT c.first_name, ct.city, COUNT(r.rental_id) AS number_of_rentals
FROM city AS ct
         JOIN address a on ct.city_id = a.city_id
         JOIN customer c on a.address_id = c.address_id
         JOIN rental r on c.customer_id = r.customer_id
GROUP BY c.first_name, ct.city
ORDER BY number_of_rentals DESC;

-- Find the total number of rentals for each customer.
SELECT c.first_name, COUNT(r.rental_id) AS number_of_rentals
FROM customer AS c
         JOIN rental r on c.customer_id = r.customer_id
GROUP BY c.first_name
ORDER BY number_of_rentals DESC;

-- Find the total number of movies in each category.
SELECT c.name, COUNT(fc.film_id) AS number_of_movies
FROM category AS c
         JOIN film_category fc on c.category_id = fc.category_id
GROUP BY c.name
ORDER BY number_of_movies DESC;

-- Find the total sales by each customer.
SELECT c.first_name, c.last_name, sum(p.amount) AS total_sales
FROM customer c
         JOIN payment p on c.customer_id = p.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY total_sales DESC;

-- Find the top 5 most rented movies of all time.
SELECT f.title, count(r.rental_id) AS times_rented
FROM film f
         JOIN inventory i on f.film_id = i.film_id
         JOIN rental r on i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY times_rented DESC
LIMIT 5;

-- Find the total number of rentals for each movie.
SELECT f.title, count(r.rental_id) AS times_rented
FROM film f
         JOIN inventory i on f.film_id = i.film_id
         JOIN rental r on i.inventory_id = r.inventory_id
GROUP BY f.title
ORDER BY times_rented DESC;

-- List all customers who have rented a movie in both ‘Action’ and ‘Comedy’ categories.
SELECT (c.first_name, c.last_name) AS name, ct.name AS category
FROM customer c
         JOIN rental r USING (customer_id)
         JOIN inventory i USING (inventory_id)
         JOIN film f USING (film_id)
         JOIN film_category fc USING (film_id)
         JOIN category ct USING (category_id)
WHERE ct.name IN ('Action', 'Comedy')
GROUP BY ct.name, c.first_name, c.last_name
ORDER BY category DESC;

-- Find the total revenue generated by each store in 2006.
SELECT s.store_id, sum(p.amount) AS revenue
FROM store s
         JOIN staff sf USING (store_id)
         JOIN payment p USING (staff_id)
WHERE EXTRACT(YEAR FROM p.payment_date) = '2006'
GROUP BY s.store_id
ORDER BY revenue DESC;

-- List all actors who have acted in a ‘Science Fiction’ movie.
SELECT c.name, a.first_name, a.last_name
FROM category c
         JOIN film_category fc USING (category_id)
         JOIN film f USING (film_id)
         JOIN film_actor fa USING (film_id)
         JOIN actor a USING (actor_id)
WHERE c.name = 'Sci-Fi';

-- Find the top 5 customers who have spent the most on rentals.
SELECT c.first_name, c.last_name, SUM(p.amount) AS spending
FROM customer c
         JOIN rental r USING (customer_id)
         JOIN payment p USING (customer_id)
GROUP BY c.first_name, c.last_name
ORDER BY spending DESC
LIMIT 5;

-- Find the total number of rentals made by each staff member.
SELECT s.first_name, s.last_name, COUNT(p.payment_id) AS rentings
FROM staff s
         JOIN payment p USING (staff_id)
GROUP BY s.first_name, s.last_name
ORDER BY rentings DESC;

-- Find the top 5 most profitable movies.
SELECT f.title, sum(p.amount) AS profits
FROM film f
         JOIN public.inventory i on f.film_id = i.film_id
         JOIN public.rental r on i.inventory_id = r.inventory_id
         JOIN public.payment p on r.rental_id = p.rental_id
GROUP BY f.title
ORDER BY profits DESC
LIMIT 5;

-- List all the customers who have rented a movie in the ‘Family’ category but not in the ‘Children’ category.
SELECT c.first_name, c.last_name, ct.name AS category
FROM customer c
         JOIN public.rental r on c.customer_id = r.customer_id
         JOIN public.inventory i on i.inventory_id = r.inventory_id
         JOIN public.film f on f.film_id = i.film_id
         JOIN public.film_category fc on f.film_id = fc.film_id
         JOIN public.category ct on ct.category_id = fc.category_id
WHERE ct.name = 'Family'
  AND ct.name != 'Children'
GROUP BY c.first_name, c.last_name, ct.name
ORDER BY c.first_name DESC;

-- Find the average rental duration for each actor.
SELECT a.first_name, a.last_name, avg(r.return_date - r.rental_date) AS average_renting_duration
FROM actor a
         JOIN public.film_actor fa on a.actor_id = fa.actor_id
         JOIN public.film f on f.film_id = fa.film_id
         JOIN public.inventory i on f.film_id = i.film_id
         JOIN public.rental r on i.inventory_id = r.inventory_id
GROUP BY a.first_name, a.last_name
ORDER BY average_renting_duration DESC;

-- Find the customers who have rented the most number of movies in each country.
WITH customer_rentals AS (SELECT c.customer_id, c.first_name, c.last_name, COUNT(r.rental_id) AS num_rentals
                          FROM customer c
                                   JOIN rental r USING (customer_id)
                          GROUP BY c.customer_id),
     customer_countries AS (SELECT c.customer_id, co.country
                            FROM customer c
                                     JOIN address a USING (address_id)
                                     JOIN city ci USING (city_id)
                                     JOIN country co USING (country_id)),
     ranked_customers AS (SELECT cc.country,
                                 cr.first_name,
                                 cr.last_name,
                                 cr.num_rentals,
                                 RANK() OVER (PARTITION BY cc.country ORDER BY cr.num_rentals DESC) as rank
                          FROM customer_rentals cr
                                   JOIN customer_countries cc USING (customer_id))
SELECT country, first_name, last_name, num_rentals
FROM ranked_customers
WHERE rank = 1;;

-- Write a query to ;
-- Find the top 5 most rented movies in each language, along with the number of times each movie has been rented.
WITH rental_languages AS (SELECT f.title, l.name, l.language_id, count(r.rental_id) AS times_rented
                          FROM film f
                                   JOIN language l USING (language_id)
                                   JOIN inventory i USING (film_id)
                                   JOIN rental r USING (inventory_id)
                          GROUP BY f.title, l.name, l.language_id),
     rental_times AS (SELECT rl.title,
                             rl.name,
                             rl.times_rented,
                             ROW_NUMBER() OVER (PARTITION BY rl.name ORDER BY rl.times_rented DESC) as rank
                      FROM rental_languages rl)
SELECT title, name, times_rented
FROM rental_times
WHERE rank < 6
ORDER BY rank;

-- Write a query to ;
-- Find the top 5 most profitable movies in each language, along with the total revenue generated by each movie.
WITH film_rental AS (SELECT l.name, f.title, SUM(p.amount) AS film_revenue
                     FROM language l
                              JOIN film f USING (language_id)
                              JOIN inventory i USING (film_id)
                              JOIN rental r USING (inventory_id)
                              JOIN payment p USING (rental_id)
                     GROUP BY l.name, f.title),
     film_rental_rank AS (SELECT fr.name,
                                 fr.title,
                                 fr.film_revenue,
                                 row_number() over (partition by fr.name ORDER BY fr.film_revenue DESC) AS rank
                          FROM film_rental fr)

SELECT frr.name, frr.title, frr.film_revenue
FROM film_rental_rank frr
WHERE frr.rank <= 5
ORDER BY frr.film_revenue DESC;

-- Write a query to ;
-- Find the top 5 most profitable actors, along with the total revenue generated by each actor.
WITH actor_profits AS (SELECT a.first_name, a.last_name, SUM(p.amount) AS actor_revenue
                       FROM actor a
                                JOIN film_actor fa USING (actor_id)
                                JOIN film f USING (film_id)
                                JOIN inventory i USING (film_id)
                                JOIN rental r USING (inventory_id)
                                JOIN payment p USING (rental_id)
                       GROUP BY a.first_name, a.last_name),
     actor_profits_rank AS (SELECT ap.first_name,
                                   ap.last_name,
                                   ap.actor_revenue,
                                   row_number() over (ORDER BY ap.actor_revenue DESC) AS rank
                            FROM actor_profits ap)

SELECT apr.first_name, apr.last_name, apr.actor_revenue
FROM actor_profits_rank apr
WHERE apr.rank <= 5
ORDER BY apr.actor_revenue DESC;

-- Write a query to ;
-- Find the top 5 most profitable categories, along with the total revenue generated by each category, for each year.
WITH category_profits AS (SELECT c.name, SUM(p.amount) AS category_revenue, EXTRACT(YEAR FROM p.payment_date) AS year
                          FROM category c
                                   JOIN film_category fc USING (category_id)
                                   JOIN film f USING (film_id)
                                   JOIN inventory i USING (film_id)
                                   JOIN rental r USING (inventory_id)
                                   JOIN payment p USING (rental_id)
                          GROUP BY c.name, year),
     category_profits_rank AS (SELECT cp.name,
                                      cp.year,
                                      cp.category_revenue,
                                      ROW_NUMBER() OVER (PARTITION BY cp.year ORDER BY cp.category_revenue DESC) AS rank
                               FROM category_profits cp)
SELECT cpr.name, cpr.year, cpr.category_revenue
FROM category_profits_rank cpr
WHERE cpr.rank <= 5
ORDER BY cpr.category_revenue DESC;;

-- Write a query to ;
-- Find the top 5 customers who have rented the most number of movies in each city, along with the total number of movies rented by each customer.
WITH rentals_per_city AS (SELECT c.first_name,
                                 c.last_name,
                                 c.customer_id,
                                 ct.city,
                                 count(r.rental_id) AS number_of_rentals_per_city
                          FROM customer c
                                   JOIN rental r USING (customer_id)
                                   JOIN address a USING (address_id)
                                   JOIN city ct USING (city_id)
                          GROUP BY c.first_name,
                                   c.last_name,
                                   c.customer_id,
                                   ct.city),


     rentals_per_customer AS (SELECT c.first_name,
                                     c.last_name,
                                     c.customer_id,
                                     count(r.rental_id) AS number_of_rentals
                              FROM customer c
                                       JOIN rental r USING (customer_id)
                              GROUP BY c.first_name,
                                       c.last_name,
                                       c.customer_id),

     customer_rentals AS (SELECT rpct.first_name,
                                 rpct.last_name,
                                 rpct.city,
                                 rpct.number_of_rentals_per_city,
                                 rpc.number_of_rentals,
                                 row_number()
                                 over (PARTITION BY rpct.city ORDER BY rpct.number_of_rentals_per_city) AS rank
                          FROM rentals_per_city rpct
                                   JOIN rentals_per_customer rpc USING (customer_id))


SELECT cr.first_name, cr.last_name, cr.city, cr.number_of_rentals_per_city, cr.number_of_rentals
FROM customer_rentals cr
WHERE cr.rank <= 5
ORDER BY cr.city;;

-- Find the total revenue generated by each actor.
SELECT a.first_name, a.last_name, SUM(p.amount) AS revenue
FROM actor a
         JOIN film_actor fa USING (actor_id)
         JOIN film f USING (film_id)
         JOIN inventory i USING (film_id)
         JOIN rental r USING (inventory_id)
         JOIN payment p USING (rental_id)
GROUP BY a.first_name, a.last_name
ORDER BY revenue DESC;

-- Find the top 5 actors who have acted in the most number of films.
SELECT a.first_name, a.last_name, count(f.film_id) AS number_of_films
FROM actor a
         JOIN film_actor fa USING (actor_id)
         JOIN film f USING (film_id)
GROUP BY a.first_name, a.last_name
ORDER BY number_of_films DESC
LIMIT 5;

-- Write a query to ;
-- Find the top 5 most rented movies in each rating, along with the number of times each movie has been rented.
WITH ratings AS (SELECT DISTINCT(f.rating), f.film_id
                 FROM film f
                 ORDER BY f.rating),


     film_rating AS (SELECT f.title, rt.rating, COUNT(r.rental_id) AS times_rented
                     FROM ratings rt
                              JOIN film f USING (film_id)
                              JOIN inventory i USING (film_id)
                              JOIN rental r USING (inventory_id)
                     GROUP BY f.title, rt.rating),

     film_rating_rank AS (SELECT fr.rating,
                                 fr.title,
                                 fr.times_rented,
                                 row_number() over (partition by fr.rating ORDER BY fr.times_rented DESC) AS rank
                          FROM film_rating fr)

SELECT frr.rating, frr.title, frr.times_rented
FROM film_rating_rank frr
WHERE frr.rank <= 5
ORDER BY frr.rating DESC;

-- Write a query to ;
-- Find the top 5 most profitable movies in each rating, along with the total revenue generated by each movie.
WITH ratings AS (SELECT DISTINCT(f.rating), f.film_id
                 FROM film f
                 ORDER BY f.rating),


     film_rating AS (SELECT f.title, rt.rating, SUM(p.amount) AS profits
                     FROM ratings rt
                              JOIN film f USING (film_id)
                              JOIN inventory i USING (film_id)
                              JOIN rental r USING (inventory_id)
                              JOIN payment p USING (rental_id)
                     GROUP BY f.title, rt.rating),

     film_rating_rank AS (SELECT fr.rating,
                                 fr.title,
                                 fr.profits,
                                 row_number() over (partition by fr.rating ORDER BY fr.profits DESC) AS rank
                          FROM film_rating fr)

SELECT frr.rating, frr.title, frr.profits
FROM film_rating_rank frr
WHERE frr.rank <= 5
ORDER BY frr.rating DESC;

-- Write a query to ;
-- Find the top 5 most profitable languages, along with the total revenue generated by each language.
WITH film_language AS (SELECT l.name, SUM(p.amount) AS profits
                       FROM language l
                                JOIN film f USING (language_id)
                                JOIN inventory i USING (film_id)
                                JOIN rental r USING (inventory_id)
                                JOIN payment p USING (rental_id)
                       GROUP BY l.name),

     film_language_rank AS (SELECT fl.name,
                                   fl.profits,
                                   row_number() over (partition by fl.name ORDER BY fl.profits DESC) AS rank
                            FROM film_language fl)

SELECT flr.name,
       flr.profits,
       flr.rank
FROM film_language_rank flr
WHERE flr.rank <= 5
ORDER BY flr.name DESC;

-- Write a query to ;
-- Find the top 5 most profitable ratings, along with the total revenue generated by each rating.
WITH ratings AS (SELECT DISTINCT(f.rating), f.film_id
                 FROM film f
                 ORDER BY f.rating),

     film_language AS (SELECT rt.rating, SUM(p.amount) AS profits
                       FROM ratings rt
                                JOIN film f USING (film_id)
                                JOIN inventory i USING (film_id)
                                JOIN rental r USING (inventory_id)
                                JOIN payment p USING (rental_id)
                       GROUP BY rt.rating),

     film_language_rank AS (SELECT fl.rating,
                                   fl.profits,
                                   row_number() over (partition by fl.rating ORDER BY fl.profits DESC) AS rank
                            FROM film_language fl)

SELECT flr.rating,
       flr.profits,
       flr.rank
FROM film_language_rank flr
WHERE flr.rank <= 5
ORDER BY flr.rating DESC;

-- Write a query to ;
-- Find the top 5 customers who have rented the most number of movies in each rating, along with the total number of movies rented by each customer.
WITH ratings AS (SELECT DISTINCT(f.rating), f.film_id
                 FROM film f
                 ORDER BY f.rating),

     film_rental AS (SELECT rt.rating, c.first_name, c.last_name, count(r.rental_id) AS number_of_rentals
                     FROM ratings rt
                              JOIN film f USING (film_id)
                              JOIN inventory i USING (film_id)
                              JOIN rental r USING (inventory_id)
                              JOIN customer c USING (customer_id)
                     GROUP BY rt.rating, c.first_name, c.last_name),

     film_rental_rank AS (SELECT fl.rating,
                                 fl.first_name,
                                 fl.last_name,
                                 fl.number_of_rentals,
                                 row_number() over (partition by fl.rating ORDER BY fl.number_of_rentals DESC) AS rank
                          FROM film_rental fl)

SELECT flr.rating,
       flr.first_name,
       flr.last_name,
       flr.number_of_rentals
FROM film_rental_rank flr
WHERE flr.rank <= 5
ORDER BY flr.rating DESC;

-- Write a query to ;
-- Find the top 5 customers who have rented the most number of movies in each language, along with the total number of movies rented by each customer.
WITH customer_rental AS (SELECT l.name, c.first_name, c.last_name, c.customer_id, count(f.film_id) AS number_of_rentals
                         FROM language l
                                  JOIN film f USING (language_id)
                                  JOIN inventory i USING (film_id)
                                  JOIN rental r USING (inventory_id)
                                  JOIN customer c USING (customer_id)
                         GROUP BY l.name, c.first_name, c.last_name, c.customer_id),

     customer_rental_rank AS (SELECT cr.name,
                                     cr.first_name,
                                     cr.last_name,
                                     cr.number_of_rentals,
                                     cr.customer_id,
                                     row_number() over (partition by cr.name ORDER BY cr.number_of_rentals DESC) AS rank
                              FROM customer_rental cr),

     customer_total_rentals AS (SELECT c.customer_id, count(r.rental_id) AS total_rentals
                                FROM customer c
                                         JOIN rental r USING (customer_id)
                                GROUP BY c.customer_id)

SELECT crr.name,
       crr.first_name,
       crr.last_name,
       crr.number_of_rentals,
       ctr.total_rentals
FROM customer_rental_rank crr
         JOIN customer_total_rentals ctr USING (customer_id)
WHERE crr.rank <= 5
ORDER BY ctr.total_rentals DESC;

-- Write a query to ;
-- Find out which actor’s films have been rented out by customers from different cities.
SELECT a.first_name, a.last_name, COUNT(DISTINCT ct.city_id) AS number_of_cities
FROM actor a
         JOIN film_actor fa USING (actor_id)
         JOIN film f USING (film_id)
         JOIN inventory i USING (film_id)
         JOIN rental r USING (inventory_id)
         JOIN customer c USING (customer_id)
         JOIN address ad USING (address_id)
         JOIN city ct USING (city_id)
GROUP BY a.first_name, a.last_name
ORDER BY number_of_cities DESC;;

-- Write a query to ;
-- Find out which category of films is most popular among customers from different countries.
WITH category_country AS (SELECT c.name, ctry.country, count(r.rental_id) AS rentals_num
                          FROM category c
                                   JOIN film_category fc USING (category_id)
                                   JOIN film f USING (film_id)
                                   JOIN inventory i USING (film_id)
                                   JOIN rental r USING (inventory_id)
                                   JOIN customer ctr USING (customer_id)
                                   JOIN address a USING (address_id)
                                   JOIN city ct USING (city_id)
                                   JOIN country ctry USING (country_id)
                          GROUP BY c.name, ctry.country),


     category_profits_rank AS (SELECT cp.name,
                                      cp.country,
                                      cp.rentals_num,
                                      ROW_NUMBER() OVER (PARTITION BY cp.country ORDER BY cp.rentals_num DESC) AS rank
                               FROM category_country cp)


SELECT cpr.name, cpr.country, cpr.rentals_num
FROM category_profits_rank cpr
WHERE cpr.rank = 1
ORDER BY cpr.country DESC;;

-- Find the most rented movie in each category.
WITH category_rentals AS (SELECT c.name                                                         AS category,
                                 f.title                                                        AS movie,
                                 COUNT(*)                                                       AS rentals,
                                 ROW_NUMBER() OVER (PARTITION BY c.name ORDER BY COUNT(*) DESC) as row_number
                          FROM rental r
                                   JOIN inventory i ON r.inventory_id = i.inventory_id
                                   JOIN film f ON i.film_id = f.film_id
                                   JOIN film_category fc ON f.film_id = fc.film_id
                                   JOIN category c ON fc.category_id = c.category_id
                          GROUP BY c.name, f.title)
SELECT category, movie, rentals
FROM category_rentals
WHERE row_number = 1;;

-- Write a query to ;
-- Find the top 5 most rented movies in each category, along with the number of times each movie has been rented.
WITH movie_category AS (SELECT c.name, f.title, COUNT(r.rental_id) AS times_rented
                        FROM category c
                                 JOIN film_category fc USING (category_id)
                                 JOIN film f USING (film_id)
                                 JOIN inventory i USING (film_id)
                                 JOIN rental r USING (inventory_id)
                        GROUP BY c.name, f.title),

     movie_category_rank AS (SELECT mc.name,
                                    mc.title,
                                    mc.times_rented,
                                    row_number() over (partition by mc.name ORDER BY mc.times_rented DESC) AS rank
                             FROM movie_category mc
                             GROUP BY mc.name, mc.title, mc.times_rented)

SELECT mcr.name, mcr.title, mcr.times_rented
FROM movie_category_rank mcr
WHERE mcr.rank <= 5
ORDER BY mcr.name, mcr.times_rented DESC;

-- Write a query to ;
-- Find the top 5 most profitable movies in each category, along with the total revenue generated by each movie.
WITH movie_category AS (SELECT c.name, f.title, sum(p.amount) AS profits
                        FROM category c
                                 JOIN film_category fc USING (category_id)
                                 JOIN film f USING (film_id)
                                 JOIN inventory i USING (film_id)
                                 JOIN rental r USING (inventory_id)
                                 JOIN payment p USING (rental_id)
                        GROUP BY c.name, f.title),

     movie_category_rank AS (SELECT mc.name,
                                    mc.title,
                                    mc.profits,
                                    row_number() over (partition by mc.name ORDER BY mc.profits DESC) AS rank
                             FROM movie_category mc
                             GROUP BY mc.name, mc.title, mc.profits)

SELECT mcr.name, mcr.title, mcr.profits
FROM movie_category_rank mcr
WHERE mcr.rank <= 5
ORDER BY mcr.name, mcr.profits DESC;

-- Write a query to ;
-- Find the top 5 most profitable stores, along with the total revenue generated by each store.
WITH store_revenue AS (SELECT st.store_id, SUM(p.amount) AS total_revenue
                       FROM payment p
                                JOIN staff s USING (staff_id)
                                JOIN store st Using (store_id)
                       GROUP BY st.store_id),
     ranked_stores AS (SELECT store_id,
                              total_revenue,
                              ROW_NUMBER() OVER (ORDER BY total_revenue DESC) as rank
                       FROM store_revenue)
SELECT store_id, total_revenue
FROM ranked_stores
WHERE rank <= 5;;

-- Write a query to ;
-- Find the top 5 most profitable cities, along with the total revenue generated by each city.
WITH store_revenue AS (SELECT c.city, SUM(p.amount) AS total_revenue
                       FROM payment p
                                JOIN staff s USING (staff_id)
                                JOIN address a USING (address_id)
                                JOIN city c USING (city_id)
                       GROUP BY c.city_id),

     ranked_stores AS (SELECT city,
                              total_revenue,
                              ROW_NUMBER() OVER (ORDER BY total_revenue DESC) as rank
                       FROM store_revenue)

SELECT city, total_revenue
FROM ranked_stores
WHERE rank <= 5;;

-- Write a query to ;
-- Find out which month had the highest number of rentals for each year.
WITH rental_date AS (SELECT EXTRACT(MONTH FROM p.payment_date) AS month,
                            EXTRACT(YEAR FROM p.payment_date)  AS year,
                            COUNT(r.rental_id)                 AS times_rented
                     FROM payment p
                              JOIN rental r USING (rental_id)
                     GROUP BY month, year),


     rental_rank AS (SELECT rd.month,
                            rd.year,
                            rd.times_rented,
                            row_number() over (partition by rd.year ORDER BY rd.times_rented DESC) AS rank
                     FROM rental_date rd)

SELECT rr.year, rr.month, rr.times_rented
FROM rental_rank rr
WHERE rr.rank = 1;

-- Write a query to ;
-- Find out which actor’s films have been rented out by customers from different countries.
SELECT DISTINCT c.country, a.first_name, a.last_name
FROM country c
         JOIN city c2 on c.country_id = c2.country_id
         JOIN address ad on c2.city_id = ad.city_id
         JOIN customer c3 on ad.address_id = c3.address_id
         JOIN rental r on c3.customer_id = r.customer_id
         JOIN inventory i on r.inventory_id = i.inventory_id
         JOIN film f on i.film_id = f.film_id
         JOIN film_actor fa on f.film_id = fa.film_id
         JOIN actor a on a.actor_id = fa.actor_id
ORDER BY first_name, last_name, country;

-- Write a query to ;
-- Find out which category of films is most popular among customers from different cities.
WITH category_city AS (SELECT ct.city, c2.name, count(r.rental_id) AS rental_count
                       FROM city ct
                                JOIN address ad on ct.city_id = ad.city_id
                                JOIN customer c on ad.address_id = c.address_id
                                JOIN rental r on c.customer_id = r.customer_id
                                JOIN inventory i on r.inventory_id = i.inventory_id
                                JOIN film f on i.film_id = f.film_id
                                JOIN film_category fc on f.film_id = fc.film_id
                                JOIN category c2 on c2.category_id = fc.category_id
                       GROUP BY ct.city, c2.name
                       ORDER BY city),

     category_rank AS (SELECT city,
                              name,
                              rental_count,
                              row_number() over (partition by city ORDER BY rental_count DESC) AS rank
                       FROM category_city)

SELECT city, name, rental_count
FROM category_rank
WHERE rank = 1
ORDER BY city;

-- Write a query to ;
-- Find out which store has generated more revenue from comedy films than action films.
WITH comedy_revenue AS (SELECT s.manager_staff_id, SUM(p.amount) AS revenue
                        FROM store s
                                 JOIN staff s2 on s2.staff_id = s.manager_staff_id
                                 JOIN payment p on s2.staff_id = p.staff_id
                                 JOIN rental r on p.rental_id = r.rental_id
                                 JOIN inventory i on r.inventory_id = i.inventory_id
                                 JOIN film f on f.film_id = i.film_id
                                 JOIN film_category fc on f.film_id = fc.film_id
                                 JOIN category c on c.category_id = fc.category_id
                        WHERE c.name = 'Comedy'
                        GROUP BY s.manager_staff_id),

     action_revenue AS (SELECT s.manager_staff_id, SUM(p.amount) AS revenue
                        FROM store s
                                 JOIN staff s2 on s2.staff_id = s.manager_staff_id
                                 JOIN payment p on s2.staff_id = p.staff_id
                                 JOIN rental r on p.rental_id = r.rental_id
                                 JOIN inventory i on r.inventory_id = i.inventory_id
                                 JOIN film f on f.film_id = i.film_id
                                 JOIN film_category fc on f.film_id = fc.film_id
                                 JOIN category c on c.category_id = fc.category_id
                        WHERE c.name = 'Action'
                        GROUP BY s.manager_staff_id)

SELECT manager_staff_id
FROM comedy_revenue cv
         JOIN action_revenue av USING (manager_staff_id)
WHERE cv.revenue > av.revenue;

-- Write a query to ;
-- Find out which country has generated more revenue from drama films than comedy films.
WITH drama_revenue AS (SELECT c2.country, SUM(p2.amount) AS revenue
                       FROM country c2
                                JOIN city c3 on c2.country_id = c3.country_id
                                JOIN address a on c3.city_id = a.city_id
                                JOIN staff s3 on a.address_id = s3.address_id
                                JOIN payment p2 on s3.staff_id = p2.staff_id
                                JOIN rental r2 on r2.rental_id = p2.rental_id
                                JOIN inventory i2 on i2.inventory_id = r2.inventory_id
                                JOIN film f2 on f2.film_id = i2.film_id
                                JOIN film_category fc2 on f2.film_id = fc2.film_id
                                JOIN category c4 on c4.category_id = fc2.category_id
                       WHERE c4.name = 'Drama'
                       GROUP BY c2.country),

     comedy_revenue AS (SELECT c2.country, SUM(p2.amount) AS revenue
                        FROM country c2
                                 JOIN city c3 on c2.country_id = c3.country_id
                                 JOIN address a on c3.city_id = a.city_id
                                 JOIN staff s3 on a.address_id = s3.address_id
                                 JOIN payment p2 on s3.staff_id = p2.staff_id
                                 JOIN rental r2 on r2.rental_id = p2.rental_id
                                 JOIN inventory i2 on i2.inventory_id = r2.inventory_id
                                 JOIN film f2 on f2.film_id = i2.film_id
                                 JOIN film_category fc2 on f2.film_id = fc2.film_id
                                 JOIN category c4 on c4.category_id = fc2.category_id
                        WHERE c4.name = 'Comedy'
                        GROUP BY c2.country)

SELECT d.country
FROM drama_revenue d
         JOIN comedy_revenue c USING (country)
WHERE d.revenue > c.revenue;

-- Write a query to ;
-- Find out which month had the highest number of rentals for each category.
WITH month_rentals AS (SELECT c.name, EXTRACT(MONTH FROM p.payment_date) AS month, count(r.rental_id) AS rentals
                       FROM category c
                                JOIN public.film_category fc on c.category_id = fc.category_id
                                JOIN public.film f on f.film_id = fc.film_id
                                JOIN public.inventory i on f.film_id = i.film_id
                                JOIN public.rental r on i.inventory_id = r.inventory_id
                                JOIN public.payment p on r.rental_id = p.rental_id
                       group by c.name, month
                       ORDER BY c.name),

     month_rental_rank AS (SELECT name,
                                  month,
                                  rentals,
                                  row_number() over (partition by name order by rentals DESC ) AS rank
                           FROM month_rentals)

SELECT name, month, rentals
FROM month_rental_rank
WHERE rank = 1
ORDER BY name;

-- Write a query to ;
-- Find out which actor’s films have been rented out by customers from different countries.
SELECT DISTINCT a.first_name, a.last_name, c3.country
FROM actor a
         JOIN film_actor fa on a.actor_id = fa.actor_id
         JOIN film f on f.film_id = fa.film_id
         JOIN inventory i on f.film_id = i.film_id
         JOIN rental r on i.inventory_id = r.inventory_id
         JOIN customer c on c.customer_id = r.customer_id
         JOIN address a2 on a2.address_id = c.address_id
         JOIN city c2 on c2.city_id = a2.city_id
         JOIN country c3 on c3.country_id = c2.country_id
ORDER BY a.first_name, a.last_name, c3.country;

-- Write a query to ;
-- Find out which category of films is most popular among customers from different cities.
WITH category_city AS (SELECT c3.name, c2.city, count(r.rental_id) AS times_rented
                       FROM category c3
                                INNER JOIN film_category fc USING (category_id)
                                INNER JOIN film f USING (film_id)
                                INNER JOIN inventory i USING (film_id)
                                INNER JOIN rental r USING (inventory_id)
                                INNER JOIN customer c USING (customer_id)
                                INNER JOIN address a2 USING (address_id)
                                INNER JOIN city c2 USING (city_id)
                       GROUP BY c3.name, c2.city
                       ORDER BY c3.name, c2.city),

     category_city_rank AS (SELECT name,
                                   city,
                                   times_rented,
                                   row_number() over (partition by city ORDER BY times_rented DESC) AS rank
                            FROM category_city)

SELECT city, name, times_rented
FROM category_city_rank
WHERE rank = 1
ORDER BY city