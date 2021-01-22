create or replace function fun3(text) returns int as '
declare
rec teacher%rowtype;

begin
select into rec *from teacher where qualification=$1;
if not found then 
raise exception '' invalid qualification'';
end if;

for rec in select *from teacher where qualification=$1
loop
raise notice '' % % % % '',rec.t_no,rec.t_name,rec.qualification,rec.experence;
end loop;
return 1;
end;'
language 'plpgsql';
