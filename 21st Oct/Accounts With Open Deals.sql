/*Problem Description:

A sales operations team keeps a list of customer accounts and a separate list of opportunities, 
each tied to an account and sitting in a stage such as Open, Won or Lost. Managers want a list of the accounts that currently 
have at least one opportunity in the Open stage, with each account shown once no matter how many open opportunities it has.

The result must contain the following columns:

account_name — the account Order the result by account_name.*/

-- Write your query for: 599. Accounts With Open Deals | @Salesforce

SELECT DISTINCT a.account_name
FROM accounts a
JOIN opportunities o
    ON a.account_id = o.account_id
WHERE o.stage = 'Open'
ORDER BY a.account_name;
