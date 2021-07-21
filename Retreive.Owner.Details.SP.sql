create procedure retrieve_owner_details
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


	open itemcursor --runs command above and puts into temporary table
	fetch next from itemcursor --fetch records
	into @I_LOCATION_NUM, @I_UNIT_NUM, @I_FIRST_NAME, @I_LAST_NAME
	while @@FETCH_STATUS = 0 --while fetch status is true, keep looping

Begin
	print @I_LOCATION_NUM
	print @I_UNIT_NUM
	print @I_FIRST_NAME
	print @I_LAST_NAME
	fetch next from itemcursor --fetch records
	into @I_LOCATION_NUM, @I_UNIT_NUM, @I_FIRST_NAME, @I_LAST_NAME

End
close itemcursor
deallocate itemcursor

exec retrieve_owner_details '11'