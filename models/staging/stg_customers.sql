SELECT customer_id,
try_to_date(signup_date, 'DD-MM-YYYY') AS signup_date,
LOWER(TRIM(customer_type)) AS customer_type,
LOWER(TRIM(loyalty_status)) AS loyalty_status

FROM {{source('raw', 'customers')}}
WHERE try_to_date(signup_date, 'DD-MM-YYYY') IS NOT NULL