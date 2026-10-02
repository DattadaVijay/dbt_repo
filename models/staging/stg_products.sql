select
    product_id,
    trim(product_name) as product_name,
    trim(category) as category,
    cast(price as decimal(18, 2)) as price
from {{ source('ecommerce', 'raw_products') }}