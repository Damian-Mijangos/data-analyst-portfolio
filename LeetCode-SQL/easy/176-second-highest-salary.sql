-- LeetCode #176: Second Highest Salary
-- Dificultad: Easy
-- Técnica: Subquery + LIMIT OFFSET
-- Link: https://leetcode.com/problems/second-highest-salary/
/*
SELECT 
  (SELECT DISTINCT salary FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
  ) AS SecondHighestSalary
*/

SELECT MAX(salary) AS SecondHighestSalary
FROM (
    SELECT salary, DENSE_RANK() OVER(ORDER BY salary DESC) AS Rank 
    FROM Employee
) Ranked_Salaries
WHERE Rank = 2;