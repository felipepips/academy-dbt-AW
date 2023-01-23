with
    enderecos as (
        select
            cast(addressid as int) as id_endereco
            , cast(addressline1 as string) as endereco_1
            , cast(addressline2 as string) as endereco_2
            , cast(city as string) as cidade
            , cast(stateprovinceid as int) as id_estado
            , cast(postalcode as string) as cep
            , cast(spatiallocation as string) as localizacao
            , cast(rowguid as string) as rowguid
            , cast(left(modifieddate,10) as date) as data_mod

        from {{ source('erp', 'address') }}
    )

select *
from enderecos
order by id_endereco asc