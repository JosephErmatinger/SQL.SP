create procedure tab_csv
@TableVal as varchar(15)
as
Begin
select 'rtrim (' + c.name + ') + ' + '''' + ',' + '''' + ' + '
from sys.tables t, sys.columns c
where t.object_id = c.object_id
and t.name = @TableVal
order by c.column_id
End

exec tab_csv orders