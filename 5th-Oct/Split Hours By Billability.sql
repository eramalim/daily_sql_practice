/*Problem Description:

Time entries are logged per employee with a type — billable client work, internal work, 
or bench (unassigned) time. Resourcing wants a per-employee summary breaking total logged 
hours into billable hours and bench hours side by side, to spot underutilized staff.

The result must contain the following columns:

employee_id — the employee
total_hours — all logged hours, regardless of type
billable_hours — hours logged specifically as billable
bench_hours — hours logged specifically as bench Order the result by employee_id.*/

-- Write your query for: 552. Split Hours By Billability | @Accenture
select employee_id,
sum(hours) as total_hours,
sum(
        case
            when entry_type = 'Billable' then hours
            else 0
            end) as billable_hours,
sum(case
            when entry_type = 'Bench' then hours
            end) as bench_hours
from time_entries group by employee_id
