create trigger t2 before delete on bus for each row execute procedure bus_check();


create or replace function bus_check() returns trigger as '
begin
if old.capacity>100 then 
raise notice'' not possible'';
return NULL;
end if; 
return old;
end; '
language 'plpgsql';
