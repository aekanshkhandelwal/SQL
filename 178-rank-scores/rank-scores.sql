# Write your MySQL query statement below
#select score, (dense_rank() over (order by score desc) as rank) from Scores 
SELECT 
    score,
        DENSE_RANK() OVER (ORDER BY score DESC) AS 'rank'
        FROM Scores;