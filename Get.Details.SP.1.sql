create procedure Get_Details
@I_CUSTOMER_NUM CHAR(4)
as
DECLARE @I_RESERVATION_ID CHAR(7)
DECLARE @I_TRIP_ID DECIMAL(3,0)
DECLARE @I_NUM_PERSONS DECIMAL(3,0)
DECLARE @I_TRIP_PRICE DECIMAL(6,2)

Declare itemcursor CURSOR read_only
for
select reservation_id, trip_id, num_persons, trip_price
from RESERVATION
where customer_num = @I_CUSTOMER_NUM

open itemcursor
fetch next from itemcursor
into @I_RESERVATION_ID, @I_TRIP_ID, @I_NUM_PERSONS, @I_TRIP_PRICE
while @@FETCH_STATUS = 0

Begin
print @I_RESERVATION_ID
print @I_TRIP_ID
print @I_NUM_PERSONS
print @I_TRIP_PRICE
fetch next from itemcursor --fetch records
into @I_RESERVATION_ID, @I_TRIP_ID, @I_NUM_PERSONS, @I_TRIP_PRICE
End
close itemcursor
deallocate itemcursor

exec Get_Details '101';
