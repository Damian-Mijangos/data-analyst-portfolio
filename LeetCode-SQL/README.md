# LeetCode SQL Solutions

Colección de soluciones a problemas de LeetCode con análisis de técnicas y rendimiento.

## Tecnologías
![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=flat&logo=mysql&logoColor=white)

## Tabla de Problemas

| # | Problema | Dificultad | Técnica | Resultado |
|---|----------|-------------|---------|-----------|
| 176 | [Second Highest Salary](./easy/176-second-highest-salary.sql) | Easy | Subquery + LIMIT OFFSET | Accepted |
| 181 | [Employees Earning More Than Managers](./easy/181-employees-earning-more.sql) | Easy | Self JOIN | Accepted |
| 182 | [Duplicate Emails](./easy/182-duplicate-emails.sql) | Easy | GROUP BY + HAVING | Accepted |
| 183 | [Customers Who Never Order](./easy/183-customers-who-never-order.sql) | Easy | LEFT JOIN + IS NULL | Accepted |
| 177 | [Nth Highest Salary](./medium/177-nth-highest-salary.sql) | Medium | DENSE_RANK + Function | ⭐ Top 98.84% |
| 178 | [Rank Scores](./medium/178-rank-scores.sql) | Medium | DENSE_RANK() OVER | Accepted |
| 180 | [Consecutive Numbers](./medium/180-consecutive-numbers.sql) | Medium | ROW_NUMBER + CTE | Accepted |
| 184 | [Department Highest Salary](./medium/184-department-highest-salary.sql) | Medium | DENSE_RANK + PARTITION BY | Accepted |

## Estadísticas

- **Total problemas**: 8
- **Easy**: 4 (50%)
- **Medium**: 4 (50%)
- **Hard**: 0 (0%)

## Técnicas más utilizadas

| Técnica | Problemas |
|---------|-----------|
| Window Functions | 3 |
| Self JOIN | 1 |
| GROUP BY + HAVING | 1 |
| LEFT JOIN + IS NULL | 1 |
| Subquery | 1 |
| CTEs | 1 |

## Destacados

### #177 — Nth Highest Salary
**Mi solución ranked Top 98.84% en velocidad** (202ms de ejecución)

```sql
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  SET N = N - 1;
  RETURN (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET N
  );
END
