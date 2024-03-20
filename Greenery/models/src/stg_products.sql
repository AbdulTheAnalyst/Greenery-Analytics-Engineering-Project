with source as (
      select * from {{ source('postgres', 'products') }}
),
stg_products as (
    select
        {{ adapter.quote("PRODUCT_ID") }},
        {{ adapter.quote("NAME") }},
        {{ adapter.quote("PRICE") }},
        {{ adapter.quote("INVENTORY") }}

    from source
)
select * from stg_products
  