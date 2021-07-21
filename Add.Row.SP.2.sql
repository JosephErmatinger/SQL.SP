create procedure add_row
@I_ORDER_NUM char(5),
@I_ORDER_DATE date,
@I_CUSTOMER_NUM char(3)
AS
INSERT INTO ORDERS (order_num, order_date, customer_num)
VALUES (@I_ORDER_NUM, @I_ORDER_DATE, @I_CUSTOMER_NUM)