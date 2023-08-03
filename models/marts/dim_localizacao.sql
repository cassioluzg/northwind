with
    estado as(
        select *
        from {{ ref('stg_erp__estados') }}
    )

    , regiao as(
        select *
        from {{ ref('stg_erp__regiao') }}
    )

    , territorio as(
        select *
        from {{ ref('stg_erp__territorios') }}
    )

    , join_localizacao as(
        select
            territorio.territorio_id
            , territorio.regiao_id
            , estado.estado_id
            , territorio.territorio_nome
            , regiao.regiao_nome
            , estado.estado_nome
            , estado.estado_abreviacao
            
        from territorio
        left join regiao on territorio.regiao_id = regiao.regiao_id
        left join estado on lower(left(regiao.regiao_nome, 4)) = estado.estado_regiao
    )

select *
from join_localizacao