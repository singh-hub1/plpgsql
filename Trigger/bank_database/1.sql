create trigger t1 before update  on customer for each row execute procedure fun1();


create or replace function fun1() returns trigger as '
begin
if old.c_no !=new.c_no then 
raise exception'' customer number cannot be changed'';
end if; 
return old;

end; '
language 'plpgsql';
