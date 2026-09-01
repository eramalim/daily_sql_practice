/*Problem Description:

You are a Data Engineer monitoring daily row count snapshots of warehouse tables. A sudden decrease in row count between two consecutive days could indicate a truncation, accidental delete, or broken partition. For each table, show the day-over-day row count change and flag any row-count shrinkage.

The result must contain the following columns:

table_name
snapshot_date
row_count
prev_row_count - previous day's row count (NULL for first snapshot)
row_diff - row_count - prev_row_count (NULL for first snapshot)
status - 'Baseline' for the first day, 'SHRINK ALERT' if row count decreased, 'Growing' otherwise
Requirements
Use LAG(row_count) OVER (PARTITION BY table_name ORDER BY snapshot_date) for prev_row_count
Compute row_diff as the arithmetic difference
Apply a 3-way CASE for status
Sort by table_name ascending, then snapshot_date ascending*/


-- Write your query for: 254. Table Row Count Drift | @Amazon

WITH row_count AS (
    SELECT
        table_name,
        snapshot_date,
        row_count,
        LAG(row_count) OVER (
            PARTITION BY table_name
            ORDER BY snapshot_date
        ) AS prev_row_count
    FROM table_row_counts
)

SELECT
    table_name,
    snapshot_date,
    row_count,
    prev_row_count,
    (row_count - prev_row_count) AS row_diff,
    CASE
        WHEN prev_row_count IS NULL THEN 'Baseline'
        WHEN row_count < prev_row_count THEN 'SHRINK ALERT'
        ELSE 'Growing'
    END AS status
FROM row_count
ORDER BY table_name ASC, snapshot_date ASC;
