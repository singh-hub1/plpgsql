create or replace function fun4(text) returns text as '
declare
rec driver%rowtype;
c text:='' \n'';

 begin
 for rec in select *from driver,bus,bus_driver where bus.depot_name=$1 and driver.d_age >=20 and bus.b_no=bus_driver.b_no and driver.d_no=bus_driver.d_no
 loop
 c:=c || rec.d_no || ''  '' || rec.d_name || '' '' || '' \n'';
 end loop;
 return c;
 end;'
 language 'plpgsql';
 
