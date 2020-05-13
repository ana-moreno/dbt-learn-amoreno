select
"ID" as customer_id,
"orderID" as order_id,
"paymentMethod" as payment_method,
amount,
created
from raw.stripe.payment