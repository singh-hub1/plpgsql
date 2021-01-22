create or replace function fun2(text) returns int as '
declare
rec customer%rowtype;
cnt int:=0;
begin
select into rec *from customer where c_no in(select c_no from ternary where b_id in(select b_id from branch where b_name=$1));

if not found then 
raise exception '' invalid data input'';
end if;

 
for rec in select *from customer where c_no in(select c_no from ternary where b_id in(select b_id from branch where b_name=$1))

loop
raise notice '' %-%-%-%'', rec.c_no , rec.c_name , rec.c_addr , rec.city;
cnt:=cnt+1;
end loop;
return cnt;
end;'
language 'plpgsql';
