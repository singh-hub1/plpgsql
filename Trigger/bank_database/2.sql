create trigger t2 before insert  on la for each row execute procedure fun2();


create or replace function fun2() returns trigger as '
begin
if new.lamt_appr > new.lamt_req then 
raise exception'' plzz enter valid lamt_appr'';
end if; 
return new;

end; '
language 'plpgsql';
