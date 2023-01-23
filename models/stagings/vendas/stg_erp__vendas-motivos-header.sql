with
    vendas_motivos_header as (
        select

            cast(salesorderid as int) as id_venda
            , cast(salesreasonid as int) as id_motivo
            , cast(left(modifieddate,10) as date) as data_mod

        from {{ source('erp', 'salesorderheadersalesreason') }}
    )

select *
from vendas_motivos_header
order by id_venda asc