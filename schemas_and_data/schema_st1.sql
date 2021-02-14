CREATE TABLE public.st1_gastos
(
    nm_parlamentar character varying(40),
    cpf character varying(15),
    sg_uf character varying(3),
    sg_partido character varying(16),
    nm_fornecedor character varying(240),
    cnpjcpf character varying(24),
    dt_emissao date,
    vl_documento double precision,
    vl_glosa double precision,
    vl_liquido double precision,
    vl_restituicao double precision,
    tx_descricao character varying(320),
    trecho character varying(320),
    nm_passageiro character varying(320),
    especificacao character varying(320),
    legislatura integer,
    natureza character varying(8),
    id serial PRIMARY KEY
);

CREATE TABLE public.st1_parlamentares
(
    sg_partido character varying(16),
    nm_parlamentar character varying(36),
    sg_uf character varying(3),
    nm_eleitoral character varying(36),
    sexo character varying(3),
    dt_nascimento date,
    sg_ufnascimento character varying(3),
    nm_municipionascimento character varying(32),
    escolaridade character varying(32),
    id serial PRIMARY KEY
);

CREATE TABLE public.st1_partidos
(
    sg_partido character varying(16),
    id serial PRIMARY KEY
);

CREATE TABLE public.st1_cnpj
(
    id serial PRIMARY KEY,
    cnpj character varying(21),
    nome_fantasia text,
    nm_pais character varying(120),
    uf character varying(3),
    cidade text
);
