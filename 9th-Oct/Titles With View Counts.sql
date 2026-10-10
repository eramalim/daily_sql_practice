/*Problem Description:

The catalog team keeps a list of titles and, separately, a log with one row for every time a title was started by a member. 
Before a quarterly licensing review, they want every title in the catalog shown next to how many times it has been watched, 
including titles nobody has watched yet.

The result must contain the following columns:

title_name — the title
view_count — number of times it was watched (0 if never) Order the result by view_count descending, then title_name.*/

-- Write your query for: 563. Titles With View Counts | @Netflix
select t.title_name,
count(v.view_id) as view_count from 
titles t left join views v on
t.title_id = v.title_id
group by title_name order by view_count desc
