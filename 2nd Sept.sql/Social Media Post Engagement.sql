/*Problem Description:

The social media team wants to compare average engagement (likes + comments + shares) across platforms for July 2024 posts, 
but only platforms with enough posts to draw a reliable conclusion.

The result must contain the following columns:

platform — the social platform
post_count — number of posts in July 2024
avg_engagement — average total engagement per post, rounded to 2 decimals
Requirements
Only include posts with posted_date in July 2024 (2024-07-01 through 2024-07-31)
Calculate each post's engagement as likes + comments + shares
Use HAVING to only return platforms with at least 4 posts
Group by platform, order results by avg_engagement descending*/

-- Write your query for: 453. Social Media Post Engagement | @Meta
with social_media_engagement as(
    select platform,
    count(post_id) as post_count,
    sum(coalesce(likes,0)) +
    sum(coalesce(comments,0)) +
    sum(coalesce(shares,0)) as total_engagement
    from social_posts
    where posted_date > '2024-06-30' and posted_date <= '2024-07-31'
    group by platform having count(post_id) >=4
)

select platform,
post_count,
round(total_engagement::numeric/post_count,2) as avg_engagement
from social_media_engagement order by avg_engagement desc 
