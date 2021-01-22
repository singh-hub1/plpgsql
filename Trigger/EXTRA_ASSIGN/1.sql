create  trigger t1 before insert or update on student for each row execute procedure fun1();

create or replace function fun1() returns trigger as '
declare 
begin
if length(new.contact_no)!=10 then 
raise exception '' contact number cannot be more than 10 digit '';
end if;
return new;
end;'
language 'plpgsql';
