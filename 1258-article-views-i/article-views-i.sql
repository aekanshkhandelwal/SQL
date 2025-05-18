# Write your MySQL query statement below
select v.viewer_id as id from Views v
where v.viewer_id = author_id
group by viewer_id
order by viewer_id