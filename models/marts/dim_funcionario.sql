with
    funcionario as(
        select *
        from {{ ref('stg_erp__funcionarios') }}
    )

    , gerente as(
        select *
        from {{ ref('stg_erp__funcionarios') }}
    )

    , join_func as (
        select 
            funcionario.func_id
            , funcionario.func_nome
            , funcionario.gerente_id
            , gerente.func_nome as genrete_nome            
            , funcionario.data_nascimento
            , funcionario.data_contratacao
            , funcionario.logradouro
            , funcionario.cidade
            , funcionario.regiao
            , funcionario.codigo_postal
            , funcionario.pais

        from funcionario
        left join gerente on funcionario.gerente_id = gerente.func_id
    )

select *
from join_func