create or replace function fun1(int) returns int as '
declare
rec salesman%rowtype;
c1 cursor for select *from salesman where deptno in(select deptno from dept where deptno::int=$1);

begin
open c1;
loop 
fetch c1 into rec;
exit when not found;
raise notice '' %-%-%-% '',rec.sno,rec.s_name,rec.start_year,rec.deptno;
end loop;
close c1;
return 1;
end;'
language 'plpgsql';

