create trigger ceck_date before insert on employee for each row execute procedure fun1();

create or replace function fun1() returns trigger as '
begin
if current_date < new.joining_date then 
raise exception '' error '';
end if;
return new;
end;'
language 'plpgsql';
