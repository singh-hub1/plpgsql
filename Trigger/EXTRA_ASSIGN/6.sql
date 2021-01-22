create trigger t6 before delete on student for each row execute procedure fun6();

create or replace function fun6() returns trigger as '
declare 
begin 
if current_time > '' 13:12:00'' then 
raise exception '' cannot be delete '';
end if ;
return old;
end ;'
language 'plpgsql';
