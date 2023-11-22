{% set payment_types = get_distinct_as_list('stg_payments','payment_type') %}

with payment_table as (
    select * from {{ ref('stg_payments') }}
),
order_table as (
    select * from {{ ref('stg_orders') }}
),
pivoted as (
    select
        order_id,
        {% for payment_type in payment_types %}
        sum(case when payment_type = '{{ payment_type }}' then payment_amount else 0 end) as {{ payment_type }}
        {% if not loop.last %},
        {% endif %}
        {% endfor %}
    from payment_table
    group by order_id
),
combined as (
    select * from pivoted
    join order_table using (order_id)
)
select * from combined