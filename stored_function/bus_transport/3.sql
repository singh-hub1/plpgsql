create or replace function fun3(text) returns int as '
declare
cnt int:=0;

 begin
 select into cnt count(b_no) from bus where r_no in(select r_no from route where source=$1);
 return cnt;
 end;'
 language 'plpgsql';
 
