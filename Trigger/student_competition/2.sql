create trigger t2 before insert on stud_comp for each row execute procedure fun2();

create or replace function fun2() returns trigger as '
begin 
if  new.year > current_date then 
raise exception '' plzz enter valid year '';
end if;
return new;
end ;'
language 'plpgsql';
