with
    src_categorias as(
        select 
            cast(category_id as int) as categoria_id 
            , cast(category_name as string) as categoria_nome
            , cast(description as string) as categoria_descircao

        from {{ source('erp', 'categories') }}
    )

select *
from src_categorias
