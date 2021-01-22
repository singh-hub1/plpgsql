create or replace function fun3(area_type) returns text as '
declare
rec person%rowtype;
c text:=''\n'';
begin
for rec in select person.* from person,area where area.a_name=person.a_name and area.a_type=$1 order by area.a_name
loop
c := c || rec.p_no || ''  '' ||  rec.p_name || '' '' || rec.a_name || '' \n '';
end loop;
return c;
 end;'
 language 'plpgsql';
 
