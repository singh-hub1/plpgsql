create or replace function fun2(area_type) returns money as '
declare
s money;

begin
select into s sum(income) where a_name in(select a_name from area where a_type =$1);

if s=0 then 
raise exception ''invalid area_type name %'',$1;
end if;

return s;
end;'
language 'plpgsql';
