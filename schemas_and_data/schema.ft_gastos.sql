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

SET default_table_access_method = heap;

--
-- Name: ft_gastos; Type: TABLE; Schema: dw; Owner: -
--

CREATE TABLE "public".ft_gastos (
    sk_partido integer NOT NULL,
    sk_fornecedor integer NOT NULL,
    sk_dispendio integer NOT NULL,
    sk_data integer NOT NULL,
    sk_local integer NOT NULL,
    vl_glosa real NOT NULL,
    vl_restituicao character varying NOT NULL,
    vl_documento real NOT NULL,
    vl_liquido real NOT NULL,
    legislatura integer NOT NULL,
    sk_parlamentar integer NOT NULL,
    sk_gastos integer NOT NULL
);

