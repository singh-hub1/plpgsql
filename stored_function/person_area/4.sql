create or replace function fun4(text) returns text as '
declare
rec person%rowtype;
c text:=''\n'';

begin
for rec in select distinct person.* from person,area where 
(select extract (year from current_date))-(select extract(year from birth_date))>6 and person.a_name=$1
loop
c := c || rec.p_name || '' \n '';
end loop;
return c;
 end;'
 language 'plpgsql';
 
