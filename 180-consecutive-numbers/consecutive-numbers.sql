# Write your MySQL query statement below
select distinct num as ConsecutiveNums
from(
    select num,
    lag(num,1) over (order by id) as p1,
    lag(num,2) over (order by id) as p2
    from Logs
) t
where num = p1 and num = p2
