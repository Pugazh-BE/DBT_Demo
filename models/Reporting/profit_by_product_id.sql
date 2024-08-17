{{
    config(
        materialized='table'
    )
}}

SELECT
    PRODUCT_ID,
    PRODUCT_NAME,
    CATEGORY,
    SUB_CATEGORY,
    SUM(PROFIT) AS PROFIT
FROM {{ ref('stg_profit') }}
GROUP BY
    PRODUCT_ID,
    PRODUCT_NAME,
    CATEGORY,
    SUB_CATEGORY