create trigger old_new before update on student for each row execute procedure fun2();

create or replace function fun2() returns trigger as '
begin 
raise notice '' the new s_class value is=% '',new.s_class;
raise notice '' updation is successfully'';
return new;
end;'
language 'plpgsql';
