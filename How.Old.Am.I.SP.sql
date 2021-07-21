create procedure how_old_am_I
@Birthday datetime
as
Begin

select floor(convert(int, getdate()- @Birthday) /365.25)

End;

exec how_old_am_I '4/10/1980'