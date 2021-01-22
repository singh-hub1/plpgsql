create or replace function fun3(date) returns int as '
declare
cnt int;
begin
select into cnt count(l_no) from la where ldate>$1;

if not found then
raise exception '' invalid data input'';
end if;

return cnt;
end;'
language 'plpgsql';
