with
    src_funcionario as(
        select 
            cast(employee_id as int) as func_id
            , cast(first_name || " " || last_name as string) as func_nome
            , cast(birth_date as date) as data_nascimento
            , cast(hire_date as date) as data_contratacao
            , cast(address as string) as logradouro
            , cast(city as string) as cidade
            , cast(region as string) as regiao
            , cast(postal_code as string) as codigo_postal
            , cast(country as string) as pais
            , cast(reports_to as int) as gerente_id
        
        from {{ source('erp', 'employees') }}
    )

select *
from src_funcionario

