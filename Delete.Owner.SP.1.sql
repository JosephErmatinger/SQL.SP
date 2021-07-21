create procedure Delete_Owner
@I_OWNER_NUM char(5)
as
delete
from OWNER
where OWNER_NUM = @I_OWNER_NUM;
