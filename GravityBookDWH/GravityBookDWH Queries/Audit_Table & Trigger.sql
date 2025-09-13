
-- Create table on GravityBookDWH

CREATE TABLE Audit_LastOrder (
    FactBookOrderSK INT PRIMARY KEY,
    DateSK INT
);

-- Inssert te data into the columns

INSERT INTO Audit_LastOrder (FactBookOrderSK, DateSK)
SELECT TOP 1 FactBook_SK, Date_SK
FROM [dbo].FactBookPrice
ORDER BY FactBook_SK DESC;

-- select * from Audit_LastOrder;

-- Create trigger on FactBook table

CREATE TRIGGER trg_UpdateLastOrder
ON [dbo].FactBookPrice
AFTER INSERT
AS
BEGIN
    DECLARE @LatestOrderSK INT, @LatestDateSK int;

    SELECT TOP 1 
        @LatestOrderSK = FactBook_SK,
        @LatestDateSK = Date_SK
    FROM [dbo].FactBookPrice
    ORDER BY FactBook_SK DESC;

    UPDATE Audit_LatestOrder
    SET 
        FactBookOrderSK = @LatestOrderSK,
        DateSK = @LatestDateSK;
END;