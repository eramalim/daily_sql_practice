/*Problem Description:

The merchandising team wants to spot products that are priced noticeably higher than the rest of their own category 
— potential premium positioning, or potential pricing errors worth a second look.

The result must contain the following columns:

product_name — name of the product
category — the product's category
price — the product's price Order final output by product_name.*/

WITH pricing AS (
    SELECT
        product_name,
        category,
        price,
        rank() OVER (
            PARTITION BY category
            order by price desc
        ) AS rn
    FROM products
)

SELECT
    product_name,
    category,
    price
FROM pricing
WHERE rn = 1
ORDER BY product_name;
