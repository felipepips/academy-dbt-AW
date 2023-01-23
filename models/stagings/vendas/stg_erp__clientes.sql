with
    clientes as (
        select

            cast(customerid as int) as id_cliente
            , cast(personid as int) as id_pessoa
            , cast(storeid as int) as id_loja
            , cast(territoryid as int) as id_regiao
            , cast(rowguid as string) as rowguid
            , cast(left(modifieddate,10) as date) as data_mod

        from {{ source('erp', 'customer') }}
    )

select *
from clientes
order by id_cliente asc