alter procedure itemlist
@itemnum char(4)
as
Declare @ordernum char(5)
Declare @numordered char(3)

Declare itemcursor CURSOR read_only
for
select order_num, num_ordered
 from order_line
 where item_num = @itemnum

 open itemcursor
 fetch next from itemcursor into @ordernum, @numordered
 while @@FETCH_STATUS = 0
 Begin
 print @ordernum                   --business logic goes here
 print @numordered
 fetch next from itemcursor into @ordernum, @numordered
 End

 close itemcursor
 deallocate itemcursor

 select distinct (item_num) from order_line;

 exec itemlist 'FD11'