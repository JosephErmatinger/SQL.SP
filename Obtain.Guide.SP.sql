create procedure Obtain_Guide
@I_GUIDE_NUM char(4)
as
declare @I_FIRST_NAME CHAR(15)
DECLARE @I_LAST_NAME CHAR(15)

Declare itemcursor CURSOR read_only
for
select guide_num, first_name, last_name
from GUIDE
where guide_num = @I_GUIDE_NUM

open itemcursor
fetch next from itemcursor
into @I_GUIDE_NUM, @I_FIRST_NAME, @I_LAST_NAME
while @@FETCH_STATUS = 0

Begin
print @I_GUIDE_NUM
print @I_FIRST_NAME
print @I_LAST_NAME
fetch next from itemcursor
into @I_GUIDE_NUM, @I_FIRST_NAME, @I_LAST_NAME

End
close itemcursor
deallocate itemcursor

exec Obtain_Guide 'AM01';