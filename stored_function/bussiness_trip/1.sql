create or replace function fun1() returns void as '
declare 
rec trip%rowtype;

begin
select into rec trip.* from trip where tno in(select tno from expense where amount=(select max(amount) from expense));

raise notice '' tno | from_city | to_city | depature_date | return_date | sno '';


raise notice ''  % | % | % | % | % | %  '',rec.tno , rec.from_city , rec.to_city, rec.depature_date , rec.return_date ,rec.sno;
end;'
language 'plpgsql';
