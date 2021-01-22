create or replace function fun3(text) returns int as '
declare
rec record;

c1 cursor for select cost,i_desc from items where i_no in(select i_no from stores_items where s_id in(select s_id from stores where location=$1));

begin
open c1;
loop 
fetch c1 into rec;
exit when not found;
raise notice '' % - %'',rec.cost,rec.i_desc;

end loop;
close c1;
return 1;
end;'
language 'plpgsql';

