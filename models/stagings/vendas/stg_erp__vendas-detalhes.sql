with
    vendas_detalhes as (
        select

            cast(salesorderid as int) as id_venda
            , cast(salesorderdetailid as int) as id_detalhe
            , cast(carriertrackingnumber as string) as cod_rastreio
            , cast(orderqty as int) as qntd
            , cast(productid as int) as id_produto
            , cast(specialofferid as int) as id_oferta
            , cast(unitprice as float64) as preco_unit
            , cast(unitpricediscount as float64) as desc_unit
            , cast(rowguid as string) as rowguid
            , cast(left(modifieddate,10) as date) as data_mod

        from {{ source('erp', 'salesorderdetail') }}
    )

select *
from vendas_detalhes
order by id_venda asc