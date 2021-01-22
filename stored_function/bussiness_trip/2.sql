
create or replace  function fun2() returns int as '
declare 
c int;

begin

select into c  count(tno) from trip where from_city=''goa'' and to_city=''delhi'';
return c;

end;'
language 'plpgsql';
