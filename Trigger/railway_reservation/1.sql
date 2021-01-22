create trigger t1 before insert on train for each row execute procedure check_bogie();

create or replace function check_bogie() returns trigger as '
begin 
if new.boogie_capacity >30 then 
raise exception  '' invalid data'' ;
end if;
return new;
end;'
language 'plpgsql';
