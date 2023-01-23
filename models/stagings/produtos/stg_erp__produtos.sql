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

        from {{ source('erp', 'product') }}
    )

select *
from produtos
order by id_produto asc