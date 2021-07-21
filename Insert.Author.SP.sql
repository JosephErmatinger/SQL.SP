CREATE PROCEDURE insertAuthor (@first varchar(50), @last varchar(50))
AS
BEGIN
	INSERT INTO Authors (FirstName, LastName) VALUES (@first, @last)
END

EXEC insertAuthor 'Susan', 'Jones';
EXEC insertAuthor 'Mike', 'Pence'; 


SELECT * FROM AUTHORS;
