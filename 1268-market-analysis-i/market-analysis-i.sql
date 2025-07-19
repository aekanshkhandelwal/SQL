# Write your MySQL query statement below
select u.user_id as "buyer_id", u.join_date, COUNT(CASE 
              WHEN o.order_date BETWEEN '2019-01-01' AND '2019-12-31' 
              THEN o.order_id 
         END)as "orders_in_2019" from Users u
left join 
Orders o on o.buyer_id = u.user_id
group by u.join_date, u.user_id;