/*Problem Description:

A staffing coordinator needs a simple roster showing which consultant is assigned to which client, 
but only for projects that are currently active — completed engagements shouldn't clutter the view. 
Consultant, assignment, and project details each live in their own table.

The result must contain the following columns:

consultant_name — the consultant's name
project_name — the project they're assigned to
client_name — the client that project belongs to Order the result by consultant_name.*/

-- Write your query for: 551. Active Project Staffing List | @Infosys
select c.consultant_name,
p.project_name,
p.client_name
from consultants c join assignments a on
c.consultant_id = a.consultant_id join projects p 
on p.project_id = a.project_id
where p.status = 'Active'
order by c.consultant_name
