create trigger t1 after insert or update on driver for each row execute procedure age_check();


create or replace function age_check() returns trigger as '
begin
if new.d_age<18 or new.d_age>50 then
raise exception''Invalid Age % '',new;
end if; 
return new;
end; '
language 'plpgsql';
