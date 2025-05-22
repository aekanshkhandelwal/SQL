# Write your MySQL query statement below
select A.machine_id, Round(Avg(B.timestamp-A.timestamp),3)as processing_time 
from Activity A
Join Activity B
ON A.machine_id = B.machine_id 
and A.process_id = B.process_id
AND A.activity_type = 'start' 
AND B.activity_type = 'end'
group by A.machine_id