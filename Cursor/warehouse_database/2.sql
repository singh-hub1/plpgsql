create or replace function fun2() returns int as '
declare
rec record;

c1 cursor for select c_name from customer where c_no in(select c_no from orders where o_no in(select o_no from items _orders where i_no in(select i_no from items where cost between ''50'' and ''60'' )));

begin
open c1;
loop 
fetch c1 into rec;
exit when not found;
raise notice '' % '',rec.c_name ;

end loop;
close c1;
return 1;
end;'
language 'plpgsql';

