with
    vendas_cartoes as (
        select

            cast(creditcardid as int) as id_cartao
            , cast(cardtype as string) as tipo_cartao
            -- , cast(cardnumber as int) as nro_cartao
            -- , cast(expmonth as int) as venc_mes
            -- , cast(expyear as int) as venc_ano
            , cast(left(modifieddate,10) as date) as data_mod

        from {{ source('erp', 'creditcard') }}
    )

select *
from vendas_cartoes
order by id_cartao asc