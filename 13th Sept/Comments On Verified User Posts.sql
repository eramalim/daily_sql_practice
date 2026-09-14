/*Problem Description:

The trust team is studying engagement patterns specifically on content from verified accounts, 
since that content tends to spread faster and draw more scrutiny.

The result must contain the following columns:

comment_id — the comment
commenter_id — who left it
comment_text — the comment content
content_preview — a preview of the post it was left on*/

-- Write your query for: 485. Comments On Verified User Posts  | @Meta
select c.comment_id,
c.commenter_id,
c.comment_text,
p.content_preview
from users u
join posts p 
on u.user_id = p.user_id
join comments c
on p.post_id = c.post_id    
where is_verified = 'true'
