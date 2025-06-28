# Write your MySQL query statement below
select * from Patients 
where conditions like '%DIAB1%' and conditions not in ('SADIAB100','ACNE +DIAB100')