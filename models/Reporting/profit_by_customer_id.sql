{{
    config(
        materialized='table'
    )
}}

SELECT
    CUSTOMER_ID,
    CUSTOMER_NAME,
    SEGMENT,
    COUNTRY,
    SUM(PROFIT) AS PROFIT
FROM {{ ref('stg_profit') }}
GROUP BY 
    CUSTOMER_ID,
    CUSTOMER_NAME,
    SEGMENT,
    COUNTRY