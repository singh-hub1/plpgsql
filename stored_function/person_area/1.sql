create or replace function fun1(text) returns int as '
declare
cnt int:=0;

 begin
 select into cnt count(p_no) from person where a_name= $1;
 return cnt;
 
 end;'
 language 'plpgsql';
 
