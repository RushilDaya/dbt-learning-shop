with source as (
    select * from {{ ref('raw_customers') }}
)

select 
    id as customer_id,
    name as customer_name,
    age as customer_age
from source