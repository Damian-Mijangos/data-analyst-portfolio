-- LeetCode #184: Department Highest Salary
-- Dificultad: Medium
-- Técnica: DENSE_RANK() + PARTITION BY + JOIN
-- Link: https://leetcode.com/problems/department-highest-salary/

WITH RankedSalaries AS (
  SELECT 
    e.name AS Employee, 
    e.salary AS Salary, 
    d.name AS Department,
    DENSE_RANK() OVER(PARTITION BY d.id ORDER BY e.salary DESC) AS Salary_Rank
  FROM Employee e
  JOIN Department d ON e.departmentId = d.id
)
SELECT Department, Employee, Salary FROM RankedSalaries
WHERE Salary_Rank = 1;