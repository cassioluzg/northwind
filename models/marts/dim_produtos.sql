with
    produtos as(
        select *
        from {{ ref('stg_erp__produtos') }}
    )

    , categorias as(
        select *
        from {{ ref('stg_erp__categorias') }}
    )

    , join_produtos as(
        select
            produtos.produto_id
            , produtos.fornecedor_id
            , produtos.categoria_id
            , produtos.produto_nome
            , categorias.categoria_nome
            , produtos.unidade_medida
            , produtos.preco_unitario
            , produtos.ponto_pedido
            , produtos.is_descontinuado
            --, categorias.categoria_descircao

        from produtos
        left join categorias on produtos.categoria_id = categorias.categoria_id
    )

select *
from join_produtos

