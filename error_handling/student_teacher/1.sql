create or replace function fun1(text) returns int as '
declare 
cnt int:=0;
begin
select into cnt count(st_te.t_no) from student,teacher,st_te where student.s_no=st_te.s_no and teacher.t_no=st_te.t_no and student.s_name= $1group by(st_te.s_no); 

if not found then 
raise exception '' no student is found '';
end if;
return cnt;
end;'
language 'plpgsql';
