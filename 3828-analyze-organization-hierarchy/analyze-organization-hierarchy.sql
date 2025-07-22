# Write your MySQL query statement below
with recursive leadership as(
    select manager_id ,employee_id ,employee_name ,salary,1 as level
    from Employees 
    where manager_id is null
    union all
    select e.manager_id ,e.employee_id ,e.employee_name ,e.salary,level+1 level
    from Employees e
    join leadership l
    on e.manager_id =l.employee_id 
),
subordinate as(
    select employee_id ,salary ,manager_id 
    from Employees 
    union all
    select e.employee_id ,e.salary ,s.manager_id 
    from Employees e
    join subordinate s
    on s.employee_id=e.manager_id 
)
,
final as(
    select l.employee_id,l.employee_name,level,
    count(s.employee_id)team_size ,
    ifnull(sum(s.salary),0)+l.salary budget 
    from leadership l
    left join subordinate s
    on s.manager_id=l.employee_id
    group by 1,2,3,l.salary
)
select * from final
order by 3, 5 desc,2