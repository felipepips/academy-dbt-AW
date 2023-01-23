with
    produtos as (
        select

            cast(productid as int) as id_produto
            , cast(name as string) as produto
            , cast(productnumber as string) as cod_produto
            , cast(makeflag as bool) as makeflag
            , cast(finishedgoodsflag as bool) as finishedgoodsflag
            , cast(color as string) as cor
            , cast(safetystocklevel as int) as estoque_minimo
            , cast(reorderpoint as int) as ponto_recompra
            , cast(standardcost as float64) as custo_padrao
            , cast(listprice as float64) as lista_preco
            , cast(`size` as string) as tamanho
            , cast(sizeunitmeasurecode as string) as unid_medida
            , cast(weightunitmeasurecode as string) as unid_peso
            , cast(weight as float64) as peso
            , cast(daystomanufacture as int) as dias_producao
            , cast(productline as string) as linha_produto
            , cast(class as string) as classe
            , cast(style as string) as estilo
            , cast(productsubcategoryid as int) as id_subcat
            , cast(productmodelid as int) as id_modelo
            , cast(left(sellstartdate,10) as date) as data_venda_ini
            , cast(left(sellenddate,10) as date) as data_venda_fin
            , cast(discontinueddate as int) as descontinuado
            , cast(rowguid as string) as rowguid
            , cast(left(modifieddate,10) as date) as data_mod

        from {{ source('erp', 'product') }}
    )

select *
from produtos
order by id_produto asc