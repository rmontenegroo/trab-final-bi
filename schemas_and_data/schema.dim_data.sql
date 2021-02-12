
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

SET default_table_access_method = heap;

CREATE TABLE "public".dim_data (
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

