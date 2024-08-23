-- Create two reports about book statistics.

-- Report 1: Show how many titles were published 
-- in each year.

-- Report 2: Show the five books that have been
-- checked out the most.

SELECT
  count(DISTINCT Title) AS [Published Count],
  Published
  -- Published, GROUP_CONCAT(DISTINCT(Title))
  -- GROUP_CONCAT is only available for some SQL dialects
FROM Books
GROUP BY Published
ORDER BY "Published Count" DESC;

SELECT count(l.LoanID) AS [Loan Count], b.Title
FROM Loans AS l
JOIN Books AS b ON l.BookID = b.BookID
GROUP BY b.Title
ORDER BY "Loan Count" DESC
LIMIT 5;