-- LeetCode #177: Nth Highest Salary
-- Dificultad: Medium
-- Técnica: DENSE_RANK() + CREATE FUNCTION
-- Resultado: Runtime 202ms, Beats 98.84% (Top velocidad)
-- Link: https://leetcode.com/problems/nth-highest-salary/
/*CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  SET N = N - 1;
  RETURN (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET N
  );
END
*/

CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (
    SELECT DISTINCT a.salary
    FROM (SELECT e.salary, DENSE_RANK() OVER (ORDER BY e.salary DESC) rank FROM Employee e) a
    WHERE a.rank = n
  );
END;
$$ LANGUAGE plpgsql;
