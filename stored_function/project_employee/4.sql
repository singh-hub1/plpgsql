create or replace function fun4() returns void as '
declare
rec project%rowtype;

begin
raise notice '' p_no || p_name || p_type || duration'';
for rec in select project.* from project,pro_emp where project.p_no=pro_emp.p_no and pro_emp.start_date >''01-05-2001 ''

 loop
   
  raise notice '' %  %  %  % '',rec.p_no,rec.p_name,rec.p_type,rec.duration;
 end loop;

end;'
language 'plpgsql';
