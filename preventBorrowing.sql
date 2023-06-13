CREATE OR ALTER TRIGGER prevent_exceeding_borrow_limit_trigger
ON Loans
INSTEAD OF INSERT
AS
BEGIN
    IF (SELECT COUNT(*) FROM Loans WHERE MemberID IN (SELECT MemberID FROM inserted) AND ReturnDate IS NULL) + (SELECT COUNT(*) FROM inserted) > 3
    BEGIN
        THROW 50000, 'Maximum borrow limit reached for this member.', 1;
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        INSERT INTO Loans (BookID, MemberID, LoanDate, ReturnDate)
        SELECT BookID, MemberID, LoanDate, ReturnDate FROM inserted;
    END
END;
GO