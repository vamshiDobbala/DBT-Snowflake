{{ config(materialized='table') }}

select
    region,
    category,
    sum(sales) as total_sales,
    sum(profit) as total_profit,
    sum(quantity) as total_quantity,
    count(distinct order_id) as total_orders

from {{ ref('slv_orders') }}

group by 1,2