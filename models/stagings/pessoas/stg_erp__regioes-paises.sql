with
    regioes_paises as (
        select
            cast(countryregioncode as string) as cod_pais
            , cast(name as string) as pais		
            , cast(left(modifieddate,10) as date) as data_mod

        from {{ source('erp', 'countryregion') }}
    )

select *
from regioes_paises
order by cod_pais asc