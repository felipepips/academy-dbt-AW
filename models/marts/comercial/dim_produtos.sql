with
    produtos as (
        select *
        from {{ ref('stg_erp__produtos') }}
    )
    , joined as (
        select
            p.id_produto as id_produto
            , p.produto as produto
            
        from produtos p
    )

select *
from joined