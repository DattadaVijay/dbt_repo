select
    c.customer_id,
    c.customer_name,
    c.email,
    c.country,
    c.created_date,

    count(distinct s.order_id) as total_orders,
    sum(s.line_amount) as lifetime_sales,
    max(s.order_timestamp) as last_order_timestamp

from {{ ref('stg_customers') }} c

left join {{ ref('fct_sales') }} s
    on c.customer_id = s.customer_id

group by
    c.customer_id,
    c.customer_name,
    c.email,
    c.country,
    c.created_date