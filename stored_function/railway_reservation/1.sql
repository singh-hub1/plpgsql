create or replace function fun1() returns void as'
declare
 rec record;
begin

select into rec sum(t_amt) from ticket where t_date>=''12-09-2017'' group by(p_id);
raise notice ''Total Ticket Amount on 17/09/2018 is %'',rec.sum;
end;'
language 'plpgsql';

