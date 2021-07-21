create procedure ORDER_DETAILS
@I_ORDER_NUM char(5)
as
declare @I_ORDER_DATE date
declare @I_CUSTOMER_NAME char(35)

Declare itemcursor CURSOR read_only
for
select order_date, customer_name, order_num
from CUSTOMER, ORDERS
where ORDER_NUM = @I_ORDER_NUM


	open itemcursor --runs command above and puts into temporary table
	fetch next from itemcursor --fetch records
	into @I_ORDER_DATE, @I_CUSTOMER_NAME, @I_ORDER_NUM
	while @@FETCH_STATUS = 0 --while fetch status is true, keep looping

Begin
	print @I_ORDER_DATE
	print @I_CUSTOMER_NAME
	print @I_ORDER_NUM
	fetch next from itemcursor --fetch records
	into @I_ORDER_DATE, @I_CUSTOMER_NAME, @I_ORDER_NUM

End
close itemcursor
deallocate itemcursor

EXEC ORDER_DETAILS '51608'