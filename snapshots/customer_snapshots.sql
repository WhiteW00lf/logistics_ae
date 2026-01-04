{% snapshot customer_snapshots %}

{{
    config(
        target_schema='snapshots',
        unique_key='customer_id',
        strategy='check',
        check_cols=['customer_type','loyalty_status']
    )
}}


SELECT customer_id,
         LOWER(TRIM(customer_type)) AS customer_type,
         LOWER(TRIM(loyalty_status)) AS loyalty_status
FROM {{ ref('stg_customers') }}

{% endsnapshot %}
