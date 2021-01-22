create or replace function fun2(text) returns int as '
declare 
cnt int:=0;
begin
select into cnt count(st_te.s_no) from student,st_te where student.s_no=st_te.s_no and st_te.subject=$1 group by(st_te.subject,st_te.s_no);


if not found then 
raise exception '' no subject is found '';
end if;
return cnt;
end;'
language 'plpgsql';
