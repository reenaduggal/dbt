{{ config(materialized='table') }}

with latest_branch as (

    select
        *,
        row_number() over (
            partition by branch_number
            order by process_date desc
        ) as rn
    from {{ ref('stg_bankdeposit') }}

)

select
    institution_name,
    branch_name,
    city,
    state,
    deposits_2016,

    case
        when deposits_2016 >= 1000000 then 'Large'
        when deposits_2016 >= 250000 then 'Medium'
        else 'Small'
    end as branch_size

from latest_branch
where rn = 1