create trigger t3 before insert  on customer for each row execute procedure fun3();


create or replace function fun3() returns trigger as '
begin
if (new.c_no <=0 or new.c_name is NULL) then  
raise exception  ''plzz enter valid data'';
end if; 
return new;
end; '
language 'plpgsql';
