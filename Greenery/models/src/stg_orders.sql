with source as (
      select * from {{ source('postgres', 'orders') }}
),
stg_oders as (
    select
        ORDER_ID,
        USER_ID,
        PROMO_ID,
        ADDRESS_ID ,
        CREATED_AT::timestampntz as created_at_utc ,
        ORDER_COST ,
        SHIPPING_COST,
        ORDER_TOTAL,
        TRACKING_ID,
        SHIPPING_SERVICE,
        ESTIMATED_DELIVERY_AT::timestampntz as estimated_delivery_at_utc,
        DELIVERED_AT::timestampntz as delivered_at_utc,
        STATUS,

    from source
)
select * from stg_oders
  