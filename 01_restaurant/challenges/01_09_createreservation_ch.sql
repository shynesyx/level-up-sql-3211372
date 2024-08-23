-- Create a reservation for a customer who may or may not
-- already be listed in our Customers table.

-- Use the following information:
-- Sam McAdams (smac@kinetecoinc.com), for 5 people
-- on August 12, 2022 at 6PM (18:00)

SELECT
  CustomerID, FirstName, LastName
FROM
  Customers
WHERE
  Email='smac@kinetecoinc.com';

INSERT INTO Customers
  (FirstName, LastName, Email)
VALUES
  ('Sam', 'McAdams', 'smac@kinetecoinc.com');

SELECT * FROM Reservations WHERE CustomerID=102;

INSERT INTO Reservations
  (CustomerID, Date, PartySize)
VALUES
  (102, '2022-08-12 18:00:00', 5);

SELECT
  c.FirstName, c.LastName,
  r.Date, r.PartySize
FROM
  Reservations AS r JOIN Customers AS c
  ON r.CustomerID = c.CustomerID
WHERE
  c.Email = 'smac@kinetecoinc.com';