/*Problem Description:

The inventory team runs periodic cycle counts to check whether physical stock matches the system's recorded quantity. 
Compare accuracy across warehouses for July 2024 counts, but only warehouses with enough counts to draw a reliable conclusion.

The result must contain the following columns:

warehouse — the warehouse being counted
count_total — total number of cycle counts performed in July 2024
matched_count — number of counts where the system quantity matched the physical count
accuracy_rate — percentage of counts that matched, rounded to 2 decimals*/

-- Write your query for: 444. Warehouse Cycle Count Accuracy | @Amazon
with inventory_counting as(
    select Warehouse,
    count(count_id) as count_total,
    sum(case
            when system_qty =  counted_qty 
            then 1
            else 0
        end) as matched_count
    from cycle_counts
    where count_date > '2024-06-30' and count_date < '2024-08-01'
    group by Warehouse having count(*) >=4
)

select Warehouse,
count_total,
matched_count,
round(matched_count*100.0/count_total,2) as accuracy_rate from 
inventory_counting order by accuracy_rate desc
