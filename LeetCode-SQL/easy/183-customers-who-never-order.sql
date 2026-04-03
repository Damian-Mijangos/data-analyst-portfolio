-- LeetCode #183: Customers Who Never Order
-- Dificultad: Easy
-- Técnica: LEFT JOIN + IS NULL
-- Link: https://leetcode.com/problems/customers-who-never-order/
SELECT c.name AS Customers FROM Customers c
LEFT JOIN Orders o ON c.id = o.customerId
WHERE o.customerId IS NULL;