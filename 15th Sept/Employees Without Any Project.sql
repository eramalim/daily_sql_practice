/*Problem Description:

A delivery organization keeps its employee roster in one table and its project staffing in another. 
Each staffing row names a project and, once someone is chosen, the employee filling that slot. 
Open slots that have not been filled yet are stored with no employee at all. 
The resourcing team wants the list of employees who are not currently staffed on any project, so they can be considered for the open slots.

The result must contain the following columns:

employee_id — the employee's ID
employee_name — the employee's name Order the result by employee_id.*/

-- Write your query for: 578. Employees Without Any Project | @Infosys
select e.employee_id,
e.employee_name from employees e 
left join project_assignments p 
on e.employee_id = p.employee_id
where p.employee_id is NULL 
