with
    enderecos as (
        select *
        from {{ ref('stg_erp__enderecos') }}
    )
    , regioes_estados as (
        select *
        from {{ ref('stg_erp__regioes-estados') }}
    )
    , regioes_paises as (
        select *
        from {{ ref('stg_erp__regioes-paises') }}
    )
    , joined as (
        select
            -- c.id_cliente as id_cliente
            -- , c.id_pessoa as id_pessoa
            -- , p.nome_completo as nome_cliente
            -- , c.id_loja as id_loja
            -- , pe.id_endereco as id_endereco
            e.id_endereco as id_endereco
            , e.cidade as cidade
            , e.id_estado as id_estado
            , re.cod_estado as cod_estado
            , re.estado as estado
            , re.cod_pais as cod_pais
            , rp.pais as pais
            , re.id_regiao as id_regiao
            
        from enderecos e
        -- left join pessoas p on c.id_pessoa = p.id_entidade
        -- left join pessoas_enderecos pe on pe.id_entidade = p.id_entidade
        -- left join enderecos e on e.id_endereco = pe.id_endereco
        left join regioes_estados re on re.id_estado = e.id_estado
        left join regioes_paises rp on rp.cod_pais = re.cod_pais
    )

select *
from joined
order by id_endereco asc