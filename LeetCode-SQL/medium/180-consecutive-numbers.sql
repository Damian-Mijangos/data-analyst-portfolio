-- LeetCode #180: Consecutive Numbers
-- Dificultad: Medium
-- Técnica: ROW_NUMBER() + CTE
-- Link: https://leetcode.com/problems/consecutive-numbers/
WITH Consecutive AS (
  SELECT num, id - ROW_NUMBER() OVER (PARTITION BY num ORDER BY id) AS grp FROM Logs
)
SELECT DISTINCT num AS ConsecutiveNums FROM Consecutive
GROUP BY num, grp
HAVING COUNT(*) >= 3;
