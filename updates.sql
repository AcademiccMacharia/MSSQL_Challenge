CREATE TRIGGER updateBookStatus
ON Library.Loans
AFTER INSERT, UPDATE
AS
BEGIN
  
  UPDATE Library.Books
  SET Status = 'Loaned'
  WHERE BookID IN (SELECT BookID FROM inserted);
  
  
  UPDATE Library.Books
  SET Status = 'Available'
  WHERE BookID IN (SELECT BookID FROM deleted);
END;