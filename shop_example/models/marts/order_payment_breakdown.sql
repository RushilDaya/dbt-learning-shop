{% set payment_types = get_distinct_as_list('stg_payments','payment_type') %}

with pivoted_table as (
    select * from {{ ref('order_amount_pivot_payment_type')}}
)

select 
    {% for payment_type in payment_types %}
    {{ payment_type }} as {{ payment_type }}_amount,
    {% endfor %}
    order_id,
    order_amount as total_amount
from pivoted_table