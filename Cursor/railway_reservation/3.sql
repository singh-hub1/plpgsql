create or replace function ticket_1(date)returns int as '
declare 
c2 cursor for select sum(no_of_berths) from ticket where t_date=$1 group by(t_date);
cnt int:=0;

begin

open c2;
loop
fetch c2 into cnt;
exit when not found;

raise notice '' %'',cnt ;
end loop;

close c2;
return 1;
end;'
language 'plpgsql';
