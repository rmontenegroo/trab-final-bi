CREATE TABLE dw.dim_data
(
    sk_data serial PRIMARY KEY,
    nk_data date NOT NULL,
    desc_data_completa character varying(60) NOT NULL,
    nr_ano integer NOT NULL,
    nm_trimestre character varying(20) NOT NULL,
    nr_ano_trimestre character varying(20) NOT NULL,
    nr_mes integer NOT NULL,
    nm_mes character varying(20) NOT NULL,
    ano_mes character varying(20) NOT NULL,
    nr_semana integer NOT NULL,
    ano_semana character varying(20) NOT NULL,
    nr_dia integer NOT NULL,
    nr_dia_ano integer NOT NULL,
    nm_dia_semana character varying(20) NOT NULL,
    flag_final_semana character(3) NOT NULL,
    flag_feriado character(3) NOT NULL,
    nm_feriado character varying(60) NOT NULL,
    dt_final timestamp without time zone NOT NULL,
    dt_carga timestamp without time zone NOT NULL
);

CREATE TABLE dw.dim_dispendio
(
    sk_dispendio serial PRIMARY KEY,
    descricao character varying(60) NOT NULL,
    nm_passageiro character varying(120) NOT NULL DEFAULT 'N/A'::character varying,
    trecho character varying(100) NOT NULL DEFAULT 'N/A'::character varying,
    especificacao character varying(20) NOT NULL DEFAULT 'N/A'::character varying
);

CREATE TABLE dw.dim_fornecedor
(
    sk_fornecedor serial PRIMARY KEY,
    natureza character varying(8) NOT NULL,
    nm_fornecedor character varying(150) NOT NULL DEFAULT 'N/A'::character varying,
    cadastro character varying(24) NOT NULL
);

CREATE TABLE dw.dim_local
(
    sk_local serial PRIMARY KEY,
    nm_cidade character varying(32) NOT NULL DEFAULT 'N/A'::character varying,
    sg_estado character(3) NOT NULL DEFAULT 'N/A'::bpchar,
    nm_pais character varying(40) NOT NULL DEFAULT 'N/A'::character varying
);

CREATE TABLE dw.dim_parlamentar
(
    sk_parlamentar serial PRIMARY KEY,
    nm_parlamentar character varying(36) NOT NULL,
    sexo character varying(10) NOT NULL DEFAULT 'N/A'::character varying,
    dt_nascimento date NOT NULL,
    sg_estado_eleitor character(3) NOT NULL DEFAULT 'N/A'::bpchar,
    escolaridade character varying(24) NOT NULL DEFAULT 'N/A'::character varying,
    nk_parlamentar integer
);

CREATE TABLE dw.dim_partido
(
    sk_partido serial PRIMARY KEY,
    nk_partido integer NOT NULL,
    sg_partido character varying(16) NOT NULL DEFAULT 'N/A'::character varying
);

CREATE TABLE dw.ft_gastos
(
    sk_partido integer NOT NULL,
    sk_fornecedor integer NOT NULL,
    sk_dispendio integer NOT NULL,
    sk_data integer NOT NULL,
    sk_local integer NOT NULL,
    vl_glosa real NOT NULL,
    vl_restituicao real NOT NULL,
    vl_documento real NOT NULL,
    vl_liquido real NOT NULL,
    legislatura integer NOT NULL,
    sk_parlamentar integer NOT NULL,
    sk_gastos serial PRIMARY KEY,
    CONSTRAINT dim_data_ft_gastos_fk FOREIGN KEY (sk_data)
        REFERENCES dw.dim_data (sk_data),
    CONSTRAINT dim_dispendio_ft_gastos_fk FOREIGN KEY (sk_dispendio)
        REFERENCES dw.dim_dispendio (sk_dispendio),
    CONSTRAINT dim_fornecedor_ft_gastos_fk FOREIGN KEY (sk_fornecedor)
        REFERENCES dw.dim_fornecedor (sk_fornecedor),
    CONSTRAINT dim_local_ft_gastos_fk FOREIGN KEY (sk_local)
        REFERENCES dw.dim_local (sk_local),
    CONSTRAINT dim_parlamentar_ft_gastos_fk FOREIGN KEY (sk_parlamentar)
        REFERENCES dw.dim_parlamentar (sk_parlamentar),
    CONSTRAINT dim_partido_ft_gastos_fk FOREIGN KEY (sk_partido)
        REFERENCES dw.dim_partido (sk_partido)
);
