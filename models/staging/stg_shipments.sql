SELECT shipment_id,
    order_id,
    hub_id,
    LOWER(TRIM(city)) AS city,
    promised_days::INT AS promised_days,
    try_to_date(shipped_date, 'DD-MM-YYYY') AS shipped_date,
    try_to_date(delivered_date, 'DD-MM-YYYY') AS delivered_date

FROM {{source('raw', 'shipments')}}
WHERE try_to_date(shipped_date, 'DD-MM-YYYY') IS NOT NULL
AND try_to_date(delivered_date, 'DD-MM-YYYY') IS NOT NULL