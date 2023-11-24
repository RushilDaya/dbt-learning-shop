with source as (
    select * from {{ source('shop','raw_orders') }}
)

select 
    id as order_id,
    customer_id,
    amount as order_amount
from source