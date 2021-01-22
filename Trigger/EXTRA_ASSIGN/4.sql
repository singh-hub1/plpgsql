create trigger t4 after insert on student  for each row execute procedure fun5();

create or replace function fun4() returns trigger as '
begin
update student set insert_time=current_time where s_no=new.s_no;
return new;
end; '
language 'plpgsql';
