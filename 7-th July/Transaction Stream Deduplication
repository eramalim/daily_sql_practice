/*Problem Description:

You are a Data Engineer at a fintech company. Due to retry logic in the payment gateway and core banking system, the same transaction sometimes gets ingested multiple times into the raw events table. Your job is to deduplicate the stream by keeping only the first-seen record per transaction_id (lowest raw_id), and report how many duplicates were found per transaction.

The result must contain the following columns:

transaction_id
account_id
amount
txn_type
txn_timestamp
source_system
total_copies - how many times this transaction appeared in the raw table
duplicates_removed - total_copies - 1*/

with transaction_stream_deduplication as(
    select transaction_id,
    account_id,
    amount,
    txn_type,
    txn_timestamp,
    source_system,
    row_number() over(
        partition by transaction_id
        order by raw_id asc 
    ) as rn,
    count(*) over(
       partition by transaction_id
    ) as total_copies
    from raw_transactions
)

select transaction_id,
account_id,
amount,
txn_type,
txn_timestamp,
source_system, total_copies,
(total_copies-1) as duplicates_removed from transaction_stream_deduplication
where rn =1 order by txn_timestamp asc
