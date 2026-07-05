/*TCS wants to generate a leave balance report for all employees. For each employee, calculate their remaining leave balance based on:

Total leaves allocated (annual entitlement)
Total leaves taken (sum of leave_days from leave_requests)
Show employee name, department, total_leaves_allocated, leaves_taken, remaining_balance, and leave_utilization_rate (leaves_taken / total_leaves_allocated * 100). Only include employees who have taken at least 1 leave. Sort by remaining_balance DESC.*/


select
    e.employee_name,
    e.department,
    e.total_leaves_allocated,
    sum(l.leave_days) as leaves_taken,
    ( e.total_leaves_allocated - sum(l.leave_days)) as remaining_balance,
    round(sum(l.leave_days)*100.0/e.total_leaves_allocated, 2) as utilization_rate
    from employees e join
    leave_requests l on
    e.employee_id = l.employee_id
    group by e.employee_name, 
    e.department, 
    e.total_leaves_allocated having  sum(l.leave_days) >=1
    order by remaining_balance desc
