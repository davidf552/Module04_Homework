# Module04_Homework

project_id: dataex-486105

dbt target dataset: dbt_dfreire

## Question 3

```sql
select count(*) as total from `dataex-486105.dbt_dfreire.fct_monthly_zone_revenue`;
```

## Question 4

```sql
select pickup_zone from `dataex-486105.dbt_dfreire.fct_monthly_zone_revenue` 
where service_type = 'Green' and revenue_month >= DATE '2020-01-01'
  AND revenue_month < DATE '2020-12-31'
  order by revenue_monthly_total_amount desc limit 1;
```

## Question 5

```sql
select sum(total_monthly_trips) as total from `dataex-486105.dbt_dfreire.fct_monthly_zone_revenue` 
where service_type = 'Green' and revenue_month >= DATE '2019-10-01'
  AND revenue_month < DATE '2019-11-01'
  group by service_type;
```

## Question 6

```sql
with source as (
    select * from {{ source('raw', 'fhv_tripdata_2019') }}
),

renamed as (
    select
        -- identifiers
        
        cast(dispatching_base_num as string) as dispatching_base_num,

        -- timestamps
        cast(pickup_datetime as timestamp) as pickup_datetime,  -- lpep = Licensed Passenger Enhancement Program (green taxis)
        cast(dropOff_datetime as timestamp) as dropoff_datetime,

        -- trip info
        PUlocationID as pickup_location_id,
        DOlocationID as dropoff_location_id,
        SR_Flag as sr_flag,
        Affiliated_base_number as af_base_number
        
    from source
    -- Filter out records with null vendor_id (data quality requirement)
    where dispatching_base_num is not null
)

select count(*) from renamed

```
