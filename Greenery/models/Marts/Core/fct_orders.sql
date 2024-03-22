{{
    config(materialized='table')
}}

with order_event_count as (
    select
        order_id
        , count(*) as event_count
    from {{ ref('stg_events') }}
    where order_id is not null
    group by 1
)
, order_item_count as (
    select
        order_id
        , count(*) as item_count
    from {{ ref('stg_order_items') }}
    group by 1
)
, final as (
    select
        o.order_id
        , o.user_id
        , o.promo_id
        , o.address_id
        , o.created_at_utc
        , o.order_cost
        , o.shipping_cost
        , o.order_total
        , o.tracking_id
        , o.shipping_service
        , o.estimated_delivery_at_utc
        , o.delivered_at_utc
        , o.status
        , oec.event_count
        , oic.item_count
    from {{ ref('stg_orders')}} o
    left join order_event_count oec on o.order_id = oec.order_id
    left join order_item_count oic on o.order_id = oic.order_id
)

select * from final