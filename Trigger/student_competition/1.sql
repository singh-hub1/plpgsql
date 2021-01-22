create trigger t1 before insert on stud_comp for each row execute procedure fun1();

create or replace function fun1() returns trigger as '
begin 
if new.rank >3 then 
raise exception '' plzz enter valid rank '';
end if;
return new;
end ;'
language 'plpgsql';
