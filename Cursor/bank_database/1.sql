create or replace function fun1(text) returns int as '
declare 
r1 branch%rowtype;
r2 customer%rowtype;
r3 la%rowtype;
r4 ternary%rowtype;
c1 cursor for select b_id from branch where b_name=$1;
c2 cursor for select *from customer;
c3 cursor for select l_no from la where lamt_appr::money>''15000'';
c4 cursor for select *from ternary;

begin

open c1;
loop
fetch c1 into r1;
exit when not found;

open c4;
loop
fetch c4 into r4;
exit when not found;
if(r1.b_id=r4.b_id) then
open c3;
loop
fetch c3 into r3;
exit when not found;
if(r3.l_no=r4.l_no) then
open c2;
loop
fetch c2 into r2;
exit when not found;
if(r4.c_no=r2.c_no) then
raise notice ''%- %- %- % '',r2.c_no,r2.c_name,r2.c_addr,r2.city; 
end if;
end loop;
close c2;
end if;
end loop;
close c3; 
end if;
end loop;
close c4;
end loop;
close c1;
return 1;
end;'
language 'plpgsql';
