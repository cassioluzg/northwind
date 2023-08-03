with
    src_estado as(
        select 
            cast(state_id as int) as estado_id
            , cast(state_name as string) as estado_nome
            , cast(state_abbr as string) as estado_abreviacao
            , cast(state_region as string) as estado_regiao

        from {{ source('erp', 'us_states') }}
    )

select *
from src_estado
