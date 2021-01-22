create trigger delu before delete on employee for each row execute procedure fun3();

create or replace function fun3() returns trigger as '
begin
raise notice '' deleted data are'';
raise notice '' % % % % '',old.e_no,old.e_name,old.qualification,old.joining_date;
return old;
end;'
language 'plpgsql';
