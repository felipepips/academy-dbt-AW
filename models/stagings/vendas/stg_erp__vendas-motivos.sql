with
    vendas_motivos as (
        select

            cast(salesreasonid as int) as id_motivo			
            , cast(name as string) as motivo_nome			
            , cast(reasontype as string) as motivo_tipo			
            , cast(left(modifieddate,10) as date) as data_mod	

        from {{ source('erp', 'salesreason') }}
    )

select *
from vendas_motivos
order by id_motivo asc