create or replace function fun2() returns void as '
declare 
rec trip%rowtype;
c1 cursor for select trip.* from trip where tno in(select tno from expense where amount=(select max(amount) from expense));

begin
raise notice '' tno | from_city | to_city | depature_date | return_date | sno '';
open c1;
loop
fetch c1 into rec;
exit when not found;
raise notice ''  % | % | % | % | % | %  '',rec.tno , rec.from_city , rec.to_city, rec.depature_date , rec.return_date ,rec.sno;
end loop;
close c1;

end;'
language 'plpgsql';
