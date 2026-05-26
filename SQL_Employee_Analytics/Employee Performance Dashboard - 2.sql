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
(7, 'Arjun', 'IT', 50000, 'Delhi'), 
(8, 'Meera', 'IT', 90000, 'Bangalore'),
(9, 'Rohan', 'Sales', 45000, 'Delhi'),
(10, 'Sneha', 'HR', 55000, 'Mumbai'),
(11, 'Vikas', 'IT', 65000, 'Pune'),
(12, 'Anjali', 'Sales', 72000, 'Jaipur');

/*
Task - 1:- Salary Category
Salary Categories - Companies categorise employees.

Example:
- High salary
- Medium salary
- Low salary
*/

SELECT AVG(salary) AS Average_salary FROM employees;

SELECT name,
dept,
salary,
CASE
    WHEN salary > (SELECT AVG(salary) FROM employees) THEN 'High'
    WHEN salary < (SELECT AVG(salary) FROM employees) THEN 'Low'
    ELSE 'Medium'
END AS salary_category
FROM employees;

/*
Task - 2:- Departmental KPIs
KPI = Key Performance Indicator

Managers ask things like:
- total salary expense
- average salary
- employee count
- highest salary
*/

SELECT SUM(salary) AS Total_Salary_Expense FROM employees; 
SELECT AVG(salary) AS Average_salary FROM employees;
SELECT COUNT(*) AS Employee_Count FROM employees;
SELECT salary AS Highest_Salary FROM employees ORDER BY salary DESC LIMIT 1;

/*
Task - 3:- Top performers
Top Performers - Companies always track top employees

Department-Wise Top Performer:- 
- Top 1 employees per department
- Top 2 employees per department
*/

SELECT * FROM (
    SELECT *,
    ROW_NUMBER() OVER(
        PARTITION BY dept
        ORDER BY salary DESC
    ) AS rnk FROM employees
) t
WHERE rnk = 1;

SELECT * FROM (
    SELECT *,
    ROW_NUMBER() OVER(
        PARTITION BY dept
        ORDER BY salary DESC
    ) AS rnk FROM employees
) t
WHERE rnk = 1 OR rnk = 2;

/* 
Task - 5:- City Analytics

Real businesses analyze:-
- which city performs best
- hiring trends
- salary distribution
*/

SELECT city, COUNT(*) AS Employee_Count,
SUM(salary) AS Total_City_Expense FROM employees
GROUP BY city ORDER BY Total_City_Expense DESC;

SELECT city, COUNT(*) AS Employee_Count,
AVG(salary) AS Average_City_Expense FROM employees
GROUP BY city ORDER BY Average_City_Expense DESC;