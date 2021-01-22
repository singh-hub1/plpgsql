create trigger t3 before insert or update on ticket for each row execute procedure check_berths();

create or replace function check_berths() returns trigger as '
begin 
if new.no_of_berths >20 then 
raise exception  '' invalid data'' ;
end if;
return new;
end;'
language 'plpgsql';
