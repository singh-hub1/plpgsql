create or replace function fun2() returns int as '
begin

 update person set income =income+(income*0.20) where a_name in(select a_name from area where a_type=''urban'');
 
 return 1;
 end;'
 language 'plpgsql';
 
