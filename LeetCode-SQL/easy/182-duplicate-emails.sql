-- LeetCode #182: Duplicate Emails
-- Dificultad: Easy
-- Técnica: GROUP BY + HAVING
-- Link: https://leetcode.com/problems/duplicate-emails/
/*
SELECT email AS Email FROM Person
GROUP BY email
HAVING COUNT(*) > 1;
*/

SELECT email FROM Person
GROUP BY email
HAVING COUNT(email) > 1;