create procedure RESERVATION_DETAILS
@I_RESERVATION_ID char(7)
as
declare @I_NUM_PERSONS decimal(3,0)
declare @I_CUSTOMER_NUM char(4)
declare @I_LAST_NAME char(30)

Declare itemcursor CURSOR read_only
for
select r.num_persons, r.customer_num, c.last_name
from CUSTOMER c, RESERVATION r
where r.customer_num = c.customer_num
and reservation_id = @I_RESERVATION_ID

open itemcursor
fetch next from itemcursor
into @I_NUM_PERSONS, @I_CUSTOMER_NUM, @I_LAST_NAME
while @@FETCH_STATUS = 0

Begin
print @I_NUM_PERSONS
print @I_CUSTOMER_NUM
print @I_LAST_NAME
fetch next from itemcursor
into @I_NUM_PERSONS, @I_CUSTOMER_NUM, @I_LAST_NAME

End
close itemcursor
deallocate itemcursor
