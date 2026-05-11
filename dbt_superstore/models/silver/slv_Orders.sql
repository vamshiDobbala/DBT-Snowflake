{{ config(materialized='table') }}

select
    order_id,
    order_date::date as order_date,
    ship_date::date as ship_date,
    ship_mode,
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    postal_code,
    region,
    product_id,
    category,
    sub_category,
    product_name,
    sales::number(10,2) as sales,
    quantity::integer as quantity,
    discount::number(5,2) as discount,
    profit::number(10,2) as profit

from {{ source('bronze', 'ORDERS') }}