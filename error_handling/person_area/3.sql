create or replace function fun3(int) returns int as '
declare
rec person%rowtype;
cnt int;

begin
select into rec *from person where (select extract(month from birth_date))=$1;
if not found then 
raise exception '' invalid month you enter '';
end if;

for rec in select *from person where (select extract(month from birth_date))=$1
loop
raise notice '' % % % % % '',rec.p_no,rec.p_name,rec.birth_date,rec.income,rec.a_name;
end loop;
return 1;
end;'
language 'plpgsql';
