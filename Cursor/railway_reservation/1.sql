create or replace function fun1(date,text) returns int as '
declare 
r1 passenger%rowtype;
r2 ticket%rowtype;
c1 cursor for select p_id from passenger where p_name=$2;
c2 cursor for select *from ticket where t_date=$1;

begin
open c1;
loop
fetch c1 into r1;
exit when not found;
open c2;
loop
fetch c2 into r2;
exit when not found;
if(r1.p_id=r2.p_id) then 
raise notice '' %- % '',r2.no_of_berths,r2.t_amt;
end if;
end loop;
close c2;
end loop;
close c1;
return 1;
end;'
language 'plpgsql';
