create procedure CHANGE_GUIDE
@I_GUIDE_NUM char(4),
@I_LAST_NAME CHAR(15)
as
UPDATE GUIDE
set LAST_NAME = @I_LAST_NAME
where GUIDE_num = @I_GUIDE_NUM;