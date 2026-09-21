SELECT
    CAST(review.created_at AS date) as review_date,
    review.product_id,
    products.product_name,
    avg(review.rating) as avg_rating
from {{ref('bronze_reviews')}} as review 
left join {{ref('silver_products')}} as products
on review.product_id = products.id
group by all