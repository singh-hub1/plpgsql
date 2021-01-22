create or replace function fun1(text) returns int as '
declare
rec customer%rowtype;
begin
for rec in select customer.* from customer,branch,la,ternary where branch.b_name=$1 and la.lamt_req> la.lamt_appr and branch.b_id =ternary.b_id and customer.c_no=ternary.c_no and la.l_no=ternary.l_no
loop
raise notice '' %- %- %- %'',rec.c_no,rec.c_name,rec.c_addr,rec.city;
end loop;
return 1;
end;'
language 'plpgsql';

