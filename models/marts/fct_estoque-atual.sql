with
    estoqueatual as(
        select
            produto_id
            , qtd_estoque
            , qtd_reservada_pedido

        from {{ ref('stg_erp__produtos') }}
    )

select *
from estoqueatual