{{ config(materialized='table') }}

select
    state,
    count(distinct branch_number) as total_branches,
    sum(deposits_2016) as total_deposits,
    avg(deposits_2016) as avg_deposits
from "iris-etl-framework-athena-db"."bankdeposit"
group by state
order by total_deposits desc