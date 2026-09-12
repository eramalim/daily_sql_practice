/*Problem Description:

Campaigns are being migrated from a legacy ads system to a new platform, 
and for a brief period both systems are live simultaneously. Produce a single, deduplicated list of every campaign that's currently active across either system.

The result must contain the following column:

campaign_name — name of a currently active campaign, appearing once even if it exists in both systems*/

select campaign_name
from legacy_campaigns
where status = 'Active'

union 

select campaign_name
from new_platform_campaigns
where status = 'Active'

order by campaign_name asc
