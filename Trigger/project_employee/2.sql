create trigger check_dur before insert on project for each row execute procedure fun2();

create or replace function fun2() returns trigger as '
begin
if new.duration <=0 then  
raise exception '' duration must be greater than zero'';
end if;
return new;
end;'
language 'plpgsql';
