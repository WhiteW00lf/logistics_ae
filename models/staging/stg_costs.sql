SELECT hub_id,
to_date(month_year || '-01') AS month_year,
CAST(OPERATING_COSTS AS INTEGER) AS operating_costs
FROM {{source('raw','costs')}}
WHERE hub_id IS NOT NULL
AND month_year IS NOT NULL
AND operating_costs IS NOT NULL