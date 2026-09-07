/*Problem Description:

The growth team wants to compare free trial conversion rates across plans for trials that started in July 2024, 
but only plans with enough trial volume to draw a reliable conclusion.

The result must contain the following columns:

plan_type — the trial plan
signup_count — number of trials started in July 2024
converted_count — number of those trials that converted to paid
conversion_rate — percentage converted, rounded to 2 decimals*/

-- Write your query for: 465. Free Trial Conversion By Plan | @Netflix

with trial_conversion as(
    select plan_type,
    count(trial_signups) as signup_count,
    sum(case
            when converted_to_paid = 'true' then 1
            else 0
        end) as converted_count 
    from trial_signups
    where trial_start_date >= '2024-07-01' and trial_start_date <= '2024-07-31' 
    group by plan_type having count(trial_signups) >= 4

)

select plan_type,
signup_count,
converted_count,
round(converted_count*100.0/signup_count) as conversion_rate 
from trial_conversion order by conversion_rate desc
