select
    order_item_id,
    order_id,
    product_id,
    cast(quantity as int) as quantity
from {{ source('ecommerce', 'raw_order_items') }}