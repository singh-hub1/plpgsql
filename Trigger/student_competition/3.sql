create trigger t3 before insert or update on stud_comp for each row execute procedure fun3();

create or replace function fun3() returns trigger as '
begin 
if (new.year > current_date) then 
new.year=current_date;
return new;
end if;
return new;
end ;'
language 'plpgsql';
