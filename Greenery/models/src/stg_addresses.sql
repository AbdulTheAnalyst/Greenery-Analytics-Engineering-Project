with source as (
      select * from {{ source('postgres', 'addresses') }}
),
stg_addresses as (
    select
        ADDRESS_ID,
        ADDRESS ,
        ZIPCODE,
        STATE,
        COUNTRY

    from source
)
select * from stg_addresses
  