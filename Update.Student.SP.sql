CREATE TRIGGER copyStudent
ON STUDENT
AFTER UPDATE
AS
BEGIN
	SELECT * INTO copyStudent
	FROM student
END

CREATE PROCEDURE updateStudent(@studentID VARCHAR(5), @lastName VARCHAR(50))
AS
BEGIN
	DECLARE @count INT
	DECLARE @initial VARCHAR(1)
	SELECT @initial = s_mi FROM student
	SELECT @count = COUNT(s_id) FROM student
	IF (@count = 1)
		UPDATE STUDENT
		SET s_last = @lastName
		WHERE s_id = @studentID
	ELSE IF (@initial IS NULL)
		PRINT 'Needs to update middle initial before changing last name'	
	ELSE IF (@count = 0)
		PRINT 'Student not in the database'
END

EXEC dbo.updateStudent 'ER100', 'Ermatinger'
