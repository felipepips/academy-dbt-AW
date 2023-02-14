with
    cartoes as (
        select *
        from {{ ref('stg_erp__vendas-cartoes') }}
    )
    , joined as (
        select
            c.id_cartao as id_cartao
            , c.tipo_cartao as tipo_cartao
            
        from cartoes c
    )

select *
from joined