{{
    config(materialized='table')
}}

with final as (
    select
        u.user_id
        , u.first_name
        , u.last_name
        , u.email
        , u.phone_number
        , u.created_at
        , u.updated_at
        , u.address_id
        , a.address
        , a.zipcode
        , a.state
        , a.country
    from {{ ref('stg_users') }} u
    left join {{ ref('stg_addresses') }} a using (address_id)
)

select * from final