with source as (
    select * from {{ source('raw', 'fhv_tripdata_2019') }}
),

renamed as (
    select
        -- identifiers
        
        cast(dispatching_base_num as string) as dispatching_base_num,

        -- timestamps
        cast(pickup_datetime as timestamp) as pickup_datetime,  
        cast(dropOff_datetime as timestamp) as dropoff_datetime,

        -- trip info
        PUlocationID as pickup_location_id,
        DOlocationID as dropoff_location_id,
        SR_Flag as sr_flag,
        Affiliated_base_number as af_base_number
        
    from source
    
    where dispatching_base_num is not null
)

select count(*) from renamed
