# Employee Performance Dashboard using SQL

## 📌 Project Overview
This project focuses on employee data analysis using SQL queries in MySQL.

The analysis includes:
- employee salary insights,
- department KPIs,
- ranking employees,
- identifying top performers,
- and business-focused analytics.

---

## 🛠️ Tools Used
- MySQL
- SQL
- MySQL Workbench

---

## 📊 SQL Concepts Used
- Aggregate Functions
- GROUP BY & HAVING
- Subqueries
- Window Functions
- RANK()
- DENSE_RANK()
- ROW_NUMBER()

---

## 📈 Key Insights

### Department Analytics
- Average salary by department
- Highest salary by department
- Departments with high salary expenditure

### Employee Analytics
- Employees earning above average salary
- Top earners in each department
- Salary ranking of employees

### Data Insights
- Duplicate salary detection
- Second highest salary analysis

---

## 📂 Files Included

```text
Employee_Performance_Dashboard/
│
├── README.md
├── Project-1.sql
├── dataset/
└── outputs/
```

---

## 🚀 Sample Query

```sql
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY dept
ORDER BY salary DESC
) AS rnk
FROM employees;
```

---

## 🎯 Learning Outcomes
- Improved SQL querying skills
- Learned window functions
- Performed business-driven data analysis
- Practiced real-world SQL scenarios
