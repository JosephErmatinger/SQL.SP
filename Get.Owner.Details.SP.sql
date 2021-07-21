create procedure Get_Owner_Details
@I_CONDO_ID char(5)
as
DECLARE @I_LOCATION_NUM DECIMAL(2,0)
DECLARE @I_UNIT_NUM CHAR(3)
DECLARE @I_FIRST_NAME CHAR(25)
DECLARE @I_LAST_NAME CHAR(25)

Declare itemcursor CURSOR read_only
for
select c.location_num, c.unit_num, o.first_name, o.last_name
from CONDO_UNIT c, OWNER o
where condo_id = @I_CONDO_ID
and c.owner_num = o.owner_num

open itemcursor
fetch next from itemcursor
into @I_LOCATION_NUM, @I_UNIT_NUM, @I_FIRST_NAME, @I_LAST_NAME
while @@FETCH_STATUS = 0

Begin
print @I_LOCATION_NUM
print @I_UNIT_NUM
print @I_FIRST_NAME
print @I_LAST_NAME
fetch next from itemcursor
into @I_LOCATION_NUM, @I_UNIT_NUM, @I_FIRST_NAME, @I_LAST_NAME

End
close itemcursor
deallocate itemcursor

exec Get_Owner_Details '11';

--4C
create procedure Insert_Row
@I_owner_num DECIMAL(2,0),
@I_FIRST_NAME char(15),
@I_LAST_NAME char(15),
@I_ADDRESS CHAR(25),
@I_CITY CHAR(25),
@I_POSTAL_CODE CHAR(5)
AS
INSERT INTO OWNER (owner_num, first_name, last_name, address, city, POSTAL_CODE)
VALUES (@I_owner_num, @I_FIRST_NAME, @I_LAST_NAME, @I_ADDRESS, @I_CITY, @I_POSTAL_CODE);
