with
    vendedores as (
        select

            cast(businessentityid as int) as id_entidade
            , cast(territoryid as int) as id_regiao
            , cast(salesquota as int) as meta
            , cast(bonus as int) as bonus
            , cast(commissionpct as float64) as comissao
            , cast(salesytd as float64) as fat_ano_atual
            , cast(saleslastyear as float64) as fat_ano_ant
            , cast(rowguid as string) as rowguid
            , cast(left(modifieddate,10) as date) as data_mod

        from {{ source('erp', 'salesperson') }}
    )

select *
from vendedores
order by id_entidade asc