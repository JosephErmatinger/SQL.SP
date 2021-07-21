﻿create procedure Get_Owner
@I_OWNER_NUM char(5)
as
DECLARE @I_FIRST_NAME CHAR(15)
DECLARE @I_LAST_NAME CHAR(15)

Declare itemcursor CURSOR read_only
for
select owner_num, first_name, last_name
from OWNER
where owner_num = @I_OWNER_NUM

open itemcursor
fetch next from itemcursor 
into @I_OWNER_NUM, @I_FIRST_NAME, @I_LAST_NAME
while @@FETCH_STATUS = 0

Begin
print @I_OWNER_NUM
print @I_FIRST_NAME
print @I_LAST_NAME
fetch next from itemcursor
into @I_OWNER_NUM, @I_FIRST_NAME, @I_LAST_NAME

End
close itemcursor
deallocate itemcursor

exec Get_Owner 'AD057'