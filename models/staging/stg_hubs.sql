SELECT hub_id,
LOWER(TRIM(hub_city)) AS hub_city,
CAST(daily_shipment_capacity AS INTEGER) AS daily_shipment_capacity
FROM {{source('raw','hubs')}}
WHERE hub_id IS NOT NULL
AND LOWER(TRIM(hub_city)) IS NOT NULL
AND daily_shipment_capacity IS NOT NULL