with
    vendedores as (
        select *
        from {{ ref('stg_erp__vendedores') }}
    )
    , pessoas as (
        select *
        from {{ ref('stg_erp__pessoas') }}
    )
    
    , joined as (
        select
            v.id_entidade as id_vendedor
            , p.nome_completo as nome_vendedor
            
        from vendedores v
        left join pessoas p on v.id_entidade = p.id_entidade
    )

select *
from joined