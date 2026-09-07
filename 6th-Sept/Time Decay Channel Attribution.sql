/*Problem Description:

Instead of splitting conversion credit equally across all touchpoints (linear attribution), 
the marketing team wants a time-decay model where touches closer to conversion get more credit. Use the weighting 
1 / (days_before_conversion + 1), normalized per customer so each customer's total credit sums to 1.0, then total up credit by channel.

The result must contain the following columns:

channel — the marketing channel
total_credit — total attribution credit earned by that channel across all customers, rounded to 2 decimals*/

