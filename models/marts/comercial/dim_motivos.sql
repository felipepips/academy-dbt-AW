with
    motivos as (
        select *
        from {{ ref('stg_erp__vendas-motivos') }}
    )
    , joined_and_transformed as (
        select
            m.id_motivo as id_motivo
            , m.motivo_nome as motivo 
            , m.motivo_tipo as tipo_motivo
            , right('0' || cast(m.id_motivo as string), 2) as id_motivo_str -- convertendo ID_MOTIVO para uma string de 2 dígitos
            
        from motivos m
    )

select *
from joined_and_transformed