create procedure add_row
@I_owner_num DECIMAL(2,0),
@I_FIRST_NAME char(15),
@I_LAST_NAME char(15),
@I_ADDRESS CHAR(25),
@I_CITY CHAR(25),
@I_POSTAL_CODE CHAR(5)
AS
INSERT INTO OWNER (owner_num, first_name, last_name, address, city, POSTAL_CODE)
VALUES (@I_owner_num, @I_FIRST_NAME, @I_LAST_NAME, @I_ADDRESS, @I_CITY, @I_POSTAL_CODE)