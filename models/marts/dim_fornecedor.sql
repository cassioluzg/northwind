with
    src_fornecedor as(
        select *
        from {{ ref('stg_erp__fornecedores') }}
    )
select *
from src_fornecedor