create procedure ChangeDate
@I_ORDER_NUM char(5),
@I_ORDER_DATE date
as
UPDATE ORDERS
set order_date = @I_ORDER_DATE
where order_num = @I_ORDER_NUM;