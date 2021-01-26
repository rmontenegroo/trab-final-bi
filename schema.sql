--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1 (Debian 13.1-1.pgdg100+1)
-- Dumped by pg_dump version 13.1 (Debian 13.1-1.pgdg100+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: st_gastos_parlamentares; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE st_gastos_parlamentares WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE st_gastos_parlamentares OWNER TO postgres;

\connect st_gastos_parlamentares

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: st0_emendas_parlamentares; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.st0_emendas_parlamentares (
    codigo_da_emenda bigint,
    ano_da_emenda bigint,
    codigo_do_autor_da_emenda bigint,
    nome_do_autor_da_emenda character varying(320),
    numero_da_emenda bigint,
    codigo_ibge_municipio bigint,
    nome_municipio character varying(120),
    codigo_ibge_estado bigint,
    nome_estado character varying(24),
    codigo_regiao character varying(2),
    nome_regiao character varying(16),
    codigo_funcao bigint,
    nome_funcao character varying(32),
    codigo_subfuncao bigint,
    nome_subfuncao character varying(64),
    valor_empenhado bigint,
    valor_liquidado bigint,
    valor_pago bigint,
    valor_restos_a_pagar_inscritos bigint,
    valor_restos_a_pagar_cancelados bigint,
    valor_restos_a_pagar_pagos bigint
);


ALTER TABLE public.st0_emendas_parlamentares OWNER TO postgres;

--
-- Name: st0_gastos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.st0_gastos (
    txnomeparlamentar character varying(320),
    cpf character varying(15),
    idecadastro integer,
    nucarteiraparlamentar integer,
    nulegislatura integer,
    sguf character(2),
    sgpartido character varying(32),
    codlegislatura integer,
    numsubcota integer,
    txtdescricao character varying(320),
    numespecificacaosubcota integer,
    txtdescricaoespecificacao character varying(320),
    txtfornecedor character varying(320),
    txtcnpjcpf character varying(24),
    txtnumero character varying(160),
    indtipodocumento integer,
    datemissao date,
    vlrdocumento double precision,
    vlrglosa double precision,
    vlrliquido double precision,
    nummes integer,
    numano integer,
    numparcela integer,
    txtpassageiro character varying(320),
    txttrecho character varying(320),
    numlote integer,
    numressarcimento integer,
    vlrrestituicao double precision,
    nudeputadoid integer,
    idedocumento integer,
    urldocumento character varying(1024)
);


ALTER TABLE public.st0_gastos OWNER TO postgres;

--
-- Name: st0_parlamentares; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.st0_parlamentares (
    idecadastro integer NOT NULL,
    nomecivil character varying(320),
    siglapartido character varying(32),
    nome character varying(320),
    siglauf character(2),
    email character varying(120),
    data date,
    nomeeleitoral character varying(320),
    sexo character(1),
    datanascimento date,
    ufnascimento character(2),
    municipionascimento character varying(160),
    escolaridade character varying(32),
    uri character varying(1024),
    uripartido character varying(1024),
    idlegislatura integer,
    urlfoto character varying(1024),
    condicaoeleitoral character varying(64),
    situacao character varying(64),
    descricaostatus text,
    cpf character varying(11),
    urlwebsite character varying(1024),
    redesocial character varying(1024),
    datafalecimento date
);


ALTER TABLE public.st0_parlamentares OWNER TO postgres;

--
-- Name: st0_votos_parlamentares; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.st0_votos_parlamentares (
    dt_geracao date,
    hh_geracao character varying(10),
    ano_eleicao integer,
    cd_tipo_eleicao integer,
    nm_tipo_eleicao character varying(20),
    nr_turno integer,
    cd_eleicao integer,
    ds_eleicao character varying(60),
    dt_eleicao date,
    tp_abrangencia character(1),
    sg_uf character(2),
    sg_ue character(2),
    nm_ue character varying(24),
    cd_municipio integer,
    nm_municipio character varying(120),
    nr_zona integer,
    cd_cargo integer,
    ds_cargo character varying(28),
    sq_candidato bigint,
    nr_candidato integer,
    nm_candidato character varying(256),
    nm_urna_candidato character varying(256),
    nm_social_candidato character varying(256),
    cd_situacao_candidatura integer,
    ds_situacao_candidatura character varying(24),
    cd_detalhe_situacao_cand integer,
    ds_detalhe_situacao_cand character varying(64),
    tp_agremiacao character varying(32),
    nr_partido integer,
    sg_partido character varying(32),
    nm_partido character varying(64),
    sq_coligacao bigint,
    nm_coligacao character varying(120),
    ds_composicao_coligacao character varying(200),
    cd_sit_tot_turno integer,
    ds_sit_tot_turno character varying(32),
    st_voto_em_transito boolean,
    qt_votos_nominais integer
);


ALTER TABLE public.st0_votos_parlamentares OWNER TO postgres;

--
-- Name: st0_parlamentares st0_parlamentares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.st0_parlamentares
    ADD CONSTRAINT st0_parlamentares_pkey PRIMARY KEY (idecadastro);


--
-- Name: idx_ano_eleicao; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ano_eleicao ON public.st0_votos_parlamentares USING btree (ano_eleicao);


--
-- Name: idx_gastos_idecadastro; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_gastos_idecadastro ON public.st0_gastos USING btree (idecadastro);


--
-- Name: idx_gastos_nulegislatura; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_gastos_nulegislatura ON public.st0_gastos USING btree (nulegislatura);


--
-- Name: idx_nm_urna_candidato; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_nm_urna_candidato ON public.st0_votos_parlamentares USING btree (nm_urna_candidato);


--
-- Name: idx_parlamentares_nome; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_parlamentares_nome ON public.st0_parlamentares USING btree (nome);


--
-- Name: idx_st0_emendas_parlamentares_lookup; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_st0_emendas_parlamentares_lookup ON public.st0_emendas_parlamentares USING btree (codigo_da_emenda, ano_da_emenda, codigo_do_autor_da_emenda, nome_do_autor_da_emenda, numero_da_emenda, codigo_ibge_municipio, nome_municipio, codigo_ibge_estado, nome_estado, codigo_regiao, nome_regiao, codigo_funcao, nome_funcao, codigo_subfuncao, nome_subfuncao, valor_empenhado, valor_liquidado, valor_pago, valor_restos_a_pagar_inscritos, valor_restos_a_pagar_cancelados, valor_restos_a_pagar_pagos);


--
-- PostgreSQL database dump complete
--

