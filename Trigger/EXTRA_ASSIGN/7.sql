create trigger t7 after delete on student for each row execute procedure fun7();

create or replace function fun7() returns trigger as '
declare 
begin 
insert into student1 values(old.s_no,old.s_name,old.s_addr,old.contact_no,old.d_o_b,current_time);
return old;
end;'
language 'plpgsql';
