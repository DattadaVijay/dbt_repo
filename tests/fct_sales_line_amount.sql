select
    order_item_id,
    quantity,
    price,
    line_amount

from {{ ref('fct_sales') }}

where line_amount != quantity * price