-- motivos foram descartados por enquanto pois uma venda pode ter mais de um motivo, isto está sendo tratado em INT_MOTIVOS
with
    vendas as (
        select *
        from {{ ref('stg_erp__vendas-header') }}
    )
    -- , motivos as (
    --     select *
    --     from {{ ref('stg_erp__vendas-motivos-header') }}
    -- )
    , detalhes as (
        select *
        from {{ ref('stg_erp__vendas-detalhes') }}
    )
    , joined as (
        select
            v.id_venda as id_venda
            , v.status as status
            , v.data_venda as data
            , v.id_cliente as id_cliente
            , v.venda_online as venda_online
            , v.id_vendedor as id_vendedor
            , d.id_detalhe as id_detalhe
            , d.qntd as qntd
            , d.id_produto as id_prod
            , d.id_oferta as id_oferta
            , d.preco_unit as preco_unit
            , d.desc_unit as desc_unit
            -- , m.id_motivo as id_motivo
            , v.id_cartao as id_cartao
            , v.id_endereco_cobranca as end_cobranca
            , v.id_endereco_entrega as end_entrega
            
        from vendas v
        -- left join motivos m on v.id_venda = m.id_venda
        left join detalhes d on v.id_venda = d.id_venda
    )

select *
from joined