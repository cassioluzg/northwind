with 
    pedido as (
        select *
        from {{ ref('stg_erp__pedidos') }}
    )

    , itens as(
        select *
        from {{ ref('stg_erp__itens_pedido') }}
    )

    , join_pedido as(
        select
            -- Chaves            
            cast(pedido.pedido_id || "_" || itens.produto_id as string) pk_vendas
            , pedido.pedido_id
            , pedido.cliente_id
            , pedido.func_id
            , pedido.transportadora_id
            , itens.produto_id
            
            -- Metricas
            , itens.preco_unitario
            , itens.quantidade
            , itens.desconto_perc
            , cast(pedido.valor_frete / (count(*) over (partition by pedido.pedido_id)) as decimal) as frete_por_item
            , (itens.preco_unitario * itens.quantidade) as vl_bruto
            , ((itens.preco_unitario * itens.quantidade) * (1 - itens.desconto_perc)) as vl_liquido
            
            -- Datas
            , pedido.data_solicitada
            , pedido.data_entrega
            , pedido.data_requerida
            --, DATETIME_DIFF(pedido.data_entrega, pedido.data_solicitada, day) as time_delivery
            --, DATETIME_DIFF(pedido.data_requerida, pedido.data_entrega, day) as entrega_x_prazo
            
            -- Textos
            , pedido.navio_nome

        from pedido
        left join itens on pedido.pedido_id = itens.pedido_id
    )

select *
from join_pedido

