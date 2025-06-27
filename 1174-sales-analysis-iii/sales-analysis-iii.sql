# Write your MySQL query statement below
SELECT a.product_id, a.product_name
FROM Product a
JOIN Sales b ON a.product_id = b.product_id
GROUP BY a.product_id,a.product_name
having min(b.sale_date)>= date '2019-01-01'
 and max(b.sale_date)<= date '2019-03-31';