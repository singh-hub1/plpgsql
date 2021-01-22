create or replace function fun2(int) returns int as '
declare
cnt int;
begin
select into cnt count(p_no) from pro_emp where e_no in(select e_no from pro_emp where e_no= $1);
 return cnt;
 
end;'
language 'plpgsql';
