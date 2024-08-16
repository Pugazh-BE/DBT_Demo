{{
    config(
        materialized='table'
    )
}}

SELECT
--from orders_raw table
    O.ORDER_ID,
    O.SHIP_MODE,
    O.CUSTOMER_ID,
    O.PRODUCT_ID,
    O.ORDER_COST_PRICE,
    O.ORDER_SELLING_PRICE,
    (O.ORDER_SELLING_PRICE - O.ORDER_COST_PRICE) as PROFIT,
--from custemer_raw table 
    C.CUSTOMER_NAME,
    C.SEGMENT,
    C.COUNTRY,
    C.STATE,
--from products_raw file
    P.CATEGORY,
    P.PRODUCT_NAME,
    P.SUB_CATEGORY
FROM 
    {{ ref('order_raw') }} AS O
LEFT JOIN
    {{ ref('customer_raw') }} AS C
ON O.CUSTOMER_ID = C.CUSTOMER_ID
LEFT JOIN
    {{ ref('product_raw') }} P
ON O.PRODUCT_ID = P.PRODUCT_ID
