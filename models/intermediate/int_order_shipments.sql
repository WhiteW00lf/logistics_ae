
SELECT s.shipment_id,
         s.order_id,
         s.hub_id,
         s.shipped_date,
         s.delivered_date,
         s.promised_days,
         o.order_date,
         o.customer_id,
         o.order_value,
         o.payment_type
FROM {{ref('stg_shipments')}} AS s
LEFT JOIN {{ref('stg_orders')}} AS o
ON s.order_id = o.order_id
