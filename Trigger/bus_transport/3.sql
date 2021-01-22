create trigger t3 before delete on driver for each row execute procedure save_pune();


create or replace function save_pune() returns trigger as '
begin
if old.address= ''pune'' then 
raise exception ''you cannot be delete'';
end if; 
return old;
end; '
language 'plpgsql';
