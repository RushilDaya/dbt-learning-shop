with stg_payments as (
    select * from {{ ref('stg_payments') }}
),
stg_orders as (
    select * from {{ ref('stg_orders') }}
),
stg_customers as (
    select * from {{ ref('stg_customers') }}
),

full_table as (
    select *
    from stg_payments
    left join stg_orders
        using (order_id)
    left join stg_customers
        using (customer_id)
)

select * from full_table