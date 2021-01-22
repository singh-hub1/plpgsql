create or replace function fun1(date) returns int as '
declare
rec train%rowtype;
cnt int:=0;
begin
select into rec *from train where t_no in(select t_no from ticket where status=''c'' and t_date=$1 group by(status,t_no));


if not found then 
raise exception '' invalid date'';
end if;

 
for rec in select *from train where t_no in(select t_no from ticket where status=''c'' and t_date=$1 group by(status,t_no))

loop
raise notice '' %-%-%-%-%-%-%-%'',rec.t_no , rec.t_name , rec.depart_time  ,rec.arrival_time, rec.source_stn, rec.dest_stn, rec.no_of_res_boogies , rec.boogie_capacity;
cnt:=cnt+1;
end loop;
return cnt;
end;'
language 'plpgsql';
