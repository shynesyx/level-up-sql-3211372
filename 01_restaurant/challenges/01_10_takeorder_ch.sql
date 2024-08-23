-- Enter a customer's delivery order into our database, 
-- and provide the total cost of the items ordered.

-- Use this order information:
-- Customer: Loretta Hundey, at 6939 Elka Place
-- Items: 1 House Salad, 1 Mini Cheeseburgers, and
-- 1 Tropical Blue Smoothie
-- Delivery date and time: September 20, 2022 @ 2PM (14:00)
-- There are no taxes or other fees.


-- Get the CustomerID by full name and address
SELECT CustomerID FROM Customers
WHERE
  FirstName='Loretta' AND
  LastName='Hundey' AND
  Address LIKE '%Elka Place';

-- Get the DishID by the dish name
SELECT DishID FROM Dishes
WHERE Name LIKE 'House%';

-- Add order
INSERT INTO Orders
  (CustomerID, OrderDate)
VALUES
  (
    (SELECT CustomerID FROM Customers
      WHERE
        FirstName='Loretta' AND
        LastName='Hundey' AND
        Address LIKE '%Elka Place'),
    '2022-09-20 14:00:00'
  );

-- Get OrderID
SELECT OrderID FROM Orders
ORDER BY OrderID DESC
LIMIT 1;

-- Check for uniqueness for the dish names
SELECT * FROM Dishes
WHERE
  Name LIKE 'House%' OR
  Name LIKE 'Mini%' OR
  Name LIKE 'Tropical%';

-- Add items to the order
INSERT INTO OrdersDishes
  (OrderID, DishID)
VALUES
  (
    (SELECT OrderID FROM Orders
      ORDER BY OrderID DESC
      LIMIT 1
    ),
    (SELECT DishID FROM Dishes WHERE Name LIKE 'House%')
  ),
  (
    (SELECT OrderID FROM Orders
      ORDER BY OrderID DESC
      LIMIT 1
    ),
    (SELECT DishID FROM Dishes WHERE Name LIKE 'Mini%')
  ),
  (
    (SELECT OrderID FROM Orders
      ORDER BY OrderID DESC
      LIMIT 1
    ),
    (SELECT DishID FROM Dishes WHERE Name LIKE 'Tropical%')
  );

-- Check the dishes on the order
SELECT o.OrderID, d.Name
FROM OrdersDishes AS o JOIN Dishes AS d
ON d.DishID=o.DishID
WHERE o.OrderID=(SELECT OrderID FROM Orders
      ORDER BY OrderID DESC
      LIMIT 1
    );

-- Get the price
SELECT sum(d.Price) AS [Order Total]
FROM OrdersDishes AS o JOIN Dishes AS d
ON o.DishID = d.DishID
WHERE o.OrderID = (SELECT OrderID FROM Orders
      ORDER BY OrderID DESC
      LIMIT 1
    );