{{ config(materialized="table") }}

select product_id, product_name, category, sub_category, sum(profit) as profit
from {{ ref("stg_profit") }}
group by product_id, product_name, category, sub_category
