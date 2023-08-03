with
    src_regiao as(
        select 
            cast(region_id as int) as regiao_id
            , cast(region_description as string) as regiao_nome
        
        from {{ source('erp', 'region') }}
    )

select *
from src_regiao