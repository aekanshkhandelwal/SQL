# Write your MySQL query statement below
select s.name from SalesPerson s
where s.name not in
(select s.name from Orders o
left join SalesPerson s
on s.sales_id = o.sales_id
left join Company c 
on o.com_id = c.com_id
where c.name = 'RED')
