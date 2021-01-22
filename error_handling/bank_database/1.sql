create or replace function fun1(text) returns int as '
declare
rec la%rowtype;
cnt int:=0;
begin
select into rec *from la,customer,ternary where customer.c_no=ternary.c_no  and la.l_no=ternary.l_no and customer.c_name=$1;


if not found then 
raise exception '' invalid data input'';
end if;

 
for rec in select *from la,customer,ternary where customer.c_no=ternary.c_no  and la.l_no=ternary.l_no and customer.c_name=$1

loop
raise notice '' %-%-%-%'', rec.l_no , rec.lamt_req , rec.lamt_appr , rec.ldate;
cnt:=cnt+1;
end loop;
return cnt;
end;'
language 'plpgsql';
