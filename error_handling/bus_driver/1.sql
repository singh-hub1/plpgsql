create or replace function fun1(int,int) returns int as '
declare
rec driver%rowtype;

begin
select into rec *from driver,bus,bus_driver where bus.b_no=bus_driver.b_no and driver.d_no=bus_driver.d_no and bus.b_no=$1 and bus_driver.d_o_a=$2;

if not found then 
raise exception '' invalid input'';
end if;

for rec in select *from driver,bus,bus_driver where bus.b_no=bus_driver.b_no and driver.d_no=bus_driver.d_no and bus.b_no=$1 and bus_driver.d_o_a=$2
loop
raise notice '' % % % % '',rec.d_no,rec.d_name,rec.address,rec.d_age;
end loop;
return 1;
end;'
language 'plpgsql';
