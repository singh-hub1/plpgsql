create or replace function fun2(text,date) returns int as '
declare
rec record;
cnt int:=0;
begin
select into rec no_of_berths,t_amt from ticket,passenger where ticket.p_id=passenger.p_id and passenger.p_name=$1 and ticket.t_date=$2;


if not found then 
raise exception '' invalid data input'';
end if;

 
for rec in select no_of_berths,t_amt from ticket,passenger where ticket.p_id=passenger.p_id and passenger.p_name=$1 and ticket.t_date=$2

loop
raise notice '' %--%'',rec.no_of_berths,rec.t_amt;
cnt:=cnt+1;
end loop;
return cnt;
end;'
language 'plpgsql';
