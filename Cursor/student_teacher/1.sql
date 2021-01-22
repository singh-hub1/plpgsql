create or replace function fun1(int) returns int as '
declare
rec record;
cnt int:=0;
c1 cursor for select s_name ,t_name,marks from student,teacher,st_te where student.s_no=st_te.s_no and teacher.t_no=st_te.t_no and st_te.subject=''dbms'' and student.s_no=$1;

begin
open c1;
loop 

fetch c1 into rec;
exit when not found;
raise notice '' % - % - % '',rec.s_name,rec.t_name,rec.marks;
cnt:=cnt+1;
end loop;
close c1;
return cnt;
end;'
language 'plpgsql';

