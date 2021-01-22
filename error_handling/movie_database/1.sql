create or replace function fun1(text) returns int as '
declare
rec actor%rowtype;
cnt int:=0;
begin
select into rec *from actor where a_name in(select a_name from movie_actor where m_name in(select m_name from movie where m_name=$1)) order by charges desc;

if not found then 
raise exception '' invalid data input '';
end if;

raise notice ''a_name || role || charges || a_addr '';

for rec in select *from actor where a_name in(select a_name from movie_actor where m_name in(select m_name from movie where m_name=$1)) order by charges desc
loop
raise notice '' % || % || % || % '',rec.a_name,rec.role,rec.charges,rec.a_addr;
cnt:=cnt+1;
end loop;
return cnt;
end;'
language 'plpgsql';
