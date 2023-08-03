with
    src_terriotorio as(
        select 
            cast(territory_id as int) as territorio_id
            , cast(territory_description as string) as territorio_nome
            , cast(region_id as int) as regiao_id

        from {{ source('erp', 'territories') }}
    )

select *
from src_terriotorio

