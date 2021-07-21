create procedure Get_Details
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

open itemcursor
fetch next from itemcursor
into @I_LOCATION_NUM, @I_UNIT_NUM, @I_CONDO_FEE, @I_OWNER_NUM
while @@FETCH_STATUS = 0 

Begin
print @I_LOCATION_NUM
print @I_UNIT_NUM
print @I_CONDO_FEE
print @I_OWNER_NUM
fetch next from itemcursor
into @I_LOCATION_NUM, @I_UNIT_NUM, @I_CONDO_FEE, @I_OWNER_NUM
End
close itemcursor
deallocate itemcursor

exec Get_Details 675;