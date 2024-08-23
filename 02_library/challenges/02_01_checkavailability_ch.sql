-- Determine how many copies of the book 'Dracula'
-- are available for library patrons to borrow.

SELECT *
FROM Books
WHERE Title = 'Dracula'


SELECT *
FROM Loans AS l JOIN Books AS b
ON l.BookID = b.BookID
WHERE
  b.Title = 'Dracula' AND
  l.ReturnedDate is NULL


SELECT
  (SELECT count(Title)
    FROM Books
    WHERE Title = 'Dracula') - 
  (SELECT count(LoanID)
    FROM Loans AS l JOIN Books AS b
    ON l.BookID = b.BookID
    WHERE
      b.Title = 'Dracula' AND
      l.ReturnedDate is NULL)
  AS [Copies Available]