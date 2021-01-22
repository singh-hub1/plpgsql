create or replace function fun2(text) returns int as '
declare
rec movie%rowtype;
cnt int:=0;
begin
select into rec *from movie where m_name in(select m_name from movie_actor where a_name in(select a_name from actor where a_name=$1));

if not found then 
raise exception '' invalid data input '';
end if;

raise notice ''m_name || release_year || budget '';

for rec in select * from movie where m_name in(select m_name from movie_actor where a_name in(select a_name from actor where a_name=$1))
loop
raise notice '' % || % || % '',rec.m_name,rec.release_year,rec.budget;
cnt:=cnt+1;
end loop;
return cnt;
end;'
language 'plpgsql';
