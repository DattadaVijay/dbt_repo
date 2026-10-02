select
    customer_id,
    customer_name,
    lower(email) as email,
    country,
    cast(created_at as date) as created_date
from {{ source('ecommerce', 'raw_customers') }}