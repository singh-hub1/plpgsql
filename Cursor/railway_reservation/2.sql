create or replace function ticket(date)returns int as '
declare 
r1 train%rowtype;
r2 ticket%rowtype;
c1 cursor for select t_no from train;
c2 cursor for select t_no from ticket where t_date=$1 and status=''c'';

begin
open c1;
loop
fetch c1 into r1;
exit when not found;
open c2;
loop
fetch c2 into r2;
exit when not found;
if(r1.t_no=r2.t_no) then 
raise notice '' % - % - % -% - % - % - % - % '', r1.t_no , r1.t_name , r1.depart_time , r1.arrival_time , r1.source_stn , r1.dest_stn , r1.no_of_res_boogies , r1.boogie_capacity ;
end if;
end loop;
close c2;
end loop;

close c1;
return 1;
end;'
language 'plpgsql';
