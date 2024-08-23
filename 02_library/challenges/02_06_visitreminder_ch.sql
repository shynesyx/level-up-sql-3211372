-- Prepare a report of the library patrons
-- who have checked out the fewest books.

SELECT
  count(LoanID) AS [Loan Count],
  p.FirstName, p.Email
FROM Loans AS l JOIN Patrons AS p
ON l.PatronID = p.PatronID
GROUP BY l.PatronID
ORDER BY "Loan Count" ASC
LIMIT 15;