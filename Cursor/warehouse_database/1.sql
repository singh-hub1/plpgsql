create or replace function fun1(text) returns int as '
declare
rec warehouse%rowtype;

c1 cursor for select * from warehouse where city in(select city from cities where city=$1);

begin
open c1;
loop 
fetch c1 into rec;
exit when not found;
raise notice '' % - % - % - % '',rec.w_id,rec.w_name,rec.location,rec.city;

end loop;
close c1;
return 1;
end;'
language 'plpgsql';

