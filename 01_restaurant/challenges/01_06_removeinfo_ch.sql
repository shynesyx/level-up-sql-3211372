-- Remove incorrect information from the database.

-- A customer named Norby has notified us he won't 
-- be able to keep his Friday reservation. 
-- Today is July 24, 2022.

SELECT
  *
FROM
  Reservations AS r
JOIN
  Customers AS c
ON
  r.CustomerID=c.CustomerID
WHERE
  c.FirstName='Norby' AND r.Date > '2022-07-24';

DELETE FROM Reservations WHERE ReservationID=2000;

-- to prevent data inconsistency in more complex DB
UPDATE Reservations 
SET Date=NULL
WHERE ReservationID=2000;