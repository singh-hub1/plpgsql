create or replace function fun1(int) returns text as '
declare
rec bus%rowtype;
c text:='' \n'';
 begin
 for rec in select *from bus where r_no in (select r_no from route where r_no =$1)
 loop
 c:=c || rec.b_no || ''  '' || rec.capacity || '' '' || rec.depot_name || '' \n'';
 end loop;
 return c;
 end;'
 language 'plpgsql';
 
