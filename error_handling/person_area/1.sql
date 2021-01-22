create or replace function fun1(text) returns int as '
declare
cnt int;
name alias for $1;
begin
select into cnt count(p_no) from person where a_name=name;
if cnt=0 then 
raise exception ''invalid area name %'',name;
end if;

return cnt;
end;'
language 'plpgsql';
