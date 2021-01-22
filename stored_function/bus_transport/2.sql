create or replace function fun2(text,text) returns int as '
declare
rec record;

 begin
 for rec in select driver.* from driver,bus,bus_driver where bus_driver.shift=$1 and bus.depot_name=$2 and bus_driver.d_o_a>2001 and bus.b_no=bus_driver.b_no and driver.d_no=bus_driver.d_no
  loop
 raise notice '' % % % % % %'',rec.d_no,rec.d_name,rec.license_no,rec.address,rec.d_age,rec.salary;
 end loop;
 return 1;
 end;'
 language 'plpgsql';
 
