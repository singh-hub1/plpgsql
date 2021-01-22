create trigger old_new1 before insert on teacher for each row execute procedure fun3();

create or replace function fun3() returns trigger as '
begin 
if new.experence<2 then 
raise exception '' experence should be minimum 2 years'';
end if;
return new;
end;'
language 'plpgsql';
