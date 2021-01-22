create trigger t2 before insert on student for each row execute procedure fun2();

create or replace function fun2() returns trigger as '
declare 
no int;
begin
  select into no count(*) from student;
  if no >=5 then 
  raise exception '' you dont allow insert more than 5 rows '';
  end if;
  return new;
  end;'
  language 'plpgsql';
