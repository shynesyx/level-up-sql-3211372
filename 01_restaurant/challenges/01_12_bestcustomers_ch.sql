-- Identify a few customers who have ordered delivery
-- from the restaurant the most often, so we can send
-- them a promotional coupon.

SELECT
  c.FirstName, c.LastName, c.Email,
  count(o.OrderID) AS [Order Count]
FROM Orders AS o JOIN Customers AS c
ON o.CustomerID = c.CustomerID
GROUP BY o.CustomerID
ORDER BY "Order Count" DESC
LIMIT 6;