
with data as (select 
    id,
    visit_date,
    people,
    LAG(people,1) over() as last,
    LAG(people,2) over() as sec_last,
    LEAD(people,1) over() as next,
    LEAD(people,2) over() as sec_next
from stadium)

select 
    id,
    visit_date,
    people 
from data
where
    (last is not null and sec_last is not null and people >= 100 and last >= 100 and sec_last >= 100)
    or
    (next is not null and sec_next is not null and people >= 100 and next >= 100 and sec_next >= 100)
    or
    (last is not null and next is not null and people >= 100 and next >= 100 and last >= 100)