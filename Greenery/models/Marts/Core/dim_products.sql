{{
    config(materialized='table')
}}

with final as (
    select
        product_id
        , name
        , price
        , inventory
    from {{ ref('stg_products') }}
)

select * from final