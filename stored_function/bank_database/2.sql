create or replace function fun2(text) returns int as '
declare
rec record;
begin
for rec in select distinct customer.c_name,la.l_no,la.lamt_appr from customer,la,ternary,branch where branch.b_name=$1 and branch.b_id=ternary.b_id and customer.c_no=ternary.c_no and la.l_no=ternary.l_no and la.ldate>=''02-04-2005''
loop
raise notice '' %- %- %'',rec.c_name,rec.l_no,rec.lamt_appr;
end loop;
return 1;
end;'
language 'plpgsql';

