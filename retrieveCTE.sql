WITH BorrowedBooks AS (
  SELECT MemberID, COUNT(*) AS "Borrowers"
  FROM Library.Loans
  GROUP BY MemberID
)
SELECT Members.Name
FROM Library.Members
JOIN BorrowedBooks ON Members.MemberID = BorrowedBooks.MemberID
WHERE BorrowedBooks.BorrowedCount >= 3;