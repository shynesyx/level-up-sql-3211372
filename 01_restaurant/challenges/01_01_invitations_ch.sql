-- Generate a list of customer information.

-- Show their first name, last name, and email address.
-- Sort the list of results by last name.

SELECT
  c.FirstName,
  c.LastName,
  c.Email
FROM
  Customers AS c
ORDER BY
  c.LastName