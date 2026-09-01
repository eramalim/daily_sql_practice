/*Problem Description:

Wipro manages IT support for a large enterprise. They need to analyze ticket resolution times. For each support engineer, calculate:

Total tickets resolved
Average resolution time in hours
Total pending tickets (status = 'Open' or 'In Progress')
Ticket resolution efficiency = (total_resolved / total_assigned) * 100
Only include engineers who have resolved at least 5 tickets. Output columns: engineer_name, total_resolved, avg_resolution_hours, pending_tickets, efficiency_pct. Sort by efficiency_pct DESC.*/


with resolution_time_analysis as(
    select 
        s.engineer_name,
        sum(
            case when status = 'Resolved' then 1
            else 0
        end) as total_resolved,
        avg(
            case 
                when status = 'Resolved' 
                then extract(epoch from(resolved_at - created_at))/3600.0
            end) as avg_resolution_time,
        sum(
            case when status in ('Open', 'In Progress') then 1
            else 0 
        end) as pending_tickets,
        count(ticket_id) as total_assigned 
        from support_tickets s
        group by  s.engineer_name
)

select
    engineer_name,
    total_resolved,
    round(avg_resolution_time,2) as avg_resolution_hours,
    pending_tickets, 
    ROUND(total_resolved*100.0/total_assigned,2) as efficiency_pct
    from resolution_time_analysis where total_resolved >=5
    order by efficiency_pct desc
