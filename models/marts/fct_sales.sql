{{ config(
    materialized='incremental',
    unique_key='order_item_id',
    incremental_strategy='merge'
) }}

select
    order_id,
    order_item_id,
    customer_id,
    order_timestamp,
    status,
    product_id,
    product_name,
    category,
    quantity,
    price,
    line_amount

from {{ ref('int_order_details') }}

where status = 'completed'

{% if is_incremental() %}

    and order_timestamp >= (
        select coalesce(max(order_timestamp), '1900-01-01')
        from {{ this }}
    )

{% endif %}