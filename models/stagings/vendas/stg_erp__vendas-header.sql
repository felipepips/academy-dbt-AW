with
    vendas_header as (
        select

            cast(salesorderid as int) as id_venda			
            , cast(revisionnumber as int) as nro_revisao			
            , cast(left(orderdate,10) as date) as data_venda			
            , cast(left(duedate,10) as date) as data_prevista			
            , cast(left(shipdate,10) as date) as data_entrega			
            , cast(status as int) as status	
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
            , cast(billtoaddressid as int) as id_endereco_cobranca
            , cast(shiptoaddressid as int) as id_endereco_entrega
            , cast(shipmethodid as int) as id_tipo_envio
            , cast(creditcardid as int) as id_cartao
            , cast(creditcardapprovalcode as string) as cod_aprovacao
            , cast(currencyrateid as int) as id_cambio
            , cast(subtotal as float64) as subtotal
            , cast(taxamt as float64) as taxa_amt
            , cast(freight as float64) as frete
            , cast(totaldue as float64) as total_atual
            , cast(comment as int) as comment
            , cast(rowguid as string) as rowguid
            , cast(left(modifieddate,10) as date) as data_mod

        from {{ source('erp', 'salesorderheader') }}
    )

select *
from vendas_header
order by id_venda asc