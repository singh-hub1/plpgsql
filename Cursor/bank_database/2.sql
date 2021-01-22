create or replace function fun2(text) returns int as '
declare 
r1 branch%rowtype;
r2 ternary%rowtype;
c1 cursor for select b_id from branch where b_name=$1;
c2 cursor for select *from ternary;
cnt int:=0;
c int;
begin
open c1;
loop
fetch c1 into r1;
exit when not found;
open c2;

loop
fetch c2 into r2;
exit when not found;
if(r1.b_id=r2.b_id) then 
select into cnt count(c_no) from ternary group by(b_id);
raise notice '' %'', cnt;

end if;

end loop;

close c2;
end loop;

close c1;

return 1;
end;'
language 'plpgsql';
