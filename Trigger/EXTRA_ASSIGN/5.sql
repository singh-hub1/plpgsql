create trigger t5 before delete on student for each row execute procedure fun6();

create or replace function fun5() returns trigger as '
declare 
begin
raise exception '' you cannot be delete from student rows '';
end;'
language 'plpgsql';
