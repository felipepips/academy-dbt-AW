with
    pessoas as (
        select

            cast(businessentityid as int) as id_entidade
            , cast(persontype as string) as tipo_pessoa
            -- , cast(namestyle as bool) as estilo_nome
            , cast(title as string) as titulo
            , cast(firstname as string) as nome_primeiro
            , cast(middlename as string) as nome_meio
            , cast(lastname as string) as nome_ultimo
            , case 
                when middlename IS NULL then firstname || " " || lastname
                else firstname || " " || middlename || " " || lastname 
                end as nome_completo
            , cast(suffix as string) as sufixo
            , cast(emailpromotion as int) as email_mkt
            , cast(additionalcontactinfo as string) as contato_adicional
            , cast(demographics as string) as dados_demograficos
            , cast(rowguid as string) as rowguid			
            , cast(left(modifieddate,10) as date) as data_mod        

        from {{ source('erp', 'person') }}
    )

select *
from pessoas
order by id_entidade asc