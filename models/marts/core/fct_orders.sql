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
    sum(amount) as amount
    from
    {{ref('stg_payments')}}
    group by 1, 2
),

final as (
    select
    orders.order_id,
    orders.customer_id,
    sum(coalesce(payments.amount, 0)) as amount
    from
    orders
    left join
    payments
    using(order_id, customer_id)
    group by
    1, 2
)

select * from final