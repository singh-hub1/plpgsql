create or replace function fun4() returns int as '
declare
rec record;
cnt int :=0;
begin
 raise notice '' SUM || BRANCH_ID '' ;
for rec in select sum(la.lamt_appr),branch.b_id from la,branch,ternary where la.l_no=ternary.l_no and branch.b_id=ternary.b_id and ldate>''02-02-2001''
group by branch.b_id
loop
raise notice '' %--% '',rec.sum,rec.b_id;
cnt:=cnt+1;
end loop;
return cnt;
end;'
language 'plpgsql';

