with
    vendas_header as (
        select

            cast(salesorderid as int) as id_venda			
            , cast(revisionnumber as int) as nro_revisao			
            , cast(left(orderdate,10) as date) as data_venda			
            , cast(left(duedate,10) as date) as data_prevista			
            , cast(left(shipdate,10) as date) as data_entrega			
            , cast(status as int) as status	
            --, cast(onlineorderflag as string) as venda_online	
            , case
                when onlineorderflag = FALSE then "nao"
                when onlineorderflag = TRUE then "sim"
                else "nao"
                end as venda_online		
            , cast(purchaseordernumber as string) as nro_oc			
            , cast(accountnumber as string) as nro_conta			
            , cast(customerid as int) as id_cliente			
            , cast(salespersonid as int) as id_vendedor			
            , cast(territoryid as int) as id_regiao

        from {{ source('erp', 'salesorderheader') }}
    )

select *
from vendas_header
order by id_venda asc