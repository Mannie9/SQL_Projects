CREATE DATABASE company;
USE company;

CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(50),
    dept VARCHAR(50),
    salary INT,
    city VARCHAR(50)
);

INSERT INTO employees VALUES
(1, 'Ravi', 'IT', 50000, 'Jaipur'),
(2, 'Aman', 'HR', 60000, 'Delhi'),
(3, 'Neha', 'IT', 70000, 'Mumbai'),
(4, 'Simran', 'HR', 60000, 'Delhi'),
(5, 'Karan', 'Sales', 80000, 'Pune'),
(6, 'Priya', 'Sales', 75000, 'Mumbai'),
(7, 'Arjun', 'IT', 50000, 'Delhi');

/* 
Show all employees
Show employees from Delhi
Show salary > 60000
Show employees ordered by salary DESC
Show distinct cities
*/

SELECT * FROM employees;
SELECT * FROM employees WHERE city = 'Delhi';
SELECT * FROM employees WHERE salary > 60000;
SELECT * FROM employees ORDER BY salary DESC;
SELECT DISTINCT(city) FROM employees;

/* 
Department-wise average salary
Department-wise highest salary
Count employees in each city
Find departments with avg salary > 60000
Find duplicate salaries
*/

SELECT dept, AVG(salary) FROM employees GROUP BY dept;
SELECT dept, MAX(salary) FROM employees GROUP BY dept;
SELECT city, COUNT(*) FROM employees GROUP BY city;
SELECT dept, AVG(salary) FROM employees GROUP BY dept HAVING AVG(salary) > 60000;
SELECT salary, COUNT(*) FROM employees GROUP BY salary HAVING COUNT(salary) > 1;

/*
Rank employees by salary
Find second highest salary
Highest paid employee in each department
Top 2 salaries
Employees earning above average salary
*/

SELECT *, RANK() OVER(ORDER BY salary DESC) AS rnk FROM employees;
SELECT * FROM (
SELECT *, DENSE_RANK() OVER(ORDER BY salary DESC) AS dns_rnk FROM employees
) t
WHERE dns_rnk = 2;
SELECT *
FROM (
    SELECT *,
    ROW_NUMBER() OVER(
        PARTITION BY dept
        ORDER BY salary DESC
    ) AS rnk
    FROM employees
) t
WHERE rnk = 1;
SELECT DISTINCT salary FROM employees ORDER BY salary DESC LIMIT 2;
SELECT * FROM employees WHERE salary > (SELECT AVG(salary) FROM employees); 