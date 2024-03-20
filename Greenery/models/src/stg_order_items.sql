with source as (
      select * from {{ source('postgres', 'order_items') }}
),
stg_order_items as (
    select
        ORDER_ID,
        PRODUCT_ID,
        QUANTITY

    from source
)
select * from stg_order_items
  