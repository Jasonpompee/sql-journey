-- Query 1: Get the title, rating, and length for 10 films.
SELECT "title", "rating", "length"
FROM film
LIMIT 10;


-- Query 2: Return the title, rating, and length for films where the length is greater than 120 minutes.
SELECT "title", "length", "rating"
FROM film
WHERE "length" > 120;


-- Query 3: Return title and rating for films whose rating is either PG or PG-13.
SELECT "title", "rating"
FROM film
WHERE "rating" = 'PG' OR "rating" = 'PG-13';


-- Query 4: Return title and length for films where the length is between 90 and 120 minutes, inclusive.
SELECT "title", "length"
FROM film
WHERE "length" BETWEEN 90 AND 120;


-- Query 5: Return titles for films whose title contains the word Airport anywhere in the title.
SELECT "title"
FROM film
WHERE "title" LIKE '%Airport%';


-- Query 6: Return address and address2 from the address table where address2 is NULL.
SELECT "address", "address2"
FROM "address"
WHERE "address2" IS NULL;


-- Query 7: Return title and length from film, sorted from longest to shortest, and return only the top 10.
SELECT "title", "length"
FROM film
ORDER BY "length" DESC
LIMIT 10;


-- Query 8: Sort films by rating alphabetically, then sort films with the same rating from longest to shortest.
SELECT "title", "rating", "length"
FROM film
ORDER BY "rating" ASC, "length" DESC;


-- Query 9: Return the unique ratings that exist in the film table.
SELECT DISTINCT "rating"
FROM film;


-- Query 10: Return title, rating, and length for films whose rating is PG, PG-13, or R.
SELECT "title", "rating", "length"
FROM film
WHERE "rating" IN ('PG', 'PG-13', 'R');


-- Query 11: Return title and replacement cost where replacement cost is not between 15 and 25.
SELECT "title", "replacement_cost"
FROM film
WHERE "replacement_cost" NOT BETWEEN 15 AND 25;


-- Query 12: Return title and length for films longer than 100 minutes whose title does not contain Love.
SELECT "title", "length"
FROM film
WHERE "length" > 100
  AND "title" NOT LIKE '%Love%';


SELECT "first_name" AS "First Name", "last_name" AS "Last Name", "email" AS "Email Address" FROM "customer"
LIMIT 10;
