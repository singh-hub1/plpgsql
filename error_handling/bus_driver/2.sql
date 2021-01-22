create or replace function fun2(text) returns int as '
declare
rec record;
cnt int:=0;
begin
select into rec  bus_driver.d_o_a,bus.b_no from bus_driver,bus,driver where bus.b_no=bus_driver.b_no and driver.d_no=bus_driver.d_no and driver.d_name=$1;

if not found then 
raise exception '' invalid input'';
end if;

 raise notice '' d_o_a || bus_no '';
for rec in  select bus_driver.d_o_a,bus.b_no from bus_driver,bus,driver where bus.b_no=bus_driver.b_no and driver.d_no=bus_driver.d_no and driver.d_name=$1
loop
raise notice '' % -%'',rec.d_o_a,rec.b_no;
cnt:=cnt+1;
end loop;
return cnt;
end;'
language 'plpgsql';
