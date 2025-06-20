select distinct l1.num as ConsecutiveNums 
from 
Logs l1 
join Logs l2
on abs(l1.id-l2.id)=1
and l1.num=l2.num
group by l1.ID,l1.num having count(*)>=2