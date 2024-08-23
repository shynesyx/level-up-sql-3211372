-- Update information in the database.

-- Set Cleo Goldwater's favorite dish to
-- the Quinoa Salmon Salad.

-- Check CustomerID by name
SELECT *
FROM Customers
WHERE FirstName='Cleo';

-- Check DishID by name
SELECT *
FROM Dishes
WHERE Name = 'Quinoa Salmon Salad';

-- Upate Cleo's favorite dish
UPDATE Customers
SET FavoriteDish = (SELECT DishID
    FROM Dishes
    WHERE Name = 'Quinoa Salmon Salad')
WHERE CustomerID = (SELECT CustomerID
    FROM Customers
    WHERE FirstName='Cleo');

-- Check the result
SELECT
  c.FirstName, c.LastName,
  d.Name AS [Favorite Dish]
FROM Customers AS c JOIN Dishes AS d
ON c.FavoriteDish = d.DishID
WHERE c.FirstName = 'Cleo'