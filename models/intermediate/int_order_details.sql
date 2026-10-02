select
    o.order_id,
    o.customer_id,
    o.order_timestamp,
    o.status,

    oi.order_item_id,
    oi.product_id,
    oi.quantity,

    p.product_name,
    p.category,
    p.price,

    oi.quantity * p.price as line_amount

from {{ ref('stg_orders') }} o

inner join {{ ref('stg_order_items') }} oi
    on o.order_id = oi.order_id

inner join {{ ref('stg_products') }} p
    on oi.product_id = p.product_id