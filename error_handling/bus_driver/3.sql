create or replace function fun3(int) returns int as '
declare
rec bus%rowtype;
cnt int:=0;
begin
select into rec  *from bus where r_no in(select r_no from route where r_no=$1);

if not found then 
raise exception '' invalid input'';
end if;

 
for rec in select *from bus where r_no in(select r_no from route where r_no=$1)
loop
raise notice '' % -%-%-%'',rec.b_no,rec.capacity,rec.depot_name,rec.r_no;
cnt:=cnt+1;
end loop;
return cnt;
end;'
language 'plpgsql';
