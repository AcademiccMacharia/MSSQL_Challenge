CREATE FUNCTION GetOverdueDays(@LoanID INT) RETURNS INT
AS
BEGIN
  DECLARE @overdueDays INT;
  
  SELECT @overdueDays = DATEDIFF(DAY, Loans.ReturnDate, GETDATE())
  FROM Library.Loans
  WHERE LoanID = @LoanID;
  
  IF @overdueDays < 0
    SET @overdueDays = 0;
  
  RETURN @overdueDays;
END;