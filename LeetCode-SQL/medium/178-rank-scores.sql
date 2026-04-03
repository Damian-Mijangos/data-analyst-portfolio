-- LeetCode #178: Rank Scores
-- Dificultad: Medium
-- Técnica: DENSE_RANK() OVER ORDER BY
-- Link: https://leetcode.com/problems/rank-scores/
SELECT score,
    DENSE_RANK() OVER (ORDER BY score DESC) AS "rank"
FROM Scores
ORDER BY score DESC;
