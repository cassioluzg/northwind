with
    src_pedido_detalhe as(
        select 
            cast(order_id as int) as pedido_id
            , cast(product_id as int) as produto_id
            , cast(unit_price as decimal) as preco_unitario
            , cast(quantity as decimal) as quantidade
            , cast(discount as decimal) as desconto

        from {{ source('erp', 'order_details') }}
    )

select *
from src_pedido_detalhe
