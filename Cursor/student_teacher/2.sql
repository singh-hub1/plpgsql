create or replace function fun2(class text) returns int as '
declare
rec record;
cnt int:=0;
c1 cursor for select s_name,subject,marks from student,st_te where  student.s_no=st_te.s_no and s_class=class;


begin
open c1;
loop 

fetch c1 into rec;
exit when not found;
raise notice '' % - % - % '',rec.s_name,rec.subject,rec.marks;
cnt:=cnt+1;
end loop;
close c1;
return cnt;
end;'
language 'plpgsql';

