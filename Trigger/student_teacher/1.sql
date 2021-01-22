create trigger s1 before insert on student for each row execute procedure fun1();

create or replace function fun1() returns trigger as '
begin
if new.s_no <=0 then 
raise exception '' student number cannot be less than or equal to zero'';
end if;
return new;
end ;'
language 'plpgsql';
