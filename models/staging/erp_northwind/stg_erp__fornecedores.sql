with
    stc_fornecedores as(
        select 
            cast(supplier_id as string) as fornec_id
            , cast(company_name as string) as fornec_nome
            , cast(address as string) as endereco
            , cast(city as string) as cidade
            , cast(region as string) as regiao
            , cast(postal_code as string) as codigo_postal
            , cast(country as string) as pais
        
        from {{ source('erp', 'suppliers') }}
    )

select *
from stc_fornecedores