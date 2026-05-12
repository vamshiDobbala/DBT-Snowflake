{{ config(materialized='table') }}

select
    order_id,
    TRY_CAST(order_date AS DATE)        AS order_date,
    TRY_CAST(ship_date AS DATE)         AS ship_date,
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
    TRY_CAST(sales AS NUMBER(10,2))     AS sales,
    TRY_CAST(quantity AS INTEGER)       AS quantity,
    TRY_CAST(discount AS NUMBER(5,2))   AS discount,
    TRY_CAST(profit AS NUMBER(10,2))    AS profit,
    CURRENT_TIMESTAMP()                 AS _silver_loaded_at

from {{ source('bronze', 'ORDERS') }}
where order_id is not null
QUALIFY ROW_NUMBER() OVER (PARTITION BY order_id ORDER BY order_id) = 1