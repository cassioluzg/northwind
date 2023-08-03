with
    src_func_terriorio as(
        select 
            cast(employee_id as int) as func_id
            , cast(territory_id as int) as territorio_id

        from {{ source('erp', 'employee_territories') }}
    )

select *
from src_func_terriorio