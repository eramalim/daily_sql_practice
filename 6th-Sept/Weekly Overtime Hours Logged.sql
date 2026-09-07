/*Problem Description:

HR wants to review overtime entries (more than 8 hours in a single day) logged during the week of July 1–7, 2024, to monitor labor costs.

The result must contain the following columns:

employee_name — the employee who logged the hours
department — their department
hours_worked — hours logged that day*/

-- Write your query for: 464. Weekly Overtime Hours Logged | @EY
select employee_name,
department,
hours_worked
from timesheet_entries
where hours_worked > 8 and 
work_date >= '2024-07-01' and work_date <= '2024-07-07'
order by hours_worked desc 
limit 5
