/*Problem Description:

A staffing team keeps a log of certifications earned by consultants. 
A consultant may renew the same certification in later years, so the same skill can appear several times for one person. 
The team wants to find consultants who hold certifications in at least two different skills.

The result must contain the following columns:

consultant_name — the consultant
skill_count — the number of different skills the consultant is certified in Order the result by consultant_name.*/

-- Write your query for: 602. Consultants With Multiple Skills | @Cognizant
select consultant_name,
count(distinct skill) as skill_count from 
certifications group by consultant_name 
having count(distinct skill)  > 1
