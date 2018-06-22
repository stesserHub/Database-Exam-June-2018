-- Author: Christoffer Laurits Ravn Rahbek

USE sakila;

-- Quesion 3.1

SELECT * FROM film
WHERE rating LIKE 'R'
AND length > 180;

-- Question 3.2

SELECT email
FROM customer
WHERE last_name
IN ('Jones', 'SMitch')
AND active = 1;

-- Question 3.3

SELECT COUNT(*)
AS CustomersAddressDrive
FROM customer
LEFT JOIN address
ON customer.address_id = address.address_id
WHERE address LIKE '%Drive';

-- Question 3.4

SELECT *
FROM country
LEFT JOIN city
ON country.country_id = city.country_id
WHERE country LIKE 'Australia'
ORDER BY city DESC;

-- Question 3.5

SELECT TOP 5 payment_id, amount, payment_date
FROM staff LEFT JOIN payment
ON staff.staff_id = payment.staff_id
WHERE first_name = 'Jon'
AND last_name = 'Stephens'
ORDER BY amount DESC;

-- Question 3.6

SELECT ROUND(AVG(rental_rate),0)
FROM film
LEFT JOIN film_category
ON film.film_id = film_category.film_id
LEFT JOIN category
ON film_category.category_id = category.category_id
WHERE category.name = 'Comedy';

-- Question 3.7

SELECT *
FROM staff
LEFT JOIN address
ON staff.address_id = address.address_id
LEFT JOIN city
ON address.city_id = city.city_id
LEFT JOIN country
ON city.country_id = city.country_id
WHERE first_name = 'Mike'
AND last_name = 'Hillyer'
-- He works on 47 MySakila Drive in Lethbridge, *Canada*...

-- Question 3.8

SELECT COUNT(*) as FilmCount, film.title
FROM inventory
LEFT JOIN film
ON inventory.film_id = film.film_id
GROUP BY CONCAT(film.title,film.film_id)
ORDER BY COUNT(*) DESC


