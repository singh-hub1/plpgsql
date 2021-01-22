create or replace function fun1() returns int as '
declare
rec producer%rowtype;
c1 cursor for select distinct p_name from producer,movie_producer where producer.p_id=movie_producer.p_id and m_name in(select movie_actor.m_name from movie,actor,movie_actor where movie.m_name=movie_actor.m_name and actor.a_name=movie_actor.a_name and movie_actor.a_name=''vishal'') group by p_name having count(movie_producer.m_name)>1;


begin
open c1;
loop 
fetch c1 into rec;
exit when not found;
raise notice '' % '',rec.p_name;
end loop;
close c1;
return 1;
end;'
language 'plpgsql';
