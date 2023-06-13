CREATE VIEW overdueLoans AS
SELECT Books.Title, Members.Name, dbo.GetOverdueDays(Loans.LoanID) AS overdueDays
FROM Library.Loans
JOIN Library.Books ON Loans.BookID = Books.BookID
JOIN Library.Members ON Loans.MemberID = Members.MemberID
WHERE Loans.ReturnDate < GETDATE();

