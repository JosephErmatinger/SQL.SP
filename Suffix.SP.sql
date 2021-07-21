CREATE PROC sp_suffix (@id INT, @suffix VARCHAR(3))
AS
BEGIN
DECLARE @count INT
DECLARE @mid VARCHAR(3)
SELECT @count = [dbo].[f_search](@id)
--see if I found him
	IF(@count = 1)
		--I found him
		BEGIN
		--check the middle name
		SELECT @mid = MiddleName
		FROM SalesLT.Customer
		WHERE CustomerID = @id;
		--check if the middle name is not NULL
		IF @mid IS NOT NULL
		--he has a middle name so I can proceed with the update
		BEGIN
			UPDATE SalesLT.Customer
			SET Suffix = @suffix
			where CustomerID = @id
			PRINT 'Good Job --- Update completed'
		END
		ELSE -- there is no middle name
			PRINT 'No middle name --- no update'
	END
	ELSE -- He wasn't found
	PRINT 'Customer not found'
	END
	
CREATE FUNCTION f_search(@id INT)
RETURNS INT
AS
BEGIN
DECLARE @count INT
SELECT @count = COUNT(CustomerID)
FROM SalesLT.Customer
WHERE CustomerID = @id
RETURN @count
END

SELECT * FROM SalesLT.CUSTOMER

EXEC sp_suffix 3, 'Jr.'