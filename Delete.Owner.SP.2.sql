create procedure delete_owner
@I_OWNER_NUM char(5)
as
delete
from OWNER
where OWNER_NUM = @I_OWNER_NUM