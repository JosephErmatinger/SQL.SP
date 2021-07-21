CREATE PROCEDURE ClearBalance(@CID INT, @SOID INT)
AS
SET NOCOUNT ON;
BEGIN
DECLARE @count INT 
DECLARE @numOrder INT
DECLARE @subTotal MONEY
SELECT @count = COUNT([CustomerID])
FROM [SalesLT].[Customer]
WHERE [CustomerID]= @CID
	IF @count = 1 
		BEGIN 
		SELECT @numOrder = COUNT([SalesOrderID])
		FROM [SalesLT].[SalesOrderHeader]
		WHERE [CustomerID]= @CID 
		AND [SalesOrderID] = @SOID
		IF @numOrder = 1 
    	BEGIN
    	select @subTotal = [SubTotal]
		FROM [SalesLT].[SalesOrderHeader]
		WHERE [CustomerID]= @CID 
		AND [SalesOrderID] = @SOID
		IF @subTotal < 100
          BEGIN
          UPDATE [SalesLT].[SalesOrderHeader]
          SET [Subtotal] = 0
          WHERE [SubTotal] < 100
          UPDATE [SalesLT].[SalesOrderHeader]
          SET [Status]   = 0 
          WHERE [SubTotal] < 100
          UPDATE[SalesLT].[SalesOrderHeader]
          SET [Comment]  = 'Order Cleared'
          WHERE [SubTotal] < 100
          PRINT 'Balance cleared'
          END
          ELSE
          PRINT 'Still active, no changes made' 
		END
		ELSE
		PRINT 'Order not found'
	END
	ELSE 
	PRINT 'Customer not found'
	END

EXECUTE ClearBalance 30072, 71776 --Balance Cleared
EXECUTE ClearBalance 29847, 71774 --Still active, no changes made
EXECUTE ClearBalance 29847, 71770 --Order not found
EXECUTE ClearBalance 999,   71774 --Customer not found