create or replace function fun3(text) returns int as '
declare
rec ticket%rowtype;
cnt int:=0;
begin
select into rec *from ticket where t_no in(select t_no from train where t_name=$1);


if not found then 
raise exception '' invalid data input'';
end if;

 
for rec in select *from ticket where t_no in(select t_no from train where t_name=$1)

loop
raise notice '' %-%-%-%-%-%-%-%'', rec.ticket_no ,rec.t_no , rec.p_id , rec.bogie_no , rec.no_of_berths ,  rec.t_date   , rec.t_amt  , rec.status ;
cnt:=cnt+1;
end loop;
return cnt;
end;'
language 'plpgsql';
