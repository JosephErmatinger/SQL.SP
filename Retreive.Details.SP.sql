create procedure retrieve_details
@I_SQR_FT DECIMAL(5,0)
as
DECLARE @I_LOCATION_NUM DECIMAL(2,0)
DECLARE @I_UNIT_NUM CHAR(3)
DECLARE @I_CONDO_FEE DECIMAL(6,2)
DECLARE @I_OWNER_NUM CHAR(5)

Declare itemcursor CURSOR read_only
for
select location_num, unit_num, condo_fee, owner_num
from CONDO_UNIT
where SQR_FT = @I_SQR_FT

	open itemcursor --runs command above and puts into temporary table
	fetch next from itemcursor --fetch records
	into @I_LOCATION_NUM, @I_UNIT_NUM, @I_CONDO_FEE, @I_OWNER_NUM
	while @@FETCH_STATUS = 0 --while fetch status is true, keep looping

Begin
	print @I_LOCATION_NUM
	print @I_UNIT_NUM
	print @I_CONDO_FEE
	print @I_OWNER_NUM
	fetch next from itemcursor --fetch records
	into @I_LOCATION_NUM, @I_UNIT_NUM, @I_CONDO_FEE, @I_OWNER_NUM
End
close itemcursor
deallocate itemcursor

exec retrieve_details 675