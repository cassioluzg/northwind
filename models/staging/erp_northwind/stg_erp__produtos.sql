with
    src_produto as(
        select 
            cast(product_id as int) as produto_id
            , cast(product_name as string) as produto_nome
            , cast(supplier_id as int) as fornecedor_id
            , cast(category_id as int) as categoria_id
            , cast(quantity_per_unit as string) as unidade_medida
            , cast(unit_price as decimal) as preco_unitario
            , cast(units_in_stock as decimal) as qtd_estoque
            , cast(units_on_order as decimal) as qtd_reservada_pedido
            , cast(reorder_level as decimal) as ponto_pedido
            , case 
                when discontinued = 1 then "descontinuado" 
                else "ativo"
            end as is_descontinuado

        from {{ source('erp', 'products') }}
    )

select *
from src_produto
