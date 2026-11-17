/*Problem Description: A social platform records which community groups each member has joined, 
and a membership can be active or ended after the member leaves. The community team wants a compact summary of the most engaged members, 
showing for each one how many groups they are currently in and which groups those are, in a single readable field.*/

-- Write your query for: 675. Members In Three Groups | @Meta
SELECT
    m.user_name,
    COUNT(g.user_id) AS active_group_count,
    STRING_AGG(g.group_name, ', ' ORDER BY g.group_name) AS group_list
FROM members m
JOIN group_memberships g
    ON m.user_id = g.user_id
WHERE g.status = 'Active'
GROUP BY m.user_id, m.user_name
HAVING COUNT(g.user_id) >= 3
ORDER BY m.user_name ASC;
