select
    order_id,
    customer_id,
    cast(order_timestamp as timestamp) as order_timestamp,
    lower(trim(status)) as status
from {{ source('ecommerce', 'raw_orders') }}