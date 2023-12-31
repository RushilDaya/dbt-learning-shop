with source as (
    select * from {{ source('shop','raw_customers') }}
)

select 
    id as customer_id,
    {{to_lowercase('name')}} as customer_name,
    age as customer_age
from source