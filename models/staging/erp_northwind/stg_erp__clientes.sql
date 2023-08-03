with 
    src_clientes as(
        select
            cast(customer_id as string) as cliente_id
            , cast(company_name as string) as cliente_nome
            , cast(address as string) as endereco
            , cast(city as string) as cidade
            , cast(region as string) as estado
            , cast(country as string) as pais
            , cast(postal_code as string) as codigo_postal

        from {{ source('erp', 'customers') }}
    )

select *
from src_clientes
