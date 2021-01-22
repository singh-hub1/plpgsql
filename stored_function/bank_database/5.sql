create or replace function fun5() returns text as '
declare
rec customer%rowtype;
c text:='' \n '';

begin
 for rec in select customer.c_no,customer.c_name,customer.c_addr,customer.city from customer,branch,la,ternary where branch.b_id=ternary.b_id and customer.c_no=ternary.c_no and la.l_no=ternary.l_no group by(customer.c_no,customer.c_name,customer.c_addr,customer.city) having count(ternary.b_id)>1
 loop
 c:= c || rec.c_no || ''  '' || rec.c_name || ''  '' || rec.c_addr ||'' '' || rec.city || '' \n '';
 end loop;
 return c;
end;'
language 'plpgsql';

