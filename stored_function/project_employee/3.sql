create or replace function fun3(text) returns void as '
declare
rec employee%rowtype;
s alias for $1;

begin
for rec in select employee.* from employee,project,pro_emp where project.p_no=pro_emp.p_no and employee.e_no=pro_emp.e_no and pro_emp.no_of_hrs>20 and project.p_name=s
 loop
  raise notice ''%'',rec.e_name;
 end loop;

end;'
language 'plpgsql';
