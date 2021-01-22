create or replace function fun3( d date) returns void as '
declare 
cnt int:=0;
c1 cursor for select count(*) from trip where depature_date=d;

begin

open c1;
loop
fetch c1 into cnt;
exit when not found;
raise notice ''  % '',cnt;
end loop;
close c1;

end;'
language 'plpgsql';
