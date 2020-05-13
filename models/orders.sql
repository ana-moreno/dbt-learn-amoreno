with orders as (
    select
    order_id,
    customer_id
    from
    {{ref('stg_orders')}}
),

payments as (
    select
    order_id,
    customer_id,
    amount
    from
    {{ref('stg_payments')}}
),

final as (
    select
    orders.order_id,
    orders.customer_id,
    SUM(payments.amount) as amount
    from
    orders
    left join
    payments
    using(order_id, customer_id)
    group by
    1, 2
)

select * from final