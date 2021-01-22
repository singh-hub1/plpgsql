create or replace function fun3() returns int as '
declare 
r1 la%rowtype;
c1 cursor for select *from la;
cnt int;
begin
open c1;
loop
fetch c1 into r1;
exit when not found;
update la set lamt_appr=lamt_appr+(lamt_appr*35)/100 where current of c1;

end loop;

close c1;
return 1;
end;'
language 'plpgsql';
