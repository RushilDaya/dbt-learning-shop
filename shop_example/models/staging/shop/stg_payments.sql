with source as (
    select * from {{ source('shop','raw_payments') }}
)

select 
    id as payment_id,
    order_id,
    amount as payment_amount,
    type as payment_type
from source