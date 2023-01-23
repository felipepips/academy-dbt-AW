with
    regioes_estados as (
        select
            cast(stateprovinceid as int) as id_estado
            , cast(stateprovincecode as string) as cod_estado
            , cast(countryregioncode as string) as cod_pais
            , cast(isonlystateprovinceflag as bool) as isonlystateprovinceflag
            , cast(name as string) as estado
            , cast(territoryid as int) as id_regiao
            , cast(rowguid as string) as rowguid
            , cast(left(modifieddate,10) as date) as data_mod

        from {{ source('erp', 'stateprovince') }}
    )

select *
from regioes_estados
order by id_estado asc