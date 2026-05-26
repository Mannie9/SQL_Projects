# SQL Employee Analytics Dashboard

## 📌 Project Overview
This project focuses on solving real-world employee analytics problems using SQL.

The project simulates how companies analyze:
- salary distribution,
- employee performance,
- departmental KPIs,
- city-wise analytics,
- and top-performing employees.

The analysis was performed using MySQL and advanced SQL querying techniques.

---

## 🛠️ Tools & Technologies
- MySQL
- SQL
- MySQL Workbench

---

## 📂 Database Schema

### Employees Table

| Column | Data Type |
|---|---|
| emp_id | INT |
| name | VARCHAR(50) |
| dept | VARCHAR(50) |
| salary | INT |
| city | VARCHAR(50) |

---

# 📊 Business Problems Solved

## 1️⃣ Salary Categorization
Employees were categorized based on company-wide average salary.

### Categories:
- High Salary
- Medium Salary
- Low Salary

### SQL Concepts Used:
- CASE Statements
- Subqueries
- Aggregate Functions

---

## 2️⃣ Departmental KPIs
Analyzed key performance indicators such as:
- Total salary expense
- Average salary
- Employee count
- Highest salary

### SQL Concepts Used:
- SUM()
- AVG()
- COUNT()
- ORDER BY
- LIMIT

---

## 3️⃣ Top Performers Analysis
Identified:
- Top 1 employee per department
- Top 2 employees per department

### SQL Concepts Used:
- Window Functions
- ROW_NUMBER()
- PARTITION BY

---

## 4️⃣ City Analytics
Analyzed:
- Employee distribution by city
- Total salary expense by city
- Average salary by city

### SQL Concepts Used:
- GROUP BY
- ORDER BY
- Aggregate Functions

---

# 🚀 Key SQL Queries

## Salary Categorization

```sql
SELECT name,
dept,
salary,
CASE
    WHEN salary > (SELECT AVG(salary) FROM employees) THEN 'High'
    WHEN salary < (SELECT AVG(salary) FROM employees) THEN 'Low'
    ELSE 'Medium'
END AS salary_category
FROM employees;
```

---

## Department-wise Top Performer

```sql
SELECT * FROM (
    SELECT *,
    ROW_NUMBER() OVER(
        PARTITION BY dept
        ORDER BY salary DESC
    ) AS rnk
    FROM employees
) t
WHERE rnk = 1;
```

---

## City-wise Salary Analytics

```sql
SELECT city,
COUNT(*) AS Employee_Count,
SUM(salary) AS Total_City_Expense
FROM employees
GROUP BY city
ORDER BY Total_City_Expense DESC;
```

---

# 📁 Project Structure

```text
SQL_Employee_Analytics/
│
├── README.md
├── Employee Performance Dashboard - 2.sql
│
├── dataset/
│   └── employees.csv
│
└── outputs/
    ├── salary_categories.png
    ├── department_kpis.png
    ├── top_performers.png
    └── city_analytics.png
```

---

# 🎯 Learning Outcomes
Through this project, I learned:
- Business-focused SQL analytics
- Writing analytical SQL queries
- Using window functions
- KPI analysis using SQL
- Real-world employee data analysis

---

# 🚀 Future Improvements
- Build Power BI dashboard
- Add interactive visualizations
- Create ETL pipeline using Python
- Use larger datasets for scalability testing
