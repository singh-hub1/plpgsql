create trigger t3 after insert on student for each row execute procedure fun4();

create or replace function fun3() returns trigger as '
declare
begin
if new.d_o_b> current_date then 
raise exception '' you cannnot enter future date '';
end if;
return new; 
end;'
  language 'plpgsql';
