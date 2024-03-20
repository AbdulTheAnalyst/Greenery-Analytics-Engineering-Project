with source as (
      select * from {{ source('postgres', 'promos') }}
),
stg_promos as (
    select
        PROMO_ID,
        DISCOUNT,
        STATUS

    from source
)
select * from stg_promos
  