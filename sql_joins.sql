-- Query 1 - Customer and Address JOIN

SELECT "customer"."first_name",
       "customer"."last_name",
       "address"."address"
FROM "customer"

JOIN "address"
ON "address"."address_id" = "customer"."address_id"

LIMIT 10;


-- Query 2 - Film and Language JOIN

SELECT "film"."title",
       "language"."name" AS "Language",
       "film"."language_id"
FROM "film"

JOIN "language"
ON "language"."language_id" = "film"."language_id";


-- Query 3 - Customer and Payment JOIN with Filter

SELECT "payment"."amount" AS "AMOUNT",
       "payment"."payment_date" AS "PAYMENT DATE",
       "customer"."first_name" AS "FIRST NAME",
       "customer"."last_name" AS "LAST NAME"
FROM "payment"

JOIN "customer"
ON "customer"."customer_id" = "payment"."customer_id"

WHERE "payment"."amount" > 5;


-- Query 4 - Three-Table JOIN

SELECT "customer"."first_name",
       "customer"."last_name",
       "address"."address",
       "payment"."amount"
FROM "customer"

JOIN "payment"
ON "payment"."customer_id" = "customer"."customer_id"

JOIN "address"
ON "address"."address_id" = "customer"."address_id"

WHERE "payment"."amount" > 7;


-- Query 5 - NATURAL JOIN

SELECT "customer"."first_name",
       "customer"."last_name",
       "address"."address",
       "payment"."amount"
FROM "customer"

NATURAL JOIN "payment"

JOIN "address"
ON "address"."address_id" = "customer"."address_id"

WHERE "payment"."amount" > 7;


-- Query 6 - LEFT JOIN

SELECT "customer"."first_name",
       "customer"."last_name",
       "payment"."amount"
FROM "customer"

LEFT JOIN "payment"
ON "payment"."customer_id" = "customer"."customer_id";


-- Query 7 - RIGHT JOIN

SELECT "customer"."first_name",
       "customer"."last_name",
       "payment"."amount"
FROM "customer"

RIGHT JOIN "payment"
ON "payment"."customer_id" = "customer"."customer_id";


-- Query 8 - FULL JOIN

SELECT "customer"."first_name",
       "customer"."last_name",
       "payment"."amount"
FROM "customer"

FULL JOIN "payment"
ON "payment"."customer_id" = "customer"."customer_id";


-- Query 9 - Self JOIN

SELECT f1."title" AS "FILM 1",
       f2."title" AS "FILM 2",
       f1."rental_rate" AS "Rental Rate"
FROM "film" AS f1

JOIN "film" AS f2
ON f1."rental_rate" = f2."rental_rate"

WHERE f1."film_id" != f2."film_id"

LIMIT 10;


-- Query 10 - LEFT JOIN Failure Drill
-- WHERE removes rows where payment.amount is NULL.

SELECT "customer"."first_name" AS "First Name",
       "customer"."last_name" AS "Last Name",
       "payment"."amount" AS "Amount"
FROM "customer"

LEFT JOIN "payment"
ON "customer"."customer_id" = "payment"."customer_id"

WHERE "payment"."amount" > 7;


-- Query 11 - Corrected LEFT JOIN Failure Drill
-- Filtering payment inside ON preserves unmatched customer rows.

SELECT "customer"."first_name" AS "First Name",
       "customer"."last_name" AS "Last Name",
       "payment"."amount" AS "Amount"
FROM "customer"

LEFT JOIN "payment"
ON "customer"."customer_id" = "payment"."customer_id"
AND "payment"."amount" > 7;


-- Query 12 - Actor, Bridge Table, and Film JOIN

SELECT "actor"."first_name" AS "First Name",
       "actor"."last_name" AS "Last Name",
       "film"."title" AS "Title"
FROM "film"

JOIN "film_actor"
ON "film_actor"."film_id" = "film"."film_id"

JOIN "actor"
ON "actor"."actor_id" = "film_actor"."actor_id"

LIMIT 10;






