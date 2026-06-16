{{ config(materialized='view') }}

with source_data as (

    select *
    from "iris-etl-framework-athena-db"."bankdeposit"

),

renamed as (

    select
        institution_name,
        main_office,
        branch_name,
        branch_number,
        established_date,
        street_address,
        city,
        county,
        state,
        zipcode,

        cast(deposits_2010 as bigint) as deposits_2010,
        cast(deposits_2011 as bigint) as deposits_2011,
        cast(deposits_2012 as bigint) as deposits_2012,
        cast(deposits_2013 as bigint) as deposits_2013,
        cast(deposits_2014 as bigint) as deposits_2014,
        cast(deposits_2015 as bigint) as deposits_2015,
        cast(deposits_2016 as bigint) as deposits_2016,

        process_date

    from source_data

)

select *
from renamed