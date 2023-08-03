with
    src_embarcacao as(
        select
            cast(ship_name as string) as navio_nome
            , cast(ship_address as string) as endereco
            , cast(ship_city as string) as cidade
            , cast(ship_region as string) as regiao
            , cast(ship_postal_code as string) as codigo_postal
            , cast(ship_country as string) as pais

        from {{ source('erp', 'orders') }}
    )

select distinct *
from src_embarcacao
order by navio_nome
