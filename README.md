# **PostgreSQL Practice Exercises**

## Table of Contents

### <a id="beginner"></a>Beginner
- [List all movies in the ‘Action’ category.](#list-all-movies-in-the-action-category)
- [Find all customers who have spent more than $100.](#find-all-customers-who-have-spent-more-than-100)
- [Find all movies that actor 'Kevin Bloom' has acted in.](#find-all-movies-that-actor-kevin-bloom-has-acted-in)
- [List all the actors who have appeared in more than 20 movies.](#list-all-the-actors-who-have-appeared-in-more-than-20-movies)
- [List all the customers who have rented a movie more than once in a single day.](#list-all-the-customers-who-have-rented-a-movie-more-than-once-in-a-single-day)
- [List all the movies that have not been rented yet.](#list-all-the-movies-that-have-not-been-rented-yet)
- [List all the customers who have rented a movie in the ‘Action’ category but not in the ‘Comedy’ category.](#list-all-the-customers-who-have-rented-a-movie-in-the-action-category-but-not-in-the-comedy-category)
- [List all the movies that have been rented more than 50 times.](#list-all-the-movies-that-have-been-rented-more-than-50-times)
- [List all the movies that have been rented by a customer who has a first name starting with ‘J’.](#list-all-the-movies-that-have-been-rented-by-a-customer-who-has-a-first-name-starting-with-j)
- [List all the movies that have been rented more than once by the same customer.](#list-all-the-movies-that-have-been-rented-more-than-once-by-the-same-customer)
- [List all the movies that were released in 2006.](#list-all-the-movies-that-were-released-in-2006)
- [Find all movies that are longer than 2 hours.](#find-all-movies-that-are-longer-than-2-hours)
- [Find all movies that are rated ‘PG-13’.](#find-all-movies-that-are-rated-pg-13)
- [List all the films that have ‘Love’ in their title.](#list-all-the-films-that-have-love-in-their-title)
- [Find all movies that were rented in the last 7 days.](#find-all-movies-that-were-rented-in-the-last-7-days)

### <a id="intermediate"></a>Intermediate
- [Find the most popular movie (the movie that has been rented the most).](#find-the-most-popular-movie-the-movie-that-has-been-rented-the-most)
- [Find the total sales by store.](#find-the-total-sales-by-store)
- [Find the top 5 customers who have rented the most movies.](#find-the-top-5-customers-who-have-rented-the-most-movies)
- [Find the average rental duration for each movie category.](#find-the-average-rental-duration-for-each-movie-category)
- [Find the total revenue generated by each movie category.](#find-the-total-revenue-generated-by-each-movie-category)
- [Find the top 10 most rented movies in the ‘Drama’ category.](#find-the-top-10-most-rented-movies-in-the-drama-category)
- [Find the average rental duration for each store.](#find-the-average-rental-duration-for-each-store)
- [Find the customers who have rented the most number of movies in each city.](#find-the-customers-who-have-rented-the-most-number-of-movies-in-each-city)
- [Find the total number of rentals for each customer.](#find-the-total-number-of-rentals-for-each-customer)
- [Find the total number of movies in each category.](#find-the-total-number-of-movies-in-each-category)
- [Find the most rented movie in each category.](#find-the-most-rented-movie-in-each-category)
- [Find the total sales by each customer.](#find-the-total-sales-by-each-customer)
- [Find the top 5 most rented movies of all time.](#find-the-top-5-most-rented-movies-of-all-time)
- [Find the total number of rentals for each movie.](#find-the-total-number-of-rentals-for-each-movie)
- [List all customers who have rented a movie in both ‘Action’ and ‘Comedy’ categories.](#list-all-customers-who-have-rented-a-movie-in-both-action-and-comedy-categories)
- [Find the total revenue generated by each store in 2006.](#find-the-total-revenue-generated-by-each-store-in-2006)
- [List all actors who have acted in a ‘Science Fiction’ movie.](#list-all-actors-who-have-acted-in-a-science-fiction-movie)
- [Find the top 5 customers who have spent the most on rentals.](#find-the-top-5-customers-who-have-spent-the-most-on-rentals)
- [Find the total number of rentals made by each staff member.](#find-the-total-number-of-rentals-made-by-each-staff-member)

### <a id="advanced"></a>Advanced
- [Find the top 5 most profitable movies.](#find-the-top-5-most-profitable-movies)
- [List all the customers who have rented a movie in the ‘Family’ category but not in the ‘Children’ category.](#list-all-the-customers-who-have-rented-a-movie-in-the-family-category-but-not-in-the-children-category)
- [Find the average rental duration for each actor.](#find-the-average-rental-duration-for-each-actor)
- [List all the movies that have been rented by a customer who lives in a city with a population greater than 500,000.](#list-all-the-movies-that-have-been-rented-by-a-customer-who-lives-in-a-city-with-a-population-greater-than-500000)
- [Find the customers who have rented the most number of movies in each country.](#find-the-customers-who-have-rented-the-most-number-of-movies-in-each-country)
- [Write a query to find the top 5 most rented movies in each language, along with the number of times each movie has been rented.](#write-a-query-to-find-the-top-5-most-rented-movies-in-each-language-along-with-the-number-of-times-each-movie-has-been-rented)
- [Write a query to find the top 5 most profitable movies in each language, along with the total revenue generated by each movie.](#write-a-query-to-find-the-top-5-most-profitable-movies-in-each-language-along-with-the-total-revenue-generated-by-each-movie)
- [Write a query to find the top 5 most profitable actors, along with the total revenue generated by each actor.](#write-a-query-to-find-the-top-5-most-profitable-actors-along-with-the-total-revenue-generated-by-each-actor)
- [Write a query to find the top 5 most profitable categories, along with the total revenue generated by each category, for each year.](#write-a-query-to-find-the-top-5-most-profitable-categories-along-with-the-total-revenue-generated-by-each-category-for-each-year)
- [Write a query to find the top 5 customers who have rented the most number of movies in each city, along with the total number of movies rented by each customer.](#write-a-query-to-find-the-top-5-customers-who-have-rented-the-most-number-of-movies-in-each-city-along-with-the-total-number-of-movies-rented-by-each-customer)
- [Find the total revenue generated by each actor.](#find-the-total-revenue-generated-by-each-actor)
- [Find the top 5 actors who have acted in the most number of films.](#find-the-top-5-actors-who-have-acted-in-the-most-number-of-films)
- [Write a query to find the top 5 most rented movies in each rating, along with the number of times each movie has been rented.](#write-a-query-to-find-the-top-5-most-rented-movies-in-each-rating-along-with-the-number-of-times-each-movie-has-been-rented)
- [Write a query to find the top 5 most profitable movies in each rating, along with the total revenue generated by each movie.](#write-a-query-to-find-the-top-5-most-profitable-movies-in-each-rating-along-with-the-total-revenue-generated-by-each-movie)
- [Write a query to find the top 5 most profitable languages, along with the total revenue generated by each language.](#write-a-query-to-find-the-top-5-most-profitable-languages-along-with-the-total-revenue-generated-by-each-language)
- [Write a query to find the top 5 most profitable ratings, along with the total revenue generated by each rating.](#write-a-query-to-find-the-top-5-most-profitable-ratings-along-with-the-total-revenue-generated-by-each-rating)
- [Write a query to find the top 5 customers who have rented the most number of movies in each rating, along with the total number of movies rented by each customer.](#write-a-query-to-find-the-top-5-customers-who-have-rented-the-most-number-of-movies-in-each-rating-along-with-the-total-number-of-movies-rented-by-each-customer)
- [Write a query to find the top 5 customers who have rented the most number of movies in each language, along with the total number of movies rented by each customer.](#write-a-query-to-find-the-top-5-customers-who-have-rented-the-most-number-of-movies-in-each-language-along-with-the-total-number-of-movies-rented-by-each-customer)
- [Write a query to find out which actor’s films have been rented out by customers from different cities.](#write-a-query-to-find-out-which-actors-films-have-been-rented-out-by-customers-from-different-cities)
- [Write a query to find out which category of films is most popular among customers from different countries.](#write-a-query-to-find-out-which-category-of-films-is-most-popular-among-customers-from-different-countries)

### <a id="expert"></a>Expert
- [Write a query to find the top 5 most rented movies in each category, along with the number of times each movie has been rented.](#write-a-query-to-find-the-top-5-most-rented-movies-in-each-category-along-with-the-number-of-times-each-movie-has-been-rented)
- [Write a query to find the top 5 most profitable movies in each category, along with the total revenue generated by each movie.](#write-a-query-to-find-the-top-5-most-profitable-movies-in-each-category-along-with-the-total-revenue-generated-by-each-movie)
- [Write a query to find the top 5 most profitable stores, along with the total revenue generated by each store.](#write-a-query-to-find-the-top-5-most-profitable-stores-along-with-the-total-revenue-generated-by-each-store)
- [Write a query to find the top 5 most profitable cities, along with the total revenue generated by each city.](#write-a-query-to-find-the-top-5-most-profitable-cities-along-with-the-total-revenue-generated-by-each-city)
- [Write a query to find out which month had the highest number of rentals for each year.](#write-a-query-to-find-out-which-month-had-the-highest-number-of-rentals-for-each-year)
- [Write a query to find out which actor’s films have been rented out by customers from different countries.](#write-a-query-to-find-out-which-actors-films-have-been-rented-out-by-customers-from-different-countries)
- [Write a query to find out which category of films is most popular among customers from different cities.](#write-a-query-to-find-out-which-category-of-films-is-most-popular-among-customers-from-different-cities)
- [Write a query to find out which store has generated more revenue from comedy films than action films.](#write-a-query-to-find-out-which-store-has-generated-more-revenue-from-comedy-films-than-action-films)
- [Write a query to find out which country has generated more revenue from drama films than comedy films.](#write-a-query-to-find-out-which-country-has-generated-more-revenue-from-drama-films-than-comedy-films)
- [Write a query to find out which actor’s films have been rented out by customers from different countries.](#write-a-query-to-find-out-which-actors-films-have-been-rented-out-by-customers-from-different-countries)
- [Write a query to find out which category of films is most popular among customers from different countries.](#write-a-query-to-find-out-which-category-of-films-is-most-popular-among-customers-from-different-countries)
- [Write a query to find out which store has generated more revenue from comedy films than action films.](#write-a-query-to-find-out-which-store-has-generated-more-revenue-from-comedy-films-than-action-films)
- [Write a query to find out which country has generated more revenue from drama films than comedy films.](#write-a-query-to-find-out-which-country-has-generated-more-revenue-from-drama-films-than-comedy-films)
- [Write a query to find out which actor’s films have been rented out by customers from different countries.](#write-a-query-to-find-out-which-actors-films-have-been-rented-out-by-customers-from-different-countries)

## [Beginner](#beginner)

- [x] <a id="list-all-movies-in-the-action-category"></a>List all movies in the ‘Action’ category.
```
SELECT f.title AS movies
FROM film AS f
JOIN film_category fc on f.film_id = fc.film_id
JOIN category c on c.category_id = fc.category_id
WHERE  c.name = 'Action';
```
- [x] <a id="find-all-customers-who-have-spent-more-than-100"></a>Find all customers who have spent more than $100.
```
SELECT concat(c.first_name, ' ', c.last_name) AS name
FROM customer AS c
JOIN payment AS p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
HAVING SUM(p.amount) > 100
```
- [x] <a id="find-all-movies-that-actor-kevin-bloom-has-acted-in"></a>Find all movies that actor 'Kevin Bloom' has acted in.
```
SELECT f.title
FROM film f
INNER JOIN film_actor fa on f.film_id = fa.film_id
INNER JOIN actor a on a.actor_id = fa.actor_id
WHERE a.first_name = 'Kevin' AND a.last_name = 'Bloom';
```
- [x] <a id="list-all-the-actors-who-have-appeared-in-more-than-20-movies"></a>List all the actors who have appeared in more than 20 movies.
```
SELECT a.first_name, a.last_name, COUNT(fa.film_id) as film_count
FROM actor a
INNER JOIN film_actor fa on a.actor_id = fa.actor_id
GROUP BY a.actor_id
HAVING COUNT(fa.film_id) > 20;
```
- [x] <a id="list-all-the-customers-who-have-rented-a-movie-more-than-once-in-a-single-day"></a>List all the customers who have rented a movie more than once in a single day.
```
SELECT first_name, last_name, COUNT(r.rental_id)
FROM customer AS c
INNER JOIN rental AS r ON r.customer_id = c.customer_id
GROUP BY c.customer_id, r.rental_date
HAVING COUNT(rental_date) > 1
```
- [x] <a id="list-all-the-movies-that-have-not-been-rented-yet"></a>List all the movies that have not been rented yet.
```
SELECT f.title
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_date IS NULL;
```
- [x] <a id="list-all-the-customers-who-have-rented-a-movie-in-the-action-category-but-not-in-the-comedy-category"></a>List all the customers who have rented a movie in the ‘Action’ category but not in the ‘Comedy’ category.
```
SELECT c.first_name, c.last_name
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON f.film_id = i.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category ca ON ca.category_id = fc.category_id
WHERE ca.name = 'Action'
AND c.customer_id NOT IN (
    SELECT c2.customer_id
    FROM customer c2
    JOIN rental r2 ON c2.customer_id = r2.customer_id
    JOIN inventory i2 ON r2.inventory_id = i2.inventory_id
    JOIN film f2 ON f2.film_id = i2.film_id
    JOIN film_category fc2 ON f2.film_id = fc2.film_id
    JOIN category ca2 ON ca2.category_id = fc2.category_id
    WHERE ca2.name = 'Comedy'
)
GROUP BY c.customer_id
```
- [x] <a id="list-all-the-movies-that-have-been-rented-more-than-50-times"></a>List all the movies that have been rented more than 50 times.
```
SELECT f.title
FROM film AS f
JOIN inventory i on f.film_id = i.film_id
JOIN rental AS r ON i.inventory_id = r.inventory_id
GROUP BY f.title
HAVING count(rental_id) > 50
```
- [x] <a id="list-all-the-movies-that-have-been-rented-by-a-customer-who-has-a-first-name-starting-with-j"></a>List all the movies that have been rented by a customer who has a first name starting with ‘J’.
```
SELECT f.title
FROM film AS f
JOIN inventory AS i ON f.film_id = i.film_id
JOIN rental AS r ON i.inventory_id = r.inventory_id
JOIN customer AS c ON r.customer_id = c.customer_id
WHERE c.first_name LIKE 'J%'
GROUP BY f.title
```
- [x] <a id="list-all-the-movies-that-have-been-rented-more-than-once-by-the-same-customer"></a>List all the movies that have been rented more than once by the same customer.
```
SELECT f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN customer c ON r.customer_id = c.customer_id
GROUP BY f.title, c.customer_id
HAVING COUNT(r.rental_id) > 1
```
- [x] <a id="list-all-the-movies-that-were-released-in-2006"></a>List all the movies that were released in 2006.
```
SELECT f.title
FROM film f
WHERE f.release_year = 2006
```
- [x] <a id="find-all-movies-that-are-longer-than-2-hours"></a>Find all movies that are longer than 2 hours.
```
SELECT f.title
FROM film f
WHERE f.length > 120
```
- [x] <a id="find-all-movies-that-are-rated-pg-13"></a>Find all movies that are rated ‘PG-13’.
```
SELECT f.title
FROM film f
WHERE f.rating = 'PG-13'
```
- [x] <a id="list-all-the-films-that-have-love-in-their-title"></a>List all the films that have ‘Love’ in their title.
```
SELECT f.title
FROM film f
WHERE f.title LIKE '%Love%'
```
- [x] <a id="find-all-movies-that-were-rented-in-the-last-7-days"></a>Find all movies that were rented in the last 7 days.
```
SELECT f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
WHERE r.rental_date >= DATE '2005-05-24' - INTERVAL '7 days';
-- WHERE r.rental_date >= DATE '2024-01-17' - INTERVAL '7 days';
```

## [Intermediate](#intermediate)

- [ ] <a id="find-the-most-popular-movie-the-movie-that-has-been-rented-the-most"></a>Find the most popular movie (the movie that has been rented the most).
- [ ] <a id="find-the-total-sales-by-store"></a>Find the total sales by store.
- [ ] <a id="find-the-top-5-customers-who-have-rented-the-most-movies"></a>Find the top 5 customers who have rented the most movies.
- [ ] <a id="find-the-average-rental-duration-for-each-movie-category"></a>Find the average rental duration for each movie category.
- [ ] <a id="find-the-total-revenue-generated-by-each-movie-category"></a>Find the total revenue generated by each movie category.
- [ ] <a id="find-the-top-10-most-rented-movies-in-the-drama-category"></a>Find the top 10 most rented movies in the ‘Drama’ category.
- [ ] <a id="find-the-average-rental-duration-for-each-store"></a>Find the average rental duration for each store.
- [ ] <a id="find-the-customers-who-have-rented-the-most-number-of-movies-in-each-city"></a>Find the customers who have rented the most number of movies in each city.
- [ ] <a id="find-the-total-number-of-rentals-for-each-customer"></a>Find the total number of rentals for each customer.
- [ ] <a id="find-the-total-number-of-movies-in-each-category"></a>Find the total number of movies in each category.
- [ ] <a id="find-the-most-rented-movie-in-each-category"></a>Find the most rented movie in each category.
- [ ] <a id="find-the-total-sales-by-each-customer"></a>Find the total sales by each customer.
- [ ] <a id="find-the-top-5-most-rented-movies-of-all-time"></a>Find the top 5 most rented movies of all time.
- [ ] <a id="find-the-total-number-of-rentals-for-each-movie"></a>Find the total number of rentals for each movie.
- [ ] <a id="list-all-customers-who-have-rented-a-movie-in-both-action-and-comedy-categories"></a>List all customers who have rented a movie in both ‘Action’ and ‘Comedy’ categories.
- [ ] <a id="find-the-total-revenue-generated-by-each-store-in-2006"></a>Find the total revenue generated by each store in 2006.
- [ ] <a id="list-all-actors-who-have-acted-in-a-science-fiction-movie"></a>List all actors who have acted in a ‘Science Fiction’ movie.
- [ ] <a id="find-the-top-5-customers-who-have-spent-the-most-on-rentals"></a>Find the top 5 customers who have spent the most on rentals.
- [ ] <a id="find-the-total-number-of-rentals-made-by-each-staff-member"></a>Find the total number of rentals made by each staff member.

## [Advanced](#advanced)

- [ ] <a id="find-the-top-5-most-profitable-movies"></a>Find the top 5 most profitable movies.
- [ ] <a id="list-all-the-customers-who-have-rented-a-movie-in-the-family-category-but-not-in-the-children-category"></a>List all the customers who have rented a movie in the ‘Family’ category but not in the ‘Children’ category.
- [ ] <a id="find-the-average-rental-duration-for-each-actor"></a>Find the average rental duration for each actor.
- [ ] <a id="list-all-the-movies-that-have-been-rented-by-a-customer-who-lives-in-a-city-with-a-population-greater-than-500000"></a>List all the movies that have been rented by a customer who lives in a city with a population greater than 500,000.
- [ ] <a id="find-the-customers-who-have-rented-the-most-number-of-movies-in-each-country"></a>Find the customers who have rented the most number of movies in each country.
- [ ] <a id="write-a-query-to-find-the-top-5-most-rented-movies-in-each-language-along-with-the-number-of-times-each-movie-has-been-rented"></a>Write a query to find the top 5 most rented movies in each language, along with the number of times each movie has been rented.
- [ ] <a id="write-a-query-to-find-the-top-5-most-profitable-movies-in-each-language-along-with-the-total-revenue-generated-by-each-movie"></a>Write a query to find the top 5 most profitable movies in each language, along with the total revenue generated by each movie.
- [ ] <a id="write-a-query-to-find-the-top-5-most-profitable-actors-along-with-the-total-revenue-generated-by-each-actor"></a>Write a query to find the top 5 most profitable actors, along with the total revenue generated by each actor.
- [ ] <a id="write-a-query-to-find-the-top-5-most-profitable-categories-along-with-the-total-revenue-generated-by-each-category-for-each-year"></a>Write a query to find the top 5 most profitable categories, along with the total revenue generated by each category, for each year.
- [ ] <a id="write-a-query-to-find-the-top-5-customers-who-have-rented-the-most-number-of-movies-in-each-city-along-with-the-total-number-of-movies-rented-by-each-customer"></a>Write a query to find the top 5 customers who have rented the most number of movies in each city, along with the total number of movies rented by each customer.
- [ ] <a id="find-the-total-revenue-generated-by-each-actor"></a>Find the total revenue generated by each actor.
- [ ] <a id="find-the-top-5-actors-who-have-acted-in-the-most-number-of-films"></a>Find the top 5 actors who have acted in the most number of films.
- [ ] <a id="write-a-query-to-find-the-top-5-most-rented-movies-in-each-rating-along-with-the-number-of-times-each-movie-has-been-rented"></a>Write a query to find the top 5 most rented movies in each rating, along with the number of times each movie has been rented.
- [ ] <a id="write-a-query-to-find-the-top-5-most-profitable-movies-in-each-rating-along-with-the-total-revenue-generated-by-each-movie"></a>Write a query to find the top 5 most profitable movies in each rating, along with the total revenue generated by each movie.
- [ ] <a id="write-a-query-to-find-the-top-5-most-profitable-languages-along-with-the-total-revenue-generated-by-each-language"></a>Write a query to find the top 5 most profitable languages, along with the total revenue generated by each language.
- [ ] <a id="write-a-query-to-find-the-top-5-most-profitable-ratings-along-with-the-total-revenue-generated-by-each-rating"></a>Write a query to find the top 5 most profitable ratings, along with the total revenue generated by each rating.
- [ ] <a id="write-a-query-to-find-the-top-5-customers-who-have-rented-the-most-number-of-movies-in-each-rating-along-with-the-total-number-of-movies-rented-by-each-customer"></a>Write a query to find the top 5 customers who have rented the most number of movies in each rating, along with the total number of movies rented by each customer.
- [ ] <a id="write-a-query-to-find-the-top-5-customers-who-have-rented-the-most-number-of-movies-in-each-language-along-with-the-total-number-of-movies-rented-by-each-customer"></a>Write a query to find the top 5 customers who have rented the most number of movies in each language, along with the total number of movies rented by each customer.
- [ ] <a id="write-a-query-to-find-out-which-actors-films-have-been-rented-out-by-customers-from-different-cities"></a>Write a query to find out which actor’s films have been rented out by customers from different cities.
- [ ] <a id="write-a-query-to-find-out-which-category-of-films-is-most-popular-among-customers-from-different-countries"></a>Write a query to find out which category of films is most popular among customers from different countries.

## [Expert](#expert)

- [ ] <a id="write-a-query-to-find-the-top-5-most-rented-movies-in-each-category-along-with-the-number-of-times-each-movie-has-been-rented"></a>Write a query to find the top 5 most rented movies in each category, along with the number of times each movie has been rented.
- [ ] <a id="write-a-query-to-find-the-top-5-most-profitable-movies-in-each-category-along-with-the-total-revenue-generated-by-each-movie"></a>Write a query to find the top 5 most profitable movies in each category, along with the total revenue generated by each movie.
- [ ] <a id="write-a-query-to-find-the-top-5-most-profitable-stores-along-with-the-total-revenue-generated-by-each-store"></a>Write a query to find the top 5 most profitable stores, along with the total revenue generated by each store.
- [ ] <a id="write-a-query-to-find-the-top-5-most-profitable-cities-along-with-the-total-revenue-generated-by-each-city"></a>Write a query to find the top 5 most profitable cities, along with the total revenue generated by each city.
- [ ] <a id="write-a-query-to-find-out-which-month-had-the-highest-number-of-rentals-for-each-year"></a>Write a query to find out which month had the highest number of rentals for each year.
- [ ] <a id="write-a-query-to-find-out-which-actors-films-have-been-rented-out-by-customers-from-different-countries"></a>Write a query to find out which actor’s films have been rented out by customers from different countries.
- [ ] <a id="write-a-query-to-find-out-which-category-of-films-is-most-popular-among-customers-from-different-cities"></a>Write a query to find out which category of films is most popular among customers from different cities.
- [ ] <a id="write-a-query-to-find-out-which-store-has-generated-more-revenue-from-comedy-films-than-action-films"></a>Write a query to find out which store has generated more revenue from comedy films than action films.
- [ ] <a id="write-a-query-to-find-out-which-country-has-generated-more-revenue-from-drama-films-than-comedy-films"></a>Write a query to find out which country has generated more revenue from drama films than comedy films.
- [ ] <a id="write-a-query-to-find-out-which-month-had-the-highest-number-of-rentals-for-each-category"></a>Write a query to find out which month had the highest number of rentals for each category.
- [ ] <a id="write-a-query-to-find-out-which-actors-films-have-been-rented-out-by-customers-from-different-countries-2"></a>Write a query to find out which actor’s films have been rented out by customers from different countries.
- [ ] <a id="write-a-query-to-find-out-which-category-of-films-is-most-popular-among-customers-from-different-cities-2"></a>Write a query to find out which category of films is most popular among customers from different cities.
- [ ] <a id="write-a-query-to-find-out-which-store-has-generated-more-revenue-from-comedy-films-than-action-films-2"></a>Write a query to find out which store has generated more revenue from comedy films than action films.
- [ ] <a id="write-a-query-to-find-out-which-country-has-generated-more-revenue-from-drama-films-than-comedy-films-2"></a>Write a query to find out which country has generated more revenue from drama films than comedy films.
- [ ] <a id="write-a-query-to-find-out-which-actors-films-have-been-rented-out-by-customers-from-different-countries-3"></a>Write a query to find out which actor’s films have been rented out by customers from different countries.