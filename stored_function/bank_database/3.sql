create or replace function fun3() returns int as '
declare
s money:=0;
begin
select into s sum(la.lamt_appr) from la where ldate>''02-02-2001'';
raise notice '' value of s is %'',s;
return 1;
end;'
language 'plpgsql';

