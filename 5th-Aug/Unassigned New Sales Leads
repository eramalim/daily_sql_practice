/* The sales manager wants a follow-up list of leads that are still marked 'New' but haven't been assigned to a rep yet, 
so they can be distributed to the team. Older unassigned leads should be prioritized first.*/

SELECT 
    lead_name,
    source,
    created_date
from leads where assigned_rep is NULL
and status = 'New'order by created_date asc
