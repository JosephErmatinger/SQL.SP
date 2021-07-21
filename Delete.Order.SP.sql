create procedure DeleteOrder
@I_ORDER_NUM char(5)
as
delete
from orders
where order_num = @I_ORDER_NUM;