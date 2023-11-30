with wide_table as (
    select * from {{ ref('payments_with_customer_age') }}
)

select payment_type as payment_method, avg(customer_age) as average_aged
from wide_table
group by payment_type