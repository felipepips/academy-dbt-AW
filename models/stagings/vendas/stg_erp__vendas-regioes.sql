with
    vendas_regioes as (
        select

            cast(territoryid as int) as id_regiao
            , cast(name as string) as nome_regiao
            , cast(countryregioncode as string) as cod_pais
            , cast(`group` as string) as grupo
            , cast(salesytd as float64) as fat_ano_atual
            , cast(saleslastyear as float64) as fat_ano_ant
            , cast(costytd as int) as custo_ano_atual
            , cast(costlastyear as int) as custo_ano_ant
            , cast(rowguid as string) as rowguid
            , cast(left(modifieddate,10) as date) as data_mod

        from {{ source('erp', 'salesterritory') }}
    )

select *
from vendas_regioes
order by id_regiao asc