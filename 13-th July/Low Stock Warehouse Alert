   /*Problem Description:

You are a Data Analyst at a logistics company. The warehouse operations team needs a daily alert listing all products where quantity_on_hand has dropped below the reorder point — these items need to be restocked urgently.

The result must contain the following columns:

product_name
category
warehouse
quantity_on_hand
reorder_point*/


Select product_name,
category,
warehouse,
quantity_on_hand,
reorder_point
from warehouse_stock where quantity_on_hand< reorder_point
order by quantity_on_hand asc
