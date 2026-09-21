select 
    orders.order_date,
    products.product_name,
    products.category,
    products.vendor,
    users.city,
    users.state,
    users.sales_channel,
    sum(orders.order_amount) as total_revenue
from {{ref('silver_orders')}} AS orders
left join {{ref('silver_products')}} as products 
on orders.product_id = products.id
left join {{ref('silver_users')}} as users 
on orders.user_id = users.id
group by all