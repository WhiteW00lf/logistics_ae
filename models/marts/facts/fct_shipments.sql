with shipment_metrics as (

    select *
    from {{ ref('int_delivery_metrics') }}

),

hub_costs as (

    select
        hub_id,
        month_year,
        operating_costs
    from {{ ref('stg_costs') }}

),

shipments_with_cost_month as (

    select
        s.*,
        date_trunc('month', s.shipped_date) as cost_month
    from shipment_metrics s

)

select
    s.shipment_id,
    s.order_id,
    s.hub_id,
    s.cost_month,
    s.shipped_date,
    s.delivered_date,
    s.promised_days,
    s.actual_delivery_days,
    s.delivery_delay_days,
    s.is_sla_breached,
    hc.operating_costs,
    hc.operating_costs
      / count(*) over (
          partition by s.hub_id, s.cost_month
        ) as allocated_cost_per_shipment

from shipments_with_cost_month s
left join hub_costs hc
  on s.hub_id = hc.hub_id
 and s.cost_month = hc.month_year
