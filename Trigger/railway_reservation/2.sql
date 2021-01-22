create trigger check_age  after insert on passenger for each row execute procedure fun2();

create or replace function fun2() returns trigger as '
begin 
if new.age >5 then 
raise notice ''  age above 5 then charged will be full'';
else
raise notice '' charged will be half '';
end if;
return new;

end;'
language 'plpgsql';
