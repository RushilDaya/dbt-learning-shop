{% set payment_types = get_distinct_as_list('stg_payments','payment_type')%}

with mart_table as (
    select * from {{ ref('order_payment_breakdown')}}
),
augmented_table as (
    select
    total_amount as provided_total,
    {% for payment_type in payment_types %}
    {{ payment_type }}_amount {% if not loop.last %} + {% endif %}
    {% endfor %} as aggegrated_total
    from mart_table

)

select * from augmented_table
where provided_total != aggegrated_total