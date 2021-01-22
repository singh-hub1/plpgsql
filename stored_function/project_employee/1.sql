create or replace function fun1() returns int as '
declare
cnt int:=0;

begin
select into cnt count(e_no) from employee where joining_date >''01-05-2001'';
 return cnt;
 
end;'
language 'plpgsql';
