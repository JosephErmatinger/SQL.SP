create procedure update_last_name
@I_OWNER_NUM char(5),
@I_LAST_NAME CHAR(25)
as
UPDATE OWNER

set LAST_NAME = @I_LAST_NAME
where OWNER_num = @I_OWNER_NUM