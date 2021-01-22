create or replace function fun1(text) returns int as '
declare
cnt int:=0;
t text;
c1 cursor for select count(m_name),a_name from movie_actor where a_name=$1 group by(a_name);


begin
open c1;
loop 
fetch c1 into cnt,t;
exit when not found;
raise notice '' % - %  '',cnt,t;
end loop;
close c1;
return 1;
end;'
language 'plpgsql';

