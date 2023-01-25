with
    pessoas_enderecos as (
        select

            cast(businessentityid as int) as id_entidade
            , cast(addressid as int) as id_endereco
            , cast(addresstypeid as int) as tipo_endereco
            , cast(rowguid as string) as rowguid			
            , cast(left(modifieddate,10) as date) as data_mod     

        from {{ source('erp', 'businessentityaddress') }}
    )

select *
from pessoas_enderecos
order by id_entidade asc