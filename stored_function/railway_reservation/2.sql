create or replace function fun2() returns void as'
declare
begin
update ticket set status=''c'' where p_id in(select p_id from passenger where p_name=''singh'');
end;'
language 'plpgsql';

