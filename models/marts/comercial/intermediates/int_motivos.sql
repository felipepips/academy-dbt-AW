with
    motivos as (
        select *
        from {{ ref('stg_erp__vendas-motivos-header') }}
    )
    , transformed as (
        select
            m.id_venda as id_venda
            , m.id_motivo as id_motivo
            , case when id_motivo = 1 then 1 else 0 end as mot1
            , case when id_motivo = 2 then 2 else 0 end as mot2
            , case when id_motivo = 3 then 3 else 0 end as mot3
            , case when id_motivo = 4 then 4 else 0 end as mot4
            , case when id_motivo = 5 then 5 else 0 end as mot5
            , case when id_motivo = 6 then 6 else 0 end as mot6
            , case when id_motivo = 7 then 7 else 0 end as mot7
            , case when id_motivo = 8 then 8 else 0 end as mot8
            , case when id_motivo = 9 then 9 else 0 end as mot9
            , case when id_motivo = 10 then 10 else 0 end as mot10
            
        from motivos m
    )
    , transformed2 as (
        select 
            id_venda
            , max(id_motivo) as id_motivo
            , case when sum(mot1) = 0 then "" else "01 " end as mot1
            , case when sum(mot2) = 0 then "" else "02 " end as mot2
            , case when sum(mot3) = 0 then "" else "03 " end as mot3
            , case when sum(mot4) = 0 then "" else "04 " end as mot4
            , case when sum(mot5) = 0 then "" else "05 " end as mot5
            , case when sum(mot6) = 0 then "" else "06 " end as mot6
            , case when sum(mot7) = 0 then "" else "07 " end as mot7
            , case when sum(mot8) = 0 then "" else "08 " end as mot8
            , case when sum(mot9) = 0 then "" else "09 " end as mot9
            , case when sum(mot10) = 0 then "" else "10 " end as mot10
        from transformed
        group by id_venda
    )

select id_venda, id_motivo, cast(mot1||mot2||mot3||mot4||mot5||mot6||mot7||mot8||mot9||mot10 as string) as motivos
from transformed2
order by id_venda asc