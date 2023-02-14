with
    vendas as (
        select *
        from {{ ref('int_vendas') }}
    )
    , cartoes as (
        select *
        from {{ ref('dim_cartoes') }}
    )
    , clientes as (
        select *
        from {{ ref('dim_clientes') }}
    )
    , enderecos as (
        select *
        from {{ ref('dim_enderecos') }}
    )
    , motivos as (
        select *
        from {{ ref('int_motivos') }}
    )
    , produtos as (
        select *
        from {{ ref('dim_produtos') }}
    )
    , vendedores as (
        select *
        from {{ ref('dim_vendedores') }}
    )            
    , joined as (
        select
            v.id_venda as id_venda
            , v.status as status
            , v.data as data
            , v.id_cliente as id_cliente
            , c.nome_cliente as nome_cliente
            -- , v.end_cobranca as end_cobranca
            , v.end_entrega as id_endereco
            , e.cidade as cidade
            , e.estado as estado
            , e.pais as pais
            , v.venda_online as venda_online
            , v.id_vendedor as id_vendedor
            , vd.nome_vendedor as nome_vendedor
            , m.id_motivo as id_motivo
            , m.motivos as motivos
            , v.id_cartao as id_cartao
            , car.tipo_cartao as tipo_cartao
            , v.id_detalhe as id_detalhe
            , v.qntd as qntd
            , v.id_prod as id_prod
            , p.produto as produto
            , v.id_oferta as id_oferta
            , v.preco_unit as preco_unit
            , v.desc_unit as desc_unit
            
        from vendas v
        left join enderecos e on v.end_entrega = e.id_endereco
        left join vendedores vd on v.id_vendedor = vd.id_vendedor
        left join produtos p on v.id_prod = p.id_produto
        left join motivos m on v.id_venda = m.id_venda
        left join cartoes car on v.id_cartao = car.id_cartao
        left join clientes c on v.id_cliente = c.id_cliente
    )
    , transformed as(
        select 
            id_venda || "-" || id_detalhe as sk_vendas
            ,*
            -- , case
            --     when venda_online = "sim" then "on-line"
            --     else nome_vendedor
            --     end as vendedor
            , preco_unit*qntd as total_bruto
            , preco_unit*(1-desc_unit) as preco_liq
            , preco_unit*(1-desc_unit)*qntd as total_liq
            


        from joined
    )

select *
from transformed
order by sk_vendas asc