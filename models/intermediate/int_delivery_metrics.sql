SELECT shipment_id,
order_id,
hub_id,
shipped_date,
delivered_date,
promised_days,
DATEDIFF(day, shipped_date, delivered_date) AS actual_delivery_days,
DATEDIFF(day, shipped_date, delivered_date) - promised_days AS delivery_delay_days,

CASE WHEN 
delivered_date is NULL THEN NULL
WHEN DATEDIFF(day, shipped_date, delivered_date) > promised_days THEN TRUE 
ELSE FALSE
END AS is_sla_breached


FROM {{ref("int_order_shipments")}}