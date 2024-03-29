﻿create procedure I_CUSTOMER_NUM
@I_CUSTOMER_NUM char(3)
as
declare @I_CREDIT_LIMIT decimal(8,2)
declare @I_CUSTOMER_NAME char(35)

Declare itemcursor CURSOR read_only
for
select credit_limit, customer_name
from CUSTOMER
where customer_num = @I_CUSTOMER_NUM

open itemcursor
fetch next from itemcursor
into @I_CREDIT_LIMIT, @I_CUSTOMER_NAME
while @@FETCH_STATUS = 0

Begin
print @I_CREDIT_LIMIT
print @I_CUSTOMER_NAME
fetch next from itemcursor
into @I_CREDIT_LIMIT, @I_CUSTOMER_NAME

End
close itemcursor
deallocate itemcursor

exec I_CUSTOMER_NUM '126';