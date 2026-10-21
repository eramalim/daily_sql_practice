/*Problem Description:

An HR analytics team reviewing pay wants to find employees who earn strictly more than the average salary of their own department. 
Some employees have no salary recorded yet, and the department average must be based only on salaries that are actually recorded. 
Departments with a single employee have no one to be compared against.

The result must contain the following columns:

employee_name — the employee
department — the employee's department
salary — the employee's salary
department_avg — the average recorded salary of the department, rounded to 2 decimal places Order the result by department, then employee_name.*/

-- Write your query for: 600. Employees Above Department Average | @SAP
with dept_avg as(
    select employee_name,
department,
salary, avg(salary) over(
    partition by department
) as department_avg 
from employees
)

select * from dept_avg
where salary > department_avg
