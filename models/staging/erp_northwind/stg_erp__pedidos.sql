with
    src_pedidos as(
        select 
            cast(order_id as int) as pedido_id
            , cast(customer_id as string) as cliente_id
            , cast(employee_id as int) as func_id
            , cast(ship_via as string) as transportadora_id
            , cast(freight as decimal) as valor_frete 
            , cast(order_date as date) as data_solicitada
            , cast(shipped_date as date) as data_entrega
            , cast(required_date as date) as data_requerida
            , cast(ship_name as string) as navio_nome

        from {{ source('erp', 'orders') }}
    )

select *
from src_pedidos
