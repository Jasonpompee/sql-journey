--How many total films are in the film table?

SELECT COUNT(*) 
FROM "film";

--What is the average rental duration of all films?

SELECT ROUND(AVG("rental_duration"))
FROM "film";

--What is the shortest film length in the film table?

SELECT MIN("length")
FROM "film";

-- What is the longest film length in the film table?

SELECT MAX("length")
FROM "film";


--What is the total replacement cost of all films combined?

SELECT SUM("replacement_cost")

FROM "film";


--How many films are there for each rating?

SELECT COUNT("title") AS "Number of movies",
"rating" AS "Rating"

FROM "film"

GROUP BY "rating";


--What is the average film length for each rating?

SELECT ROUND(AVG("length"),2) AS "Average Length",
          "rating" AS "Rating"
		  
FROM "film"

GROUP BY "rating";


-- Which ratings have more than 200 films?

SELECT COUNT("rating") AS "Number Of Movies", "rating" AS "Rating"
FROM "film"

GROUP BY "rating"

HAVING COUNT("rating") > 200;


--How many rental records exist in total, and how many of those have a non-NULL return_date?

SELECT "customer"."first_name" AS "First Name",
	"customer"."last_name" AS "Last Name",
	COUNT("rental_id") AS "Number Of Rentals",
	"customer"."customer_id"
FROM "customer"

JOIN "rental"

ON "rental"."customer_id"= "customer"."customer_id"
GROUP BY "customer"."customer_id"

LIMIT 10;


SELECT
    "customer"."customer_id",
  COUNT(DISTINCT("rental"."rental_id")) AS "Rental Row Count"
FROM "customer" 



JOIN "rental"
ON "rental"."customer_id" = "customer"."customer_id"

JOIN "payment"
ON "payment"."customer_id" = "customer"."customer_id"


GROUP BY "customer"."customer_id"

Limit 10;

SELECT "title" AS "Movies", "length" AS "Length of Movies"
FROM "film"
WHERE "length" >(
SELECT AVG("length") FROM "film")

LIMIT 10;

SELECT "customer"."first_name" AS "First Name",
	"customer"."last_name" AS "Last Name",
	COUNT("payment"."amount") AS "Number of payments",
	"customer"."customer_id"
	
FROM "customer"

JOIN "payment"

ON "payment"."customer_id" = "customer"."customer_id"

GROUP BY "customer"."customer_id"

HAVING COUNT("payment"."amount") > 25

ORDER BY "Number of payments" DESC













