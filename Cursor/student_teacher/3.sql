create or replace function fun3() returns int as '
declare
rec teacher%rowtype;

c1 cursor for select * from teacher where experence in(select max(experence) from teacher);

begin
open c1;
raise notice '' t_no || t_name || qualification ||experence '';
loop 

fetch c1 into rec;
exit when not found;
raise notice '' % - % - % - % '',rec.t_no,rec.t_name,rec.qualification,rec.experence;

end loop;
close c1;
return 1;
end;'
language 'plpgsql';

