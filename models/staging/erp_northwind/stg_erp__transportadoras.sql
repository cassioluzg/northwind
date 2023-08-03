with
    source_transportadora as(
        select 
            cast(shipper_id as int) as transportadora_id
            , cast(company_name as string) as transportadora_nome

        from {{ source('erp', 'shippers') }}
    )

select *
from source_transportadora
