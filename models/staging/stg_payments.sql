select
"ID" as customer_id,
"orderID" as order_id,
"paymentMethod" as payment_method,
amount,
created,
"_BATCHED_AT_" as batched_at
from {{ source('stripe', 'payment') }}